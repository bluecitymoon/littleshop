package com.ls.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.ls.entity.Company;


public interface CompanyRepository extends JpaRepository<Company, Integer> , JpaSpecificationExecutor<Company>{
	
	List<Company> findByNameAndFEurl(String name, String fEurl);
}
