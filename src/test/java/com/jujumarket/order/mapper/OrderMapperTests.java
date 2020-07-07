package com.jujumarket.order.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.domain.OrderVO;
import com.jujumarket.order.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderMapperTests {
	
	@Setter(onMethod_=@Autowired)
	private OrderMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(order -> log.info(order));
	}
	
//	@Test
	public void testInsert() {
		OrderRequestVO order = new OrderRequestVO();
		order.setOrderCode("20200630-00001");
		order.setTotalPay(53000L);
		order.setTotalSum(60000L);
		order.setTotalDiscount(10000L);
		order.setDeliCharge(3000L);
		order.setIsMember("Y");
		order.setIdNo("CU00004");
		
		mapper.insert(order);
		
		log.info(order);
	}
	
//	@Test
	public void testInsertSelectKey() {
		OrderRequestVO order = new OrderRequestVO();
		order.setOrderCode("20200630-00002");
		order.setTotalPay(62500L);
		order.setTotalSum(70000L);
		order.setTotalDiscount(10000L);
		order.setDeliCharge(2500L);
		order.setIsMember("Y");
		order.setIdNo("CU00005");
		
		mapper.insert(order);
		
		log.info(order);
	}
	
//	@Test
	public void testRead() {
		//존재하는 주문번호로 테스트
		OrderVO order = mapper.read("20200630-00002");
		log.info(order);
	}
	
//	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("20200630-00002"));
	}
	
//	@Test
	public void testUpdate() {
		OrderVO order = new OrderVO();
		order.setOrderCode("20200630-00001");
		order.setTotalPay(22500L);
		order.setTotalSum(30000L);
		order.setTotalDiscount(10000L);
		order.setDeliCharge(2500L);
		order.setIsMember("Y");
		order.setIdNo("CU00006");
		
		int count = mapper.update(order);
		
		log.info("UPDATE COUNT: " + order);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
