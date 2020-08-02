package com.jujumarket.member.service;

import java.util.List;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.member.domain.MyPageVO;

public interface MyPageService {

	public List<MyPageVO> getMyReviewListByIdNo(String idNo, Criteria cri);

	public int getMyReviewCountByIdNo(String idNo, Criteria cri);



}

