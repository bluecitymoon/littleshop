package com.ls.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import com.ls.entity.Company;
import com.ls.service.CompanyService;

@Component("companyAction")
public class CompanyAction extends BaseAction {

	private static final long serialVersionUID = 7818205738152334717L;

	private List<Company> companies;
	
	private Page<Company> company;

	@Resource(name = "companyService")
	private CompanyService companyService;

	public String loadAllCompany() {
		String pageNumbersString = getParameter("pageNumber");
		if (null == pageNumbersString) {
			pageNumbersString = "1";
		}
		
		Integer pageNumber = Integer.valueOf(pageNumbersString);
		
		
		companies = companyService.findAllCompanies();

		return SUCCESS;
	}

	public String loadCompanyInPage() {
		String pageNumbersString = getParameter("pageNumber");
		if (null == pageNumbersString) {
			pageNumbersString = "1";
		}
		
		Integer pageNumber = Integer.valueOf(pageNumbersString);
		
		company = companyService.getCompanyInPage(pageNumber);
		
		return SUCCESS;
	}
	
	public List<Company> getCompanies() {
		return companies;
	}

	public void setCompanies(List<Company> companies) {
		this.companies = companies;
	}

	public Page<Company> getCompany() {
		return company;
	}

	public void setCompany(Page<Company> company) {
		this.company = company;
	}

	
	
}