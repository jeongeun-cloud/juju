package com.jujumarket.admin.mapper;

import java.util.List;

import com.jujumarket.admin.domain.MemStatVO;
import com.jujumarket.shop.domain.ItemCriteria;

public interface MemStatMapper {
	

	public Integer TotalMem();
	
	public Integer TodayTotalMem();
	
	public Integer WithdrawTotal();
	
	public Integer TodayWithdrawTotal();
	//

	public Integer getCusNum();
	
	public Integer getSellNum();
	
	//탈퇴
	public List<MemStatVO> getWithdraw(ItemCriteria cri);
	
	public int getWithdrawTotal(ItemCriteria cri);
	
	public List<MemStatVO> getMemSta(String day);
	
	public List<MemStatVO> getWithdrawSta(String day);
	
	//1:1문의 고객
	public int cNum();
	//1:1문의 상인
	public int sNum();
}
