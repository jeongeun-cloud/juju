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
	
//	이거 4개 추가함~
	public List<BoardQNAVO> getListByIdNo(String idNo);
	
	public List<BoardQNAVO> getListWithPagingByIdNo(Criteria cri, String idNo);

	public int getResultTotalByIdNo(Criteria cri, String idNo);

	public String getIdNoByPostingNo(String postingNo);

	public List<BoardQNAVO> getMyQnAListByIdNo(String idNo, Criteria cri);

	public int getMyQnACountByIdNo(String idNo, Criteria cri);

	
	
	
		

	
	
}