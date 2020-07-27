package com.jujumarket.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.admin.domain.BannerVO;
import com.jujumarket.admin.mapper.BannerMapper;
import com.jujumarket.shop.mapper.RegisterItemMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BannerServiceImpl implements BannerService {
	
	@Setter(onMethod_ = @Autowired)
	private BannerMapper mapper;

	@Override
	public void register(BannerVO vo) {
		log.info("register banner... " + vo);
		
		mapper.insertSelectKey(vo);
	}

}
