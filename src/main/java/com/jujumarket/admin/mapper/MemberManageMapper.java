package com.jujumarket.admin.mapper;

import java.util.List;

import com.jujumarket.admin.domain.MemberManageVO;


public interface MemberManageMapper {
	
	public List<MemberManageVO> getAllMember();
	
	public List<MemberManageVO> getRegDate();
	
}
