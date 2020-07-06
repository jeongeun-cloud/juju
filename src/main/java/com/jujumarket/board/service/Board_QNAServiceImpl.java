package com.jujumarket.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.board.domain.Board_QNAVO;
import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.mapper.Board_QNAMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class Board_QNAServiceImpl implements Board_QNAService {

	@Setter(onMethod_ = @Autowired)
	private Board_QNAMapper mapper;
	
	@Override
	public void register(Board_QNAVO qna) {

		log.info("regisert......" + qna);

		mapper.insertSelectKey(qna);

	}

	@Override
	public Board_QNAVO get(String postingNo) {

		log.info("get......" + postingNo);
		return mapper.read(postingNo);
	}

	@Override
	public boolean modify(Board_QNAVO qna) {

		log.info("modify...." + qna);
		return mapper.update(qna) == 1;
	}

	@Override
	public boolean remove(String postingNo) {

		log.info("modify...." + postingNo);
		return mapper.delete(postingNo) == 1;
	}




	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<Board_QNAVO> getList(Criteria cri) {
		log.info("get List with criteria :" + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<Board_QNAVO> qna() {
		
		log.info("get FAQ......");
		
		return mapper.qna();
	}

	@Override
	public List<Board_QNAVO> getList() {
         log.info("get FAQ......");
		
		return mapper.qna();
	}

	
	}
	
	
