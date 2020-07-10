package com.jujumarket.board.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.domain.ReplyVO;
import com.jujumarket.board.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	//private String[] bnoArr = {"56","58","59","63"};
	private String[] idArr = {"1","2","3","4","5","6","7","8","9","10"};
	
	
	@Setter(onMethod_={@Autowired})
	private ReplyMapper mapper;
	
	//@Test
	public void testMapper() {
		
		log.info(mapper);
	}
	
//	@Test
	public void testCreate() {
		
	IntStream.rangeClosed(1,10).forEach(i ->{
		
		ReplyVO vo = new ReplyVO();
	
	     	 vo.setIdNo("Idno2");
			 vo.setPostingNo("posting2");
		     vo.setReplyContent("Reply 내용2");
		
			
			mapper.insert(vo);			
		
	});
		
	}
	
	//@Test
	public void testRead() {
		
		String targetreplyNo = "3";
		
		ReplyVO vo = mapper.read(targetreplyNo);
		
		log.info(vo);
		
	}
	
	//@Test
	public void testDelete() {
		
		String gargetreplyNo = "3";
		
		mapper.delete(gargetreplyNo);
		
	}
	
	//@Test
	public void testUpdate() {

		String targetreplyNo = "11";
		
		ReplyVO vo = mapper.read(targetreplyNo);
		
		vo.setReplyContent("update Reply");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT: " + count);
	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		// "10"
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri,idArr[3]);
		
		replies.forEach(reply -> log.info(reply));
		
	}
}
