package com.jujumarket.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.ReviewVO;
import com.jujumarket.order.domain.OrderRequestVO;

public interface ReviewMapper {
	
	public List<ReviewVO> getList(String itemCode);
	
	public List<ReviewVO> getListWithPaging(@Param("cri") Criteria cri, @Param("itemCode") String itemCode);
	
	public int insert(ReviewVO register);
	
	public int insertSelectKey(ReviewVO register);
	
	public ReviewVO read(String reviewNo);
	
	public int delete(String reviewNo);
	
	public int update(ReviewVO register);
	
	public int getCountByItemCode(String itemCode);
	
	public List<ReviewVO> getMainReview();
	
	public List<OrderRequestVO> getOrderStat(String idNo);

}
