package com.jujumarket.member.mapper;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberVO;

public interface CustomerMapper {
	
	public void insert(CustomerVO customer);

	public CustomerVO getCustomerInfoByIdNo(String idNo);

	public int modifyCustomerInfo(MemberVO member);

	
//	public void readCustomer(CustomerVO customer);
	
}
