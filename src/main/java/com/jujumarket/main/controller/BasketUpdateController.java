//package com.jujumarket.main.controller;
//
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.jujumarket.main.service.BasketService;
//
//import lombok.AllArgsConstructor;
//import lombok.extern.log4j.Log4j;
//
//@RestController
//@Log4j
//@RequestMapping(value = {"product/*"})
//@AllArgsConstructor
//public class BasketUpdateController {
//	
//	private BasketService service;
//	
//	@GetMapping("/item")
//	public void list(Model model) {
//		log.info("update basket controller start");
//		model.addAttribute("list", service.getList());
//	}
//
//}
