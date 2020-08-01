package com.jujumarket.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jujumarket.admin.domain.ListItemVO;
import com.jujumarket.admin.service.BannerService;
import com.jujumarket.member.service.MemberService;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.service.RegisterItemService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product")
@AllArgsConstructor
public class StoreController {
	
	private RegisterItemService itemService;
	private MemberService memberService;
	
	@GetMapping("/store")
	public void list(ItemCriteria cri, String idNo, Model model) {
		log.info("product store 작동중");
		
		model.addAttribute("seller", memberService.getSellerInfoByIdNo(idNo));
		
		cri.setIdNo(idNo);	// 해당 샵 아이템만 가져오기
		model.addAttribute("list", itemService.getList(cri));
		
	}

}
