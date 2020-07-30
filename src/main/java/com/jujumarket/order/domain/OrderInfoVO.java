package com.jujumarket.order.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderInfoVO {
	private String baskId;
	private String orderCode;
	//OrderInfoVO에만 존재하는 컬럼 
	private Long itemNum;
	//OrderInfoVO에만 존재하는 컬럼
	private Long disAmount;
	private Timestamp orderDate;
	private String itemCode;
	private Long totalPrice;
	private Long normPrice;
	private Long price;
	

}
