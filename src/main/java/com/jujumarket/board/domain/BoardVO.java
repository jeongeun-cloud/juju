package com.jujumarket.board.domain;

import lombok.Data;

@Data
public class BoardVO {
	
	private String boardType;
	private String boardName;

//	CREATE TABLE T_BOARD(
//			  boardType Varchar2(30 ) NOT NULL,
//			  boardName Varchar2(30 ) NOT NULL
//			);

}