package com.myspring.momeche001;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class); 
	
	// 업체소개 페이지
	@RequestMapping(value = "/company/About_Us.do", method = RequestMethod.GET)
	public String About_Us(Locale locale, Model model) {

		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/company/About_Us";
	}
	
	
	
	// 유튜브 페이지 시험용
	@RequestMapping(value = "/company/use_info.do", method = RequestMethod.GET)
	public String use_info(Locale locale, Model model) {

		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/company/use_info";
	}
	
	
	
}
