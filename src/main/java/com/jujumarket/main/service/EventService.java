package com.jujumarket.main.service;

import java.util.List;

import com.jujumarket.admin.domain.BannerVO;

public interface EventService {
	
	public List<BannerVO> getBanner(String bannerType);

}
