package com.jujumarket.member.mapper;

import java.util.List;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberHistoryVO;
import com.jujumarket.member.domain.MemberVO;

public interface CustomerMapper {
	
	//일반고객 m_customer에 회원가입정보 추가
	public void insert(CustomerVO customer);
	//회원히스토리 m_history 테이블에 회원가입정보 추가 
	public void insertJoinInfo(CustomerVO customer);
	//일반고객 회원정보 수정 시 화면에 이전 회원정보 보여주기 (customerInfoModify.jsp)
	public CustomerVO getCustomerInfoByIdNo(String idNo);
	//읿반고객 회원정보 수정
	public int modifyCustomerInfo(MemberVO member);
	//일반고객 회원탈퇴
	public int deleteCustomer(String idNo);
	//일반고객 회원탈퇴정보 히스토리에 저장 
	public int insertDeleteInfo(MemberHistoryVO memberHistory);
	//아이디찾기
	public List<String> getEmailList(MemberVO member);


}
