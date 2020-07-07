package com.jujumarket.order.mapper;

import java.util.List;

import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.domain.OrderResponseVO;
import com.jujumarket.order.domain.OrderVO;

public interface OrderMapper {

//xml 만든 이후에
//	@Select("select * from t_order")
	public List<OrderVO> getList();
	public void insert(OrderRequestVO order);
	public void insertSelectKey(OrderRequestVO order);
	public OrderVO read(String orderCode);
	public OrderRequestVO requestRead(String orderCode);
	public int delete(String orderCode);
	public int update(OrderVO order);
	public int insertorderCode(String orderCode);
	public List<OrderResponseVO> orderResponse(String idNo);

}
