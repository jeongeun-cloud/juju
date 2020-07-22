package com.jujumarket.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.main.domain.BoardItemVO;
import com.jujumarket.main.mapper.MainIndexMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MainIndexServiceImpl implements MainIndexService {
	
	 @Setter(onMethod_ = @Autowired)
	private MainIndexMapper mapper;
	
	@Override
	public List<BoardItemVO> RealNew() {
		
		return mapper.RealNew();
	}

}
