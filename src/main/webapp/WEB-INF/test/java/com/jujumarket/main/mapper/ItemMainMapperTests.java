package com.jujumarket.main.mapper;

import java.sql.Timestamp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.main.domain.ItemMainVO;
import com.jujumarket.main.mapper.ItemMainMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ItemMainMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ItemMainMapper mapper;
	
//	@Test
	public void testGetList() {
		mapper.getList().forEach(item -> log.info(item));
	}
	
//	@Test
	public void testInsert() {
		ItemMainVO item = new ItemMainVO();
		item.setItemCode("test117");
		item.setItemName("테스트제품");
		item.setItemContent("이 제품은 좋은 제품");
		item.setPrice(1000);
		item.setNormPrice(2000);
		item.setStock(999);
		item.setDispStat("진열중");
		item.setSaleStat("판매중");
		item.setItemChr("BEST");
		item.setItemImg1("pic.jpg");
		item.setItemImg2("pic.jpg");
		item.setItemImg3("pic.jpg");
		item.setItemImg4("pic.jpg");
		
		item.setClassCode("asdf");
		item.setIdNo("asdf");
		
		mapper.insert(item);
		log.info(item);
		
	}
	
	
//	@Test
	public void testRead() {
		
		ItemMainVO item = mapper.get("abcd0113");
		
		log.info(item);
		
	}
	
	
//	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("test112"));
	}
	
//	@Test
	public void testUpdate() {
		
		ItemMainVO item = new ItemMainVO();
		item.setItemCode("test113");
		item.setItemName("업데이트제품");
		item.setItemContent("이 제품은 좋은 제품");
		item.setPrice(1000);
		item.setNormPrice(2000);
		item.setStock(999);
		item.setDispStat("진열중");
		item.setSaleStat("판매중");
		item.setItemChr("BEST");
		item.setItemImg1("pic.jpg");
		item.setItemImg2("pic.jpg");
		item.setItemImg3("pic.jpg");
		item.setItemImg4("pic.jpg");
		
		item.setClassCode("asdf");
		item.setIdNo("asdf");
		
		int count = mapper.update(item);
		log.info("UPDATE COUNT: " + count);
		
	}
	
	
	

}
