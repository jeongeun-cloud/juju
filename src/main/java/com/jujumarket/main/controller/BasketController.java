package com.jujumarket.main.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.main.domain.BasketVO;
import com.jujumarket.main.service.BasketService;
import com.jujumarket.main.service.ItemMainService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = {"product/*", "basket/*"})
@AllArgsConstructor
public class BasketController {
   
   private BasketService service;
   
   private ItemMainService iservice;
   
   
//   모든 url 에 장바구니 db 연결 
   @GetMapping("*")
   public void list(Model model) {
      
      log.info("listaaa");
      model.addAttribute("list", service.getList());
   }
   
//   item 으로 끝나는 곳에 장바구니 db 랑 item db 연결 
   @GetMapping("/item")
   public void get(@RequestParam("itemCode") String itemCode, Model model) {
      
      log.info("/item");
      model.addAttribute("product", iservice.get(itemCode));
      model.addAttribute("list", service.getList());
      
   }
   
   
   @PostMapping("/item")
   @ResponseBody
   public void register(@RequestBody BasketVO basket, RedirectAttributes rttr) {
	   
	   log.info("register: " + basket);
	   service.register(basket);
	   rttr.addFlashAttribute("result", basket.getBaskId());
   }
   
   
   
   
   
   
   
   
   
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
   
   @PostMapping("/modify")
   public String modify(BasketVO basket, RedirectAttributes rttr) {
      log.info("modify: " + basket);
      
      if(service.modify(basket)) {
         rttr.addFlashAttribute("result", "success");
      }
      
      return "redirect:/basket/list";
   }
   
   @PostMapping("/remove")
   public String remove(@RequestParam("baskId") String baskId, RedirectAttributes rttr) {
      
      log.info("remove...." + baskId);
      
      if(service.remove(baskId)) {
         rttr.addFlashAttribute("result", "success");
      }
      
      return "redirect:/basket/list";
   }
   
   
   

}