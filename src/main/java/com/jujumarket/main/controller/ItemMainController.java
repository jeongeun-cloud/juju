package com.jujumarket.main.controller;
//package com.jujumarket.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.jujumarket.domain.ItemVO;
//import com.jujumarket.service.ItemService;
//
//import lombok.AllArgsConstructor;
//import lombok.extern.log4j.Log4j;
//
//@Controller
//@Log4j
//@RequestMapping("/product/*")
//@AllArgsConstructor
//public class ItemController {
//	
//	private ItemService service;
//	
//	@GetMapping("/list")
//	public void list(Model model) {
//		
//		log.info("list");
//		model.addAttribute("list", service.getList());
//		
//	}
//	
//	@PostMapping("/register")
//	public String register(ItemVO item, RedirectAttributes rttr) {
//		
//		log.info("register: " + item);
//		
//		service.register(item);
//		
//		rttr.addFlashAttribute("result", item.getItemCode());
//		
//		return "redirect:/product/list";
//	}
//	
//	@GetMapping("/item")
//	public void get(@RequestParam("itemCode") String itemCode, Model model) {
//		
//		log.info("/item");
//		model.addAttribute("product", service.get(itemCode));
//	}
//	
//	@PostMapping("/modify")
//	public String modify(ItemVO item, RedirectAttributes rttr) {
//		log.info("modify: " + item);
//		
//		if(service.modify(item)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		return "redirect:/product/list";
//	}
//	
//	
//	@PostMapping("/remove")
//	public String remove(@RequestParam("itemCode") String itemCode, RedirectAttributes rttr) {
//		
//		log.info("remove...." + itemCode);
//		if(service.remove(itemCode)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		return "redirect:/product/list";
//	}
//	
//	
//	
//
//}
