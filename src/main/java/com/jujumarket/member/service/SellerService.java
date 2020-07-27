package com.jujumarket.member.service;

import com.jujumarket.member.domain.MemberHistoryVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;

public interface SellerService {
	public void register(SellerVO seller);
	
//	public void insertMemberHistory(String idNo);

	public boolean modifySellerInfo(MemberVO member);
	
	public boolean deleteMember(MemberHistoryVO memberHistory);


}
