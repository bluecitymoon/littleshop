package com.ls.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.ls.entity.Company;
import com.ls.service.CompanyService;

@Component("companyAction")
public class CompanyAction extends BaseAction {

	private static final long serialVersionUID = 7818205738152334717L;

	private List<Company> companies;

	@Resource(name = "companyService")
	private CompanyService companyService;

	public String loadAllCompany() {

		companies = companyService.findAllCompanies();

		return SUCCESS;
	}

	public List<Company> getCompanies() {
		return companies;
	}

	public void setCompanies(List<Company> companies) {
		this.companies = companies;
	}

	
	
}