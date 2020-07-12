package com.jujumarket.main.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.main.domain.Board_ItemVO;
import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
//	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	

//	@Test
	public void testGetList() {
	//	service.getList().forEach(board-> log.info(board));
		service.getList(new Criteria(2,10)).forEach(board->log.info(board));
	}
	
//	@Test
	public void testGets() {
		log.info(service.gets("VeggieV03"));
	}
	
//	@Test
	public void testLowPrice() {
		log.info(service.listSort("25"));
	}

//	@Test
	public void testHighPrice()
	{
		log.info(service.listSort("24"));
	}
	
	@Test
	public void testNewProduct()
	{
		log.info(service.listSort("22"));
	}
}
