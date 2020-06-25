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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/*")
@AllArgsConstructor
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
		
		return "redirect:/shop/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("itemCode") String itemCode, Model model) {
		log.info("/get or modify");
		
		model.addAttribute("register", service.get(itemCode));
	}
	
	@PostMapping("/modify")
	public String modify(RegisterItemVO register, RedirectAttributes rttr) {
		log.info("modify : " + register);
		
		if(service.modify(register)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/shop/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("itemCode") String itemCode, RedirectAttributes rttr) {
		log.info("remove....." + itemCode);
		if(service.remove(itemCode)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/shop/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
}
