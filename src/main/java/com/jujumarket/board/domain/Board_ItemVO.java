package com.jujumarket.board.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Board_ItemVO {
	
	private String postingNo;
	private String itemCode;
	private String shopCode;
	
	private String title;
	private String content;
	private String queType;
	private String boardType;
	private String idNo;
	private Date regDate;
	
	
//	CREATE TABLE t_board_item(
//			  postingNo Varchar2(30 ) NOT NULL,
//			  itemCode Varchar2(30 ) NOT NULL,
//			  shopCode Varchar2(30 ) NOT NULL,
//			  
//			  title Varchar2(30 ) NOT NULL,
//			  content Varchar2(1000 ) NOT NULL,
//			  queType Varchar2(30 ) NOT NULL,
//			  boardType Varchar2(30 ) NOT NULL,
//			  IDno Varchar2(10 ) NOT NULL
//			  
//			  regDate Timestamp(6) NOT NULL,
//			);

}