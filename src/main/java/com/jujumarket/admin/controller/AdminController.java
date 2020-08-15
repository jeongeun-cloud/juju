package com.jujumarket.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jujumarket.admin.domain.ListItemVO;
import com.jujumarket.admin.domain.MemStatVO;
import com.jujumarket.admin.domain.MemberManageVO;
import com.jujumarket.admin.service.MemStatService;
import com.jujumarket.admin.service.MemberManageService;
import com.jujumarket.admin.service.QnaListService;
import com.jujumarket.board.service.BoardFAQService;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ItemPageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	
	private MemStatService msservice;
	private BoardFAQService fservice;
	private QnaListService qservice;
	private MemberManageService mmservice;
	
	
	@GetMapping("/index")
	public void index(Model model) {
		
		MemStatVO vo = new MemStatVO();
		//총 회원수 
		Integer iT = msservice.TotalMem();
		if(iT==null) { iT=0;}
		vo.setIT(iT);
		model.addAttribute("iT", vo.getIT());
		
		//총 회원수 
		Integer iTodayT = msservice.TodayTotalMem();
		if(iTodayT==null) { iTodayT=0;}
		vo.setITodayT(iTodayT);
		model.addAttribute("iTodayT", vo.getITodayT());
		
		//총 회원수 
		Integer iWithdrawT = msservice.WithdrawTotal();
		if(iWithdrawT==null) { iWithdrawT=0;}
		vo.setIWithdrawT(iWithdrawT);
		model.addAttribute("iWithdrawT",vo.getIWithdrawT());
		
		//총 회원수 
		Integer iTodayWithdrawT = msservice.TodayWithdrawTotal();
		if(iTodayWithdrawT==null) { iTodayWithdrawT=0;}
		vo.setITodayWithdrawT(iTodayWithdrawT);
		model.addAttribute("iTodayWithdrawT", vo.getITodayWithdrawT());
		
		//notice
	
		model.addAttribute("noticelist",fservice.getnotice());
		model.addAttribute("faqlist",fservice.getfaq());
		
		//오늘 1:1 문의 한 고객,상인 num
		int cNum =msservice.cNum();
		vo.setCNum(cNum);
		model.addAttribute("cNum", vo.getCNum());
		
		int sNum =msservice.sNum();
		vo.setSNum(sNum);
		model.addAttribute("sNum", vo.getSNum());
		
	}
	
	//회원현황
	@GetMapping("/memberStat")
	public void minfo(@RequestParam(value="searchDay", defaultValue="202008") String day , Model model) {
		
		//System.out.println("searchDay는"+day);
		String year= day.substring(0, 4);
		String month=day.substring(4,6);
		
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		
		MemStatVO vo = new MemStatVO();
		//일반회원
		Integer customerNum = msservice.getCusNum();
		if(customerNum==null) {customerNum=0;}
		vo.setCustomerNum(customerNum);
		
		//상인
		Integer sellerNum = msservice.getSellNum();
		if(sellerNum==null) {sellerNum=0;}
		vo.setSellerNum(sellerNum);
		
		model.addAttribute("customerNum", vo.getCustomerNum());
		model.addAttribute("sellerNum", vo.getSellerNum());
		//총합
		Integer totalNum= customerNum+sellerNum;
		model.addAttribute("totalNum", totalNum);
		
		//회원가입한 회원 통계
		String result="";
		List<MemStatVO> ms = msservice.getMemSta(day);
		
		for(MemStatVO key: ms) {
			
			if(result!="") {
				result +=",";				
			}
			result +="["+key.getRegiday()+", "+key.getRegiMem()+"]";
		}
		//System.out.println("이번달 고객 가입수"+result);
		model.addAttribute("MemStat",result);
		
		//탈퇴한 회원 통계
		String result2="";
		List<MemStatVO> wd = msservice.getWithdrawSta(day);
		
		for(MemStatVO key2: wd) {
			
			if(result2!="") {
				result2 +=",";				
			}
			result2 +="["+key2.getWithday()+", "+key2.getWithMem()+"]";
		}
		//System.out.println("이번달 탈퇴 가입수"+result2);
		model.addAttribute("WithdrawSta",result2);
		
	}
	
	//탈퇴 회원 
	@GetMapping("/withdraw")
	public void withdraw(ItemCriteria cri,Model model) {
		
		int total = msservice.getWithdrawTotal(cri);
		
		model.addAttribute("withdraw", msservice.getWithdraw(cri));
		model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
	}

	//1:1문의 게시판 모아보기
	@GetMapping("/QnaList")
	public void qnalist(ItemCriteria cri, Model model) {
		
		int total = qservice.QnalistTotal(cri);
		
		model.addAttribute("qna",qservice.getQnaList(cri));
		model.addAttribute("pageMaker", new ItemPageDTO(cri,total));
	}
	
	@GetMapping("/memberManage")
	public void memberManage(ItemCriteria cri, Model model) {
		
		List<MemberManageVO> list = mmservice.getTotal();
		int total = list.size();
		
		model.addAttribute("blackList",mmservice.getBlack());
		model.addAttribute("allMember", mmservice.getAllMember(cri));
		model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
	}
	
	@PostMapping("/regBlack")
	@ResponseBody
	public ResponseEntity<String> regSeason(String[] idNo) {
		
		for(int i=0; i<idNo.length; i++) {
			MemberManageVO vo = mmservice.getMember(idNo[i]);
	
			mmservice.regBlack(vo);
		}

		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
}
