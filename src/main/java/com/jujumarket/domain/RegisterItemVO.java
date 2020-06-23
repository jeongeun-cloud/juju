package com.jujumarket.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RegisterItemVO {

	private String itemCode;
	private String itemName;
	private String itemContent;
	private int price;
	private int normPrice;
	private int stock;
	private String dispStat;
	private String saleStat;
	private String itemChr;
	private String itemImg;
	private Timestamp regDate;
	private Timestamp updateDate;
	private String classCode;
	private String IDno;
}
