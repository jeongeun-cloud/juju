package com.jujumarket.admin.service;

import java.util.List;

import com.jujumarket.admin.domain.MemStatVO;
import com.jujumarket.shop.domain.ItemCriteria;

public interface MemStatService {
	
	public Integer TotalMem();
	
	public Integer TodayTotalMem();
	
	public Integer WithdrawTotal();
	
	public Integer TodayWithdrawTotal();
	
	public Integer getCusNum();
	
	public Integer getSellNum();
	
	public List<MemStatVO> getWithdraw();
	
	public int getWithdrawTotal(ItemCriteria cri);
	
	public List<MemStatVO> getMemSta(String day);
	
	public List<MemStatVO> getWithdrawSta(String day);
	

}
