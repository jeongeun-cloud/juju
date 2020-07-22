package com.jujumarket.main.controller;

import java.util.List;

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
import com.jujumarket.main.domain.PrdReplyPageDTO;
import com.jujumarket.main.domain.PrdReplyVO;
import com.jujumarket.main.service.PrdReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/repliesprdQnA/")
public class PrdReplyController {
	
	private PrdReplyService service;

	@PostMapping(value = "/new", 
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody PrdReplyVO vo){

		log.info("PrdReplyVO: " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("PrdReplyVO INSERT COUNT : " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				// 삼항 연산자 처리
	}
	
	
	@PostMapping(value = "/replynew", 
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replycreate(@RequestBody PrdReplyVO vo){

		log.info("PrdReplyVO: " + vo);
		
		int insertCount2 = service.replyRgister(vo);
		
		log.info("PrdReplyVO INSERT COUNT : " + insertCount2);
		
		return insertCount2 == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				// 삼항 연산자 처리
	}

	@GetMapping(value = "pages/{itemCode}/{page}",
			produces =
			{MediaType.APPLICATION_XML_VALUE,
			 MediaType.APPLICATION_JSON_UTF8_VALUE})		
			
	
	public ResponseEntity<PrdReplyPageDTO> getList(
			@PathVariable("itemCode") String itemCode,
			@PathVariable("page") int page){
		
				Criteria cri = new Criteria(page,10);

		 return new ResponseEntity<>(service.getPrdReplyListPage(cri, itemCode),HttpStatus.OK);
		       }
	
	@GetMapping(value = "/{itemCode}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					    MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<PrdReplyVO> get(@PathVariable("itemCode") String itemCode){
		
		 log.info("get   : " +itemCode);
		
		 return new ResponseEntity<>(service.get(itemCode), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{replyNo}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("replyNo") int replyNo){
		
		log.info("remove  : " +  replyNo);
		
		return service.remove(replyNo) == 1
	
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{replyNo}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody PrdReplyVO vo,
			@PathVariable("replyNo") int replyNo){
		
		vo.setReplyNo(replyNo);
		
		log.info("replyNo  :" + replyNo);
		log.info("modify   :" + vo);
		
		return service.modify(vo) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	
	}
	

}
