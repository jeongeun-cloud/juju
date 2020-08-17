package com.jujumarket.main.controller;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jujumarket.main.domain.BasketVO;
import com.jujumarket.main.domain.ItemMainVO;
import com.jujumarket.main.service.BasketService;
import com.jujumarket.main.service.ItemMainService;

import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@Log4j
@RequestMapping(value = { "product/*", "basket/*", "includes/*" })
//@AllArgsConstructor
public class BasketController {

   private BasketService basketservice;
   private ItemMainService itemservice;

   // 0807 규원 추가
   // private LinkedHashSet<ItemMainVO> recentlySeen = new LinkedHashSet<>();
   // private LinkedHashMap<String, String> recentlySeen = new LinkedHashMap<String, String>();
   private LinkedList<ItemMainVO> recentlySeen = new LinkedList<ItemMainVO>();

   @Autowired
   public BasketController(BasketService basketservice, ItemMainService itemservice) {
      this.basketservice = basketservice;
      this.itemservice = itemservice;
   }

// private LinkedHashMap<String, String> recentlySeen;
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

   public void setRecentlySeen(LinkedList<ItemMainVO> recentlySeen) {
      this.recentlySeen = recentlySeen;
   }

   /* 기존 채련님 부분. 수정,삭제  없이 내용추가
    * //item 으로 끝나는 곳에 장바구니 db 랑 item db 연결
    * 
    * @GetMapping("/item") 
    * public void get(@RequestParam("itemCode") String itemCode, Model model) {
    *  log.info("/item");
    * 
    * model.addAttribute("product", itemservice.get(itemCode));
    * model.addAttribute("shopName", itemservice.getShop(itemCode)); 
    * }
    */
  
//    0807최근본 상품 구현 kw 
//   item 으로 끝나는 곳에 장바구니 db 랑 item db 연결 
   @GetMapping("/item")
   public void get(@RequestParam("itemCode") String itemCode, Model model, HttpSession session) {
      log.info("/item");
      // ItemMainVO를 LinkedList에 넣기 
      ItemMainVO item = itemservice.get(itemCode);
      // 중복 체크용 변수 num 
      int num = -1;
      // 사이즈 체크용 변수
      int capacity = 10;
      // 중복체크 
      for (int i = 0; i < recentlySeen.size(); i++) {
         if (itemCode.equals(recentlySeen.get(i).getItemCode())) {
            num = i;
         }
      }
      // 중복이 있으면 중복 삭제
      if (num != -1) {
         recentlySeen.remove(num);
      }
      // 용량에 맞춰서 오래된 상품 삭제
      if (recentlySeen.size() >= capacity) {
         recentlySeen.remove(0);
      }
      // 최근본 상품 추가 
      recentlySeen.add(item);
      session.setAttribute("recentlySeen", recentlySeen);

      // 최근본상품 잘 쌓이는지 확인 
      // System.out.println(recentlySeen);

      // 채련님 부분
      model.addAttribute("product", itemservice.get(itemCode));
      model.addAttribute("shopName", itemservice.getShop(itemCode));
   }
   
   
   
   
   @GetMapping("/getBasketTotal") 
   @ResponseBody
   public ResponseEntity getBasketTotal(String id, Model model, HttpSession session, HttpServletRequest request,
	         HttpServletResponse response) {
	   
	      // null 처리 시작 
	      if (id.equals("") || id == null) {

	         id="gnull";

	      }
	      // null 처리 끝
	      
	      Integer basketTotal = basketservice.getBasketTotal(id);
	      //System.out.println(id);
	      //System.out.println("basketTotal="+basketTotal);
	      //model.addAttribute("basketTotal", Integer.toString(basketTotal));
	      
	      if(basketTotal==null) {
	    	  basketTotal = 0;
	      }
	      
	      return ResponseEntity.status(HttpStatus.OK).body(Integer.toString(basketTotal));
   }
   
   
   

   @GetMapping("/basket")
   @ResponseBody
   public ResponseEntity<?> basketlist(String id, Model model, HttpSession session, HttpServletRequest request,
         HttpServletResponse response) {

      // 비회원 주문처리 세션으로 하면 안됨 (로그인으로 인식함) -> 쿠키로 처리
      // 만약 id 가 null 이고 쿠키에 암것도 없으면 시퀀스로 g0001 같은거 만들어서 쿠키에 저장
      // 만약 id 가 null 이고 쿠키에 뭐가 있으면 쿠키에 있는 아이디를 가져온다
      // 만약 id 가 null 이 아니면 일반 형태로 진행

      // 비회원 처리 시작 - 근데 쿠키가 한 페이지 마다 담기는듯..?
      if (id.equals("") || id == null) {

         Cookie[] cookies = request.getCookies();

         String guestId = "";

         for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("guestId")) {
               guestId = cookies[i].getValue();
            }
         }

         // 쿠키에 guestId 없으면
         if (guestId.equals("")) {
            // g0001 같은거 만들어서 쿠키에 저장
            Cookie cookie = new Cookie("guestId", makeGuestId());
            response.addCookie(cookie);

            // 쿠키에 guestId 있으면
         } else {
            // 쿠키에 있는 아이디를 가져온다
            id = guestId;
         }

      }
      // 비회원 처리 끝

      log.info("listaaa");
      List<BasketVO> basket = null;
      basket = basketservice.getList(id);

      // 비회원 관련
      BasketVO tmpbasket = new BasketVO();
      tmpbasket.setIdNo(id);
      basket.add(tmpbasket);
      // 비회원 관련
      
      model.addAttribute("basket", JSONArray.fromObject(basket));

      // 이거 안됨
      // model.addAttribute("guestId", id);

      return ResponseEntity.status(HttpStatus.OK).body(JSONArray.fromObject(basket));
   }


   
   
   @PostMapping("/basket")
   @ResponseBody
   public ResponseEntity<?> register(@RequestBody BasketVO basket, HttpServletRequest request,
         HttpServletResponse response) {

      // 비회원 처리 시작
      // 로그인 상태가 아닐 때
      if (basket.getIdNo().equals("") || basket.getIdNo() == null) {

         Cookie[] cookies = request.getCookies();

         String guestId = "";

         for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("guestId")) {
               guestId = cookies[i].getValue();
            }
         }

         // 쿠키에 guestId 없으면
         if (guestId.equals("")) {
            // g0001 같은거 만들어서 쿠키에 저장
            Cookie cookie = new Cookie("guestId", makeGuestId());
            response.addCookie(cookie);

            // 쿠키에 guestId 있으면
         } else {
            // 쿠키에 있는 아이디를 가져온다
            basket.setIdNo(guestId);
         }

      }
      // 비회원 처리 끝

      log.info("register: " + basket);

      // 수량 안들어왔으면 1로 설정해준다
      if (basket.getItemNum() == null) {
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

   // 게스트 아이디 시퀀스로 만들어주는 메서드 (g0001 같은 idNo)
   public String makeGuestId() {
      return basketservice.makeGuestId();
   }

   @GetMapping("/footer")
   public void footer() {
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