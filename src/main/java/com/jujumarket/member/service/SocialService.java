package com.jujumarket.member.service;

import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SocialVO;

public interface SocialService {
	
	public void register(MemberVO socialVO);
	
	public int socialEmailCheck(String emailAccount);
	
	public MemberVO getSocialInfo(String emailAccount);
	
}
