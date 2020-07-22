package com.jujumarket.main.mapper;


import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.PrdReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PrdReplyMapperTests {
	
	//private String[] bnoArr = {"56","58","59","63"};
	private String[] idArr = {"1","2","3","4","5","6","7","8","9","10"};
	
	
	@Setter(onMethod_={@Autowired})
	private PrdReplyMapper mapper;
	
	@Test
	public void testMapper() {
		
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		
	IntStream.rangeClosed(1,10).forEach(i ->{
		
		PrdReplyVO vo = new PrdReplyVO();
	
		
		     vo.setReplyNo(1); 
		     vo.setItemCode("product22222");
		     vo.setReplyContent("내용");
		     vo.setReplyCode("code");
		     vo.setIdNo("idNo");
		     
			
			mapper.insert2(vo);			
			

	});
		
	}
	
	//@Test
	public void testRead() {
		
		String targetreplyNo = "item1";
		
		PrdReplyVO vo = mapper.read(targetreplyNo);
		
		log.info(vo);
		System.out.println(vo);
		
	}
	
	//@Test
	public void testDelete() {
		
		int gargetreplyNo = 3;
		
		mapper.delete(gargetreplyNo);
		
	}
	
	//@Test
	public void testUpdate() {

		String targetreplyNo = "item1";
		
		PrdReplyVO vo = mapper.read(targetreplyNo);
		
		vo.setReplyContent("ddd Reply");
		
		vo.setReplyNo(1);
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT: " + count);
	}
	
	//@Test
	public void testList() {
		
		Criteria cri = new Criteria();
	
		// "10"
		 
		List<PrdReplyVO> replies = mapper.getListWithPaging(cri,idArr[0]);
		
		
		replies.forEach(reply -> log.info(reply));
		System.out.println();
		
	}
	
	/*
	 * @Test public void testList2() {
	 * 
	 * 
	 * 
	 * public List<ReplyVO> getListWithPaging(
	 * 
	 * @Param("cri") Criteria cri,
	 * 
	 * @Param("postingNo") String postingNo);
	 * 
	 * public int getCountBypostingNo(String postingNo);
	 * 
	 * 
	 * }
	 */
	
}
