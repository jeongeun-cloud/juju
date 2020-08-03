package com.jujumarket.order.service;

import org.springframework.stereotype.Service;

import com.jujumarket.order.domain.OrderMemberVO;
import com.jujumarket.member.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor

public class OrderMemberServiceImpl implements OrderMemberService{
	
		private MemberMapper memberMapper;

		@Override
		public OrderMemberVO getOrderMemberInfo(String idNo) {
			return memberMapper.orderMemberInfo(idNo);
		}
		
		@Override
		public OrderMemberVO getOrderSellerInfo(String idNo) {
			return memberMapper.orderSellerInfo(idNo);
		}
		
		@Override
		public OrderMemberVO getOrderSocialInfo(String idNo) {
			return memberMapper.orderSocialInfo(idNo);
		}
}