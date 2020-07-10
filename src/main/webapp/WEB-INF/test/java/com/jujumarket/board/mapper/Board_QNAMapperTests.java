package com.jujumarket.board.mapper;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;

import com.jujumarket.board.domain.Board_FAQVO;
import com.jujumarket.board.domain.Board_QNAVO;
import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.mapper.Board_QNAMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Board_QNAMapperTests {
	@Setter(onMethod_ = @Autowired)
	private Board_QNAMapper mapper;
	public  MockMvc mockMvc;

	@Test
	public void testGetList() {
	mapper.getList().forEach(register -> log.info(register));
	//mapper.getList(new Criteria(2, 10)).forEach(board ->log.info(board));
	   
		
	}
	
	
	//@Test
	public void testInsert() {
		Board_QNAVO qna = new Board_QNAVO();
		
	
		qna.setTitle("title 제목");
		qna.setContent("content 내용");
		qna.setReplyBool("Bool 불");
		qna.setBoardType("게시글타입 type");
		qna.setIdNo("아이디 LDH");

		
		mapper.insert(qna);
		
		log.info(qna);

	}
	
	
     // @Test
		public void testInsertSelectKey() {
			Board_QNAVO qna = new Board_QNAVO();
			
			qna.setTitle("title 제목2");
			qna.setContent("content 내용2");
			qna.setReplyBool("Bool 불2");
			qna.setBoardType("게시글타입 type2");
			qna.setIdNo("아이디 LDH2");
			
			mapper.insertSelectKey(qna);
			
			log.info(qna);
		}
		
		@Test
		public void testRead() {
			Board_QNAVO qna = mapper.read("5");
		}
		
		//@Test
		public void testDelete() {
			log.info("DELETE COUNT : " + mapper.delete("4"));
		}
		
		@Test
		public void testUpdate() {
			Board_QNAVO qna = new Board_QNAVO();
			
			
			qna.setPostingNo("5");
			qna.setTitle("수정 제목2");
			qna.setContent("수정 내용2");
			qna.setReplyBool("수정 불2");
			qna.setBoardType("수정 type2");
			qna.setIdNo("수정 LDH2");
			
			int count = mapper.update(qna);
			
			log.info("UPDATE COUNT : " + count);
		}
		
		//@Test
		public void testPaging() {
			
			Criteria cri = new Criteria();
			
			cri.setPageNum(1);
			cri.setAmount(5);
			
			List<Board_QNAVO> list = mapper.getListWithPaging(cri);
			
			list.forEach(board -> log.info(board));
			
		}
		
		//@Test
		public void testSearch() {
			
			Criteria cri = new Criteria();
			cri.setKeyword("t");
			cri.setType("TC");
			
			List<Board_QNAVO> list = mapper.getListWithPaging(cri);
			
			list.forEach(board ->log.info(board));
			
		}
		
		
}
