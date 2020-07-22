package com.jujumarket.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.member.domain.CustomerVO;
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
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	private MemberSerivce memberService;
	private CustomerService customerService;
	private SellerService sellerService;
	private MailService mailService;

	//회원가입 누르면 가장 먼저 뜨는 폼. 일반고객/상인고객 중 택1
	@GetMapping("/chooseMemberType")
	public void chooseMemberType() {
		
	}
	
	//REST방식으로 이메일 인증
	//ajax로 email주소를 받아오고 authKey return
	@ResponseBody
	@PostMapping("/emailAuth")
	public ResponseEntity<?> emailAuth(@RequestBody String email){
		String authKey = mailService.sendMail(email);
		return ResponseEntity.status(HttpStatus.OK).body(authKey);
	}
	
	//REST방식으로 이메일 중복체크
	@ResponseBody
	@PostMapping(value = "/duplicateCheck", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> duplicateCheck(@RequestBody String emailAccount){
		boolean result = memberService.duplicateCheck(emailAccount);
		return ResponseEntity.status(HttpStatus.OK).body(result);
	}
	
	
	//일반고객폼
	@GetMapping("/customerJoinForm") 
	public void customerJoinForm() {
	}
	
	
	//일반고객 가입 정보 POST방식 DB INSERT
	@PostMapping("/customerJoinForm")
	public String customerJoinForm(CustomerVO customer) {
		customerService.register(customer);
		return "redirect:/member/customerJoinComplete";
	}

	@GetMapping("/customerJoinComplete")
	public void customerJoinComplete() {
		
	}
	
	//상인회원가입폼 
	@GetMapping("/sellerJoinForm")
	public void sellerJoinForm() {
		
	}
	
	//상인(판매자) 가입정보 POST방식 DB INSERT
	@PostMapping("/sellerJoinForm")
	public String sellerJoinForm(SellerVO seller) {
		sellerService.register(seller);
		return "redirect:/member/sellerJoinComplete";
	}
	
	@GetMapping("/sellerJoinComplete")
	public void sellerJoinComplete() {
		
	}
	
	//주주마켓 로그인 페이지
	@GetMapping("/login")
	public void login() {
		
	}
	
	//세션에 로그인 정보 저장
	//이메일로 idNo가져와서 세션에 로그인정보 저장하기 
	@PostMapping("/login")
	public String login(String emailAccount, String pwd, HttpSession session, RedirectAttributes rttr) {
		
		if(memberService.loginCheck(emailAccount, pwd)) {
//			MemberVO member = memberService.getInfoByEmail(emailAccount);
			String idNo = memberService.getIdNoByEmail(emailAccount);
			session.setAttribute("sessionMember", idNo);
			return "redirect:/";
			
		}else {
			rttr.addFlashAttribute("result", "로그인 실패");
			return "redirect:/member/login";
		}
	}
	
	//로그아웃 세션
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionMember");
		return "redirect:/";
	}

}
