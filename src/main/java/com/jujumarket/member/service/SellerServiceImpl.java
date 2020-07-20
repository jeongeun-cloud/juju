package com.jujumarket.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jujumarket.member.domain.SellerVO;
import com.jujumarket.member.mapper.MemberMapper;
import com.jujumarket.member.mapper.SellerInfoMapper;
import com.jujumarket.member.mapper.SellerMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SellerServiceImpl implements SellerService{
	
	private MemberMapper memberMapper;
	private SellerMapper sellerMapper;
	private SellerInfoMapper sellerInfoMapper;

	@Transactional
	@Override
	public void register(SellerVO seller) {
		memberMapper.insert(seller);
		sellerMapper.insert(seller);
		sellerInfoMapper.insert(seller);
	
	}


}
