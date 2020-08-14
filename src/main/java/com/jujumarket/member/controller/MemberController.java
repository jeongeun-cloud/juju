package com.jujumarket.member.controller;

import java.io.File;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.main.controller.BasketController;
import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;
import com.jujumarket.member.service.CustomerService;
import com.jujumarket.member.service.MailService;
import com.jujumarket.member.service.MemberService;
import com.jujumarket.member.service.SellerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	private MemberService memberService;
	private CustomerService customerService;
	private SellerService sellerService;
	private MailService mailService;
	private ServletContext servletContext;
	private BasketController basketController;

	// [회원가입]일반회원/상인회원 선택
	@GetMapping("/chooseMemberType")
	public void chooseMemberType() {

	}

	// [회원가입]일반회원
	@GetMapping("/customerJoinForm")
	public void customerJoinForm() {
	}

	// [회원가입]일반회원
	@PostMapping("/customerJoinForm")
	public String customerJoinForm(CustomerVO customer, RedirectAttributes rttr) {
		customerService.register(customer);
		rttr.addFlashAttribute("customer", customer);
		return "redirect:/member/customerJoinComplete";
	}

	// [회원가입][일반고객]완료
	@GetMapping("/customerJoinComplete")
	public void customerJoinComplete() {

	}

	// [회원가입]상인회원
	@GetMapping("/sellerJoinForm")
	public void sellerJoinForm() {

	}

	// [회원가입]상인회원 (+이미지 업로드)
	@PostMapping("/sellerJoinForm")
	public String sellerJoinForm(SellerVO seller, MultipartFile[] uploadFile, RedirectAttributes rttr) {

		String uploadFolder = servletContext.getRealPath("/resources/seller");
		File uploadPath = new File(uploadFolder, seller.getBusinessCode());
		System.out.println("upload path : " + uploadPath);
		log.info("upload path : " + uploadPath);

		// 사업자등록번호를 이름으로 하는 이미지 저장폴더 생성
		if (uploadPath.exists() == false) {
			uploadPath.mkdir();
		}

		int i = 0;
		for (MultipartFile multi : uploadFile) {
			String uploadFilename = multi.getOriginalFilename();
			if (uploadFilename.equals("")) {
				break;
			}

			// IE has file path
			uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("\\") + 1);

			UUID uuid = UUID.randomUUID();
			uploadFilename = uuid.toString() + "_" + uploadFilename;

			try {
				// 이미지 파일 path에 올리기
				File saveFile = new File(uploadPath, uploadFilename);
				multi.transferTo(saveFile);

			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch

			if (i == 0)
				seller.setBusinessRegFile(uploadFilename);
			else if (i == 1)
				seller.setThumbImg(uploadFilename);
			else if (i == 2)
				seller.setBackImg(uploadFilename);
			i++;
		}
		sellerService.register(seller);
		rttr.addFlashAttribute("seller", seller);
		return "redirect:/member/sellerJoinComplete";
	}

	// [회원가입][상인회원]완료
	@GetMapping("/sellerJoinComplete")
	public void sellerJoinComplete() {

	}

	// [회원가입]이메일인증
	@ResponseBody
	@PostMapping("/emailAuth")
	public ResponseEntity<?> emailAuth(@RequestBody String email) {
		String authKey = mailService.sendMail(email);
		return ResponseEntity.status(HttpStatus.OK).body(authKey);
	}

	// [회원가입]이메일 중복체크
	@ResponseBody
	@PostMapping(value = "/duplicateCheck", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> duplicateCheck(@RequestBody String emailAccount) {
		boolean result = memberService.duplicateCheck(emailAccount);
		return ResponseEntity.status(HttpStatus.OK).body(result);
	}

	// [회원가입]][상인회원]사업자등록번호 중복체크
	@ResponseBody
	@PostMapping(value = "/bcUniqueCheck", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> bcUniqueCheck(@RequestBody String businessCode) {
		boolean result = sellerService.bcUniqueCheck(businessCode);
		return ResponseEntity.status(HttpStatus.OK).body(result);
	}

	// [로그인]
	@GetMapping("/login")
	public void login() {

	}

	// [로그인]이메일로 idNo가져와서 세션에 로그인정보 저장
	@PostMapping("/login")
	public String login(String emailAccount, String pwd, HttpSession session, RedirectAttributes rttr) {

		if (memberService.loginCheck(emailAccount, pwd)) {
			MemberVO member = memberService.getMemberInfo(emailAccount);
			session.setAttribute("sessionMember", member);
			// 기존 세션에 저장된 최근본상품 초기화
			basketController.setRecentlySeen(new LinkedList<>());
			return "redirect:/";

		} else {
			rttr.addFlashAttribute("result", "로그인에 실패했습니다.");
			return "redirect:/member/login";
		}
	}

	// [로그아웃]
	@GetMapping("/logout")
	public String logout(HttpSession session) {

		// 1. 세션에 담긴 멤버 정보만 삭제
		session.removeAttribute("sessionMember");
		// 기존 세션에 저장된 최근본상품 초기화
		basketController.setRecentlySeen(new LinkedList<>());

		// 2. 세션 전체 삭제
		// session.invalidate();
		return "redirect:/";
	}

	// [ID/PW찾기]
	@GetMapping("/findIdPwd")
	public void findIdPwd() {

	}

	// [ID/PW찾기]
	@ResponseBody
	@PostMapping(value = "/findId", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> findId(@RequestBody MemberVO member) {
		List<String> emailList = memberService.getEmailList(member);

		return ResponseEntity.status(HttpStatus.OK).body(emailList);
	}

	// [ID/PW찾기]변경된 비밀번호 저장
	@PostMapping("/findIdPwd")
	public String findIdPwd(MemberVO member, RedirectAttributes rttr) {
		if (memberService.updatePwd(member)) {
			rttr.addFlashAttribute("result", "변경된 비밀번호로 로그인 해주세요.");
			return "redirect:/member/login";
		} else {
			rttr.addFlashAttribute("result", "비밀번호가 변경되지 않았습니다. ");
			return "redirect:/member/findIdPwd";

		}

	}

}
