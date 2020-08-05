package com.jujumarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.admin.domain.QnaVO;
import com.jujumarket.admin.mapper.QnaListMapper;
import com.jujumarket.shop.domain.ItemCriteria;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaListServiceImpl implements QnaListService {
	
	
	@Setter(onMethod_ = @Autowired)
	private QnaListMapper mapper;
	@Override
	public List<QnaVO> getQnaList(ItemCriteria cri) {
		return mapper.getQnaList(cri);
	}
	
	@Override
	public int QnalistTotal(ItemCriteria cri) {
		return mapper.QnalistTotal(cri);
	}

}
