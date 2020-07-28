package com.jujumarket.admin.mapper;

import java.util.List;

import com.jujumarket.admin.domain.BannerVO;

public interface BannerMapper {
	
	public void insert(BannerVO vo);
	
	public void insertSelectKey(BannerVO vo);
	
	public List<BannerVO> getBanner(String bannerType);
	
	public int delete(String imgNo);
	
	public BannerVO read(String imgNo);

}
