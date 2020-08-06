package com.jujumarket.board.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardFAQVO {
	
	private String rowNum;
	private String postingNo;
	private String title;
	private String content;
	private String boardType;
	private String idNo;
	private Date regDate;
	private Date updateDate;
	
//	postingNo Varchar2(30 ) NOT NULL,
//	  title Varchar2(30 ) NOT NULL,
//	  content Varchar2(1000 ) NOT NULL,
//	  regDate Timestamp(6) NOT NULL,
//	  boardType Varchar2(30 ) NOT NULL,
//	  IDno Varchar2(10 )

}