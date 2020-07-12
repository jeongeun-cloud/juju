package com.jujumarket.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BobController {
	
	@RequestMapping(value="/bob")
	public ModelAndView bob() throws Exception{
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("bob");
		return mav;
		
	}
}
