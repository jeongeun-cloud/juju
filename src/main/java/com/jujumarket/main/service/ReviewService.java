package com.jujumarket.main.service;

import java.util.List;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.ReviewVO;

public interface ReviewService {
	
	public int register(ReviewVO register);
	
	public ReviewVO get(String reviewNo);
	
	public int modify(ReviewVO register);
	
	public int remove(String reviewNo);
	
	public List<ReviewVO> getList(String itemCode);
	
	public List<ReviewVO> getListWithPaging(Criteria cri, String itemCode);
	
//	public int getTotal(Criteria cri);

}
