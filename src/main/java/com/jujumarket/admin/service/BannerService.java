package com.jujumarket.admin.service;

import java.util.List;

import com.jujumarket.admin.domain.BannerVO;

public interface BannerService {
	
	public void register(BannerVO vo);

	public List<BannerVO> getBanner(String bannerType);
	
	public int remove(String imgNo);
	
	public BannerVO get(String imgNo);
}
