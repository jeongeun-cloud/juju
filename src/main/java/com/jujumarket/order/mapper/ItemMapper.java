package com.jujumarket.order.mapper;

import java.util.List;

import com.jujumarket.order.domain.ItemVO;

public interface ItemMapper {
	
//	@Select("select * from t_item")
	public List<ItemVO> getList();

	public void insert(ItemVO item);
	
	public void insertSelectKey(ItemVO item);
	
	public ItemVO read(String ItemCode);
	
	public int delete(String ItemCode);
	
	public int update(ItemVO item);
	
}


