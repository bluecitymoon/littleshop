package com.ls.service;

import java.util.List;

public interface GrabService {
	
	List<String> findFeCityURLs();
	
	void grabCompanyResource(String cityURL);
	
	void grabAllCompanyResource();
}
