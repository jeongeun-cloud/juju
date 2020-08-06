package com.jujumarket.admin.service;

import java.util.List;

import com.jujumarket.admin.domain.QnaVO;
import com.jujumarket.shop.domain.ItemCriteria;

public interface QnaListService {
	
	public List<QnaVO> getQnaList(ItemCriteria cri);
	
	public int QnalistTotal(ItemCriteria cri);

}
