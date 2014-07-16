package com.ls.service;

import java.util.List;

import com.ls.entity.Company;

public interface GrabService {
	
	List<String> findFeCityURLs();
	
	void grabCompanyResource(String cityURL);
	
	void grabAllCompanyResource();
	
	List<Company> grabCompanyInPage(String indexPageURL);
	
	Company grabCompanyDetail(String detailPageUrl);
}
