package com.jujumarket.main.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.main.domain.BasketVO;
import com.jujumarket.main.service.BasketService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BasketServiceTests {
	
	@Setter(onMethod_ = {@Autowired })
	private BasketService service;
	
//	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
		
	}
	
//	@Test
	public void testRegister() {
		
		BasketVO basket = new BasketVO();
		basket.setBaskId("basket000102");
		basket.setItemNum(20);
		basket.setIdNo("cus000001");
		basket.setItemCode("abcd0232");
		
		service.register(basket);
		
		log.info("생성된 장바구니 번호 : " + basket.getBaskId());
		
	}
	
//	@Test
	public void testGetList() {
		service.getList().forEach(basket -> log.info(basket));
	}
	
//	@Test 
	public void testGet() {
		log.info(service.get("basket000102"));
	}
	
//	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove("basket000102"));
	}
	
//	@Test
	public void testUpdate() {
		BasketVO basket = service.get("basket000001");
		
		if(basket == null) {
			return;
		}
		
		basket.setItemNum(100);
		
		log.info("MODIFY RESULT: " + service.modify(basket));
			
				
	}
	
	@Test
	public void testJoin() {
		
		log.info(service.getList().toString());
		
		
	}
	
	

}





















