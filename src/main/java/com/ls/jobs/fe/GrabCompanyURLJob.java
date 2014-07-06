package com.ls.jobs.fe;

import java.util.List;

import javax.annotation.Resource;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.ls.entity.Company;
import com.ls.grab.GrapImgUtil;
import com.ls.grab.HtmlParserUtilPlanB;
import com.ls.grab.HttpClientGrabUtil;
import com.ls.repository.CompanyResourceRepository;
import com.ls.service.GrabService;

public class GrabCompanyURLJob extends QuartzJobBean {
	
	org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger("services");

	private GrabService grabService;
	
	@Autowired
	CompanyResourceRepository companyResourceRepository;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {

		logger.info("dong yao dong yao");
		
		System.out.println("dongyaodongyao");
		
		// 1. find basic grab url list
		List<String> urls = grabService.findFeCityURLs();
		
		// 2. grab data
		
		for (String url : urls) {
			//find last grab date for the city
			
		//	Long lastGrabTimeMillis =  grabService.findLastGrabMillisForCity(cityId);
			String meirongshiURL = url.endsWith("/") ? url + "meirongshi/" : url + "/meirongshi/";
			
			//page navigation = url + 'pn0...1000'
			
			
			
		}
		
		String testURL = "http://su.58.com/meirongshi/pn0";
		
		String htmlForPage = HttpClientGrabUtil.fetchHTMLwithURL(testURL);
		
		List<Company> companiesInThisPage = HtmlParserUtilPlanB.findPagedCompanyList(htmlForPage);
		
		//<input id="pagenum" value="C29C0040637C187E41C97E412398A6D8A" type="hidden" />
		for (Company company : companiesInThisPage) {
			
			String companyDetailUrl = company.getfEurl();
			String detailPageHtml = HttpClientGrabUtil.fetchHTMLwithURL(companyDetailUrl);
			
		//	String companyName = HtmlParserUtilPlanB.findCompanyName(detailPageHtml);
		//	company.setName(companyName);
			
			String contactor = HtmlParserUtilPlanB.findContactorName(detailPageHtml);
			company.setContactor(contactor);
			
			String phoneImgSrc = HtmlParserUtilPlanB.findContactorPhoneNumberImgSrc(detailPageHtml);
			company.setPhoneSrc(phoneImgSrc);
			
			String imgFileNameAfterGrabed = GrapImgUtil.grabImgWithSrc(phoneImgSrc);
			company.setPhoneSrc(imgFileNameAfterGrabed);
		}
	}

}
