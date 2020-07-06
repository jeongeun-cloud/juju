package com.jujumarket.main.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jujumarket.main.domain.CategoryVO;
import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.PageDTO;
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
	public void list(@RequestParam(value="classCode", required=false) String classCode , @RequestParam(value="sort" ,defaultValue="22") String order ,
			Criteria cri, Model model) {
		
		
		System.out.println("/////sort값은: " +order);

		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		
		
		
		//classCode(상품분류코드) 가 받아지는게 있으면 serive.gets 사용 
		if(classCode !=null) {
     		//log.info("list"+cri);
			log.info("classCode는?:"+classCode);
		    log.info("class적용후 :"+order);
		    model.addAttribute("order",service.listSort(order));
		    model.addAttribute("list", service.gets(classCode)); 
			model.addAttribute("pageMaker",new PageDTO(cri,123));
			model.addAttribute("code_save", classCode);
			
		}else {
		//없으면 그냥 allList를 보여주시 위해서 getList 사용 	
			
			log.info("기본order:"+order);
			model.addAttribute("order",service.listSort(order));
			model.addAttribute("list", service.getList(cri));
			model.addAttribute("pageMaker",new PageDTO(cri,123));//pageMaker 에 pageDTO 클래스의 객체를 만들어서 Model에 담아준다.
		}
		
		
	}
	
	@PostMapping("/list")
	public String gets(@RequestParam("classCode") String classCode, Model model) {
		
		log.info("classCode POST"+ service.gets(classCode));
		model.addAttribute("board", service.gets(classCode));
		
		return "redirect:/product/list";
	}
	
//	@GetMapping("/gets")
//	public void gets(@RequestParam("classCode") String classCode, Model model) {
//		log.info("/gets");
//		model.addAttribute("board", service.gets(classCode));
//	}
	

	

	

	

}
