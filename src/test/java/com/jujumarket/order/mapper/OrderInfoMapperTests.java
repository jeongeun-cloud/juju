package com.jujumarket.order.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.order.domain.OrderInfoVO;
import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.mapper.OrderInfoMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderInfoMapperTests {
	
	@Setter(onMethod_=@Autowired)
	private OrderInfoMapper mapper;
	
	
	public void testGetList() {
		mapper.getList().forEach(orderinfo -> log.info(orderinfo));
		
	}
	
	
//	@Test
	public void testInsert() {
		OrderInfoVO orderInfo = new OrderInfoVO();
		orderInfo.setOrderCode("20200701-00001");
		orderInfo.setItemCode("abcd1234");
		orderInfo.setItemNum(3L);
		orderInfo.setDisAmount(10000L);
		
		mapper.insert(orderInfo);
		
		log.info(orderInfo);
	}
	
//	@Test
	public void testInsertSelectKey() {
		OrderInfoVO orderInfo = new OrderInfoVO();
		orderInfo.setOrderCode("20200701-00002");
		orderInfo.setItemCode("abcd1235");
		orderInfo.setItemNum(3L);
		orderInfo.setDisAmount(10000L);
		
		mapper.insert(orderInfo);
		
		log.info(orderInfo);
	}
	
//	@Test
	public void testRead() {
		//존재하는걸로 확인
		OrderRequestVO orderInfo = mapper.read("20200701-00001");
		
		log.info(orderInfo);
	}
	
//	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("20200701-00001"));
	}
	
//	@Test
	public void testUpdate() {
		OrderInfoVO orderInfo = new OrderInfoVO();
		//존재하는지 확인할것
		orderInfo.setOrderCode("20200701-00002");
		orderInfo.setItemCode("abcd1237");
		orderInfo.setItemNum(1L);
		orderInfo.setDisAmount(5000L);
		
		int count = mapper.update(orderInfo);
		
		log.info("UPDATE COUNT: " + count);
	}
	
	
	
	
	
	

}
