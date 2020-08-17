package com.jujumarket.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ManagementVO;

public interface ManagementMapper {
		
	
		public List<ManagementVO> shippinggetList(); //옛날꺼
		
		public List<ManagementVO> searchordergetList(); //옛날꺼
		
		public List<ManagementVO> shippinggetListPaging(ItemCriteria cri); //배송처리
		
		public List<ManagementVO> searchordergetListPaging(ItemCriteria cri); //전체보기
		
		public int getnotCount (ItemCriteria cri); //전체 total 아직 미완
		
		public int getTotalCount (ItemCriteria cri); //배송처리 total	
		
		public int RefundTotal (ItemCriteria cri); //배송처리 total	
		
		public List<ManagementVO> getcheck(String orderStat);//착크박스 처리였나 ?...
		
		public List<ManagementVO> getcheckAll(ItemCriteria cri); //전체보기 orderStat
	
		public List<Integer> getListCount(); //송장없는 애들 List
		
		public void insertSelectKey(ManagementVO vo); //송장수정
		
		public int shippingupdate(ManagementVO vo); //송장번호 입력은 수정으로 처리를 함
		
		public int shippStatupdate(ManagementVO vo); //송장번호 입력은 수정으로 처리를 함
		
        public List<ManagementVO> datedate(ManagementVO vo);//날짜처리

        public List<ManagementVO> refundListPaging(ItemCriteria cri); //취소환불
        
        public void refundinsertSelectKey(ManagementVO vo); //취소요청 상태변경
        
        public void refundupdate(ManagementVO vo); //송장수정
        
    
		
}
