package com.jujumarket.member.service;

import com.jujumarket.member.domain.MemberHistoryVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;

public interface SellerService {
	//회원가입(상인) 
	public void register(SellerVO seller);
	//[마이페이지]회원정보수정(상인)
	public boolean modifySellerInfo(MemberVO member);
	//[마이페이지]회원탈퇴(상인)
	public boolean deleteMember(MemberHistoryVO memberHistory);
	//사업자등록번호 중복체크 
	public boolean bcUniqueCheck(String businessCode);


}
