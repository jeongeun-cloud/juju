package com.jujumarket.shop.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.member.domain.MemberVO;
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
	 public void searlist(ItemCriteria cri,String date1,String date2,Model model,String orderStat,HttpSession session
			              ) {
		
		   orderStat = orderStat == null?  "" : orderStat;
		 
		   SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		   Date time = new Date();
		   String time1 = format1.format(time);
		
		   date1 = date1 == null?"2020-07-01": date1;
		   date2 = date2 == null?time1: date2;
		   date1 = date1 == ""?"2020-07-01": date1;
		   date2 = date2 == ""?time1: date2;
		
		   cri.setDate1(date1);
		   cri.setDate2(date2);
		   cri.setOrderStat(orderStat);
		   cri.setAmount(30);
		   
		   MemberVO vo = (MemberVO) session.getAttribute("sessionMember");
		   String memidNo = vo == null ? "" : vo.getIdNo().trim();
		   cri.setIdNo(memidNo);
		   
		   int total = service.getTotal(cri);
		   
		   System.out.println(cri.getIdNo());

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
	 public void  shippinglist(ItemCriteria cri , Model model, String date1,String date2,HttpSession session) {
		 
	 int total = service.getNotTotal(cri);
	  List<Integer>page = service.ListCount();
	  
	  System.out.println("페이지리스트당"+page);
	  System.out.println("페이지리스트당"+page.size());

	   MemberVO vo = (MemberVO) session.getAttribute("sessionMember");
	   String memidNo = vo == null ? "" : vo.getIdNo().trim();
	   cri.setIdNo(memidNo);
	  

	 
	   SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
	   Date time = new Date();
	   String time1 = format1.format(time);
	   
	   date1 = date1 == null?"2020-07-01": date1;
	   date2 = date2 == null?time1: date2;
	   date1 = date1 == ""?"2020-07-01": date1;
	   date2 = date2 == ""?time1: date2;
	   
	   
	   cri.setDate1(date1);
	   cri.setDate2(date2);
	   cri.setAmount(60);
	   
	       model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
	       model.addAttribute("list", service.shippinggetList(cri));

	 }
	
	 
	
	 
	 //송장 변경 및 배송 statas 변경
	 @PostMapping("/shipping")
		public String shippingupdate(String shippingCode,String orderCode,String baskId,String itemCode, Model model) {
  
	
		    ManagementVO vo = new ManagementVO();
		  
			String[] arrOrder = orderCode.toString().split(",");
			String[] arrShipping = shippingCode.toString().split(",");
			String[] arrbaskId = baskId.toString().split(",");
			String[] arritemCode = itemCode.toString().split(",");
			String[] arrShippingcode = new String[arrOrder.length];
			
			System.out.println(arrShippingcode.length);
			
			System.arraycopy(arrShipping, 0, arrShippingcode, 0, arrShipping.length);
			
		        
				if(arrOrder.length!=arrShipping.length) {
				  
				  	  for(int i = 0; i <arrShippingcode.length ;i++ ) {
					  
							  if(arrShippingcode[i]==null) {
							  arrShippingcode[i] = "";
					  }
				  }
					  
	           System.out.println("Arrays.toString(arrShippingcode)"+Arrays.toString(arrShippingcode));
				
	           	   String j="";
								 
					for(int i = 0; i <arrOrder.length ;i++ ) {
						
						
						
						if(!arrShippingcode[i].equals("")) {
			
					    	j = arrShippingcode[i];
						}

				
						if(arrShippingcode[i].equals("")) {
							arrShippingcode[i] = j;
						}
						}
			  
				
			  }
			 
			
			 System.out.println("Arrays.toString(arrOrder))"+Arrays.toString(arrOrder));
			 System.out.println("Arrays.toString(arrbaskId))"+Arrays.toString(arrbaskId));
			 System.out.println("Arrays.toString(arritemCode)"+Arrays.toString(arritemCode));
			 System.out.println("Arrays.toString(arrShippingcode22222)"+Arrays.toString(arrShippingcode));
			
	
			
			for (int i=0; i<arrOrder.length; i++) {
				
			     
			    
			    System.out.println("이ㅓㄱ야리거222222"+arrShippingcode[i]);
				
				vo.setOrderCode(arrOrder[i]);
				vo.setShippingCode(arrShippingcode[i]);
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
		   date1 = date1 == ""?"2020-07-01": date1;
		   date2 = date2 == ""?time1: date2;
		   
		   
		   cri.setDate1(date1);
		   cri.setDate2(date2);
		   cri.setOrderStat(orderStat);
		   
		   
		   
		   System.out.println(cri.toString());
		   System.out.println("맥크리"+cri);
		   
		   
		   int total = service.getRefundTotal(cri);
		   
		   

		   model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
		   
		   System.out.println("토토토토타타타타탈"+total);
		   
		   if(!orderStat.equals("")) {
				 
				 model.addAttribute("list", service.refundList(cri));
	       }
	 	}
	 
	 @PostMapping("/refund")
	 public String refundStatus(String orderCode,String orderStat,String baskId ,String itemCode,Model model) {
		 
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
