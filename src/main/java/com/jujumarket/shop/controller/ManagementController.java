package com.jujumarket.shop.controller;


import java.text.SimpleDateFormat;
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

	//searchorder /shipping

	 @GetMapping("/searchorder") 
	 public void searlist(ItemCriteria cri,String date1,String date2,Model model,String orderStat
			              ) {
		
		   orderStat = orderStat == null?  "" : orderStat;
		 
		   SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		   Date time = new Date();
		   String time1 = format1.format(time);
		
		   date1 = date1 == null?"2020-07-01": date1;
		   date2 = date2 == null?time1: date2;
		   cri.setDate1(date1);
		   cri.setDate2(date2);
		   cri.setOrderStat(orderStat);
		   
		   int total = service.getTotal(cri);

		   model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
		   model.addAttribute("list", service.searcheckAll(cri));
		   
		   if(!orderStat.equals("")) {
				 
				 	if(orderStat.equals("all")) {
						model.addAttribute("list", service.searcheckAll(cri));
					}else {
						 model.addAttribute("list", service.searchordergetList(cri));
				    }  
	
		  
  
	       }
	 }
	
	 //배송대기중 출력
	 @GetMapping("/shipping")
	 public void  shippinglist(ItemCriteria cri , Model model, String date1,String date2) {
	 int total = service.getNotTotal(cri);

	 
	   SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
	   Date time = new Date();
	   String time1 = format1.format(time);
	   
	   date1 = date1 == null?"2020-07-01": date1;
	   date2 = date2 == null?time1: date2;
	   
	   cri.setDate1(date1);
	   cri.setDate2(date2);

	   System.out.println("맥크리shiping"+cri);
	   
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
				
				
			
				service.shippingupdate(vo);
				  
				model.addAttribute("shippingCode");				

		  	}	
			 return "redirect:/shop/shipping";
		}

	 
	 
	
	 
	//취소요청주문	또는 취소처리주문 확인
	 @GetMapping("/refund") 
	 public void refundlist(ItemCriteria cri,String date1,String date2,Model model,String orderStat) {
		
		   orderStat = orderStat == null? "환불처리요청": orderStat;
		 
		   SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		   Date time = new Date();
		   String time1 = format1.format(time);
		
		   date1 = date1 == null?"2020-07-01": date1;
		   date2 = date2 == null?time1: date2;
		   cri.setDate1(date1);
		   cri.setDate2(date2);
		   cri.setOrderStat(orderStat);
		   
		   System.out.println(cri.toString());
		   System.out.println("맥크리"+cri);
		   
		   
		   int total = service.getTotal(cri);

		   model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
		   
		   
		   
		   if(!orderStat.equals("")) {
				 
				 model.addAttribute("list", service.refundList(cri));
	       }
	 	}
	 
	 @PostMapping("/refund")
	 public String refundStatus(String orderCode,String orderStat,String baskId ,String itemCode,Model model) {
		
//		 System.out.println("들어옴");
//		 System.out.println(orderCode);
//		 System.out.println(orderStat);
//		 System.out.println(baskId);
//		 System.out.println(itemCode);
		 
		 ManagementVO vo = new ManagementVO();
		  
			String[] arrorderCode = orderCode.toString().split(",");
			String[] arrorderStat = orderStat.toString().split(",");
			String[] arrbaskId = baskId.toString().split(",");
			String[] arritemCode = itemCode.toString().split(",");
		 
		 
			for (int i=0; i<arrorderCode.length; i++) {
				vo.setOrderCode(arrorderCode[i]);
				vo.setOrderStat(arrorderStat[i]);
				vo.setBaskId(arrbaskId[i]);
				vo.setItemCode(arritemCode[i]);
				
				
				
			service.refundupdate(vo);
				  
				model.addAttribute("refundCode");				

		  	}	
			 return "redirect:/shop/refund";
		}
	 
}
