package com.jujumarket.shop.controller;


import java.util.Date;
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
	 public void searlist(ItemCriteria cri,Model model) {
		 log.info("searchorder list");
//		 System.out.println(orderStat);
		 

			 int total = service.getTotal(cri);

		
			 model.addAttribute("list", service.searchordergetList(cri));
			 model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
  
	  }
	 
	 
	 //라디오버튼 검색기능/날짜 검색기능
	 @PostMapping("/searchorder")
	 public void searchcheck(String orderStat,String date1,String date2, ItemCriteria cri, Model model) {
		 
		 orderStat = orderStat == null?  "" : orderStat;
		 date1 = date1 == null?  "" : date1;
		 date2 = date2 == null?  "" : date2;
		 
		 int total = service.getTotal(cri);
		 model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
		 
		 System.out.println(orderStat);
		 
		 if(!orderStat.equals("")) {
		 
		 	if(orderStat.equals("all")) {
				model.addAttribute("list", service.searcheckAll(orderStat));
			}else {
				model.addAttribute("list", service.searcheck(orderStat)); 
			}
		 }else {
			 if(!(date1.equals("")) && !(date2.equals("")) ) {
				 
				 
				 
				 ManagementVO vo = new ManagementVO();
				 
				 vo.setDate1(date1);
				 vo.setDate2(date2);
			
				 
		 			model.addAttribute("list", service.Shippingdate(vo)); 
		 			
		 		}
		 }
		 	
	 }
	 
	 
	 //배송대기중 출력
	 @GetMapping("/shipping")
	 public void  shippinglist(ItemCriteria cri , Model model, String date1,String date2) {
	 int total = service.getNotTotal(cri);

	
	   cri.setDate1(date1);
	   cri.setDate2(date2);
	   
	   System.out.println(cri.getDate1());
	   System.out.println(cri.getDate2());

	 
	 
	  model.addAttribute("list", service.shippinggetList(cri));
	  model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
	  
	  
	
		 
	 }
	 
	
	 
	 //송장 변경 및 배송 statas 변경
	 @PostMapping("/shipping")
		public String shippingupdate(String shippingCode,String orderCode,String baskId,String itemCode, Model model) {
  
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
			 return "redirect:/shop/shipping";
		}

	 

}
