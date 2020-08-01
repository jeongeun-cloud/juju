package com.jujumarket.member.service;

import com.jujumarket.member.domain.SocialVO;

public interface SocialService {
	
	public void register(SocialVO socialVO);
	
	public int socialEmailCheck(String emailAccount);
	
	public SocialVO getSocialInfo(String emailAccount);
	
}
