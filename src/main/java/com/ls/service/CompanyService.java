package com.ls.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.ls.entity.Company;
import com.ls.entity.Problem;
import com.ls.entity.Step;

public interface CompanyService {
	List<Company> findCompany(String name);
	List<Company> findAllCompanies();
	
	Page<Company> getCompanyInPage(Integer index);
	
	Problem saveProblem(Problem problem);
	
	Step saveStep(Step step);
}
