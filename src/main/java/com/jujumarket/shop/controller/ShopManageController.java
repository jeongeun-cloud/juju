package com.jujumarket.shop.controller;

import java.util.List;


import javax.mail.Session;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jujumarket.board.service.BoardFAQService;
import com.jujumarket.member.domain.DangolVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.service.MemberService;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ItemPageDTO;
import com.jujumarket.shop.domain.ShopManageVO;
import com.jujumarket.shop.domain.WholeStaVO;
import com.jujumarket.shop.service.RegisterItemService;
import com.jujumarket.shop.service.ShopManageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/shop")
@AllArgsConstructor
public class ShopManageController {

	private ShopManageService smservice;
	private BoardFAQService fservice;
	private RegisterItemService itemService;
	private MemberService mservice;
	
	@GetMapping("/")
	public String index(HttpSession session, Model model) {
		
		
		
		 ShopManageVO smvo = new ShopManageVO();
		 
		 MemberVO member = (MemberVO)session.getAttribute("sessionMember");
		  String idNo = member == null ? "" : member.getIdNo().trim(); 
		  
		  
		
		  String shopName=smservice.getShopName(idNo);
		  
		  model.addAttribute("shopName", shopName);
		  
		  
		  smvo.setShopId(idNo);
		  model.addAttribute("shopId", idNo);
		
		  Integer todayordercnt = smservice.todayOrderCnt(idNo);
		  if(todayordercnt == null ) {  todayordercnt=0; }
		  smvo.setTodayOrderCnt(todayordercnt);
		
		  model.addAttribute("todayOrderCnt", smvo.getTodayOrderCnt());
		  
		  //오늘 ,어제 주문량 비교 
		  String compare="";
			List<WholeStaVO> tt= smservice.getCompareSta(idNo);	
			for(WholeStaVO t :tt) {
				if(compare!="") {
					compare += ",";
					
				}
				compare +="['"+t.getDday()+"', "+t.getOrderT()+"]";
				
			}
			model.addAttribute("tt", compare);
			
		//공지사항
		model.addAttribute("noticelist",fservice.getnotice());
		model.addAttribute("faqlist",fservice.getfaq());	
		
		// 상품 아이템 갯수 출력
		ItemCriteria cri = new ItemCriteria();
		cri.setIdNo(idNo);
		int total = itemService.getTotal(cri);
		model.addAttribute("itemTotal", new ItemPageDTO(cri, total));
			
		//전체 상품 통계관리 
		String result="";
		List<WholeStaVO> rr= smservice.getWholeSta(idNo);
		
		for(WholeStaVO key: rr) {
			if(result!="") {
				result += ",";
				
			}
			result +="['"+key.getItemName()+"', "+key.getOrderCnt()+"]";
			
			
		}
		model.addAttribute("WholeSta", result); 
		return "shop/index";
	}
	
	
	@GetMapping("/sales")
	public void todaytotal( HttpSession session, Model model) {

		  ShopManageVO smvo = new ShopManageVO();
		  
		  //세션에서 ID가져오기	
		  

		  MemberVO member = (MemberVO)session.getAttribute("sessionMember");
		  String idNo = member == null ? "" : member.getIdNo().trim();   // 비어있을 때 null Exception 방지
		
		 //주문
		  Integer todayordertotal= smservice.todayOrderTotal(idNo);
		  if(todayordertotal == null ) {  todayordertotal=0; }
		  smvo.setTodayOrderTotal(todayordertotal);
		  
		  Integer prevordertotal=smservice.prevOrderTotal(idNo);
		  if(prevordertotal == null ) {  prevordertotal=0; }
		  smvo.setPrevOrderTotal(prevordertotal);
		  
		  Integer todayordercnt = smservice.todayOrderCnt(idNo);
		  if(todayordercnt == null ) {  todayordercnt=0; }
		  smvo.setTodayOrderCnt(todayordercnt);
		  
		  Integer prevordercnt= smservice.prevOrderCnt(idNo);
		  if(prevordercnt == null ) {  prevordercnt=0; }
		  smvo.setPrevOrderCnt(prevordercnt);
		 
		  //환불
		  Integer todayrefundtotal= smservice.todayRefundTotal(idNo);
		  if(todayrefundtotal == null ) {  todayrefundtotal=0; }
		  smvo.setTodayRefundTotal(todayrefundtotal);
		  
		  Integer prevrefundtotal=smservice.prevRefundTotal(idNo);
		  if(prevrefundtotal == null ) {  prevrefundtotal=0; }
		  smvo.setPrevRefundTotal(prevrefundtotal);
		  
		  Integer todayrefundcnt = smservice.todayRefundCnt(idNo);
		  if(todayrefundcnt == null ) {  todayrefundcnt=0; }
		  smvo.setTodayRefundCnt(todayrefundcnt);
		  
		  Integer prevrefundcnt= smservice.prevRefundCnt(idNo);
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
	public void shopStat(HttpSession session2 ,Model model) {
		
		WholeStaVO wsvo = new WholeStaVO();
		MemberVO member = (MemberVO)session2.getAttribute("sessionMember");
	    String idNo = member == null ? "" : member.getIdNo().trim();   // 비어있을 때 null Exception 방지
	    	   
		//오늘 판매량 top5
		model.addAttribute("TodayProSta",smservice.getTodayProSta(idNo));
		
		//전체 상품 통계관리 
		String result="";
		List<WholeStaVO> rr= smservice.getWholeSta(idNo);
		
		for(WholeStaVO key: rr) {
			if(result!="") {
				result += ",";
				
			}
			result +="['"+key.getItemName()+"', "+key.getOrderCnt()+"]";
			
			
		}
		model.addAttribute("WholeSta", result);
	
		//일자별 주문 금액 통계
		String result2="";
		List<WholeStaVO> dd= smservice.getDaySta(idNo);	
		for(WholeStaVO key2 :dd) {
			if(result2!="") {
				result2 += ",";
				
			}
			result2 +="['"+key2.getDayD()+"', "+key2.getOrderTotalD()+"]";
			
		}
		model.addAttribute("dd", result2);
	
		 //월별 주문 금액 통계
		String result3="";
		List<WholeStaVO> mm= smservice.getMonthSta(idNo);
		
		
		for(WholeStaVO key3 :mm) {
			if(result3!="") {
				result3 += ",";
				
			}
			result3 +="['"+key3.getDayM()+"', "+key3.getOrderTotalM()+"]";
			
		}
		model.addAttribute("mm", result3);
		 
		//년별 주문 금액 통계
		String result4="";
		List<WholeStaVO> yy= smservice.getYearSta(idNo);
		
		
		for(WholeStaVO key4 :yy) {
			if(result4!="") {
				result4 += ",";
				
			}
			result4 +="['"+key4.getDayY()+"', "+key4.getOrderTotalY()+"]";
			
		}
		model.addAttribute("yy", result4);

	}
	//상인 페이지에서 단골 회원 list 끌고 오기
	@GetMapping("/dangol")
	public void dangolList(HttpSession session,Model model) {
		
		MemberVO member = (MemberVO)session.getAttribute("sessionMember");
	    String shopidNo = member == null ? "" : member.getIdNo().trim();
	    
	    String shopName=smservice.getShopName(shopidNo);
	    
	    model.addAttribute("shopName", shopName);
	    
	    model.addAttribute("dangolList",mservice.getDangol(shopName));
	    
	    Integer total=mservice.totalDangol(shopName);
		if(total==null) {total=0;}
		model.addAttribute("totalDangol",total );
	    
	    
		
	}
	
	

}
