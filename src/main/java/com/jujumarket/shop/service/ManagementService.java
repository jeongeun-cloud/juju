package com.jujumarket.shop.service;

import java.util.List;

import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ManagementVO;



public interface ManagementService {
	
	public boolean shippingupdate(ManagementVO vo); //송장번호수정
	
	public List<ManagementVO> searchordergetList(ItemCriteria cri);
	
	public List<ManagementVO> shippinggetList(ItemCriteria cri);
	
	public int getTotal(ItemCriteria cri);
	
	public int getNotTotal(ItemCriteria cri);

}
