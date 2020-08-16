package com.jujumarket.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.member.domain.DangolVO;
import com.jujumarket.member.domain.MyPageVO;
import com.jujumarket.member.domain.MyPerchaseVO;
import com.jujumarket.member.mapper.MyPageMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MyPageServiceImpl implements MyPageService{
	private MyPageMapper myPageMapper;

	@Override
	public List<MyPageVO> getMyReviewListByIdNo(String idNo, Criteria cri) {
		return myPageMapper.getMyReviewListByIdNo(idNo, cri);
	}

	@Override
	public int getMyReviewCountByIdNo(String idNo, Criteria cri) {
		return myPageMapper.getMyReviewCountByIdNo(idNo, cri);
	}

	@Override
	public List<MyPageVO> getMyPrdReplyListByIdNo(String idNo, Criteria cri) {
		return myPageMapper.getMyPrdReplyListByIdNo(idNo, cri);
	}

	@Override
	public int getMyPrdReplyCountByIdNo(String idNo, Criteria cri) {
		return myPageMapper.getMyPrdReplyCountByIdNo(idNo, cri);
	}

	@Override
	public List<MyPerchaseVO> getMyPerchaseListByIdNo(String idNo, Criteria cri) {
		return myPageMapper.getMyPerchaseListByIdNo(idNo, cri);
	}

	@Override
	public int getMyPerchaseCountByIdNo(String idNo, Criteria cri) {
		return myPageMapper.getMyPerchaseCountByIdNo(idNo, cri);
	}
	//나의 단골 가게 보기 
	@Override
	public List<DangolVO> getMyDangol(String memidNo) {
		return myPageMapper.getMyDangol(memidNo);
	}

	@Override
	public List<MyPerchaseVO> getGuestPurchaseListByOrderCode(String orderCode) {
		return myPageMapper.getGuestPurchaseListByOrderCode(orderCode);
	}



}
