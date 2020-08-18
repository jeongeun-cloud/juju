//package com.jujumarket.main.controller;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//import org.apache.mahout.cf.taste.common.TasteException;
//import org.apache.mahout.cf.taste.recommender.RecommendedItem;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.jujumarket.main.domain.RecommendVO;
//import com.jujumarket.main.service.RecommendService;
//import com.jujumarket.shop.domain.RegisterItemVO;
//import com.jujumarket.shop.service.RegisterItemService;
//
//import lombok.AllArgsConstructor;
//import lombok.extern.log4j.Log4j;
//
//@Log4j
//@Controller
//@RequestMapping("/recommend/")
//@AllArgsConstructor
//public class RecommendController {
//	
//	private RecommendService service;
//	private RegisterItemService itemService;
//	
//	@GetMapping(value = "/test", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody
//	public ResponseEntity<List> test(Model model) throws IOException, TasteException {
//		log.info("Recommend Test 작동중");
//		
//		
//		List<RecommendedItem> recommendations = (List<RecommendedItem>) service.getRecommend();
//		
////		for (RecommendedItem recommendation : recommendations) {
////			System.out.println("2번 사람에게 추천 결과 [item : p00" + recommendation.getItemID() + ", value : " + recommendation.getValue() + "]");
////
////		}
//		List<RecommendVO> result = new ArrayList<>();
//				
//		for(int i=0; i<recommendations.size(); i++) {
//			
//			RecommendVO vo = new RecommendVO();
//			vo.setItemCode("s0003p00" + recommendations.get(i).getItemID());
//			vo.setValue(recommendations.get(i).getValue());
//			
//			RegisterItemVO item = itemService.get(vo.getItemCode());
//			
//			vo.setIdNo(item.getIdNo());
//			vo.setItemName(item.getItemName());
//			vo.setNormPrice(item.getNormPrice());
//			vo.setPrice(item.getPrice());
//			vo.setItemImg1(item.getItemImg1());
//			
//			result.add(vo);
//		}
//		
//		return new ResponseEntity<>(result, HttpStatus.OK);
//		
//	}
//	
//}
