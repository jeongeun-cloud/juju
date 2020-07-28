package com.jujumarket.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.admin.domain.BannerVO;
import com.jujumarket.admin.mapper.BannerMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EventServiceImpl implements EventService {
	
	@Setter(onMethod_ = @Autowired)
	private BannerMapper mapper;

	@Override
	public List<BannerVO> getBanner(String bannerType) {
		log.info("Banner 불러오기...");
		
		return mapper.getBanner(bannerType);
	}

}
