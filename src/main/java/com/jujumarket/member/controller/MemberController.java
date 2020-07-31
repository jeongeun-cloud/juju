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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String sellerJoinForm(SellerVO seller, MultipartFile[] uploadFile) {
		
		  String uploadFolder = servletContext.getRealPath("/resources/seller");
	      File uploadPath = new File(uploadFolder, seller.getBusinessCode());
	      System.out.println("upload path : " + uploadPath);
	      log.info("upload path : " + uploadPath);
	      
	      //사업자등록번호를 이름으로 하는 이미지 저장폴더 생성
	      if(uploadPath.exists() == false) {
	         uploadPath.mkdir(); 
	      }

	      int i = 0;
	      for(MultipartFile multi : uploadFile) {
	         
	         String uploadFilename = multi.getOriginalFilename();
	         
	         if(uploadFilename.equals("")) {
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
	         
		         if(i==0) seller.setBusinessRegFile(uploadFilename);
		         else if(i==1) seller.setThumbImg(uploadFilename);
		         else if(i==2) seller.setBackImg(uploadFilename);
		         i++;
	      }
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
			MemberVO member = memberService.getMemberInfo(emailAccount);
//			String idNo = memberService.getIdNoByEmail(emailAccount);
			session.setAttribute("sessionMember", member);
			return "redirect:/";
			
		}else {
			rttr.addFlashAttribute("result", "로그인에 실패했습니다.");
			return "redirect:/member/login";
		}
	}
	
	//로그아웃 세션
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/findIdPwd")
	public void findIdPwd( ) {
		
	}
	
	@ResponseBody
	@PostMapping(value="/findId", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> findId(@RequestBody MemberVO member){
		List<String> emailList = memberService.getEmailList(member);

		return ResponseEntity.status(HttpStatus.OK).body(emailList);
	}
	

	@PostMapping("/findIdPwd")
	public String findIdPwd(MemberVO member, RedirectAttributes rttr) {
		if(memberService.updatePwd(member)) {
			rttr.addFlashAttribute("result", "비밀번호를 변경했습니다. 바뀐 비밀번호로 로그인 해주세요.");
			return "redirect:/member/login";
		}else {
			rttr.addFlashAttribute("result", "변경안됨");
			return "redirect:/member/findIdPwd";
			
			
		}
		
	}

}
