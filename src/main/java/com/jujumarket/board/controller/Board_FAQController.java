package com.jujumarket.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.board.domain.Board_FAQVO;
import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.domain.PageDTO;
import com.jujumarket.board.service.Board_FAQService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor

public class Board_FAQController {

	private Board_FAQService service;


	@PostMapping("/Board_FAQ/register")
	public String faqRegister(Board_FAQVO faq, RedirectAttributes rttr) {
		log.info("register : " + faq);

		service.register(faq);

		rttr.addFlashAttribute("result", faq.getPostingNo());

		return "redirect:/community/Board_FAQ/list";

	}

	@PostMapping("/notice/register")
	public String noticeRegister(Board_FAQVO notice, RedirectAttributes rttr) {
		log.info("register : " + notice);

		service.register(notice);

		rttr.addFlashAttribute("result", notice.getBoardType());

		return "redirect:/community/notice/list";

		
	}

	@GetMapping("/Board_FAQ/list")
	public void faqlist(Criteria cri, Model model) {

		log.info("faq " + cri);
		
	
		model.addAttribute("faq", service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}

	@GetMapping("/notice/list")
	public void noticelist(Criteria cri,Model model) {
		log.info("notice");

		model.addAttribute("notice", service.noticegetList(cri));

		int total = service.getTotal(cri);
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		
	}

	@GetMapping("/Board_FAQ/register")
	public void faqregister() {

	}

	@GetMapping("/notice/register")
	public void noticeregister() {

	}

	@GetMapping({ "/Board_FAQ/get", "/Board_FAQ/modify" })
	public void faqget(@RequestParam("postingNo") String postingNo, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/Board_FAQ/get or /Board_FAQ/modify");

		model.addAttribute("Board_FAQ", service.get(postingNo));
		

	}

	@PostMapping("/Board_FAQ/modify")
	public String modify(Board_FAQVO fqa, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + fqa);

		if (service.modify(fqa)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/community/Board_FAQ/list"+ cri.getListLink();
	}

	@PostMapping("/Board_FAQ/remove")
	public String remove(@RequestParam("postingNo") String postingNo,
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove....." + postingNo);
		if (service.remove(postingNo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/community/Board_FAQ/list" + cri.getListLink();
	}

	@GetMapping({ "/notice/get", "/notice/modify" })
	public void noticeGet(@RequestParam("postingNo") String postingNo,
			@ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/notice/get or /notice/modify");

		model.addAttribute("Board_FAQ", service.get(postingNo));

	}
	

	@PostMapping("/notice/modify")
	public String noticeModify(Board_FAQVO notice,@ModelAttribute("cri") Criteria cri,  RedirectAttributes rttr) {
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
