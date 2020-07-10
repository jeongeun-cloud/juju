package com.jujumarket.board.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class ReplyVO {
	
	private String idNo;
	private String postingNo;
	private String replyContent;
	private String replyNo;
	private Date regDate;
	
	
	

}
