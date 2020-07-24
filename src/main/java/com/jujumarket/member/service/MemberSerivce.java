package com.jujumarket.member.service;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.SellerVO;

public interface MemberSerivce {
	
	public boolean loginCheck(String emailAccount, String pwd);

	public boolean duplicateCheck(String emailAccount);

//	public MemberVO getInfoByEmail(String emailAccount);

	public String getIdNoByEmail(String emailAccount);

	public CustomerVO getCustomerInfoByIdNo(String idNo);

	public SellerVO getSellerInfoByIdNo(String idNo);


	
	
}
