package com.jujumarket.order.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.domain.OrderVO;
import com.jujumarket.order.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private OrderService service;

//	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}

	@Test
	public void testRegister() {
		OrderRequestVO order = new OrderRequestVO();
//		order.setOrderCode("timestamp");
//		log.info("setOrderCode");
		order.setItemCode("product55555");
		log.info("setItemCode");
		order.setItemNum(4L);
		log.info("수량");
		order.setDisAmount(10000L);
		log.info("할인금액");
		order.setTotalPay(45000L);
		log.info("최종결제금액");
		order.setTotalSum(60000L);
		log.info("주문총금액");
		order.setTotalDiscount(20000L);
		log.info("총할인금액");
		order.setDeliCharge(0L);
		log.info("배송비");
		order.setIsMember("Y");
		log.info("회원여부");
		order.setIdNo("c00001");
		log.info("회원계정");
		order.setOrderStat("발송중");
		log.info("주문상태");

		service.register(order);
		log.info("서비스 리지스터");

		log.info(order);

		
	}

//	@Test
	public void testGetList() {
		service.getList().forEach(order -> log.info(order));
	}

//	@Test
	public void testGet() {
		log.info(service.get("20200630-00001"));
	}

//	@Test 
	public void testDelete() {
		// 주문번호의 존재여부를 확인하고 테스트할 것
		log.info("REMOVE RESULT: " + service.remove("20200630-00001"));
	}

//	@Test
	public void testUpdate() {
		OrderVO order = service.get("20200630-00003");

		if (order == null) {
			return;
		}

		order.setTotalSum(100000L);
		log.info("MODIFY RESULT: " + service.modify(order));
	}

//	OK
//	@Test 
	public void testClass() {
		log.info(service);
		log.info(service.getClass().getName());
	}

}
