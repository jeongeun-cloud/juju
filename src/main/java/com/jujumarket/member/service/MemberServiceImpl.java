package com.jujumarket.member.service;

import org.springframework.stereotype.Service;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.SellerVO;
//import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.mapper.CustomerMapper;
import com.jujumarket.member.mapper.MemberMapper;
import com.jujumarket.member.mapper.SellerMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberSerivce {

	private MemberMapper memberMapper;
	private CustomerMapper customerMapper;
	private SellerMapper sellerMapper;

	@Override
	public boolean loginCheck(String emailAccount, String pwd) {
		return pwd.equals(memberMapper.getPwdByEmailAccount(emailAccount));

	}

	@Override
	public boolean duplicateCheck(String emailAccount) {
		String email = memberMapper.getEmailAccount(emailAccount);
		if(email==null){
			return true;
		}else {
		return false;
	}
	}

	/*
	 * @Override public MemberVO getInfoByEmail(String emailAccount) { return
	 * memberMapper.read(emailAccount); }
	 */

	@Override
	public String getIdNoByEmail(String emailAccount) {
		return memberMapper.getIdNoByEmailAccount(emailAccount);
	}

	@Override
	public CustomerVO getCustomerInfoByIdNo(String idNo) {
		return customerMapper.getCustomerInfoByIdNo(idNo);
	}

	@Override
	public SellerVO getSellerInfoByIdNo(String idNo) {
		return sellerMapper.getSellerInfoByIdNo(idNo);
	}


	
}


