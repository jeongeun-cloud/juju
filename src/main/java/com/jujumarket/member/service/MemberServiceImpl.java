package com.jujumarket.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.member.mail.MailHandler;
import com.jujumarket.member.mail.TempKey;
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
		
		String idNo = memberMapper.getMemberIdNoByEmailAccount(emailAccount);
		String customerPwd = customerMapper.getCustomerPwdByIdNo(idNo);
		String sellerPwd = sellerMapper.getSellerPwdByIdNo(idNo);
		
		return pwd.equals(customerPwd) || pwd.equals(sellerPwd);
		
	}

	@Override
	public boolean duplicateCheck(String email) {
		return false;
	}

}
