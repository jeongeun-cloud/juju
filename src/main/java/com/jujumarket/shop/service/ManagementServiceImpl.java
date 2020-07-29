package com.jujumarket.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ManagementVO;
import com.jujumarket.shop.mapper.ManagementMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ManagementServiceImpl implements ManagementService {
	
	@Setter(onMethod_ = @Autowired)
	private ManagementMapper mapper;

	@Override
	public boolean shippingupdate(ManagementVO vo) {
		// TODO Auto-generated method stub
		
		return mapper.shippingupdate(vo) == 1;
	}

	
	@Override
	public List<ManagementVO> searchordergetList(ItemCriteria cri) {
		System.out.println(cri);
		
		return mapper.searchordergetListPaging(cri);
	}
	
	@Override
	public List<ManagementVO> shippinggetList(ItemCriteria cri) {
		System.out.println(cri);
		
		return mapper.shippinggetListPaging(cri);
	}


	@Override
	public int getTotal(ItemCriteria cri) {
		
		return mapper.getTotalCount(cri);
	}


	@Override
	public int getNotTotal(ItemCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getnotCount(cri);
	}



}
