package com.jujumarket.member.service;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberHistoryVO;
import com.jujumarket.member.domain.MemberVO;

public interface CustomerService {
	public void register(CustomerVO customer);

//	public void insertMemberHistory(String idNo);

	boolean modifyCustomerInfo(MemberVO member);

	public boolean deleteMember(MemberHistoryVO memberHistory);

}
