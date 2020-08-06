
package com.jujumarket.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberHistoryVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.mapper.CustomerMapper;
import com.jujumarket.member.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CustomerServiceImpl implements CustomerService{
	//t_member
	private MemberMapper memberMapper;
	//m_customer
	private CustomerMapper customerMapper;
	
	//회원가입(일반고객)
	//t_member, m_customer, m_history 동시에 가입정보 추가 
	@Transactional
	@Override
	public void register(CustomerVO customer) {
		memberMapper.insertCustomer(customer);
		customerMapper.insertJoinInfo(customer);
		customerMapper.insert(customer);
	}
	
	//[마이페이지]일반고객 회원정보수정
	//t_member, m_customer 를 동시에 update
	@Transactional
	@Override
	public boolean modifyCustomerInfo(MemberVO member) {
		return memberMapper.modifyMemberInfo(member)==1 
		&& customerMapper.modifyCustomerInfo(member)==1;
	
	}
	
	//[마이페이지]회원탈퇴(일반고객)
	//t_member, m_customer 에서 회원삭제
	//m_history 에 탈퇴정보추가
	//를 동시에
	@Transactional
	@Override
	public boolean deleteMember(MemberHistoryVO memberHistory) {
		String idNo = memberHistory.getIdNo();
		return memberMapper.deleteMember(idNo) == 1
		&& customerMapper.deleteCustomer(idNo) == 1
		&& customerMapper.insertDeleteInfo(memberHistory) == 1;
	
	
	}


	

}