package com.jujumarket.order.domain;

import lombok.Data;

@Data
public class CustomerVO {
	private String idno;
	private String contact;
	private String pwd;
	private String authcode;
	private String postcode;	
	private String addr;
}