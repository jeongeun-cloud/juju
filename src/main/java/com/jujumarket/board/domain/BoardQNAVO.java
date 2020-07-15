package com.jujumarket.board.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardQNAVO {

	private String postingNo;
	private String title;
	private String content;
	private String replyBool;
	private String boardType;
	private String idNo;
	private Date  regDate;
	
	
	
	
	
//	    CREATE TABLE t_board_qna(
//			  postingNo Varchar2(30 ) NOT NULL,
//			  title Varchar2(30 ) NOT NULL,
//			  content Varchar2(1000 ) NOT NULL,
//			  replyBool Varchar2(30 ) NOT NULL,
//			  regDate Timestamp(6) NOT NULL,
//			  boardType Varchar2(30 ) NOT NULL,
//			  idNo Varchar2(10 ) NOT NULL
//			);


}