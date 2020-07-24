package com.jujumarket.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jujumarket.member.domain.MemberVO;
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
		memberMapper.insertSeller(seller);
		sellerMapper.insert(seller);
		sellerInfoMapper.insertShopInfo(seller);
	
	}

	@Transactional
	@Override
	public boolean modifySellerInfo(MemberVO member) {

		return memberMapper.modifyMemberInfo(member)==1 
		&& sellerMapper.modifySellerInfo(member)==1
		&& sellerInfoMapper.modifySellerInfo(member)==1;
	}


}
