package com.jujumarket.main.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jujumarket.main.domain.BoardItemVO;
import com.jujumarket.main.domain.CategoryVO;
import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.PageDTO;
import com.jujumarket.main.domain.SortVO;
import com.jujumarket.main.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class BoardItemController {
   
   private BoardService service;
   
   @GetMapping("/list")   
   public void list(@RequestParam(value="classCode", required=false) String classCode , Criteria cri, Model model){
      
      
      //System.out.println("/////sort값은: " +order);
      System.out.println("classCode는?:"+classCode);
   
      List<CategoryVO> category = null;
      category = service.category();
      model.addAttribute("category", JSONArray.fromObject(category));

      CategoryVO vo = new CategoryVO();
      for(int i=0; i<category.size(); i++) {
         vo = category.get(i);
         if(vo.getClassCode().equals(classCode)) {
            model.addAttribute("path", vo.getFullPath());
         }
         }

         log.info("classCode는?:"+classCode);
         model.addAttribute("list", service.gets(classCode)); 
         model.addAttribute("pageMaker",new PageDTO(cri,123));
         model.addAttribute("cs", classCode);//pageMaker 에 pageDTO 클래스의 객체를 만들어서 Model에 담아준다.
         
      
   }
   
   
   
   @GetMapping(value = "/test/{classCode}/{sort}", produces= {MediaType.APPLICATION_JSON_VALUE})
   @ResponseBody
   public ResponseEntity<?> test(@PathVariable String classCode, @PathVariable String sort, Model model) {
      
      System.out.println("컨트롤러 왔음");
      
      System.out.println(classCode);
      
      SortVO vo = new SortVO();
      vo.setClassCode(classCode);
      vo.setSort(sort);
      
      
      List<BoardItemVO> list = service.listSort(vo);
      
      System.out.println("sort후 결과값:"+list);
      
      return ResponseEntity.status(HttpStatus.OK).body(list);
      /* return ResponseEntity.status(HttpStatus.OK).body(list.toString()); */
      
   }
   
   
   
   
   
   @PostMapping("/list")
   public String gets(@RequestParam("classCode") String classCode, Model model) {
      
      log.info("classCode POST"+ service.gets(classCode));
      model.addAttribute("board", service.gets(classCode));
      
      return "redirect:/product/list";
   }
   



}