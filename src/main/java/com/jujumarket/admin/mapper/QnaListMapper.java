package com.jujumarket.admin.mapper;

import java.util.List;

import com.jujumarket.admin.domain.QnaVO;
import com.jujumarket.shop.domain.ItemCriteria;

public interface QnaListMapper {
	
	public List<QnaVO> getQnaList(ItemCriteria cri);

	public int QnalistTotal(ItemCriteria cri);

}
