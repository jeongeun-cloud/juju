package com.jujumarket.order.service;

import java.util.List;

import com.jujumarket.main.domain.BasketVO;
import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.domain.OrderResponseVO;
import com.jujumarket.order.domain.OrderVO;

public interface OrderService {
	
	
	public String register(OrderRequestVO order);
	
	public OrderVO get(String orderCode);
	
	public boolean modify(OrderVO order);
	
	public boolean remove(String orderCode);
	
	public List<OrderVO> getList();

	public List<OrderResponseVO> getOrderResponse(String idNo);

	public List<OrderResponseVO> showOrderList(String orderCode);
	
	public String getRecentOrderCode(String idNo);
	
	public BasketVO getOne(String baskId);

}
