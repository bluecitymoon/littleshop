package com.ls.controller;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.google.common.collect.ImmutableList;
import com.ls.entity.Company;
import com.ls.service.GrabService;

@Component("grabAction")
public class GrabAction extends BaseAction {

	private static final long serialVersionUID = 1504280162797333021L;

	@Resource(name = "grabService")
	private GrabService grabService;
	
	private List<Company> companies;

	public String grabCompanyIndexPage() {
		String url = getParameter("url");
		System.out.println(url);
		System.out.println(URLDecoder.decode(url));
		
		if (null != url) {
			url = URLDecoder.decode(url);
			
			//companies = grabService.grabCompanyInPage(url);
			
			Company company = new Company();
			company.setName("心悦数据公司");
			company.setfEurl("http://su.58.com/meirongshi/?PGTID=14052432562410.5737352641994795&ClickID=1");
			company.setDistinct("长宁区");
			
			companies = ImmutableList.of(company);
		} else {
			
		}
		

		return SUCCESS;
	}

	public List<Company> getCompanies() {
		return companies;
	}

	public void setCompanies(List<Company> companies) {
		this.companies = companies;
	}

	
	
}
