package com.jujumarket.main.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PrdReplyVO {
	
	private int replyDepth;
	private int replyCount;
	private int replyNo;
	private String replyContent;
	private String replyCode;

	private String emailAccount;
	private String itemCode;
	private String idNo;
	private Date regDate;
	private Date updateDate;

}
