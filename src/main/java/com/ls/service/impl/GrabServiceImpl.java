package com.ls.service.impl;

import java.util.List;

import org.apache.http.client.utils.HttpClientUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.ImmutableList;
import com.ls.entity.CityURL;
import com.ls.entity.Company;
import com.ls.grab.HtmlParserUtilPlanB;
import com.ls.grab.HttpClientGrabUtil;
import com.ls.repository.CityURLRepository;
import com.ls.service.GrabService;

@Service("grabService")
public class GrabServiceImpl implements GrabService {
	
	@Autowired
	private CityURLRepository cityURLRepository;
	
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
		
		for (CityURL cityURL : allCityURLs) {
			
			try {
				String pagedCompanyURL = cityURL + "/meirongshi/pn";
				int i = 0;
				
				String pagedCompanyURLWithPageNumber = pagedCompanyURL + i;
				String pagedCompanyHTML = HttpClientGrabUtil.fetchHTMLwithURL(pagedCompanyURLWithPageNumber);
				
				List<Company> companies = HtmlParserUtilPlanB.findPagedCompanyList(pagedCompanyHTML);
				
				for (Company company : companies) {
					String url = company.getfEurl();
					
					CityURL cityURLtoSave = new CityURL();
					cityURLtoSave.setUrl(url);
					cityURLtoSave.setName(company.getName());
					cityURLtoSave.setType("58");
					
					cityURLRepository.save(cityURLtoSave);
				}
				
				i++;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

}
