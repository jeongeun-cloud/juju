package com.jujumarket.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jujumarket.main.service.BobService;
import com.jujumarket.main.service.EventService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/")
@AllArgsConstructor
public class EventContoller {
	
	private EventService service;
	
	@GetMapping("/event")
	public void list(Model model) {
		log.info("controller 작동중");
		
		String bannerType = "event";
		model.addAttribute("event", service.getBanner(bannerType));
	}
}
