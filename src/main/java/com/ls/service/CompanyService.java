package com.ls.service;

import java.util.List;
import java.util.Set;

import com.ls.entity.Company;
import com.ls.entity.User;

public interface CompanyService {
	List<Company> findCompany(String name);
	List<Company> findAllCompanies();
}
