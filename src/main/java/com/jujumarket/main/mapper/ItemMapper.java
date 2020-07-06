package com.jujumarket.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.jujumarket.main.domain.ItemVO;

public interface ItemMapper {
	
//	@Select("select * from t_item")
	public List<ItemVO> getList();

	public void insert(ItemVO item);
	
	public void insertSelectKey(ItemVO item);
	
	public ItemVO get(String ItemCode);
	
	public int delete(String ItemCode);
	
	public int update(ItemVO item);
	
}
