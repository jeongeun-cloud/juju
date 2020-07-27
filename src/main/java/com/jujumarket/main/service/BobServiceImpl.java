package com.jujumarket.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.main.domain.BoardItemVO;
import com.jujumarket.main.mapper.BobMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BobServiceImpl implements BobService {
	
	   @Setter(onMethod_ = @Autowired)
	   private BobMapper mapper;

	
	@Override
	public List<BoardItemVO> wholebest() {
		log.info("bobserive 하는중");
		return mapper.wholebest();
	}
	
	@Override
	public List<BoardItemVO> reviewbest() {
		
		return mapper.reviewbest();
	}

}
