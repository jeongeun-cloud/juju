package com.jujumarket.board.mapper;

import java.util.List;

import com.jujumarket.board.domain.BoardQNAVO;
import com.jujumarket.board.domain.Criteria;


public interface BoardQNAMapper {

	//@Select("select * from T_Board_QNA ")
	public List<BoardQNAVO> getList();
	
	public List<BoardQNAVO> getList(Criteria cri);
	
	public List<BoardQNAVO> getListWithPaging(Criteria cri);
	
	public List<BoardQNAVO> getResultListhPaging(Criteria cri);
	
	public List<BoardQNAVO> qna();
	
	public void insert(BoardQNAVO qna);
	
	public void insertSelectKey(BoardQNAVO qna);
		
	public BoardQNAVO read(String postingNo);
	
	public int delete(String postingNo);
	
	public int update(BoardQNAVO qna);
	

	public int getTotalCount(Criteria cri);
	
	public int getResultTotal(Criteria cri);


}
