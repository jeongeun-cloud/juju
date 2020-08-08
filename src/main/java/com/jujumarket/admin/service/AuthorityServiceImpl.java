package com.jujumarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jujumarket.admin.domain.AuthorityVO;
import com.jujumarket.admin.mapper.AuthorityMapper;


import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class AuthorityServiceImpl implements AuthorityService {

	@Setter(onMethod_ = @Autowired)
	AuthorityMapper mapper;
	@Override
	
	public List<AuthorityVO> authorityList() {

		return mapper.authorityList();
	}
	@Override
	public List<AuthorityVO> get(String emailAccount) {
		
		return mapper.getauthority(emailAccount);
	}
	
	@Transactional
	@Override
	public void memberupdate(String idNo) {


		 mapper.authorityinsert(idNo);
	     mapper.authorityupdate(idNo);
		
	}

	


}
