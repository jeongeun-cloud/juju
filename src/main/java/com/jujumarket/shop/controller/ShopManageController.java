package com.jujumarket.shop.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jujumarket.shop.domain.ShopManageVO;
import com.jujumarket.shop.domain.WholeStaVO;
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
		 //주문
		  Integer todayordertotal= smservice.todayOrderTotal();
		  if(todayordertotal == null ) {  todayordertotal=0; }
		  smvo.setTodayOrderTotal(todayordertotal);
		  
		  Integer prevordertotal=smservice.prevOrderTotal();
		  if(prevordertotal == null ) {  prevordertotal=0; }
		  smvo.setPrevOrderTotal(prevordertotal);
		  
		  Integer todayordercnt = smservice.todayOrderCnt();
		  if(todayordercnt == null ) {  todayordercnt=0; }
		  smvo.setTodayOrderCnt(todayordercnt);
		  
		  Integer prevordercnt= smservice.prevOrderCnt();
		  if(prevordercnt == null ) {  prevordercnt=0; }
		  smvo.setPrevOrderCnt(prevordercnt);
		 
		  //환불
		  Integer todayrefundtotal= smservice.todayRefundTotal();
		  if(todayrefundtotal == null ) {  todayrefundtotal=0; }
		  smvo.setTodayRefundTotal(todayrefundtotal);
		  
		  Integer prevrefundtotal=smservice.prevRefundTotal();
		  if(prevrefundtotal == null ) {  prevrefundtotal=0; }
		  smvo.setPrevRefundTotal(prevrefundtotal);
		  
		  Integer todayrefundcnt = smservice.todayRefundCnt();
		  if(todayrefundcnt == null ) {  todayrefundcnt=0; }
		  smvo.setTodayRefundCnt(todayrefundcnt);
		  
		  Integer prevrefundcnt= smservice.prevRefundCnt();
		  if(prevrefundcnt == null ) {  prevrefundcnt=0; }
		  smvo.setPrevRefundCnt(prevrefundcnt);
		  
		 
		  
		  
		  model.addAttribute("todayOrderTotal",smvo.getTodayOrderTotal());
		  model.addAttribute("prevOrderTotal", smvo.getPrevOrderTotal());
		  model.addAttribute("todayOrderCnt", smvo.getTodayOrderCnt());
		  model.addAttribute("prevOrderCnt", smvo.getPrevOrderCnt());
		  
		  model.addAttribute("todayRefundTotal",smvo.getTodayRefundTotal());
		  model.addAttribute("prevRefundTotal", smvo.getPrevRefundTotal());
		  model.addAttribute("todayRefundCnt", smvo.getTodayRefundCnt());
		  model.addAttribute("prevRefundCnt", smvo.getPrevRefundCnt());
		  

	}
	
	@GetMapping("/stats")
	public void shopStat(Model model) {
		
		model.addAttribute("TodayProSta",smservice.getTodayProSta());
//		model.addAttribute("DaySta",smservice.getDaySta());
//		model.addAttribute("MonthSta",smservice.getMonthSta());
//		model.addAttribute("YearSta",smservice.getYearSta());
		  
		
		//전체 상품 통계관리 
		String result="";
		List<WholeStaVO> rr= smservice.getWholeSta();
		
		for(WholeStaVO key: rr) {
			if(result!="") {
				result += ",";
				
			}
			result +="['"+key.getItemName()+"', "+key.getOrderCnt()+"]";
			
			
		}
		model.addAttribute("WholeSta", result);
		
		
		//일자별 주문 금액 통계
		String result2="";
		List<WholeStaVO> dd= smservice.getDaySta();
		
		for(WholeStaVO key2 :dd) {
			if(result2!="") {
				result2 += ",";
				
			}
			result2 +="['"+key2.getDayD()+"', "+key2.getOrderTotalD()+"]";
			
		}
		model.addAttribute("dd", result2);
	
		
		 //월별 주문 금액 통계
		String result3="";
		List<WholeStaVO> mm= smservice.getMonthSta();
		
		
		for(WholeStaVO key3 :mm) {
			if(result3!="") {
				result3 += ",";
				
			}
			result3 +="['"+key3.getDayM()+"', "+key3.getOrderTotalM()+"]";
			
		}
		model.addAttribute("mm", result3);
		 
		//년별 주문 금액 통계
		String result4="";
		List<WholeStaVO> yy= smservice.getYearSta();
		
		
		for(WholeStaVO key4 :yy) {
			if(result4!="") {
				result4 += ",";
				
			}
			result4 +="['"+key4.getDayY()+"', "+key4.getOrderTotalY()+"]";
			
		}
		model.addAttribute("yy", result4);
		
	}
	
	

}
