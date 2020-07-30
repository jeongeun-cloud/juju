package com.jujumarket.order.mapper;

import java.util.List;

import com.jujumarket.order.domain.OrderHistoryVO;
import com.jujumarket.order.domain.OrderInfoVO;
import com.jujumarket.order.domain.OrderRequestVO;

public interface OrderHistoryMapper {

//	@Select ("select * from t_order_history")
	public List<OrderHistoryVO> getList();
	
	public void insert(OrderInfoVO orderInfo);
	
	public void insertSelectKey(OrderRequestVO order);
	
	public OrderHistoryVO read(String orderCode);
	
	public int delete(String orderCode);
	
	
	public int insertorderCode(String orderCode);

	public int update(OrderHistoryVO orderHistory);
	
}
