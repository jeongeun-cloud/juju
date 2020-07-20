package com.jujumarket.member.domain;

import lombok.Data;

@Data
public class SellerVO {

	private String idNo;
	private String emailAccount;
	private String memName;
	private String memCode;
	//nullable
	private String memAddr;
	//nullable
	private String postCode;
	
	//columes from m_shop
	private String shopName;
	private String pwd;
	private String shopAddr;
	private String contact1;
	
	//nullables
	private String contact2;
	private String shopPostCode;
	
	//columes from t_shop_info
	private String businessCode;
	private String businessRegFile;
	private String bank;
	private String bankAccount;
	private String thumbImg;
	private String backImg;
}
