package com.jujumarket.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.main.domain.BoardItemVO;
import com.jujumarket.shop.domain.WholeStaVO;
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
	public Integer todayOrderTotal() {
		log.info("shopnamgeservice단 둘어옴!");
		return mapper.todayOrderTotal();
	}
	
	@Override
	public Integer prevOrderTotal() {
		
		return mapper.prevOrderTotal();
	}
	
	@Override
	public Integer todayOrderCnt() {
		
		return mapper.todayOrderCnt();
	}
	
	@Override
	public Integer prevOrderCnt() {
		
		return mapper.prevOrderCnt();
	}
	@Override
	public Integer todayRefundTotal() {
		return mapper.todayRefundTotal();
	} 
	@Override
	public Integer prevRefundTotal() {
		return mapper.prevRefundTotal();
	}
	@Override
	public Integer todayRefundCnt() {
		return mapper.todayRefundCnt();
	}
	@Override
	public Integer prevRefundCnt() {
		return mapper.prevRefundCnt();
	}
	
	@Override
	public List<BoardItemVO> getTodayProSta() {
		
		return mapper.getTodayProSta();
	}
	
	@Override
	public List<WholeStaVO> getWholeSta() {
		
		return mapper.getWholeSta();
	}
	
	@Override
	public List<WholeStaVO> getDaySta() {
		// TODO Auto-generated method stub
		return mapper.getDaySta();
	}
	@Override
	public List<WholeStaVO> getMonthSta() {
		// TODO Auto-generated method stub
		return mapper.getMonthSta();
	}
	@Override
	public List<WholeStaVO> getYearSta() {
		// TODO Auto-generated method stub
		return mapper.getYearSta();
	}
}
