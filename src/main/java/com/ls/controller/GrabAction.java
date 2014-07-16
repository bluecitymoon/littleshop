package com.ls.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.common.collect.ImmutableList;
import com.ls.entity.City;
import com.ls.entity.Company;
import com.ls.entity.Province;
import com.ls.repository.CityRepository;
import com.ls.repository.ProvinceRepository;
import com.ls.service.GrabService;
import com.opensymphony.xwork2.Preparable;

@Component("grabAction")
public class GrabAction extends BaseAction implements Preparable{

	private static final long serialVersionUID = 1504280162797333021L;

	@Resource(name = "grabService")
	private GrabService grabService;
	
	@Autowired
	private CityRepository cityRepository;
	
	@Autowired 
	private ProvinceRepository provinceRepository;
	
	private List<Company> companies;
	
	private List<City> jiangsuCities;
	
	private Object lock = new Object();

	public String grabCompanyIndexPage() {
		String url = getParameter("url");
		System.out.println(url);
		System.out.println(URLDecoder.decode(url));
		
		if (null != url) {
			url = URLDecoder.decode(url);
			
			//companies = grabService.grabCompanyInPage(url);
			
			Company company = new Company();
			company.setfEurl("http://su.58.com/meirongshi/?PGTID=14052432562410.5737352641994795&ClickID=1");
			
			companies = ImmutableList.of(company);
		} else {
			
		}
		

		return SUCCESS;
	}
	
	public String getcities() {
		
		synchronized (lock) {
			String provinceName = getParameter("province");
			List<Province> provinces = provinceRepository.findByName(provinceName);

			jiangsuCities = provinces.get(0).getCitys();
		}

		return SUCCESS;
	}

	public List<Company> getCompanies() {
		return companies;
	}

	public void setCompanies(List<Company> companies) {
		this.companies = companies;
	}

	public List<City> getJiangsuCities() {
		return jiangsuCities;
	}

	public void setJiangsuCities(List<City> jiangsuCities) {
		this.jiangsuCities = jiangsuCities;
	}

	public void prepare() throws Exception {
		jiangsuCities = new ArrayList<City>();
	}
	
}
