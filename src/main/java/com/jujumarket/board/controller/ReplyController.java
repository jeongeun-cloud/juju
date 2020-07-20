package com.jujumarket.board.controller;

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

import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.domain.ReplyVO;
import com.jujumarket.board.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import java.util.List;


@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/replies/")
public class ReplyController {
	
	private ReplyService service;

	@PostMapping(value = "/new", 
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){

		log.info("ReplyVO: " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("Reply INSERT COUNT : " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				// 삼항 연산자 처리
	}

	@GetMapping(value = "pages/{postingNo}/{page}",
			produces =
			{MediaType.APPLICATION_XML_VALUE,
			 MediaType.APPLICATION_JSON_UTF8_VALUE})		
			
	public ResponseEntity<List<ReplyVO>> getList(
			@PathVariable("page") int page,
			@PathVariable("postingNo") String postingNo){
		
				log.info("getList...............댓글");
				Criteria cri = new Criteria(page,1);
		         log.info(cri + "댓글");

		         
		         return new ResponseEntity<>(service.getList(cri, postingNo),HttpStatus.OK);
		       }
	
	@GetMapping(value = "/{postingNo}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					    MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("postingNo") String postingNo){
		
		 log.info("get   : " +postingNo);
		
		 return new ResponseEntity<>(service.get(postingNo), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{replyNo}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("replyNo") String replyNo){
		
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
			@RequestBody ReplyVO vo,
			@PathVariable("replyNo") String replyNo){
		
		vo.setReplyNo(replyNo);
		
		log.info("replyNo  :" + replyNo);
		log.info("modify   :" + vo);
		
		return service.modify(vo) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}//main
