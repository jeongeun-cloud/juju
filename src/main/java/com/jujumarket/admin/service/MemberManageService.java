package com.jujumarket.admin.service;

import java.util.List;

import com.jujumarket.admin.domain.MemberManageVO;


public interface MemberManageService {
	
	public List<MemberManageVO> getAllMember();
	
	public List<MemberManageVO> getRegDate();
}
