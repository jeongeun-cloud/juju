package com.jujumarket.member.mapper;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberVO;
//import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;
import com.jujumarket.order.domain.OrderMemberVO;

public interface MemberMapper {
	
	public void insertSeller(SellerVO seller);

	public void insertCustomer(CustomerVO customer);
	
	public OrderMemberVO orderMemberInfo(String idNo);
	
	public String getPwdByEmailAccount(String emailAccount);
	
	public String getEmailAccount(String emailAccount);

	public String getIdNoByEmailAccount(String emailAccount);
	
	public int modifyMemberInfo(MemberVO member);
	
}
