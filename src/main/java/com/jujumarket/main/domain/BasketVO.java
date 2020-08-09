package com.jujumarket.main.domain;

import lombok.Data;

@Data
public class BasketVO {
	
	private String baskId;
	private Integer itemNum;
	private String idNo; // 고객 아이디
	private String itemCode;
	
	private String sellerId; // 상인 아이디 
	private String itemName;
	private String itemImg1;
	private int price;
	
	private int normPrice;
	private int disAmount;
	

}
