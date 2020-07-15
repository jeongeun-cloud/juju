package com.jujumarket.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SeasonalController {
	
	@RequestMapping(value="/seasonal")
	public ModelAndView seasonal() throws Exception{
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("seasonal");
		return mav;
	}
}
