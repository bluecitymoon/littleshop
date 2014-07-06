package com.ls.service.impl;

import java.util.List;
import java.util.Random;

import org.apache.http.client.utils.HttpClientUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.ImmutableList;
import com.ls.entity.CityURL;
import com.ls.entity.Company;
import com.ls.entity.CompanyResource;
import com.ls.grab.HtmlParserUtilPlanB;
import com.ls.grab.HttpClientGrabUtil;
import com.ls.repository.CityURLRepository;
import com.ls.repository.CompanyResourceRepository;
import com.ls.service.GrabService;

@Service("grabService")
public class GrabServiceImpl implements GrabService {
	
	@Autowired
	private CityURLRepository cityURLRepository;
	
	@Autowired
	private CompanyResourceRepository companyResourceRepository;
	
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

}
