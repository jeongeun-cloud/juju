package com.jujumarket.order.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderInfoVO {
	private String orderCode;
	private String baskId;
	private String itemCode;
	//OrderInfoVO에만 존재하는 컬럼 
	private Long itemNum;
	//OrderInfoVO에만 존재하는 컬럼
	private Long disAmount;
	private Long totalPrice;
	private Timestamp orderDate;

}
