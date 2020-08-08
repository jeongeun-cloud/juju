package com.jujumarket.member.mapper;

import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SocialVO;

public interface SocialMapper {

	public void insertSocialMember(MemberVO socialVO);
	
	public void insertSocialCustomer(MemberVO socialVO);
	
	public void insertSocialHistory(MemberVO socialVO);
	
	public int socialEmailCheck(String emailAccount);
	
	public MemberVO getSocialInfo(String emailAccount);
	
}
