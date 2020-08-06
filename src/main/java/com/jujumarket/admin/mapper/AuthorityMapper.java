package com.jujumarket.admin.mapper;

import java.util.List;

import com.jujumarket.admin.domain.AuthorityVO;

public interface AuthorityMapper {
	
	
	public List<AuthorityVO> authorityList();

	public List<AuthorityVO> getauthority(String emailaccount);
	
	public void authorityinsert(String idNo);
	
	public int authorityupdate(String idNo);


}
