package com.jujumarket.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ItemPageDTO;
import com.jujumarket.shop.domain.ManagementVO;
import com.jujumarket.shop.service.ManagementService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/*")
@AllArgsConstructor
public class ManagementController {
	private ManagementService service;

	
	/*
	 * /searchorder /shipping
	 */
	
	 @GetMapping("/searchorder")
	 public void  searlist(ItemCriteria cri , Model model) {
	 
	 log.info("searchorder list");
	 
	 int total = service.getTotal(cri);
 
	 System.out.println("total" + total);
	 
	
	 
	  model.addAttribute("list", service.searchordergetList(cri)); 
	  model.addAttribute("pageMaker", new ItemPageDTO(cri, total));


	 }
	 
	 
	 @GetMapping("/shipping")
	 public void  shippinglist(ItemCriteria cri , Model model) {
	 
	 log.info("searchorder list");
	 int total = service.getNotTotal(cri);
	 
	 System.out.println("total" + total);
	 
	  model.addAttribute("list", service.shippinggetList(cri)); 
	  model.addAttribute("pageMaker", new ItemPageDTO(cri, total));


	 }
	 
	
	 
	 @PostMapping("/shipping")
		public void shippingupdate(String shippingCode,String orderCode, Model model) {
          
		 
		  System.out.println("들어옴");
		 ManagementVO vo = new ManagementVO();
		 vo.setOrderCode(orderCode);
		 vo.setShippingCode(shippingCode);
		 

			model.addAttribute("shippingCode", service.shippingupdate(vo));
			
			
		}



}
