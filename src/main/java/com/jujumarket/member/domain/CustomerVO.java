package com.jujumarket.member.domain;

import lombok.Data;

@Data
public class CustomerVO {
	private String idNo;
	private String emailAccount;
	private String memName;
	private String memCode;
	//nullable
	private String memAddr;
	//nullable
	private String PostCode;
	
	//m_customer
	//nullable
	private String contact;
	private String pwd;
}
