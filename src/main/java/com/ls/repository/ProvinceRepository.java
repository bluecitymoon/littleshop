package com.ls.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.ls.entity.Province;


public interface ProvinceRepository extends JpaRepository<Province, Integer> , JpaSpecificationExecutor<Province>{
	List<Province> findByName(String name);
}
