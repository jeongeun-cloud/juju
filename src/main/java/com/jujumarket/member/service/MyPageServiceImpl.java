package com.jujumarket.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.member.domain.MyPageVO;
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


	
	

	
	

}
