package com.jujumarket.member.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jujumarket.member.domain.SocialVO;
import com.jujumarket.member.mapper.SocialMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SocialServiceImpl implements SocialService{

	private SocialMapper mapper;
	
	@Transactional
	@Override
	public void register(SocialVO socialVO) {
		log.info("register social account.....");
		
		mapper.insertSocialMember(socialVO);
		mapper.insertSocialCustomer(socialVO);
	}

	@Override
	public int socialEmailCheck(String emailAccount) {
		log.info("socialEmailCheck....");
		
		return mapper.socialEmailCheck(emailAccount);
	}

	@Override
	public SocialVO getSocialInfo(String emailAccount) {
		log.info("getSocialInfo....");
		
		return mapper.getSocialInfo(emailAccount);
	}

}