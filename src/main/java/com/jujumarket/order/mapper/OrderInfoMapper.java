package com.jujumarket.order.mapper;

import java.util.List;

import com.jujumarket.order.domain.OrderInfoVO;
import com.jujumarket.order.domain.OrderRequestVO;

public interface OrderInfoMapper {
	
//	@Select("select * from t_order_info")
	public List<OrderInfoVO> getList();
	public void insert(OrderInfoVO orderInfo);
	public void insertSelectKey(OrderRequestVO order);
	public OrderRequestVO read(String orderCode);
	public int delete(String orderCode);
	public int update(OrderInfoVO orderInfo);
	public int insertorderCode(String orderCode);
	public OrderInfoVO makeInfoAndHistory(String baskId);


}
