package com.jujumarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.admin.domain.MemStatVO;
import com.jujumarket.admin.mapper.MemStatMapper;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.mapper.ShopManageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor

public class MemStatServiceImpl implements MemStatService {
	
	@Setter(onMethod_ = @Autowired)
	private MemStatMapper mapper;
	
	@Override
	public Integer getCusNum() {
		return mapper.getCusNum();
	}
	
	@Override
	public Integer getSellNum() {
		return mapper.getSellNum();
	}
	//탈퇴
	@Override
	public List<MemStatVO> getWithdraw(ItemCriteria cri) {
		return mapper.getWithdraw(cri);
	}
	
	@Override
	public int getWithdrawTotal(ItemCriteria cri) {
		return mapper.getWithdrawTotal(cri);
	}
	
	//회원가입한 회원 통계
	public java.util.List<MemStatVO> getMemSta(String day) {
		
		return mapper.getMemSta(day);
	}
	
	@Override
	public List<MemStatVO> getWithdrawSta(String day) {
		return mapper.getWithdrawSta(day);
	}

	@Override
	public Integer TotalMem() {
		return mapper.TotalMem();
	}
	@Override
	public Integer TodayTotalMem() {
		return mapper.TodayTotalMem();
	}
	@Override
	public Integer WithdrawTotal() {
		return mapper.WithdrawTotal();
	}
	@Override
	public Integer TodayWithdrawTotal() {
		return mapper. TodayWithdrawTotal();
	}
	//1:1 문의
	@Override
	public int cNum() {
		return mapper.cNum();
	}
	@Override
	public int sNum() {
		return mapper.sNum();
	}
}
