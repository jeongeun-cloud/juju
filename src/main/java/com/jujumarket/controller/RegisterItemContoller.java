package com.jujumarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.domain.RegisterItemVO;
import com.jujumarket.service.RegisterItemService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/register/*")
public class RegisterItemContoller {


	private RegisterItemService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping("/register")
	public String register(RegisterItemVO register, RedirectAttributes rttr) {
		log.info("register : " + register);
		service.register(register);
		rttr.addFlashAttribute("result", register.getItemCode());
		
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("register") String itemCode, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(itemCode));
	}
	
	@PostMapping("/modify")
	public String modify(RegisterItemVO register, RedirectAttributes rttr) {
		log.info("modify : " + register);
		
		if(service.modify(register)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("itemCode") String itemCode, RedirectAttributes rttr) {
		log.info("remove....." + itemCode);
		if(service.remove(itemCode)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
}
