package com.jujumarket.member.service;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberVO;

public interface CustomerService {
	public void register(CustomerVO customer);

	boolean modifyCustomerInfo(MemberVO member);
	
//	public boolean modifyCustomerInfo(CustomerVO customer);
	
}
