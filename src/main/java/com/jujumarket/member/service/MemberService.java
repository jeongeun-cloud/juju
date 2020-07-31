package com.jujumarket.member.service;

import java.util.List;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;

public interface MemberService {
	
	public boolean loginCheck(String emailAccount, String pwd);

	public boolean duplicateCheck(String emailAccount);
//세션이었음
//	public String getIdNoByEmail(String emailAccount);

	public CustomerVO getCustomerInfoByIdNo(String idNo);

	public SellerVO getSellerInfoByIdNo(String idNo);

	public boolean checkPwd(String idNo, String pwd);

	public List<String> getEmailList(MemberVO member);

	public boolean updatePwd(MemberVO member);

	public MemberVO getMemberInfo(String emailAccount);




	
	
}
