package com.jujumarket.order.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderHistoryVO {
	private String baskId;
	private String orderCode;
	private String itemCode;
	private String orderStat;
	private Timestamp prgDate;
	private String historyNo;
	
}
