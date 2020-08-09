package com.jujumarket.main.service;

import java.util.List;

import com.jujumarket.main.domain.ItemMainVO;

public interface ItemMainService {
	
	public void register(ItemMainVO item);
	
	public ItemMainVO get(String itemCode);
	
	public boolean modify(ItemMainVO item);
	
	public boolean remove(String itemCode);
	
	public List<ItemMainVO> getList();

	public String getShop(String itemCode);


}
