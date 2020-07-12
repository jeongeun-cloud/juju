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

	//상품테이블에서 idNo를 get방식으로 넘겨줌
	//model에 orderList, memberInfo를 담아서 정보를 출력
	@GetMapping("/orderItemsForm")
	public void orderItemsForm(@RequestParam("idNo") String idNo, Model model) {
		log.info("orderList");
		
		model.addAttribute("orderList", orderService.getOrderResponse(idNo));
		model.addAttribute("memberInfo", orderMemberService.getOrderMemberInfo(idNo));
		//memberInfo, orderList를 jsp에서 사용

	}

	//orderResult화면을 보여줌
	@GetMapping("/orderResult")
	public void orderResult(@RequestParam("orderCode") String orderCode, Model model) {
		log.info("/orderResult");

	}

	//orderResult 정보를  t_delivery DB에 insert 
//	@PostMapping("/orderResult")
//	public String orderResult(OrderRequestVO order) {
//		log.info("orderResult");
//		log.info(order);
//		String orderCode = orderService.register(order);
//
//		return "redirect:/order/orderResult" + "?orderCode=" + orderCode;
//	}
	
	
	//orderResult에 그냥 넘겨주는 방식
	@PostMapping("/orderResult")
	public void orderResult(OrderRequestVO order, Model model) {
		log.info("orderResult");
		log.info(order);
		String orderCode = orderService.register(order);
		model.addAttribute("orderResult", order);

		
//		return "redirect:/order/orderResult" + "?orderCode=" + orderCode;
	}

	@PostMapping("/modify")
	public String modify(OrderVO order, RedirectAttributes rttr) {
		log.info("modify: " + order);

		if (orderService.modify(order)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect: /order/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("orderCode") String orderCode, RedirectAttributes rttr) {
		log.info("remove......" + orderCode);
		if (orderService.remove(orderCode)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/order/list";
	}

}
