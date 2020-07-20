package com.jujumarket.main.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.ReviewVO;
import com.jujumarket.main.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/review/")
@AllArgsConstructor
public class ReviewController {
	
	private ReviewService service;
	//private ServletContext servletContext;
	
	@PostMapping(value = "/regReview",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReviewVO vo) {
		log.info("ReviewVO : " + vo);
		
//		String uploadFolder = servletContext.getRealPath("/resources/review");
//		
//	    File uploadPath = new File(uploadFolder, vo.getItemCode());
//	    log.info("upload path : " + uploadPath);
//	      
//	    if(uploadPath.exists() == false) {
//	       uploadPath.mkdir();      // 각 상품마다 폴더를 가짐
//	    }
		
		int insertCount = service.register(vo);
		
		System.out.println("Review INSERT COUNT : " + insertCount);
		
		return insertCount == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "pages/{itemCode}/{page}",
			produces =
			{MediaType.APPLICATION_XML_VALUE,
			 MediaType.APPLICATION_JSON_UTF8_VALUE})
			
	public ResponseEntity<List<ReviewVO>> getList(
			@PathVariable("page") int page,
			@PathVariable("itemCode") String itemCode){
		
			log.info("getList...............");
//			Criteria cri = new Criteria(page,1);
//	        System.out.println(cri.toString() + "여기!");
	         
        return new ResponseEntity<>(service.getList(itemCode), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{reviewNo}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("reviewNo") String reviewNo) {
		log.info("remove : " + reviewNo);
		
		return service.remove(reviewNo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{reviewNo}",
			consumes = "application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReviewVO vo, @PathVariable("reviewNo") String reviewNo) {
		vo.setReviewNo(reviewNo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{reviewNo}",
			produces = {MediaType.APPLICATION_XML_VALUE,
		    MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReviewVO> get(@PathVariable("reviewNo") String reviewNo) {
		log.info("get : " + reviewNo);
		
		return new ResponseEntity<>(service.get(reviewNo), HttpStatus.OK);
	}


}
