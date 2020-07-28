package com.jujumarket.member.mapper;

import java.util.List;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberHistoryVO;
import com.jujumarket.member.domain.MemberVO;

public interface CustomerMapper {
	
	public void insert(CustomerVO customer);
	
	public void insertJoinInfo(CustomerVO customer);
	//회원정보 수정 시 기존정보 가져오기
	public CustomerVO getCustomerInfoByIdNo(String idNo);

	public int modifyCustomerInfo(MemberVO member);

	public int deleteCustomer(String idNo);
	
	public int insertDeleteInfo(MemberHistoryVO memberHistory);
	//id찾기
	public List<String> getEmailList(MemberVO member);


}
