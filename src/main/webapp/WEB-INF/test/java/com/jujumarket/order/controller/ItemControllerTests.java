package com.jujumarket.order.controller;

import org.junit.Before;
import org.junit.Test;
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

@WebAppConfiguration

@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class ItemControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/product/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
		
	}
	
//	@Test
	public void testRegister() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/product/register")
				.param("itemCode", "test300")
				.param("itemName", "테스트300")
				.param("itemContent", "아이템설명")
				.param("price", "3000")
				.param("normPrice","1000")
				.param("stock", "999")
				.param("dispStat", "진열중")
				.param("saleStat", "판매중")
				.param("itemChr", "특성")
				.param("itemImg1", "test.jpg")
				.param("itemImg2", "test.jpg")
				.param("itemImg3", "test.jpg")
				.param("itemImg4", "test.jpg")
				.param("imgDetail", "detaildetail")
				.param("classCode", "T1test01")
				.param("idNo", "seller01")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
//	@Test
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/product/item")
				.param("itemCode", "test300"))
				.andReturn()
				.getModelAndView().getModelMap());
		
	}
	
	
//	@Test
	public void testModify() throws Exception {
		
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/product/modify")
						.param("itemCode", "test300")
						.param("itemName", "테스트300")
						.param("itemContent", "아이템설명")
						.param("price", "3000")
						.param("normPrice","1000")
						.param("stock", "990")
						.param("dispStat", "진열중")
						.param("saleStat", "판매중")
						.param("itemChr", "특성")
						.param("itemImg1", "test.jpg")
						.param("itemImg2", "test.jpg")
						.param("itemImg3", "test.jpg")
						.param("itemImg4", "test.jpg")
						.param("imgDetail", "detaildetail")
						.param("classCode", "T1test01")
						.param("idNo", "seller01")
						)
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
		
	}
	
	@Test
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/product/remove")
				.param("itemCode", "test300")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	
	

}
