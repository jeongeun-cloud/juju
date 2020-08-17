package com.jujumarket.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ManagementVO;
import com.jujumarket.shop.mapper.ManagementMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
public class ManagementServiceImpl implements ManagementService {
	
	@Setter(onMethod_ = @Autowired)
	private ManagementMapper mapper;

	@Transactional
	@Override
	public void shippingupdate(ManagementVO vo) {

	   mapper.shippingupdate(vo);
	   mapper.insertSelectKey(vo);
	   mapper.shippStatupdate(vo);
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


	@Override
	public List<ManagementVO> searcheck(String orderStat) {
		
		return mapper.getcheck(orderStat);
	}


	@Override
	public List<ManagementVO> searcheckAll(ItemCriteria cri) {

		return mapper.getcheckAll(cri);
	}


	@Override
	public List<ManagementVO> Shippingdate(ManagementVO vo) {
		// TODO Auto-generated method stub
		return mapper.datedate(vo);
	}


	@Override
	public List<ManagementVO> refundList(ItemCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.refundListPaging(cri);
	}
	
	
	@Override
	@Transactional
    public void refundupdate(ManagementVO vo) {
		
		mapper.refundinsertSelectKey(vo);
		mapper.refundupdate(vo);
		
	}


	@Override
	public List<Integer> ListCount() {
		// TODO Auto-generated method stub
		return mapper.getListCount();
	}


	@Override
	public int getRefundTotal(ItemCriteria cri) {
		// TODO Auto-generated method stub
		return  mapper.RefundTotal(cri);
	}

}
