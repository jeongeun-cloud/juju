package com.jujumarket.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jujumarket.shop.domain.ManagementVO;

public interface ManagementMapper {
	
		public ManagementVO read(String orderCode);
		
		public int update(String shippingCode); //송장번호 입력은 수정으로 처리를 함
		
		public List<ManagementVO> shippinggetList();
		
		public List<ManagementVO> searchordergetList();
		
		public List<ManagementVO> pricegetList();
		
		public List<ManagementVO> getListWithPaging(
				//@Param("cri") Criteria cri,
				@Param("itemCode") String itemCode);
}
