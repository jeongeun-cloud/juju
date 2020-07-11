package com.jujumarket.order.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.order.domain.OrderHistoryVO;
import com.jujumarket.order.mapper.OrderHistoryMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderHistoryMapperTests {
	
	@Setter(onMethod_=@Autowired)
	private OrderHistoryMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(orderHistory -> log.info(orderHistory));
	}
	
//	@Test
	public void testInsert() {
		OrderHistoryVO orderHistory = new OrderHistoryVO();
		orderHistory.setOrderCode("20200701-00003");
		orderHistory.setItemCode("zxcv1234");
		orderHistory.setOrderStat("발송준비중");
		
		mapper.insert(orderHistory);
		
		log.info(orderHistory);
	}
	
//	@Test
	public void testInsertSelectKey() {
		OrderHistoryVO orderHistory = new OrderHistoryVO();
		orderHistory.setOrderCode("20200701-00004");
		orderHistory.setItemCode("zxcv1234");
		orderHistory.setOrderStat("결제완료");
		
		mapper.insert(orderHistory);
		
		log.info(orderHistory);
	}
	
//	@Test
	public void testRead() {
		//존재하는걸로 테스트
		OrderHistoryVO orderHistory = mapper.read("20200701-00003");
		log.info(orderHistory);
				
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("20200701-00003"));
	}
	
	@Test
	public void testUpdate() {
		OrderHistoryVO orderHistory = new OrderHistoryVO();
		//실행 전 존재하는 번호인지 확인
		orderHistory.setOrderCode("20200701-00003");
		orderHistory.setItemCode("zxcv1111");
		orderHistory.setOrderStat("NewItem");
		
		int count = mapper.update(orderHistory);
		log.info("UPDATE COUNT: " + count);
	}
	
	

}
