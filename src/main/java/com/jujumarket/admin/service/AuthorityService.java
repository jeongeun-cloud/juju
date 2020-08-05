package com.jujumarket.admin.service;

import java.util.List;

import com.jujumarket.admin.domain.AuthorityVO;

public interface AuthorityService {
	
	
	public List<AuthorityVO>  authorityList();
	
	public List<AuthorityVO>  get(String emailAccount);
	
	public void  memberupdate (String idNo);
	
	

}
