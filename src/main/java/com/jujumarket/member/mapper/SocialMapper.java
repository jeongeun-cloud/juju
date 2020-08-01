package com.jujumarket.member.mapper;

import com.jujumarket.member.domain.SocialVO;

public interface SocialMapper {

	public void insertSocialMember(SocialVO socialVO);
	
	public void insertSocialCustomer(SocialVO socialVO);
	
	public int socialEmailCheck(String emailAccount);
	
	public SocialVO getSocialInfo(String emailAccount);
	
}
