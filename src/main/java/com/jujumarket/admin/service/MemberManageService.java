package com.jujumarket.admin.service;

import java.util.List;

import com.jujumarket.admin.domain.MemberManageVO;
import com.jujumarket.shop.domain.ItemCriteria;


public interface MemberManageService {
	
	public List<MemberManageVO> getTotal();
	
	public List<MemberManageVO> getAllMember(ItemCriteria cri);
	
	public MemberManageVO getMember(String idNo);
	
	public void regBlack(MemberManageVO vo);
	
	public List<MemberManageVO> getBlack();
	
}
