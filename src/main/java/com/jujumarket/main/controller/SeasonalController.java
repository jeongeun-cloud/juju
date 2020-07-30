package com.jujumarket.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jujumarket.admin.domain.ListItemVO;
import com.jujumarket.admin.service.BannerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/")
@AllArgsConstructor
public class SeasonalController {
	
	private BannerService service;
	
	@GetMapping("/seasonal")
	public void list(Model model) {
		log.info("controller 작동중");
		
		String bannerType = "seasonal"; 
		model.addAttribute("seasonal", service.getBanner(bannerType));
		model.addAttribute("seasonItem", service.getSeason());
	}

}
