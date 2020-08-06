package com.jujumarket.admin.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ColumnVO {
    
	private String img1;
	private String column1;
	private String img2;
	private String column2;
	private Timestamp regDate;
	private Timestamp updateDate;
	private String idNo;
	
	private String type;

}
