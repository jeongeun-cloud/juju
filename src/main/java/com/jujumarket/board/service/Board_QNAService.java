package com.jujumarket.board.service;

import java.util.List;

import com.jujumarket.board.domain.Board_QNAVO;
import com.jujumarket.board.domain.Criteria;

public interface Board_QNAService {
	
	public void register(Board_QNAVO qna);
		
	public Board_QNAVO get(String postingNo);

	public boolean modify(Board_QNAVO qna);
	
	public boolean remove(String postingNo);
	

	public List<Board_QNAVO> qna();
	
	public List<Board_QNAVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

	public List<Board_QNAVO> getList();
	

	
	
}