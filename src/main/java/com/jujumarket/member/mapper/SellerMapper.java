package com.jujumarket.member.mapper;

import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;

public interface SellerMapper {
	public void insert(SellerVO seller);

	public SellerVO getSellerInfoByIdNo(String idNo);
	
	public int modifySellerInfo(MemberVO member);
	
}
