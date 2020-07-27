package com.jujumarket.main.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewVO {
	
	private String reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewImg;
	private int score;
	private Timestamp regDate;
	private Timestamp updateDate;
	private String orderCode;
	private String itemCode;
	private String idNo;
	private String emailAccount;

}
