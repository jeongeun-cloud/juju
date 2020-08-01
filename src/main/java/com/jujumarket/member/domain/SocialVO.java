package com.jujumarket.member.domain;

import lombok.Data;

@Data
public class SocialVO {
	
	// t_member
	private String idNo;
	private String emailAccount;
	private String memName;
	private String memCode;
	
	// m_social
	private String contact;
	private String birth;
	private String socialType;
	
}
