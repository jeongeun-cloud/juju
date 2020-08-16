package com.jujumarket.member.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyPerchaseVO {
	//t_order
	private String orderStat;

	//t_order_info
	private String orderCode;
	private Timestamp orderDate;
	private Long itemNum;
	private Long totalPrice;
	
	//t_item
	private String itemImg1;
	private String itemName;
	private String itemCode;
	
	//m_shop
	private String idNo; 
	private String shopName;
	
	//t_category
	private String classCode;
	private String fullPath;
	
}
