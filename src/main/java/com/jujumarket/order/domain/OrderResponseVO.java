package com.jujumarket.order.domain;

import lombok.Data;

@Data
public class OrderResponseVO {

	
	private String itemImg1;
	private String itemName;
	private Long normPrice;
	private Long itemNum;
	private Long price;
	private Long totalPrice;
	private Long disAmount;
	private String itemCode;
	private String baskId;
	
	private String sellerId;
	
}
