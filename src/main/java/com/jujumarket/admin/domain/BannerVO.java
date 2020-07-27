package com.jujumarket.admin.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BannerVO {
	
	private String imgNo;
	private String uuid;
	private String imgPath;
	private String imgName;
	private Timestamp regDate;
	private Timestamp updateDate;
	private String idNo;
	private String bannerType;

}
