package com.jujumarket.board.service;

import java.util.List;

import com.jujumarket.board.domain.BoardQNAVO;
import com.jujumarket.board.domain.Criteria;

public interface BoardQNAService {
	
	public void register(BoardQNAVO qna);
		
	public BoardQNAVO get(String postingNo);

	public boolean modify(BoardQNAVO qna);
	
	public boolean remove(String postingNo);
	
	public int getTotal(Criteria cri);


	public List<BoardQNAVO> qna();
	
	public List<BoardQNAVO> getList(Criteria cri);
	
	public int getResultTotal(Criteria cri);
	
	
	
		

	
	
}