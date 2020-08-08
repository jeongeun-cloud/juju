package com.jujumarket.shop.mapper;

import java.util.List;

import com.jujumarket.shop.domain.CategoryVO;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.RegisterItemVO;


public interface RegisterItemMapper {
	
	public List<RegisterItemVO> getList();
	
	public List<RegisterItemVO> getListWithPaging(ItemCriteria cri);
	
	public void insert(RegisterItemVO register);
	
	public void insertSelectKey(RegisterItemVO register);
	
	public RegisterItemVO read(String itemCode);
	
	public int delete(String itemCode);
	
	public int update(RegisterItemVO register);
	
	public int updateSeason(RegisterItemVO register);
	
	public List<CategoryVO> category();
	
	public int getTotalCount(ItemCriteria cri);

	public String getCategory(String itemCode);
	
	public List<RegisterItemVO> getOldFiles();

	public int getResultTotal(ItemCriteria cri);

}
