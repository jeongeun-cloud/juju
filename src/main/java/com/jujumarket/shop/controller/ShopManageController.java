package com.jujumarket.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jujumarket.shop.domain.ShopManageVO;
import com.jujumarket.shop.service.ShopManageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/shop")
@AllArgsConstructor
public class ShopManageController {

	private ShopManageService smservice;

	@GetMapping("/sales")
	public void todaytotal(Model model) {

		  ShopManageVO smvo = new ShopManageVO();
		 
		  int todayordertotal= smservice.todayOrderTotal();
		  smvo.setTodayOrderTotal(todayordertotal);
		  
		  int prevordertotal=smservice.prevOrderTotal();
		  smvo.setPrevOrderTotal(prevordertotal);
		  
		  model.addAttribute("todayOrderTotal",smvo.getTodayOrderTotal());
		  model.addAttribute("prevOrderTotal", smvo.getPrevOrderTotal());

		System.out.println("오늘 주문 출력 :" + smvo.getTodayOrderTotal());
		System.out.println("지난달 주문 출력 :" + smvo.getPrevOrderTotal());
	}

}
