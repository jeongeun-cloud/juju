package com.jujumarket.shop.service;

import java.util.List;

import com.jujumarket.main.domain.BoardItemVO;
import com.jujumarket.shop.domain.WholeStaVO;

public interface ShopManageService {
	
	public String getShopName(String idNo);
	
	public List<WholeStaVO>getCompareSta(String idNo);
	
	public Integer todayOrderTotal(String idNo);
	
	public Integer prevOrderTotal(String idNo);
	
	public Integer todayOrderCnt(String idNo);
	
	public Integer prevOrderCnt(String idNo);
	
	public Integer todayRefundTotal(String idNo);
	
	public Integer prevRefundTotal(String idNo);
	
	public Integer todayRefundCnt(String idNo);
	
	public Integer prevRefundCnt(String idNo);
	
//	stats 
	
	public List<BoardItemVO>getTodayProSta(String idNo);
	
	public List<WholeStaVO>getWholeSta(String idNo);
	
	public List<WholeStaVO>getDaySta(String idNo);
	
	public List<WholeStaVO>getMonthSta(String idNo);
	
	public List<WholeStaVO>getYearSta(String idNo);
	

 	

}
