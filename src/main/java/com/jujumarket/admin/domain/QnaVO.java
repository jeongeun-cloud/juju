package com.jujumarket.admin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {

	private int rn;
	private String title;
	private Date regDate;
	private String idNo;
	private String emailAccount;
	private String postingNo;
}
