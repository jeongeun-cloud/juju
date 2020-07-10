package com.jujumarket.order.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.order.domain.ItemVO;
import com.jujumarket.order.service.ItemService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ItemServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private ItemService service;
	
//	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
//	@Test
	public void testRegister() {
		ItemVO item = new ItemVO();
		item.setItemCode("test200");
		item.setItemName("카쿠볼");
		item.setItemContent("달콤한 카쿠볼 우유에 말아먹자");
		item.setPrice(5000);
		item.setNormPrice(7000);
		item.setStock(999);
		item.setDispStat("진열중");
		item.setSaleStat("판매중");
		item.setItemChr("신상품");
		item.setItemImg1("cakooball.jpg");
		item.setItemImg2("cakooball.jpg");
		item.setItemImg3("cakooball.jpg");
		item.setItemImg4("cakooball.jpg");
		item.setImgDetail("cakooball.jpg");
		item.setClassCode("AAA");
		item.setIdNo("shop30");
		
		service.register(item);
		
		log.info("생성된 게시물의 번호: " + item.getItemCode());
		
	}
	
//	@Test
	public void testGetList() {
		service.getList().forEach(item -> log.info(item));
	}
	
//	@Test
	public void testGet() {
		log.info(service.get("test200"));
	}
	
//	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove("test200"));
	}
	
//	@Test
	public void testUpdate() {
		
		ItemVO item = service.get("test117");
		
		if(item == null) {
			return;
		}
		
		item.setItemName("치즈라떼 별로야");
		log.info("MODIFY RESULT: " + service.modify(item));
		
	}
	
	

}
