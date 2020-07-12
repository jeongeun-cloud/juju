package com.jujumarket.main.service;

import java.util.List;

import com.jujumarket.main.domain.Board_ItemVO;
import com.jujumarket.main.domain.CategoryVO;
import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.SortVO;

public interface BoardService {
	
	
	public List<Board_ItemVO> gets(String classCode);
	
	public List<CategoryVO> category();
	
	public List<Board_ItemVO> getList(Criteria cri);
	
	 public List<Board_ItemVO> listSort(SortVO sort); 
	

	
	
	
}
