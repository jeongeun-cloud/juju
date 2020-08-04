package com.jujumarket.main.service;

import java.util.List;

import com.jujumarket.main.domain.ReviewVO;
import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.ReviewPageDTO;

public interface ReviewService {
	
	public int register(ReviewVO register);
	
	public ReviewVO get(String reviewNo);
	
	public int modify(ReviewVO register);
	
	public int remove(String reviewNo);
	
	public List<ReviewVO> getList(String itemCode);
	
	public ReviewPageDTO getListPage(Criteria cri, String itemCode);
	
	public List<ReviewVO> mainReview();
	
	public List<OrderRequestVO> getOrderStat(String idNo);
	
//	public int getTotal(Criteria cri);

}
