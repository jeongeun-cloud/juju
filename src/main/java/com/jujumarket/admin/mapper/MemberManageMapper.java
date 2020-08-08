package com.jujumarket.admin.mapper;

import java.util.List;

import com.jujumarket.admin.domain.MemberManageVO;
import com.jujumarket.shop.domain.ItemCriteria;


public interface MemberManageMapper {
	
	public List<MemberManageVO> getTotal();
	
	public List<MemberManageVO> getAllMember(ItemCriteria cri);
	
}
