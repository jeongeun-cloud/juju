package com.jujumarket.main.service;

import java.util.List;

import com.jujumarket.main.domain.ItemVO;

public interface ItemService {
	
	public void register(ItemVO item);
	
	public ItemVO get(String itemCode);
	
	public boolean modify(ItemVO item);
	
	public boolean remove(String itemCode);
	
	public List<ItemVO> getList();
	

}
