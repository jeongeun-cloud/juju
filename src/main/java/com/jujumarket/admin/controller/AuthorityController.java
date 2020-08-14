package com.jujumarket.admin.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jujumarket.admin.domain.AuthorityVO;
import com.jujumarket.admin.service.AuthorityService;

import lombok.AllArgsConstructor;


@Controller
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AuthorityController {
	
	AuthorityService service;
	
	@GetMapping("/authority")
	public void authority(Model model) {
		
		model.addAttribute("list",service.authorityList());
	}
	
	@GetMapping(value = "/authorityGet2", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<?> authorityGet2(String emailAccount, Model model){
		
		List<AuthorityVO> get = service.get(emailAccount);

		return new ResponseEntity<>(get, HttpStatus.OK);
	}
	
	
	@PostMapping("/authority")
	public String authority(String idNo, Model model) {

		String[] arridNo = idNo.toString().split(",");
		
		for (int i=0; i<arridNo.length; i++) {
			service.memberupdate(arridNo[i]);
	  	}	

		return "redirect:/admin/authority";
	}
		
}
	


