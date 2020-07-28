package com.jujumarket.member.mapper;

import java.util.List;

import com.jujumarket.member.domain.MemberHistoryVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;

public interface SellerMapper {
	public void insert(SellerVO seller);
	//회원정보수정
	public SellerVO getSellerInfoByIdNo(String idNo);
	
	public int modifySellerInfo(MemberVO member);

	public int deleteSeller(String idNo);

	public int insertDeleteInfo(MemberHistoryVO memberHistory);
	//id찾기
	public List<String> getEmailList(MemberVO member);
	
}
