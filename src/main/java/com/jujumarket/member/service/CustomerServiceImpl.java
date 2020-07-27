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

	private MemberMapper memberMapper;
	private CustomerMapper customerMapper;
	
	@Transactional
	@Override
	public void register(CustomerVO customer) {
		memberMapper.insertCustomer(customer);
		memberMapper.insertJoinInfo(customer);
		customerMapper.insert(customer);
		
	}
	
	@Transactional
	@Override
	public boolean modifyCustomerInfo(MemberVO member) {
		
		return memberMapper.modifyMemberInfo(member)==1 
		&& customerMapper.modifyCustomerInfo(member)==1;
	
	}
	
	@Transactional
	@Override
	public boolean deleteMember(MemberHistoryVO memberHistory) {
		String idNo = memberHistory.getIdNo();
		return memberMapper.deleteMember(idNo) == 1
		&& customerMapper.deleteCustomer(idNo) == 1
		&& customerMapper.insertDeleteInfo(memberHistory) == 1;
	
	
	}


	

}
