package com.jujumarket.board.mapper;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.jujumarket.board.domain.Board_FAQVO;
import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.mapper.Board_FAQMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Board_FAQMapperTests {

	@Setter(onMethod_ = @Autowired)
	private Board_FAQMapper mapper;
	public  MockMvc mockMvc;

	//@Test
	public void testGetList() {
	//\\	mapper.getList().forEach(register -> log.info(register));
	mapper.getList(new Criteria(2, 10)).forEach(board ->log.info(board));
	   
		
	}
	
	//@Test
	public void testInsert() {
		Board_FAQVO fqa = new Board_FAQVO();
		
		fqa.setTitle("test1");
		fqa.setContent("test1");
		fqa.setBoardType("2");
		fqa.setIdNo("LDH");

		
		mapper.insert(fqa);
		
		log.info(fqa);
	}
	
	//@Test
	public void testInsertSelectKey() {
		Board_FAQVO fqa = new Board_FAQVO();
		
		fqa.setTitle("test2");
		fqa.setContent("test2");
		fqa.setBoardType("1");
		fqa.setIdNo("LDH");
		
		mapper.insertSelectKey(fqa);
		
		log.info(fqa);
	}
	
	//@Test
	public void testRead() {
		Board_FAQVO rqa = mapper.read("24");
	}
	
	//@Test
	public void testDelete() {
		log.info("DELETE COUNT : " + mapper.delete("25"));
	}
	
	//@Test
	public void testUpdate() {
		Board_FAQVO fqa = new Board_FAQVO();
		
		fqa.setPostingNo("33");
		fqa.setTitle("수정");
		fqa.setContent("test2");
		fqa.setBoardType("1");
		fqa.setIdNo("LDH");
		
		int count = mapper.update(fqa);
		
		log.info("UPDATE COUNT : " + count);
	}
	
	//@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(1);
		cri.setAmount(5);
		
		List<Board_FAQVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
		
	}
	
	//@Test
	public void testSearch() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("t");
		cri.setType("TC");
		
		List<Board_FAQVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board ->log.info(board));
		
	}
	
	



	
}
