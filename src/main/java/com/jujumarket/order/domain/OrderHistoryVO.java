package com.jujumarket.order.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderHistoryVO {
	private String orderCode;
	private String itemCode;
	private Timestamp prgDate;
	private String orderStat;
	
}
