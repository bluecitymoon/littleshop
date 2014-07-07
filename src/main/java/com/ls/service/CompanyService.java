package com.ls.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.ls.entity.Company;
import com.ls.entity.Problem;

public interface CompanyService {
	List<Company> findCompany(String name);
	List<Company> findAllCompanies();
	
	Page<Company> getCompanyInPage();
	
	Problem saveProblem(Problem problem);
}
