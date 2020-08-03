package com.jujumarket.order.service;

import com.jujumarket.order.domain.OrderMemberVO;


public interface OrderMemberService{

	public OrderMemberVO getOrderMemberInfo(String idNo); 
	
	public OrderMemberVO getOrderSellerInfo(String idNo); 
	
	public OrderMemberVO getOrderSocialInfo(String idNo); 

}