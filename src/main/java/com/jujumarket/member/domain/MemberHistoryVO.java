package com.jujumarket.member.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberHistoryVO {
	private String idNo;
	private String pwd;
	private String condition;
	private Timestamp condiUpdateDate;
	private String accountType;
	private Timestamp recentConnect;
	private String reason;

}
