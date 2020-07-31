package com.jujumarket.main.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.main.domain.AlarmVO;
import com.jujumarket.main.domain.BasketVO;
import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.PageDTO;
import com.jujumarket.main.domain.ReviewVO;
import com.jujumarket.main.service.BasketService;
import com.jujumarket.main.service.ItemMainService;
import com.jujumarket.main.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@Log4j
@RequestMapping(value = {"product/*", "basket/*", "includes/*"})
@AllArgsConstructor
public class BasketController {
   
   private BasketService basketservice;
   
   private ItemMainService itemservice;
   
//   모든 url 에 장바구니 db 연결 
//   @GetMapping("*")
//   public void list(@RequestBody String id, Model model) {
//      
//      log.info("listaaa");
//      model.addAttribute("list", basketservice.getList(id));
//   }
   
   
   @GetMapping("/basketSlide")
   public void basketSlide() {
	   
	   
   }
   
   
//   item 으로 끝나는 곳에 장바구니 db 랑 item db 연결 
   @GetMapping("/item")
   public void get(@RequestParam("itemCode") String itemCode, Model model) {
      log.info("/item");

      model.addAttribute("product", itemservice.get(itemCode));
      model.addAttribute("shopName", itemservice.getShop(itemCode));
   }

   //알람 서비스 신청 받기
   @GetMapping("/addalarm")
   @ResponseBody
   public ResponseEntity<String> applyAlarm(String itemCode, String idNo, Model model) {
	   AlarmVO alarmvo = new AlarmVO();
	   alarmvo.setItemCode(itemCode);
	   alarmvo.setIdNo(idNo);
	   
	   System.out.println("컨트롤러에 들어온 itemCode"+itemCode);
	   System.out.println("컨트롤러에 들어온 idNo"+idNo);
	   System.out.println("vo에 저장됐을까?"+alarmvo.toString());
	  
	    itemservice.applyAlarm(alarmvo);
	   
	    return new ResponseEntity<>("success", HttpStatus.OK);
   }
   //알람 서비스 취소하기 
   @GetMapping("/cancelalarm")
   @ResponseBody
   public ResponseEntity<String> cancelAlarm(String itemCode, String idNo, Model model) {
	   AlarmVO alarmvo = new AlarmVO();
	   alarmvo.setItemCode(itemCode);
	   alarmvo.setIdNo(idNo);
	   
	   System.out.println("취소할  itemCode"+itemCode);
	   System.out.println("취소할 idNo"+idNo);
	   System.out.println("취소vo에 저장됐을까?"+alarmvo.toString());
	   
	    itemservice.cancelAlarm(alarmvo);
	   
	    return new ResponseEntity<>("success", HttpStatus.OK);
   }
   
   @GetMapping("/basket")
   @ResponseBody
   public ResponseEntity<?> basketlist(String id, Model model) {
      
	   System.out.println("컨트롤러에 id 잘 들어오나"+id);
	   
      log.info("listaaa");
      List<BasketVO> basket = null;
      basket = basketservice.getList(id);
      model.addAttribute("basket",JSONArray.fromObject(basket));
      
      return ResponseEntity.status(HttpStatus.OK).body(JSONArray.fromObject(basket));
      
//      model.addAttribute("list", service.getList());
   }
   
   @PostMapping("/basket")
   @ResponseBody
   public ResponseEntity<?> register(@RequestBody BasketVO basket) {
	   
	   log.info("register: " + basket);
	   
	   // 수량 안들어왔으면 1로 설정해준다
	   if(basket.getItemNum()==null) {
		   basket.setItemNum(1);
	   }
	   
      
      basketservice.register(basket);
      return ResponseEntity.status(HttpStatus.OK).body("DB insert ok~");
   }
   
   
   
   @DeleteMapping("/remove")
   @ResponseBody
   public ResponseEntity<?> delete(@RequestBody String baskId) {
	   
	   log.info("delete...");
	   basketservice.remove(baskId);
	   return ResponseEntity.status(HttpStatus.OK).body("DB remove ok~");
	   
   }
   
   
   
   
   
   
   
//   @PostMapping("/remove")
// public String remove(@RequestParam("baskId") String baskId, RedirectAttributes rttr) {
//    
//    log.info("remove...." + baskId);
//    
//    if(service.remove(baskId)) {
//       rttr.addFlashAttribute("result", "success");
//    }
//    
//    return "redirect:/basket/list";
// }
   
   
   
   
//   @GetMapping("/item")
//   @ResponseBody
//   public void get() {
//      log.info("/item");
//      
//   }
   
   
   
   
   
   
//   @PostMapping("/item")
//   @ResponseBody()
//   public void register(BasketVO basket, RedirectAttributes rttr, @RequestParam("itemCode") String itemCode,  Model model) {
//      
//      basket.setBaskId("baskID73");
//      basket.setItemNum(1);
//      basket.setIdNo("cus000001");
//      basket.setItemCode("abcd1020");
//      basket.setItemName("itemName");
//      basket.setItemImg1("itemImg");
//      basket.setPrice(1000);
//      
//      log.info("register: " + basket);
//      service.register(basket);
//      rttr.addFlashAttribute("result", basket.getBaskId());
//      
//      
//   }

   
   
   
//   @PostMapping("/register")
//   public String register(BasketVO basket, RedirectAttributes rttr) {
//      
//      log.info("register: " + basket);
//      
//      service.register(basket);
//      
//      rttr.addFlashAttribute("result", basket.getBaskId());
//      
//      return "redirect:/basket/list";
//      
//   }
   
   
   
   
   
//   @PostMapping("/action/addToBasketAction")
//   public String register(BasketVO basket, RedirectAttributes rttr) {
//      
//      return "redirect:/product/item?itemCode=abcd0003";
//   }
   
   
   
//   @GetMapping("/detail")   
//   public void get(@RequestParam("idNo") String idNo, Model model) {
//      
//      log.info("/detail");
//      model.addAttribute("basket", service.get(idNo));
//   }
//   
   
//   @PostMapping("/modify")
//   public String modify(BasketVO basket, RedirectAttributes rttr) {
//      log.info("modify: " + basket);
//      
//      if(service.modify(basket)) {
//         rttr.addFlashAttribute("result", "success");
//      }
//      
//      return "redirect:/basket/list";
//   }
   
//   @PostMapping("/remove")
//   public String remove(@RequestParam("baskId") String baskId, RedirectAttributes rttr) {
//      
//      log.info("remove...." + baskId);
//      
//      if(service.remove(baskId)) {
//         rttr.addFlashAttribute("result", "success");
//      }
//      
//      return "redirect:/basket/list";
//   }
   

}