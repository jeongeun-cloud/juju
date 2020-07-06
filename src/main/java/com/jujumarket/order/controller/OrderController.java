package com.jujumarket.order.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.domain.OrderResponseVO;
import com.jujumarket.order.domain.OrderVO;
import com.jujumarket.order.service.OrderMemberService;
import com.jujumarket.order.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {
	private OrderService orderService;
	private OrderMemberService orderMemberService;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		//jsp 화면처리에 DB 호출할 때 list 
		//model.addAttribute("list", orderService.getOrderResponse());
		//getOrderResponse는 OrderService에서 List<> 로 선언  
	}

	

	@GetMapping("/orderItemsForm")
	public void orderItemsForm(@RequestParam("idNo") String idNo, Model model) {
		log.info("orderList");
		model.addAttribute("orderList", orderService.getOrderResponse(idNo));
		model.addAttribute("memberInfo", orderMemberService.getOrderMemberInfo(idNo));

	}
	
	
//	@GetMapping("/orderResult")
//	public void get(@RequestParam("orderCode") String orderCode, Model model) {
//		log.info("/orderResult");
//		model.addAttribute("order", orderService.get(orderCode));
//	}
	
	@GetMapping("/orderResult")
	public void orderResult(@RequestParam("orderCode") String orderCode, Model model) {
		log.info("/orderResult");
		
	}
	
	@PostMapping("/orderResult")
	public String orderResult(OrderRequestVO order) {
		log.info("orderResult");
		List<OrderResponseVO> itemList = orderService.getOrderResponse(order.getIdNo());
		for(int i = 0; i<itemList.size(); i++) {
			OrderResponseVO item = itemList.get(i);
			order.setItemCode(item.getItemCode());
			orderService.register(order);
		}
		
		
		
		return "redirect:/order/orderResult"+"?orderCode=20200702-00011";
	}
	
	
	@PostMapping("/register")
	public String register(OrderRequestVO order, RedirectAttributes rttr) {
		log.info("register: " + order);
		orderService.register(order);
		
		rttr.addFlashAttribute("result", order.getOrderCode());
		
		return "redirect:/order/register";
	
	}
	
	
//	@GetMapping("/get")
//	public void get(@RequestParam("orderCode") String orderCode, Model model) {
//		log.info("/get");
//		model.addAttribute("order", service.get(orderCode));
//	}
	
	@PostMapping("/modify")
	public String modify(OrderVO order, RedirectAttributes rttr) {
		log.info("modify: " + order);
		
		if(orderService.modify(order)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect: /order/list";
	}
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("orderCode") String orderCode, RedirectAttributes rttr) {
		log.info("remove......" + orderCode);
		if(orderService.remove(orderCode)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/order/list";
	}
	
}
