package com.jujumarket.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AuthorityController {
	
	
	@GetMapping("/authority")
	public void authorityList() {
           
		
		
	}
	

}
