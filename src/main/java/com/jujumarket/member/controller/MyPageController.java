package com.jujumarket.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.member.domain.MemberHistoryVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;
import com.jujumarket.member.service.CustomerService;
import com.jujumarket.member.service.MailService;
import com.jujumarket.member.service.MemberSerivce;
import com.jujumarket.member.service.SellerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class MyPageController {

	private MemberSerivce memberService;
	private CustomerService customerService;
	private SellerService sellerService;
	private MailService mailService;

	//일반고객 회원정보수정
	@GetMapping("/customerInfoModify")
	public String customerInfoModify(HttpSession session, Model model) {
		Object member = session.getAttribute("sessionMember");
		if (member == null) {
			return "redirect:/member/login";
		}
		String idNo = member.toString();
		if (idNo.substring(0, 1).equals("c")) {
			model.addAttribute("customerInfo", memberService.getCustomerInfoByIdNo(idNo));
			return "/mypage/customerInfoModify";
		} else {
			return "redirect:/";
		}
	}

	@PostMapping("/customerInfoModify")
	public String customerInfoModify(MemberVO member, RedirectAttributes rttr) {
		if (customerService.modifyCustomerInfo(member)) {
			rttr.addFlashAttribute("result", "회원정보를 수정했습니다.");
		}
		return "redirect:/mypage/customerInfoModify";
		
	}
	
	//상인 회원정보수정
	@GetMapping("/sellerInfoModify")
	public String sellerInfoModify(HttpSession session, Model model) {
		Object member = session.getAttribute("sessionMember");
		if (member == null) {
			return "redirect:/member/login";
		}
		String idNo = member.toString();
		if (idNo.substring(0, 1).equals("s")) {
			model.addAttribute("sellerInfo", memberService.getSellerInfoByIdNo(idNo));
			return "/mypage/sellerInfoModify";
		} else {
			return "redirect:/";
		}

	}
	

	@PostMapping("/sellerInfoModify")
	public String sellerInfoModify(MemberVO member, RedirectAttributes rttr) {
		if (sellerService.modifySellerInfo(member)) {
			rttr.addFlashAttribute("result", "회원정보를 수정했습니다.");
		}
		return "redirect:/mypage/sellerInfoModify";

	}
	
	
	@GetMapping("/modifyPwd")
	public void modifyPwd(String pwd) {
		
	}

	//회원탈퇴
	@GetMapping("/memberDelete")
	public String memberDelete(HttpSession session) {
		Object member = session.getAttribute("sessionMember");
		if (member == null) {
			return "redirect:/";
		}
		return "/mypage/memberDelete";
	}

	@PostMapping("/memberDelete")
	public String memberDelete(MemberHistoryVO memberHistory, HttpSession session, RedirectAttributes rttr) {
		String idNo = session.getAttribute("sessionMember").toString();
		//session에서 받아온 idNo를 memberHistory에 저장 
		memberHistory.setIdNo(idNo);
		if (memberService.deleteCheck(idNo, memberHistory.getPwd())) {
			if (idNo.substring(0, 1).equals("c")) {
				customerService.deleteMember(memberHistory);
				return "redirect:/mypage/memberDeleteComplete";

			} else if (idNo.substring(0, 1).equals("s")) {
				sellerService.deleteMember(memberHistory);
				return "redirect:/mypage/memberDeleteComplete";
			}

		}
		rttr.addFlashAttribute("result", "비밀번호가 일치하지않습니다.");
		return "redirect:/mypage/memberDelete";
	}
	
	//회원탈퇴완료 
	@GetMapping("/memberDeleteComplete")
	public void memberDeleteComplete(HttpSession session) {
		session.invalidate();
		
	}
	
	@GetMapping("/findIdPwd")
	public void findIdPwd() {
		
	}

}
