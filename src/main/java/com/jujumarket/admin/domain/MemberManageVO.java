package com.jujumarket.admin.domain;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class MemberManageVO {

	// t_member
	private String idNo;
	private String emailAccount;
	private String memName;
	private String memCode;
	private String memAddr;
	private String postCode;

	// m_history
	private Timestamp condiUpdateDate;
}
