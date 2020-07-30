package com.jujumarket.shop.controller;


import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	 public void searlist(ItemCriteria cri, Model model) {
		 log.info("searchorder list");
//		 System.out.println(orderStat);
		 
//		 if(orderStat == null || orderStat == "" || orderStat == "all") {
			 int total = service.getTotal(cri);
		
			 model.addAttribute("list", service.searchordergetList(cri));
			 model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
			 
//		 }else {
//			 
//			 System.out.println(service.searcheck(orderStat));
//			 model.addAttribute("list", service.searcheck(orderStat)); 
//		 }
	  
	  }
	 
	 
//	 @GetMapping("/searcheck")
//	 public String  searchcheck(String shippingcheck, Model model) {
//		 
//		 System.out.println(shippingcheck);
//		 System.out.println(service.searcheck(shippingcheck));
//		 		 
//
//
//		 model.addAttribute("list", service.searcheck(shippingcheck)); 
//		 
//		 return "redirect:/shop/searchorder";
//		 
//	 }
	 
	 @PostMapping("/searchorder")
	 public void searchcheck(String orderStat, Model model) {
		 
		  System.out.println(orderStat);
		  
		  if(orderStat.equals("all")){
			
			model.addAttribute("list", service.searcheckAll(orderStat)); 
			
		  }else {
			  model.addAttribute("list", service.searcheck(orderStat)); 
		  }
	
		 
		
	}
	 
	 
	 @GetMapping("/shipping")
	 public void  shippinglist(ItemCriteria cri , Model model) {
	 
	 int total = service.getNotTotal(cri);
	 

	 
	  model.addAttribute("list", service.shippinggetList(cri)); 
	  model.addAttribute("pageMaker", new ItemPageDTO(cri, total));


	 }
	 
	
	 
	 @PostMapping("/shipping")
		public void shippingupdate(String shippingCode,String orderCode,String baskId,String itemCode, Model model) {
  
		 System.out.println("들어옴2");
		    ManagementVO vo = new ManagementVO();
		  
			String[] arrOrder = orderCode.toString().split(",");
			String[] arrShipping = shippingCode.toString().split(",");
			String[] arrbaskId = baskId.toString().split(",");
			String[] arritemCode = itemCode.toString().split(",");
			
			for (int i=0; i<arrOrder.length; i++) {
				vo.setOrderCode(arrOrder[i]);
				vo.setShippingCode(arrShipping[i]);
				vo.setBaskId(arrbaskId[i]);
				vo.setItemCode(arritemCode[i]);
				
				
				System.out.println(arrbaskId[i]);
				System.out.println(arritemCode[i]);
				service.shippingupdate(vo);
				  
				model.addAttribute("shippingCode");

		  	}	
		}
	 

}
