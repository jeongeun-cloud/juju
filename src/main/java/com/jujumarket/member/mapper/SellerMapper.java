package com.jujumarket.member.mapper;

import java.util.List;

import com.jujumarket.member.domain.MemberHistoryVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;

public interface SellerMapper {
	//상인 회원가입
	public void insert(SellerVO seller);
	//상인 회원가입정보(히스토리에 저장)
	public void insertJoinInfo(SellerVO seller);
	//상인 회원정보수정화면 @GetMapping시 필요
	public SellerVO getSellerInfoByIdNo(String idNo);
	//상인 회원정보수정 (m_shop)
	public int modifySellerInfo(MemberVO member);
	//상인 회원탈퇴 (m_shop)
	public int deleteSeller(String idNo);
	//회원히스토리(m_history)에 회원탈퇴정보 저장
	public int insertDeleteInfo(MemberHistoryVO memberHistory);
	//회원 id찾기
	public List<String> getEmailList(MemberVO member);
	
	

	
}
