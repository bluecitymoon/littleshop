package com.ls.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.ImmutableList;
import com.ls.entity.CityURL;
import com.ls.entity.Company;
import com.ls.entity.CompanyResource;
import com.ls.grab.GrapImgUtil;
import com.ls.grab.HtmlParserUtilPlanB;
import com.ls.grab.HttpClientGrabUtil;
import com.ls.repository.CityURLRepository;
import com.ls.repository.CompanyRepository;
import com.ls.repository.CompanyResourceRepository;
import com.ls.service.GrabService;
import com.ls.vo.GrabStatistic;

@Service("grabService")
public class GrabServiceImpl implements GrabService {
	
	@Autowired
	private CityURLRepository cityURLRepository;
	
	@Autowired
	private CompanyResourceRepository companyResourceRepository;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	public List<String> findFeCityURLs() {
		
		List<String> list = ImmutableList.of("http://su.58.com/", "http://nj.58.com/");
		
		return list;
	}

	/**
	 * grab company name and URL to database 
	 */
	public void grabCompanyResource(String siteURL) {
		
	}

	public void grabAllCompanyResource() {

		List<CityURL> allCityURLs = cityURLRepository.findAll();
		Random random = new Random();
		int i = 0;
		
		for (CityURL cityURL : allCityURLs) {
			
			try {
				String urlInDb = cityURL.getUrl();
				
				String pagedCompanyURL = urlInDb.endsWith("/") ? urlInDb + "meirongshi/pn" : urlInDb + "/meirongshi/pn";
				
				
				
				String pagedCompanyURLWithPageNumber = pagedCompanyURL + i;
				String pagedCompanyHTML = HttpClientGrabUtil.fetchHTMLwithURL(pagedCompanyURLWithPageNumber);
				
				List<Company> companies = HtmlParserUtilPlanB.findPagedCompanyList(pagedCompanyHTML);
				
				for (Company company : companies) {
					
					CompanyResource companyResource = new CompanyResource();
					companyResource.setUrl(company.getfEurl());
					companyResource.setName(company.getName());
					companyResource.setType("58");
					
					companyResourceRepository.save(companyResource);
				}
				
				i++;
				
				if (i == 3) {
					break;
				}
				
				int waitSeconds = random.nextInt(5000);
				Thread.sleep(waitSeconds);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

	public List<Company> grabCompanyInPage(String indexPageURL) {
		
		String pagedCompanyHTML = HttpClientGrabUtil.fetchHTMLwithURL(indexPageURL);
		
		List<Company> companies = HtmlParserUtilPlanB.findPagedCompanyList(pagedCompanyHTML);
		
		return companies;
	}

	public Company grabCompanyDetail(String detailPageUrl) {
		Company company = new Company();
		
		if (StringUtils.isBlank(detailPageUrl)) {
			throw new IllegalArgumentException("detail page url is empty");
		}
		String detailPageHtml =  HttpClientGrabUtil.fetchHTMLwithURL(detailPageUrl);
		
		return company;
	}

	public GrabStatistic grabCompanyInformationByUrl(String url, Date publishDateEnd) {
		
		GrabStatistic grabStatistic = new GrabStatistic();
		
		// grab util the publish date
		int pageNumber = 0;
		
		int proccessCount = 0;
		int saved = 0;
		int error = 0;
		int duplicate = 0;
		while (true) {
			proccessCount ++;
			String pageURL = url + "meirongshi/pn" + pageNumber;
			
			String html = HttpClientGrabUtil.fetchHTMLwithURL(pageURL);
			
			List<Company> basicCompany = HtmlParserUtilPlanB.findPagedCompanyList(html);
			
			for (Company company : basicCompany) {
				
					try {
						
						String companyDetailUrl = company.getfEurl();
						String detailPageHtml = HttpClientGrabUtil.fetchHTMLwithURL(companyDetailUrl);

						String contactor = HtmlParserUtilPlanB.findContactorName(detailPageHtml);
						company.setContactor(contactor);

						String phoneImgSrc = HtmlParserUtilPlanB.findContactorPhoneNumberImgSrc(detailPageHtml);
						company.setPhoneImgSrc(phoneImgSrc);
						
						String address = HtmlParserUtilPlanB.findCompanyAddress(detailPageHtml);
						company.setAddress(address);
						
						if (StringUtils.isNotBlank(phoneImgSrc)) {
							String imgFileNameAfterGrabed = GrapImgUtil.grabImgWithSrc(phoneImgSrc);
							company.setPhoneSrc(imgFileNameAfterGrabed);
						}
						
						String emailImgSrc = HtmlParserUtilPlanB.findContactorEmailImgSrc(detailPageHtml);
						company.setEmailSrc(emailImgSrc);
						
						if (StringUtils.isNotBlank(emailImgSrc)) {
							String emailImgFileNameAfterGrabed = GrapImgUtil.grabImgWithSrc(emailImgSrc);
							company.setEmailSrc(emailImgFileNameAfterGrabed);
						}
						
						
					} catch (Exception e) {
						error ++;
					}
					
					if (ifCompanyDataValueable(company)){
						
						List<Company> companyInDb = companyRepository.findByNameAndFEurl(company.getName(), company.getfEurl());
						
						if (null == companyInDb || companyInDb.isEmpty()) {
							
							try {
								companyRepository.save(company);
								saved ++;
							} catch (Exception e) {
								//
								error ++;
							}
							
						} else {
							duplicate ++;
						}
						
						
						
					} else {
						error ++;
					}
					
					String grabingPublishDate = company.getPublishDate();
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyy-MM-DD");
				try {
					// break condition

					if (StringUtils.isNotBlank(grabingPublishDate)) {

						boolean ifChoosenDateBeforePublishDate = simpleDateFormat.parse("2014-" + grabingPublishDate).before(publishDateEnd);

						if (ifChoosenDateBeforePublishDate) {
							grabStatistic.setSaved(saved);
							grabStatistic.setTotalReaded(proccessCount);
							grabStatistic.setDuplicate(duplicate);

							return grabStatistic;
						}
					}
				} catch (ParseException e) {
						//
					}
			}
			
			pageNumber ++;
		}
		
		
	}
	
	private boolean ifCompanyDataValueable(Company company) {
		if (StringUtils.isBlank(company.getName()) || StringUtils.isBlank(company.getContactor()) || StringUtils.isBlank(company.getfEurl()) || StringUtils.isEmpty(company.getPhoneSrc())) 
		{
			return false;
		}
		
		return true;
	}

}
