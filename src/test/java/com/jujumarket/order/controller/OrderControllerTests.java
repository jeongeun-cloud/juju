package com.jujumarket.order.controller;

import org.junit.Before;
import org.junit.Test;
//import org.aspectj.lang.annotation.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
//Test for Controller
@WebAppConfiguration

@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j	
public class OrderControllerTests {
	
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
	public void testList() throws Exception{
		log.info( 
				mockMvc.perform(MockMvcRequestBuilders.get("/order/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
				
	}
	
//	@Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/order/register")
							.param("orderCode", "20200630-00004")
							.param("totalPay", "55000")
							.param("totalSum", "65000")
							.param("totalDiscount", "10000")
							.param("deliCharge", "5000")
							.param("isMember", "Y")
							.param("idNo", "CU00006")
							).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
				
	}
	
//	@Test
	public void testGet() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/order/orderItemsForm")
				.param("orderCode", "20200630-00004"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
//	@Test
	public void testModify() throws Exception{
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/order/modify")
						.param("orderCode", "20200630-00004")
						.param("totalPay", "50000")
						.param("totalSum", "60000")
						.param("totalDiscount", "10000")
						.param("deliCharge", "0")
						.param("isMember", "Y")
						.param("idNo", "CU00006"))
					.andReturn().getModelAndView().getViewName();
		
				log.info(resultPage);
	}
	
	@Test
	public void testRemove() throws Exception{
		//삭제 전 데이터베이스에 주문번호 확인할 것 
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/order/remove")
						.param("orderCode", "20200630-00004")
						).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	

}
