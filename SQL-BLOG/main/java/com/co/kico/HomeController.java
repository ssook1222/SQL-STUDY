package com.co.kico;

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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping(value = "/summary/database", method = RequestMethod.GET)
	public String summary(Locale locale, Model model) {
		return "summary_database";
	}
	
	@RequestMapping(value = "/summary/database/3", method = RequestMethod.GET)
	public String ch3(Locale locale, Model model) {
		return "book/ch3";
	}
	
}
