package com.jujumarket.member.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.PageDTO;
import com.jujumarket.member.domain.MemberHistoryVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.MyPageVO;
import com.jujumarket.member.domain.MyPerchaseVO;
import com.jujumarket.member.service.CustomerService;
import com.jujumarket.member.service.MemberService;
import com.jujumarket.member.service.MyPageService;
import com.jujumarket.member.service.SellerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class MyPageController {

	private MemberService memberService;
	private CustomerService customerService;
	private SellerService sellerService;
	private ServletContext servletContext;
	private MyPageService myPageService;

	
	
	@PostMapping("/myPurchaseListGuest")
	public String myPurchaseListGuest(String orderCode, String nonMemPwd, Model model) {
		
		if(nonMemPwd==null || nonMemPwd.equals("")) {
			return "member/login";
		}
		
		List<MyPerchaseVO> myPerchase = myPageService.getGuestPurchaseListByOrderCode(orderCode);
		model.addAttribute("myPerchaseList", myPerchase);
		
		return "/mypage/myPurchaseListGuest";
		
	}
	
	
	
	
	// [마이페이지]나의 주문내역 (최초 페이지 로드 시 get방식 사용) 
	@GetMapping("/myPerchaseList")
	public String myPerchase(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		if (member == null) {
			return "redirect:/member/login";
		}
		Criteria cri = new Criteria(1, 10);
		String idNo = member.getIdNo();
		List<MyPerchaseVO> myPerchase = myPageService.getMyPerchaseListByIdNo(idNo, cri);
		model.addAttribute("myPerchaseList", myPerchase);

		int myPerchaseNum = myPageService.getMyPerchaseCountByIdNo(idNo, cri);
		model.addAttribute("pageMaker", new PageDTO(cri, myPerchaseNum));

		return "/mypage/myPerchaseList";
	}

	// 페이지 이동 ajax방식으로 처리
	@GetMapping(value = "/myPerchase/page/{pageNum}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<?> myPerchase(HttpSession session, @PathVariable int pageNum) {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		Criteria cri = new Criteria(pageNum, 10);
		String idNo = member.getIdNo();
		List<MyPerchaseVO> myPerchase = myPageService.getMyPerchaseListByIdNo(idNo, cri);
		return ResponseEntity.status(HttpStatus.OK).body(myPerchase);
	}

	// [마이페이지]나의 상품문의 (최초 페이지 로드 시 get방식 사용) 
	@GetMapping("/myPrdReply")
	public String myPrdReply(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		if (member == null) {
			return "redirect:/member/login";
		}
		Criteria cri = new Criteria(1, 10);
		String idNo = member.getIdNo();
		List<MyPageVO> myPrdReply = myPageService.getMyPrdReplyListByIdNo(idNo, cri);
		model.addAttribute("myPrdReplyList", myPrdReply);

		int myPrdReplyNum = myPageService.getMyPrdReplyCountByIdNo(idNo, cri);
		model.addAttribute("pageMaker", new PageDTO(cri, myPrdReplyNum));

		return "/mypage/myPrdReply";
	}

	// 페이지 이동 ajax방식으로 처리
	@GetMapping(value = "/myPrdReply/page/{pageNum}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<?> myPrdReply(HttpSession session, @PathVariable int pageNum) {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		Criteria cri = new Criteria(pageNum, 10);
		String idNo = member.getIdNo();
		List<MyPageVO> myPrdReply = myPageService.getMyPrdReplyListByIdNo(idNo, cri);
		return ResponseEntity.status(HttpStatus.OK).body(myPrdReply);
	}

	// [마이페이지]나의 상품평 (최초 페이지 로드 시 get방식 사용)
	@GetMapping("/myReview")
	public String myReview(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		if (member == null) {
			return "redirect:/member/login";
		}
		Criteria cri = new Criteria(1, 10);
		String idNo = member.getIdNo();
		List<MyPageVO> myReview = myPageService.getMyReviewListByIdNo(idNo, cri);
		model.addAttribute("myReviewList", myReview);

		int myReviewNum = myPageService.getMyReviewCountByIdNo(idNo, cri);
		model.addAttribute("pageMaker", new PageDTO(cri, myReviewNum));

		return "/mypage/myReview";
	}

	// 페이지 이동 ajax방식으로 처리
	@GetMapping(value = "/myReview/page/{pageNum}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<?> myReview(HttpSession session, @PathVariable int pageNum) {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		Criteria cri = new Criteria(pageNum, 10);
		String idNo = member.getIdNo();
		List<MyPageVO> myReview = myPageService.getMyReviewListByIdNo(idNo, cri);
		return ResponseEntity.status(HttpStatus.OK).body(myReview);
	}

	// [마이페이지][일반회원]회원정보수정
	@GetMapping("/customerInfoModify")
	public String customerInfoModify(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		if (member == null) {
			return "redirect:/member/login";
		}
		String idNo = member.getIdNo();
		if (idNo.substring(0, 1).equals("c")) {
			model.addAttribute("customerInfo", memberService.getCustomerInfoByIdNo(idNo));
			return "/mypage/customerInfoModify";
		} else {
			return "redirect:/";
		}
	}

	// [마이페이지][일반회원]회원정보수정
	@PostMapping("/customerInfoModify")
	public String customerInfoModify(MemberVO member, RedirectAttributes rttr) {
		if (customerService.modifyCustomerInfo(member)) {
			rttr.addFlashAttribute("result", "회원정보를 수정했습니다.");
		}
		return "redirect:/mypage/customerInfoModify";

	}

	// [마이페이지][상인회원]회원정보수정
	@GetMapping("/sellerInfoModify")
	public String sellerInfoModify(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		if (member == null) {
			return "redirect:/member/login";
		}
		String idNo = member.getIdNo();
		if (idNo.substring(0, 1).equals("s")) {
			model.addAttribute("sellerInfo", memberService.getSellerInfoByIdNo(idNo));
			return "/mypage/sellerInfoModify";
		} else {
			return "redirect:/";
		}

	}

	// [마이페이지][상인회원]회원정보수정
	@PostMapping("/sellerInfoModify")
	public String sellerInfoModify(MemberVO member, RedirectAttributes rttr, MultipartFile[] uploadFile) {
		String uploadFolder = servletContext.getRealPath("/resources/seller");
		File uploadPath = new File(uploadFolder, member.getBusinessCode());
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
				i++;
				continue;
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
				member.setThumbImg(uploadFilename);
			else if (i == 1)
				member.setBackImg(uploadFilename);

			i++;
		}
		if (sellerService.modifySellerInfo(member)) {
			rttr.addFlashAttribute("result", "회원정보를 수정했습니다.");
		}
		return "redirect:/mypage/sellerInfoModify";

	}

	//[마이페이지]비밀번호 변경
	@GetMapping("/modifyPwd")
	public String modifyPwd(HttpSession session) {
		Object member = session.getAttribute("sessionMember");
		if (member == null) {
			return "redirect:/";
		}
		return "/mypage/modifyPwd";
	}

	//[마이페이지]비밀번호 변경
	@PostMapping("/modifyPwd")
	public String modifyPwd(String pwd, String newPwd, HttpSession session, RedirectAttributes rttr) {

		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		String idNo = member.getIdNo();

		if (memberService.checkPwd(idNo, pwd)) {
			member.setPwd(newPwd);
			memberService.updatePwd(member);
			session.invalidate();
			rttr.addFlashAttribute("result", "비밀번호가 변경되었습니다. 다시 로그인해주세요.");
			return "redirect:/member/login";
		}

		rttr.addFlashAttribute("result", "비밀번호가 일치하지 않습니다.");
		return "redirect:/mypage/modifyPwd";
	}

	//[마이페이지]회원탈퇴
	@GetMapping("/memberDelete")
	public String memberDelete(HttpSession session) {
		Object member = session.getAttribute("sessionMember");
		if (member == null) {
			return "redirect:/";
		}
		return "/mypage/memberDelete";
	}

	//[마이페이지]회원탈퇴
	@PostMapping("/memberDelete")
	public String memberDelete(MemberHistoryVO memberHistory, HttpSession session, RedirectAttributes rttr) {
		MemberVO member = (MemberVO) session.getAttribute("sessionMember");
		String idNo = member.getIdNo();
		memberHistory.setIdNo(idNo);
		if (memberService.checkPwd(idNo, memberHistory.getPwd())) {
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
	
	//[마이페이지]회원탈퇴완료
	@GetMapping("/memberDeleteComplete")
	public void memberDeleteComplete(HttpSession session) {
		session.invalidate();

	}
	//나의 단골 리스트 보기 
	@GetMapping("/myDangol")
	public void myDangol(HttpSession session,Model model) {
		MemberVO member = (MemberVO)session.getAttribute("sessionMember");
		String memidNo = member == null ? "" : member.getIdNo().trim();
		
		
		
		model.addAttribute("myDangol", myPageService.getMyDangol(memidNo));
		
		
		
	}

}