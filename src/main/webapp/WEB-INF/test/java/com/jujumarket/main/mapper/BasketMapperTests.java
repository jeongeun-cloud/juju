package com.jujumarket.main.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.main.domain.BasketVO;
import com.jujumarket.main.mapper.BasketMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BasketMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BasketMapper mapper;
	
//	@Test
	public void testGetList() {
		mapper.getList().forEach(basket -> log.info(basket));
	}
	
//	@Test
	public void testInsert() {
		
		BasketVO basket = new BasketVO();
		basket.setBaskId("basket000002");
		basket.setItemNum(2);
		basket.setIdNo("cus000002");
		basket.setItemCode("m00001");
		
		mapper.insert(basket);
		
		log.info(basket);
		
	}
	
//	@Test
	public void testInsertSelectKey() {
		BasketVO basket = new BasketVO();
		basket.setBaskId("basket000003");
		basket.setItemNum(3);
		basket.setIdNo("cus000003");
		basket.setItemCode("m00004");
		
		mapper.insert(basket);
		
		log.info(basket);
	}
	
//	@Test
	public void testRead() {
		BasketVO basket = mapper.read("basket000001");
		
		log.info(basket);
	}
	
//	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("basket000003"));
	}
	
	
//	@Test
	public void testUpdate() {
		
		BasketVO basket = new BasketVO();
		basket.setBaskId("basket000002");
		basket.setItemNum(5);
		basket.setIdNo("cus000003");
		basket.setItemCode("m000010");
		
		int count = mapper.update(basket);
		log.info("UPDATE COUNT: " + count);
		
	}
	
	

}
