package com.jujumarket.member.service;

import java.util.List;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.member.domain.DangolVO;
import com.jujumarket.member.domain.MyPageVO;
import com.jujumarket.member.domain.MyPerchaseVO;

public interface MyPageService {

	public List<MyPageVO> getMyReviewListByIdNo(String idNo, Criteria cri);

	public int getMyReviewCountByIdNo(String idNo, Criteria cri);

	public List<MyPageVO> getMyPrdReplyListByIdNo(String idNo, Criteria cri);

	public int getMyPrdReplyCountByIdNo(String idNo, Criteria cri);

	public List<MyPerchaseVO> getMyPerchaseListByIdNo(String idNo, Criteria cri);

	public int getMyPerchaseCountByIdNo(String idNo, Criteria cri);
	
	public List<DangolVO> getMyDangol(String memidNo);

	public List<MyPerchaseVO> getGuestPurchaseListByOrderCode(String orderCode);


}

