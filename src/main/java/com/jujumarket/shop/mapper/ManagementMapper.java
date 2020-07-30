package com.jujumarket.shop.mapper;

import java.util.List;


import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ManagementVO;

public interface ManagementMapper {
		
		public int shippingupdate(ManagementVO vo); //송장번호 입력은 수정으로 처리를 함
		
		public List<ManagementVO> shippinggetList();
		
		public List<ManagementVO> searchordergetList();
		
		public List<ManagementVO> pricegetList();
		
		public List<ManagementVO> shippinggetListPaging(ItemCriteria cri);
		
		public List<ManagementVO> searchordergetListPaging(ItemCriteria cri);
		
		public int getnotCount (ItemCriteria cri);
		
		public int getTotalCount (ItemCriteria cri);	
		
		public List<ManagementVO> getcheck(String orderStat);
}
