package com.ls.jobs.fe;

import java.util.List;

import javax.annotation.Resource;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.ls.service.GrabService;

public class GrabFeJob extends QuartzJobBean {
	
	org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger("services");

	@Resource(name = "grabService")
	private GrabService grabService;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {

		logger.info("dong yao dong yao");
		
		System.out.println("dongyaodongyao");
		
		// 1. find basic grab url list
		List<String> urls = grabService.findFeCityURLs();
		
		// 2. grab data
		
		for (String url : urls) {
			//find last grab date for the city
			
		//	Long lastGrabTimeMillis =  grabService.findLastGrabMillisForCity(cityId);
			String meirongshiURL = url.endsWith("/") ? url + "meirongshi/" : url + "/meirongshi/";
			
			//page navigation = url + 'pn0...1000'
			
			
			
		}
		// 3. save to db
		
		// 4. save grab log

	}

}
