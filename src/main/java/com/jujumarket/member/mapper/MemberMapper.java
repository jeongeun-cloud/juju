package com.jujumarket.member.mapper;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.SellerVO;
import com.jujumarket.order.domain.OrderMemberVO;

public interface MemberMapper {
	
	public void insert(SellerVO seller);

	public void insert(CustomerVO customer);
	
	public OrderMemberVO orderMemberInfo(String idNo);
	
	public String getMemberIdNoByEmailAccount(String emailAccount);
}
