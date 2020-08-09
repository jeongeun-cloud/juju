package com.jujumarket.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jujumarket.member.domain.MemberHistoryVO;
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
	
	//t_member
	private MemberMapper memberMapper;
	//m_shop
	private SellerMapper sellerMapper;
	//m_shop_info
	private SellerInfoMapper sellerInfoMapper;

	
	//회원가입(상인) 
	//t_member, m_shop, m_shop,info, m_history 가입정보 동시에 추가	
	@Transactional
	@Override
	public void register(SellerVO seller) {
		memberMapper.insertSeller(seller);
		sellerMapper.insertJoinInfo(seller);
		sellerMapper.insert(seller);
		sellerInfoMapper.insertShopInfo(seller);
		
	
	}

	//[마이페이지]회원정보수정(상인)
	//t_member, m_shop, m_shop_info 를 동시에 update
	@Transactional
	@Override
	public boolean modifySellerInfo(MemberVO member) {

		return memberMapper.modifyMemberInfo(member)==1 
		&& sellerMapper.modifySellerInfo(member)==1
		&& sellerInfoMapper.modifySellerInfo(member)==1;
	}
	
	//[마이페이지]회원탈퇴(상인)
	//t_member, m_shop, m_shop_info 에서 회원삭제
	//m_history에 탈퇴정보 추가 
	//를 동시에 
	@Transactional
	@Override
	public boolean deleteMember(MemberHistoryVO memberHistory) {
		String idNo = memberHistory.getIdNo();
		
		return memberMapper.deleteMember(idNo)== 1
		&& sellerMapper.deleteSeller(idNo) == 1
		&& sellerInfoMapper.deleteSellerInfo(idNo) == 1
		&& sellerMapper.insertDeleteInfo(memberHistory) ==1;

	
	}

	@Override
	public boolean bcUniqueCheck(String businessCode) {
		if (sellerInfoMapper.bcUniqueCheck(businessCode) == null) {
			return true;
		} else {
			return false;
		}
	}





}