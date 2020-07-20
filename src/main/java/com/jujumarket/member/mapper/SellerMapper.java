package com.jujumarket.member.mapper;

import com.jujumarket.member.domain.SellerVO;

public interface SellerMapper {
	public void insert(SellerVO seller);
	
	public String getSellerPwdByIdNo(String idNo);
}
