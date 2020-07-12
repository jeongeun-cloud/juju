package com.jujumarket.board.service;

import static org.junit.Assert.assertNotNull;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.board.domain.Board_QNAVO;
import com.jujumarket.board.service.Board_QNAService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Board_QNAServiceTests {

	@Setter(onMethod_ = @Autowired)
	private Board_QNAService service;
	
	//@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	//@Test
	public void testRegister() {
		Board_QNAVO qna = new Board_QNAVO();
		
		qna.setTitle("title 제목");
		qna.setContent("content 내용");
		qna.setReplyBool("Bool 불");
		qna.setBoardType("게시글타입 type");
		qna.setIdNo("아이디 LDH");

		
	    service.register(qna);
		log.info("생성된 아이템 번호 : " + qna.getPostingNo());
	}
	

	@Test
	public void testGetList() {
		service.getList().forEach(fqa -> log.info(fqa));
		
	}
	
	@Test
	public void testGet() {
		log.info(service.get("5"));
	}
	
	//@Test
	public void testDelete() {
		log.info("REMOVE RESULT : " + service.remove("23"));
	}
	
	//@Test
	public void testUpdate() {
		Board_QNAVO qna = service.get("22");
		
		if(qna == null) {
			return;
		}
		
		qna.setTitle("title 허소리하지마인마");
		log.info("MODIFY RESULT : " + service.modify(qna));
	}
	
}
