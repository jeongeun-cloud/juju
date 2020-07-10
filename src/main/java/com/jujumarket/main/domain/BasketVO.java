package com.jujumarket.main.domain;

import lombok.Data;

@Data
public class BasketVO {
	
	private String baskId;
	private int itemNum;
	private String idNo;
	private String itemCode;
	
	private String itemName;
	private String itemImg1;
	private int price;

}
