package com.jujumarket.member.domain;

import lombok.Data;

@Data
public class MemberVO {
	//t_member(NN)
	private String idNo;
	private String emailAccount;
	private String memName;
	private String memCode;
	private String pwd; 

	//nullable
	private String memAddr;
	private String postCode;
	
	//m_customer
	private String contact;
	
		
	//m_shop(NN)
	private String shopName;
	private String shopAddr;
	private String contact1;

		
	//m_shop (nullable)
	private String contact2;
	private String shopPostCode;

	//m_shop_info(NN)
	private String businessCode;
	private String businessRegFile;
	private String bank;
	private String bankAccount;
	private String thumbImg;
		
	//m_shop_info(nullable)
	private String backImg;
	
	// m_social
	private String birth;
	private String socialType;

}
