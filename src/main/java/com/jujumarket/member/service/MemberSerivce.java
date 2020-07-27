package com.jujumarket.member.service;

import java.util.List;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;

public interface MemberSerivce {
	
	public boolean loginCheck(String emailAccount, String pwd);

	public boolean duplicateCheck(String emailAccount);

//	public MemberVO getInfoByEmail(String emailAccount);

	public String getIdNoByEmail(String emailAccount);

	public CustomerVO getCustomerInfoByIdNo(String idNo);

	public SellerVO getSellerInfoByIdNo(String idNo);

	public boolean deleteCheck(String idNo, String pwd);

	public List<String> getEmailList(MemberVO member);




	
	
}
