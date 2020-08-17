package com.jujumarket.order.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.main.domain.BasketVO;
import com.jujumarket.order.domain.DeliveryVO;
import com.jujumarket.order.domain.MemberVO;
import com.jujumarket.order.domain.OrderInfoVO;
import com.jujumarket.order.domain.OrderMemberVO;
import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.domain.OrderResponseVO;
import com.jujumarket.order.domain.OrderVO;
import com.jujumarket.order.domain.PaymentVO;
import com.jujumarket.order.service.DeliverySerivce;
import com.jujumarket.order.service.OrderMemberService;
import com.jujumarket.order.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSON;
import net.sf.json.JSONArray;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor

public class OrderController {
   private OrderService orderService;
   private OrderMemberService orderMemberService;
   private DeliverySerivce deliveryService;

   // 상품테이블에서 idNo를 get방식으로 넘겨줌
   @GetMapping("/orderItemsForm")
   public String orderItemsForm(@RequestParam("idNo") String idNo, Model model, HttpSession session) {
      log.info("orderList");

      // model에 orderList를 담아 주문서(orderItemsForm.jsp)에 출력
      //model.addAttribute("orderList", orderService.getOrderResponse(idNo));
      
      // model에 memberInfo를 담아 주문서(orderItemsForm.jsp)에 출력
      // 0802 주정은 수정
      MemberVO vo = (MemberVO) session.getAttribute("sessionMember");
      String memCode = vo.getMemCode();
      if(memCode.equals("CUSTOMER")) {
         
         // model에 memberInfo를 담아 주문서(orderItemsForm.jsp)에 출력
         model.addAttribute("memberInfo", orderMemberService.getOrderMemberInfo(idNo));
         // idNo로 최근주문정보 가져오기->deliveryService에서 해당 주문정보 호출
         String orderCode = orderService.getRecentOrderCode(idNo);
         if (orderCode != null) {
            //model.addAttribute("recentDelivery", deliveryService.get(orderCode));
         }
      } else if(memCode.equals("SELLER") || memCode.equals("JUNIOR")) {
         model.addAttribute("memberInfo", orderMemberService.getOrderSellerInfo(idNo));
      } else {
         model.addAttribute("memberInfo", orderMemberService.getOrderSocialInfo(idNo));
      }
      
      // idNo로 최근주문정보 가져오기->deliveryService에서 해당 주문정보 호출
      String orderCode = orderService.getRecentOrderCode(idNo);
      
      //System.out.println("orderCode 비었어? " + orderCode);
      
      if (orderCode != null) {
         model.addAttribute("recentDelivery", deliveryService.get(orderCode));
      }

      return "order/orderItemsForm";
   }

   
   
   
   @PostMapping("/orderItemsForm")
   public void sendChkRow(@RequestParam("idNo") String idNo, String[] checkRow, Model model, HttpSession session) {

      
      List<BasketVO> list = new ArrayList<>();
      for (int i = 0; i < checkRow.length; i++) {
         list.add(orderService.getOne(checkRow[i]));
      }

      model.addAttribute("list", list);
      
      // 비회원일 경우를 대비해서 idNo를 컨트롤러에서 실어보낸다 
      model.addAttribute("controllerIdNo", idNo);

      // [baskId105, baskId107]
      //System.out.println("orderController 에서 Arrays.toString(checkRow) : " + Arrays.toString(checkRow));
      // [baskId105, baskId107]
      //System.out.println("orderController 에서 list.toString(): " + list.toString());

      log.info("orderList");
      // model에 orderList를 담아 주문서(orderItemsForm.jsp)에 출력
      //model.addAttribute("orderList", orderService.getOrderResponse(idNo));
      System.out.println(idNo);
      
      // 0802 주정은 수정
      // model에 memberInfo를 담아 주문서(orderItemsForm.jsp)에 출력
      OrderMemberVO orderMember = new OrderMemberVO();
      if(idNo.substring(0, 1).equals("c") || idNo.substring(0, 1).equals("g") ) {
         orderMember = orderMemberService.getOrderMemberInfo(idNo);
         //System.out.println(orderMemberService.getOrderMemberInfo(idNo).toString());
      }else if(idNo.substring(0, 1).equals("s")) {
         orderMember = orderMemberService.getOrderSellerInfo(idNo);
      }else {
         orderMember = orderMemberService.getOrderSocialInfo(idNo);
      }
      model.addAttribute("memberInfo", orderMember);
      
      // idNo로 최근주문정보 가져오기->deliveryService에서 해당 주문정보 호출
      String orderCode = orderService.getRecentOrderCode(idNo);
      if (orderCode != null) {
         
         DeliveryVO delivery = deliveryService.get(orderCode);
         
         if(delivery != null) {
            
            model.addAttribute("recentDelivery", delivery);
         }
         
      }

   }
   
   
   
   
   
   
   
   
   
   
   @GetMapping("/payAPItest")
   public void payAPItest() {

   }

