package com.jujumarket.shop.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.RegisterItemVO;
import com.jujumarket.shop.mapper.RegisterItemMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RegisterItemMapperTests {

	@Setter(onMethod_ = @Autowired)
	private RegisterItemMapper mapper;
	
//	@Test
	public void testGetList() {
		mapper.getList().forEach(register -> log.info(register));
	}
	
//	@Test
	public void testInsert() {
		RegisterItemVO register = new RegisterItemVO();
		
		register.setItemName("�뼇�뙆");
		register.setItemContent("�넀吏� �릺�엳�쓬~~");
		register.setPrice(2000);
		register.setNormPrice(2100);
		register.setStock(5);
		register.setDispStat("y");
		register.setSaleStat("�뙋留ㅼ쨷");
		register.setItemChr("�씤湲곗젣�뭹");
		register.setItemImg1("�뼇�뙆.jpg");
		register.setItemImg2("�뼇�뙆.jpg");
		register.setItemImg3("�뼇�뙆.jpg");
		register.setItemImg4("�뼇�뙆.jpg");
		register.setImgDetail("�뼇�뙆.jpg");
		
		mapper.insert(register);
		
		log.info(register);
	}
	
//	@Test
	public void testInsertSelectKey() {
		RegisterItemVO register = new RegisterItemVO();
		
		register.setItemName("�뼇�뙆222");
		register.setItemContent("�넀吏� �릺�엳�쓬~~2222");
		register.setPrice(20000);
		register.setNormPrice(21000);
		register.setStock(50);
		register.setDispStat("n");
		register.setSaleStat("�뙋留ㅼ쨷");
		register.setItemChr("�씤湲곗젣�뭹22");
		register.setItemImg1("�뼇�뙆22.jpg");
		register.setItemImg2("�뼇�뙆22.jpg");
		register.setItemImg3("�뼇�뙆22.jpg");
		register.setItemImg4("�뼇�뙆22.jpg");
		register.setImgDetail("�뼇�뙆22.jpg");
		
		mapper.insertSelectKey(register);
		
		log.info(register);
	}
	
//	@Test
	public void testRead() {
		RegisterItemVO register = mapper.read("1");
	}
	
//	@Test
	public void testDelete() {
		log.info("DELETE COUNT : " + mapper.delete("2"));
	}
	
//	@Test
	public void testUpdate() {
		RegisterItemVO register = new RegisterItemVO();
		
		register.setItemCode("1");
		register.setItemName("諛곗텛 �닔�젙");
		register.setItemContent("諛곗텛 �닔�젙 �릺�엳�쓬~~2222");
		register.setPrice(520000);
		register.setNormPrice(521000);
		register.setStock(550);
		register.setDispStat("n");
		register.setSaleStat("�뙋留ㅼ쨷");
		register.setItemChr("�씤湲곗젣�뭹55");
		register.setItemImg1("諛곗텛55.jpg");
		register.setItemImg2("諛곗텛55.jpg");
		register.setItemImg3("諛곗텛55.jpg");
		register.setItemImg4("諛곗텛55.jpg");
		register.setImgDetail("諛곗텛55.jpg");
		
		int count = mapper.update(register);
		
		log.info("UPDATE COUNT : " + count);
	}
	
//	@Test
	public void testPaging() {
		ItemCriteria cri = new ItemCriteria();
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<RegisterItemVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(register -> log.info(register));
	}
	
	@Test
	public void testSearch() {
		ItemCriteria cri = new ItemCriteria();
      	cri.setKeyword("肄�");
      
      	List<RegisterItemVO> list = mapper.getListWithPaging(cri);
      
      	list.forEach(register -> log.info(register));
	}
	
	@Test
	public void testFullPath() {
		String itemCode = "item000041";
		log.info(mapper.getCategory(itemCode));
	}

}
