package com.jujumarket.shop.service;

import java.util.List;

import com.jujumarket.shop.domain.ManagementVO;
import com.jujumarket.shop.domain.RegisterItemVO;


public interface ManagementService {

    ///searchorder /shipping
	//  public ManagementVO get(String orderCode); 상세보기 보류
	
	public boolean shippingupdate(ManagementVO vo); //송장번호수정
	
	/* public ManagementVO get(String orderCode); */
		 
	public List<ManagementVO> searchordergetList();

	public List<ManagementVO> shippinggetList();
	
	public List<ManagementVO> pricegetList();


}
