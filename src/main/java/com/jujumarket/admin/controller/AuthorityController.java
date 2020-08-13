package com.jujumarket.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jujumarket.admin.service.AuthorityService;

import lombok.AllArgsConstructor;
import oracle.jdbc.proxy.annotation.Post;


@Controller
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AuthorityController {
	
	
	AuthorityService service;
	
	@GetMapping("/authority")
	public void authority(Model model) {
		
		model.addAttribute("list",service.authorityList());
	}
	
	@GetMapping("/authority2")
	public void authority2(Model model) {
		
		model.addAttribute("list",service.authorityList());
	}
	
	@GetMapping("/authorityget")
	public void authorityget(@RequestParam("emailaccount")String emailAccount, Model model){
		
		
//		System.out.println(emailAccount);
//		System.out.println("들어옴 ");
//		
//		
//		System.out.println(service.get(emailAccount).toString());
			
		model.addAttribute("list",service.get(emailAccount));
		

	}
	
	
	@PostMapping("/authority")
	public String authority(String idNo,Model model) {
		
		System.out.println(idNo);
		
		String[] arridNo = idNo.toString().split(",");
		
		for (int i=0; i<arridNo.length; i++) {

			service.memberupdate(arridNo[i]);
			  
			model.addAttribute("idNo");				

	  	}	

		return "redirect:/admin/authority";
		
		
	}
		
		
	}
	


