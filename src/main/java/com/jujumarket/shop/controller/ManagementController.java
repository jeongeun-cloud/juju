package com.jujumarket.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.board.domain.Criteria;
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
	 public void  searlist(Model model) {
	 
	 log.info("searchorder list");
	 
	  model.addAttribute("list", service.searchordergetList()); 
	  model.addAttribute("price", service.pricegetList()); 

	 }
	 
	 @GetMapping("/shipping")
	 public void  shippinglist(Model model) {

	 
	 model.addAttribute("list", service.shippinggetList()); 
	 model.addAttribute("price", service.pricegetList()); 

	 }
	 
	 @PostMapping("/shipping")
		public void shippingupdate(String shippingCode,String orderCode, Model model) {

		 ManagementVO vo = new ManagementVO();
		 vo.setOrderCode(orderCode);
		 vo.setShippingCode(shippingCode);
		 
		 System.out.println("넘어옴");
		 System.out.println("orderCode" + orderCode);
		 System.out.println("shippingCode" + shippingCode);
		
		 
			model.addAttribute("shippingCode", service.shippingupdate(vo));
			
			
		}

	
		/*
		 * @PostMapping("/shipping") public String modify(String orderCode,
		 * RedirectAttributes rttr) {
		 * 
		 * log.info("shipping log" + orderCode);
		 * 
		 * if(service.modify(orderCode)) {
		 * 
		 * rttr.addFlashAttribute("result", "success"); }
		 * 
		 * return "redirect:/shop/shipping"; }
		 */

}
