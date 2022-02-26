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
	
	/*
	  Simply selects the home view to render by returning its name.
	 */
/* @RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}*/
	
	/*
	@RequestMapping(value = "/product_main.do", method = RequestMethod.GET)
	public String product_main(Locale locale, Model model) {

		
		return "product_main";
	}
	
	
	@RequestMapping(value = "/product_detail.do", method = RequestMethod.GET)
	public String product_detail(Locale locale, Model model) {

		
		return "product_detail";
	}
	*/
	
	
	@RequestMapping(value = "/company/use_info.do", method = RequestMethod.GET)
	public String use_info(Locale locale, Model model) {

		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/company/use_info";
	}
	
	
	@RequestMapping(value = "/company/About_Us.do", method = RequestMethod.GET)
	public String About_Us(Locale locale, Model model) {

		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/company/About_Us";
	}
	
	
	
}
