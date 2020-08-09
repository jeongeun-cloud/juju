package com.jujumarket.admin.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.admin.domain.MemberManageVO;
import com.jujumarket.admin.mapper.MemberManageMapper;
import com.jujumarket.shop.domain.ItemCriteria;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberManageServiceImpl implements MemberManageService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberManageMapper mapper;
	
	@Override
	public List<MemberManageVO> getTotal() {
		log.info("getTotal......");
		
		return mapper.getTotal();
	}

	@Override
	public List<MemberManageVO> getAllMember(ItemCriteria cri) {
		log.info("getAllMember......");
		
		return mapper.getAllMember(cri);
	}

	@Override
	public MemberManageVO getMember(String idNo) {
		log.info("getMember......");
		
		return mapper.getMember(idNo);
	}

	@Override
	public void regBlack(MemberManageVO vo) {
		log.info("regBlack......");
		
		mapper.regBlack(vo);
	}

	@Override
	public List<MemberManageVO> getBlack() {
		log.info("getBlack......");
		
		return mapper.getBlack();
	}
	
}
