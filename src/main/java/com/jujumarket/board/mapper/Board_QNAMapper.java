package com.jujumarket.board.mapper;

import java.util.List;

import com.jujumarket.board.domain.Board_FAQVO;
import com.jujumarket.board.domain.Board_QNAVO;
import com.jujumarket.board.domain.Criteria;


public interface Board_QNAMapper {

	//@Select("select * from T_Board_QNA ")
	public List<Board_QNAVO> getList();
	
	public List<Board_QNAVO> getList(Criteria cri);
	
	public List<Board_QNAVO> getListWithPaging(Criteria cri);
	
	public List<Board_QNAVO> qna();
	
	public void insert(Board_QNAVO qna);
	
	public void insertSelectKey(Board_QNAVO qna);
		
	public Board_QNAVO read(String postingNo);
	
	public int delete(String postingNo);
	
	public int update(Board_QNAVO qna);
	
	public void insert(Board_FAQVO faq);
	
	public void insertSelectKey(Board_FAQVO faq);

	public int getTotalCount(Criteria cri);


}
