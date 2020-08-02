package com.jujumarket.member.domain;

import lombok.Data;

@Data
public class CustomerVO {
	//t_member(NN)
	private String idNo;
	private String emailAccount;
	private String memName;
	private String memCode;

	//nullable
	private String pwd;
	private String memAddr;
	private String postCode;
	
	//m_customer
	private String contact;
	
	//m_history 탈퇴사유 (nullable)
	private String reason;
	
}
