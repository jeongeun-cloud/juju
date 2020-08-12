package com.jujumarket.board.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class ReplyVO {
	
	private String replyNo;
	private String replyContent;
	private Date regDate;
	private Date updateDate;
	
	private String postingNo;
	private String emailAccount;
	
	
	private String idNo;
	
	
	
	

}
