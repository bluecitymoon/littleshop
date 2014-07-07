package com.ls.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.ls.entity.Company;
import com.ls.entity.Problem;
import com.ls.repository.CompanyRepository;
import com.ls.repository.ProblemRepository;
import com.ls.service.CompanyService;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyRepository companyRepository;
	
	@Autowired
	private ProblemRepository problemRepository;
	
	public List<Company> findCompany(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Company> findAllCompanies() {
		return companyRepository.findAll();
	}

	public Page<Company> getCompanyInPage() {
		//companyRepository.findAll(new PageRequest(page, size))
		return null;
	}

	public Problem saveProblem(Problem problem) {
		
		return problemRepository.save(problem);
	}

}
