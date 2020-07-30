package com.jujumarket.order.service;

import java.util.List;

import com.jujumarket.order.domain.DeliveryVO;


public interface DeliverySerivce {
	
	public DeliveryVO get(String orderCode);
	
	public void register(DeliveryVO delivery);
	
}
