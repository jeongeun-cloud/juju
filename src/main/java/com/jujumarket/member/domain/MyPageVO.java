package com.jujumarket.member.domain;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class MyPageVO {
	
	//공통컬럼
	private String idNo;
	private String itemCode;
	private String itemName;
	

	private Timestamp regDate;

	//getMyReviewListByIdNo 메소드에서 사용
	private String reviewNo;
	private String reviewImg;
	private String reviewTitle;
	private String reviewContent;
	
	//getMyprdReplyListByIdNo 메소드에서 사용
	private String replyNo;
	private String replyCode;
	private String replyContent;

}
