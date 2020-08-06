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
	
	//shop 이름가져오기
	@Override
	public String getShopName(String idNo) {
		return mapper.getShopName(idNo);
	
	}
	
	@Override
	public List<WholeStaVO> getCompareSta(String idNo) {
		return mapper.getCompareSta(idNo);
	}
	
	@Override
	public Integer todayOrderTotal(String idNo) {
		log.info("shopnamgeservice단 둘어옴!");
		return mapper.todayOrderTotal(idNo);
	}
	
	@Override
	public Integer prevOrderTotal(String idNo) {
		
		return mapper.prevOrderTotal(idNo);
	}
	
	@Override
	public Integer todayOrderCnt(String idNo) {
		
		return mapper.todayOrderCnt(idNo);
	}
	
	@Override
	public Integer prevOrderCnt(String idNo) {
		
		return mapper.prevOrderCnt(idNo);
	}
	@Override
	public Integer todayRefundTotal(String idNo) {
		return mapper.todayRefundTotal(idNo);
	} 
	@Override
	public Integer prevRefundTotal(String idNo) {
		return mapper.prevRefundTotal(idNo);
	}
	@Override
	public Integer todayRefundCnt(String idNo) {
		return mapper.todayRefundCnt(idNo);
	}
	@Override
	public Integer prevRefundCnt(String idNo) {
		return mapper.prevRefundCnt(idNo);
	}
	
	@Override
	public List<BoardItemVO> getTodayProSta(String idNo) {
		
		return mapper.getTodayProSta(idNo);
	}
	
	@Override
	public List<WholeStaVO> getWholeSta(String idNo) {
		
		return mapper.getWholeSta(idNo);
	}
	
	@Override
	public List<WholeStaVO> getDaySta(String idNo) {
		return mapper.getDaySta(idNo);
	}
	@Override
	public List<WholeStaVO> getMonthSta(String idNo) {
		// TODO Auto-generated method stub
		return mapper.getMonthSta(idNo);
	}
	@Override
	public List<WholeStaVO> getYearSta(String idNo) {
		// TODO Auto-generated method stub
		return mapper.getYearSta(idNo);
	}
}
