package com.jujumarket.shop.service;

import java.util.List;

import com.jujumarket.main.domain.BoardItemVO;
import com.jujumarket.shop.domain.WholeStaVO;

public interface ShopManageService {
	
	public Integer todayOrderTotal();
	
	public Integer prevOrderTotal();
	
	public Integer todayOrderCnt();
	
	public Integer prevOrderCnt();
	
	public Integer todayRefundTotal();
	
	public Integer prevRefundTotal();
	
	public Integer todayRefundCnt();
	
	public Integer prevRefundCnt();
	
//	stats 
	
	public List<BoardItemVO>getTodayProSta();
	
	public List<WholeStaVO>getWholeSta();
	
	public List<WholeStaVO>getDaySta();
	
	public List<WholeStaVO>getMonthSta();
	
	public List<WholeStaVO>getYearSta();
	

 	

}
