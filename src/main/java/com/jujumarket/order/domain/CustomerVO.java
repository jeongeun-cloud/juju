package com.jujumarket.order.domain;

import lombok.Data;

@Data
public class CustomerVO {
	private String idNo;
	private String contact;
	private String pwd;
	private String authCode;
	private String postCode;	
	private String shopAddr;
}