package com.jujumarket.main.mapper;

import java.util.List;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> getList(String itemCode);
	
	public List<ReviewVO> getListWithPaging(Criteria cri, String itemCode);
	
	public int insert(ReviewVO register);
	
	public int insertSelectKey(ReviewVO register);
	
	public ReviewVO read(String reviewNo);
	
	public int delete(String reviewNo);
	
	public int update(ReviewVO register);
	
//	public int getTotalCount(Criteria cri);

}
