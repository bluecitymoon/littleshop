package com.ls.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.google.common.collect.ImmutableList;
import com.ls.service.GrabService;

@Service("grabService")
public class GrabServiceImpl implements GrabService {

	public List<String> findFeCityURLs() {
		
		List<String> list = ImmutableList.of("http://su.58.com/", "http://nj.58.com/");
		
		return list;
	}

}
