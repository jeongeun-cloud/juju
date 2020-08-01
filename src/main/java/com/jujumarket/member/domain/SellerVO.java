package com.jujumarket.member.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SellerVO {
	//t_member(NN)
	private String idNo;
	private String emailAccount;
	private String memName;
	private String memCode;

	//t_member(nullable)
	private String pwd;
	private String memAddr;
	private String postCode;
	
	
	//m_shop(NN)
	private String shopName;
	private String shopPostCode;
	private String shopAddr;
	private String contact1;

	
	//m_shop (nullable)
	private String contact2;

	//m_shop_info(NN)
	private String businessCode;
	private String businessRegFile;
	private String bank;
	private String bankAccount;
	private String thumbImg;
	
	//m_shop_info(nullable)
	private String backImg;
	
	//m_history 탈퇴사유(nullable)
	private String reason;
	
}
