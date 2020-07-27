package com.jujumarket.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.shop.mapper.ShopManageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ShopManageServiceImpl implements ShopManageService {
	
	@Setter(onMethod_ = @Autowired)
	private ShopManageMapper mapper;

	
	@Override
	public int todayOrderTotal() {
		log.info("shopnamgeservice단 둘어옴!");
		return mapper.todayOrderTotal();
	}
	
	@Override
	public int prevOrderTotal() {
		// TODO Auto-generated method stub
		return mapper.prevOrderTotal();
	}
}
