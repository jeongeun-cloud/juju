package com.jujumarket.shop.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.jujumarket.shop.domain.CategoryVO;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.RegisterItemVO;


public interface RegisterItemService {

	public void register(RegisterItemVO register);
	
	public RegisterItemVO get(String itemCode);
	
	public boolean modify(RegisterItemVO register);
	
	public boolean remove(String itemCode);
	
	//public List<RegisterItemVO> getList();
	
	public List<RegisterItemVO> getList(ItemCriteria cri);
	
	public List<CategoryVO> category();
	
	public int getTotal(ItemCriteria cri);
	
	public void getExcelDown(HttpServletResponse response);

	public String getCategory(String itemCode);
	
	public int getResultTotal(ItemCriteria cri);
	
}
