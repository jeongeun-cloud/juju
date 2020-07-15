package com.jujumarket.shop.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.RegisterItemVO;
import com.jujumarket.shop.service.RegisterItemService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RegisterItemServiceTests {

	@Setter(onMethod_ = @Autowired)
	private RegisterItemService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
//	@Test
	public void testRegister() {
		RegisterItemVO register = new RegisterItemVO();
		
		register.setItemName("무우");
		register.setItemContent("무우 등록 되있음~~!!");
		register.setPrice(520000);
		register.setNormPrice(521000);
		register.setStock(550);
		register.setDispStat("n");
		register.setSaleStat("판매중");
		register.setItemChr("인기제품55");
//		register.setItemImg("무12.jpg");
		
		service.register(register);
		
		log.info("생성된 아이템 번호 : " + register.getItemCode());
	}
	
//	@Test
	public void testGetList() {
		//service.getList().forEach(register -> log.info(register));
		service.getList(new ItemCriteria(2, 10)).forEach(register -> log.info(register));
	}
	
//	@Test
	public void testGet() {
		log.info(service.get("1"));
	}
	
//	@Test
	public void testDelete() {
		log.info("REMOVE RESULT : " + service.remove("6"));
	}
	
//	@Test
	public void testUpdate() {
		RegisterItemVO register = service.get("1");
		
		if(register == null) {
			return;
		}
		
		register.setItemContent("아이템 내용 수정합니다.");
		log.info("MODIFY RESULT : " + service.modify(register));
	}
	
	@Test
	public void testCateg() {
		log.info(service.category());
	}
}
