package com.jujumarket.board.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardQNAVO {

	private String postingNo;
	private String title;
	private String content;
	private String idNo;
	private Date  regDate;
	private Date updateDate;
	//0811 kw 추가 
	private Integer rn;



}