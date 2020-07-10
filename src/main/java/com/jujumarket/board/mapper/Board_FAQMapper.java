package com.jujumarket.board.mapper;


import java.util.List;

import com.jujumarket.board.domain.Board_FAQVO;
import com.jujumarket.board.domain.Criteria;


public interface Board_FAQMapper {

	//@Select("select * from T_Board_FAQ ")
	public List<Board_FAQVO> getList(Criteria cri);
	
	public List<Board_FAQVO> getListWithPaging(Criteria cri);
	
	public List<Board_FAQVO> noticegetListWithPaging(Criteria cri);
	
	public void insert(Board_FAQVO faq);
	
	public void insertSelectKey(Board_FAQVO faq);
	
	public Board_FAQVO read(String postingNo);
	
	public int delete(String postingNo);
	
	public int update(Board_FAQVO faq);
	
	public List<Board_FAQVO> faq();
	
	public List<Board_FAQVO> notice();
	
	public int getTotalCount(Criteria cri);
	
	
	
}
