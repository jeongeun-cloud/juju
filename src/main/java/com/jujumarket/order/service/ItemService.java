package com.jujumarket.order.service;

import java.util.List;

import com.jujumarket.order.domain.ItemVO;

public interface ItemService {
	
	public void register(ItemVO item);
	
	public ItemVO get(String itemCode);
	
	public boolean modify(ItemVO item);
	
	public boolean remove(String itemCode);
	
	public List<ItemVO> getList();
	

}
