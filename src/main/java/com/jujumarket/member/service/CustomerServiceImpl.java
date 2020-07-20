package com.jujumarket.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jujumarket.member.domain.CustomerVO;
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
		memberMapper.insert(customer);
		customerMapper.insert(customer);
		
	}

}
