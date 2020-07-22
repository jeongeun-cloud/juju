package com.jujumarket.member.service;

import com.jujumarket.member.domain.MemberVO;

public interface MemberSerivce {
	
	public boolean loginCheck(String emailAccount, String pwd);

	public boolean duplicateCheck(String emailAccount);

//	public MemberVO getInfoByEmail(String emailAccount);

	public String getIdNoByEmail(String emailAccount);
	
}
