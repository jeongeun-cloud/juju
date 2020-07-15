package com.jujumarket.board.mapper;


import java.util.List;

import com.jujumarket.board.domain.BoardFAQVO;
import com.jujumarket.board.domain.Criteria;


public interface BoardFAQMapper {

	//@Select("select * from T_Board_FAQ ")
	public List<BoardFAQVO> getList(Criteria cri);
	
	public List<BoardFAQVO> getListWithPaging(Criteria cri);
	
	public List<BoardFAQVO> noticegetListWithPaging(Criteria cri);
	
	public void insert(BoardFAQVO faq);
	
	public void insertSelectKey(BoardFAQVO faq);
	
	public BoardFAQVO read(String postingNo);
	
	public int delete(String postingNo);
	
	public int update(BoardFAQVO faq);
	
	public List<BoardFAQVO> faq();
	
	public List<BoardFAQVO> notice();
	
	public int getTotalCount(Criteria cri);

	public int getnoticeTotalCount(Criteria cri);
	
	
	
}
