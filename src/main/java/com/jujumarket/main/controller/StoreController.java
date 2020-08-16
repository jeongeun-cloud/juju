package com.jujumarket.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jujumarket.admin.domain.ListItemVO;
import com.jujumarket.admin.service.BannerService;
import com.jujumarket.main.domain.PageDTO;
import com.jujumarket.member.domain.DangolVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;
import com.jujumarket.member.service.MemberService;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.service.RegisterItemService;
import com.jujumarket.shop.service.RegisterItemServiceImpl;
import com.jujumarket.shop.service.ShopManageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product")
@AllArgsConstructor
public class StoreController {
	
	private RegisterItemService itemService;
	private MemberService memberService;
	private ShopManageService smservice;
	
	@GetMapping("/store")
	public void list(HttpSession session, ItemCriteria itemcri, String idNo, Model model) {
		log.info("product store 작동중");
		
		DangolVO vo = new DangolVO();
		
		MemberVO member = (MemberVO)session.getAttribute("sessionMember");
		String memidNo = member == null ? "" : member.getIdNo().trim();
		vo.setMemidNo(memidNo);
		String shopName = smservice.getShopName(idNo);
		vo.setShopName(shopName);
		
		model.addAttribute("memidNo", vo.getMemidNo());
		
		
		model.addAttribute("seller", memberService.getSellerInfoByIdNo(idNo));
		
		itemcri.setIdNo(idNo);	// 해당 샵 아이템만 가져오기
		
		int total = itemService.getTotal(itemcri);
		
		System.out.println(total);
		
		
	
		
		model.addAttribute("list", itemService.getList(itemcri));
		model.addAttribute("pageMaker", new PageDTO(itemcri,total));
		
		//단골 신청 했는지 확인
		int count=memberService.checkDangol(vo);
		
		if(count==0) {
			vo.setCheck("단골되기");
		}
		else {
			vo.setCheck("단골취소");
		}
		
		model.addAttribute("checkDangol", vo.getCheck());
		
		Integer membertotal=memberService.totalDangol(shopName);
		if(membertotal==null) {membertotal=0;}
		
		model.addAttribute("totalDangol",membertotal );
		
		
		
		
		
			
	}
	//단골 추가
	@GetMapping("/store/addDangol")
	public ResponseEntity<String> addDangol(HttpSession session,String shopName, Model model) {
		
		 MemberVO member = (MemberVO)session.getAttribute("sessionMember");
		 String memidNo = member == null ? "" : member.getIdNo().trim();
		 
		 
		 DangolVO vo = new DangolVO();
		 vo.setShopName(shopName);
		 vo.setMemidNo(memidNo);
		 
		 memberService.addDangol(vo);
		
		
		return new ResponseEntity<>("success", HttpStatus.OK);
		
	}
	//단골 취소
	@GetMapping("/store/cancelDangol")
	public ResponseEntity<String> cancelDangol(HttpSession session,String shopName, Model model) {
		
		 MemberVO member = (MemberVO)session.getAttribute("sessionMember");
		 String memidNo = member == null ? "" : member.getIdNo().trim();

		 
		 DangolVO vo = new DangolVO();
		 vo.setShopName(shopName);
		 vo.setMemidNo(memidNo);
		 
		 memberService.cancelDangol(vo);
		
		
		return new ResponseEntity<>("success", HttpStatus.OK);
		
	}
	

}
