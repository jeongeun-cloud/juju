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
		
		register.setItemName("臾댁슦");
		register.setItemContent("臾댁슦 �벑濡� �릺�엳�쓬~~!!");
		register.setPrice(520000);
		register.setNormPrice(521000);
		register.setStock(550);
		register.setDispStat("n");
		register.setSaleStat("�뙋留ㅼ쨷");
		register.setItemChr("�씤湲곗젣�뭹55");
//		register.setItemImg("臾�12.jpg");
		
		service.register(register);
		
		log.info("�깮�꽦�맂 �븘�씠�뀥 踰덊샇 : " + register.getItemCode());
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
		
		register.setItemContent("�븘�씠�뀥 �궡�슜 �닔�젙�빀�땲�떎.");
		log.info("MODIFY RESULT : " + service.modify(register));
	}
	
	@Test
	public void testCateg() {
		log.info(service.category());
	}
	
	@Test
	public void testFullPath() {
		log.info(service.getCategory("item000041"));
	}
}
