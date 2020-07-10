package com.jujumarket.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.board.domain.Board_QNAVO;
import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.domain.PageDTO;
import com.jujumarket.board.service.Board_QNAService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor

public class Board_QNAController {

	private Board_QNAService service;
	
	/*
	 * @GetMapping("/myQna/list") public void list(Model model) {
	 * 
	 * log.info("list"); model.addAttribute("list", service.getList());
	 * 
	 * }
	 */


	@PostMapping("/myQna/register")
	public String register(Board_QNAVO qna, RedirectAttributes rttr) {
		log.info("register : " + qna);

		service.register(qna);

		rttr.addFlashAttribute("result", qna.getPostingNo());

		return "redirect:/mypage/myQna/list";

	}


	
	  @GetMapping("/myQna/list") 
	  public void list(Criteria cri, Model model) {
		  
	
	  
	  log.info("qna" + cri);
	  
	  
	  model.addAttribute("qna", service.getList(cri));
	  
	  int total = service.getTotal(cri);
	  log.info("total: " + total);
	  
	  model.addAttribute("pageMaker", new PageDTO(cri,total));
	  }
	 


	@GetMapping("/myQna/register")
	public void register() {

	}


	@GetMapping({ "/myQna/get", "/myQna/modify" })
	public void get(@RequestParam("postingNo") String postingNo, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/myQna/get or /myQna/modify");

		model.addAttribute("Board_QNA", service.get(postingNo));
		

	}

	@PostMapping("/myQna/modify")
	public String modify(Board_QNAVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + qna);

		if (service.modify(qna)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/mypage/myQna/list"+ cri.getListLink();
	}

	@PostMapping("/myQna/remove")
	public String remove(@RequestParam("postingNo") String postingNo,
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove....." + postingNo);
		if (service.remove(postingNo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/mypage/myQna/list" + cri.getListLink();
	}

}