   // orderResult화면을 보여줌
   @GetMapping("/orderResult")
   public String orderResult(@RequestParam("orderCode") String orderCode, Model model, HttpSession session) {
      log.info("/orderResult");
      OrderVO order = orderService.get(orderCode);
      
      //System.out.println("OrderController 에서 orderResult 메서드의 order.toString()" + order.toString());
      
      List<OrderResponseVO> itemList = orderService.showOrderList(orderCode);
      String idNo = order.getIdNo();
      
      // 0802 주정은 수정
      OrderMemberVO orderMember = new OrderMemberVO();
      if(idNo.substring(0, 1).equals("c") || idNo.substring(0, 1).equals("g")) {
         orderMember = orderMemberService.getOrderMemberInfo(idNo);
      }else if(idNo.substring(0, 1).equals("s")) {
         orderMember = orderMemberService.getOrderSellerInfo(idNo);
      }else {
         orderMember = orderMemberService.getOrderSocialInfo(idNo);
      }
//      List<OrderResponseVO> itemList = orderService.getOrderResponse(idNo);
      // 주문번호로 배송정보를 가져오기
      DeliveryVO delivery = deliveryService.get(orderCode);
      // jsp에서 사용할 요소들을 order, orderMember, itemList, delivery로 이름 줘서 쓰기
      model.addAttribute("order", order);
      model.addAttribute("orderMember", orderMember);
      model.addAttribute("itemList", itemList);
      model.addAttribute("delivery", delivery);
      return "/order/orderResult";
   }

   // orderResult 정보를 t_delivery DB에 insert. orderCode를 기준으로 insert
   @PostMapping("/orderResult")
   public void orderResult(OrderRequestVO order) {
      //System.out.println("orderResult postmapping 진행");
      //System.out.println("order 에 뭐가 담겨오는거냐"+order.toString());
      
      //log.info("orderResult postmapping 진행");
      //log.info(order);
      orderService.register(order);

      //return "redirect:/order/orderResult" + "?orderCode=" + orderCode;
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

   @GetMapping("/basketList")
   public void ddd() {

   }

//   @PostMapping("/basketList")
//   public void selectArr(String[] checkRow, Model model) {
//      
//      List<String> list = new ArrayList<>();
//      for(int i=0; i<checkRow.length; i++) {
//         list.add(checkRow[i]);
//      }
//      
//      model.addAttribute("list", list);
//      System.out.println(Arrays.toString(checkRow));
//      System.out.println(list.toString());
//      
//      //return "redirect:/order/orderItemsForm?idNo=c0001";
//   }

   

   @GetMapping("/getSelectedBasket")
   @ResponseBody
   public void getSelectedBasket(String baskId, Model model) {

      log.info(baskId);
      System.out.println(baskId);

      model.addAttribute("basket", orderService.getOne(baskId));

   }
   
   
   @PostMapping("/orderInsert")
   @ResponseBody
   public void orderInsert(@RequestBody OrderRequestVO order) {
      
      //System.out.println("OrderController의 orderInsert 메서드의 order.toString() : "+order.toString());
      
      orderService.register(order);
      
   }
   
   @PostMapping("/orderInfoInsert")
   @ResponseBody
   public void orderInfoInsert(@RequestBody OrderInfoVO notfullVO) {
      
      // notfullVO 에는 baskId 와 orderCode 만 들어있음 
      //System.out.println("OrderController 에서 baskId : " + notfullVO.getBaskId() + ", orderCode : " + notfullVO.getOrderCode());
      
      OrderInfoVO fullvo = orderService.getMakeInfoAndHistory(notfullVO.getBaskId());
      
      //System.out.println("fullvo : " + fullvo.toString());
      
      fullvo.setOrderCode(notfullVO.getOrderCode());
      fullvo.setDisAmount((fullvo.getNormPrice()-fullvo.getPrice())*fullvo.getItemNum());
      fullvo.setTotalPrice(fullvo.getPrice()*fullvo.getItemNum());
      
      
      orderService.orderInfoRegister(fullvo);
      
      orderService.orderHistoryRegister(fullvo);
      
   }
   
   @PostMapping("/paymentTableInsert")
   @ResponseBody
   public void paymentTableInsert(@RequestBody PaymentVO payment) {
      
      orderService.paymentRegister(payment);
      
   }
   
   
   @PostMapping("/deliveryTableInsert")
   @ResponseBody
   public void deliveryTableInsert(@RequestBody DeliveryVO delivery) {
      
      deliveryService.register(delivery);
      
   }
   
   
   @PostMapping("/gusetInsert")
   @ResponseBody
   public void gusetInsert(@RequestBody OrderMemberVO orderMember) {
      
      orderService.guestInsert(orderMember);
   }
   
   
   @PostMapping("/socialMemUpdate")
   @ResponseBody
   public void socialMemUpdate(@RequestBody OrderMemberVO orderMember) {
      orderService.socialMemUpdate(orderMember);
   }
   
   
   

}