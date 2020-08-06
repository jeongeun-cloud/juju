package com.jujumarket.member.service;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberHistoryVO;
import com.jujumarket.member.domain.MemberVO;

public interface CustomerService {
	//일반고객 회원가입
	//t_member, m_customer, m_history 3개 테이블에 동시에 가입정보 추가 
	public void register(CustomerVO customer);

	//[마이페이지]일반고객 회원정보수정
	//t_member, m_customer 정보를 동시에 update
	public boolean modifyCustomerInfo(MemberVO member);
	
	//[마이페이지]일반고객 회원탈퇴
	//t_member, m_customer 에서 회원정보삭제
	//m_history 에 일반고객 탈퇴정보추가 
	public boolean deleteMember(MemberHistoryVO memberHistory);

}
