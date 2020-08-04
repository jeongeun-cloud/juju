package com.jujumarket.order.domain;

import java.sql.Timestamp;
//import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private String orderCode;
	private Long totalPay;
	private Long totalSum;
	private Long totalDiscount;
	private String receivAddr;
	private Long deliCharge;
	private Timestamp orderDate;
	private String isMember;
	private String idNo;
	private String nonMemPwd;
	private String orderStat;
	
	
}





