package com.jujumarket.main.service;

import java.util.List;

import com.jujumarket.main.domain.BasketVO;

public interface BasketService {
	
	public void register(BasketVO basket);
	
	public BasketVO get(String baskId);
	
	public boolean modify(BasketVO basket);
	
	public boolean remove(String baskId);
	
	public List<BasketVO> getList(String id);
	
	public String makeGuestId();

	public Integer getBasketTotal(String id);

}
