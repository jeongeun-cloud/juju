package com.jujumarket.board.service;

import static org.junit.Assert.assertNotNull;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.board.domain.Board_FAQVO;
import com.jujumarket.board.service.Board_FAQService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Board_FAQServiceTests {

	@Setter(onMethod_ = @Autowired)
	private Board_FAQService service;
	
	//@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		Board_FAQVO fqa = new Board_FAQVO();
		
		fqa.setTitle("서비스2");
		fqa.setContent("등록2");
		fqa.setBoardType("1");
		fqa.setIdNo("ㅁㅁㅁ");
		fqa.setPostingNo("1");
	
		
	    service.register(fqa);
		log.info("생성된 아이템 번호 : " + fqa.getPostingNo());
	}
	

	@Test
	public void testGetList() {
		//service.getList().forEach(fqa -> log.info(fqa));
		
	}
	
	@Test
	public void testGet() {
		log.info(service.get("1"));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT : " + service.remove("46"));
	}
	
	@Test
	public void testUpdate() {
		Board_FAQVO fqa = service.get("48");
		
		if(fqa == null) {
			return;
		}
		
		fqa.setTitle("아이템.");
		log.info("MODIFY RESULT : " + service.modify(fqa));
	}
	
}
