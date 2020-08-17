package com.jujumarket.main.domain;

import lombok.Data;

@Data
public class RecommendVO {
	
	private String idNo;
	private String itemCode;
	private float value;
	
	private String itemName;
	private int price;
	private int normPrice;
	private String itemImg1;
	
}
