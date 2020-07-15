package com.jujumarket.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.board.domain.BoardFAQVO;
import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.domain.PageDTO;
import com.jujumarket.board.service.BoardFAQService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor

public class BoardFAQController {

	private BoardFAQService service;


	@PostMapping("/BoardFAQ/register")
	public String faqRegister(BoardFAQVO faq, RedirectAttributes rttr) {
		log.info("register : " + faq);

		service.register(faq);

		rttr.addFlashAttribute("result", faq.getPostingNo());

		return "redirect:/community/BoardFAQ/list";

	}

	@PostMapping("/notice/register")
	public String noticeRegister(BoardFAQVO notice, RedirectAttributes rttr) {
		log.info("register : " + notice);

		service.register(notice);

		rttr.addFlashAttribute("result", notice.getPostingNo());

		return "redirect:/community/notice/list";

		
	}

	@GetMapping("/BoardFAQ/list")
	public void faqlist(Criteria cri, Model model) {

		log.info("faq " + cri);
		
	
		model.addAttribute("faq", service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info("total:dddddddd " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}

	
	
	
	@GetMapping("/notice/list")
	public void noticelist(Criteria cri,Model model) {
		log.info("notice");

		model.addAttribute("notice", service.noticegetList(cri));

		int total = service.getnoticeTotal(cri);
		log.info("total:dddddddd " + total);
		log.info("total: " + total);
		
		
		System.out.println("total"+total);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		
	}

	@GetMapping("/BoardFAQ/register")
	public void faqregister() {

	}

	@GetMapping("/notice/register")
	public void noticeregister() {

	}

	@GetMapping({ "/BoardFAQ/get", "/BoardFAQ/modify" })
	public void faqget(@RequestParam("postingNo") String postingNo, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/BoardFAQ/get or /BoardFAQ/modify");

		model.addAttribute("BoardFAQ", service.get(postingNo));
		

	}

	@PostMapping("/BoardFAQ/modify")
	public String modify(BoardFAQVO fqa,
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + fqa);

		if (service.modify(fqa)) {
			rttr.addFlashAttribute("result", "success");
			
			
		}

		return "redirect:/community/BoardFAQ/list"+cri.getListLink();
	}
	

	@PostMapping("/BoardFAQ/remove")
	public String remove(@RequestParam("postingNo") String postingNo,
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove....." + postingNo);
		if (service.remove(postingNo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/community/BoardFAQ/list"+cri.getListLink();
		
	}
	

	@GetMapping({ "/notice/get", "/notice/modify" })
	public void noticeGet(@RequestParam("postingNo") String postingNo,
			@ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/notice/get or /notice/modify");

		model.addAttribute("BoardFAQ", service.get(postingNo));

	}
	

	@PostMapping("/notice/modify")
	public String noticeModify(BoardFAQVO notice,@ModelAttribute("cri") Criteria cri,  RedirectAttributes rttr) {
		log.info("modify : " + notice);

		if (service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		

		return "redirect:/community/notice/list" + cri.getListLink();
	}

	@PostMapping("/notice/remove")
	public String noticeRemove(@RequestParam("postingNo") String postingNo,@ModelAttribute("cri")
	Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove....." + postingNo);
		
		if (service.remove(postingNo)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/community/notice/list" + cri.getListLink();
	}

}
