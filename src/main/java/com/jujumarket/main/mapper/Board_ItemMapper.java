package com.jujumarket.main.mapper;

	import java.util.List;

import com.jujumarket.main.domain.Board_ItemVO;
import com.jujumarket.main.domain.CategoryVO;
import com.jujumarket.main.domain.Criteria;


public interface Board_ItemMapper {
	
	public List<Board_ItemVO> listSort(String order);
	
	public List<Board_ItemVO> getListWithPaging(Criteria cri);
	
	public List<Board_ItemVO> gets(String classCode);

	public List<CategoryVO> category();
	
	public List<Board_ItemVO> lowPrice(String order);
	
	public List<Board_ItemVO> highPrice(String order); 
	
	public List<Board_ItemVO> bestProduct(String order);	
	
	public List<Board_ItemVO> newProduct(String order);	
		
	}



