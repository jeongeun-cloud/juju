package com.jujumarket.board.service;

import java.util.List;

import com.jujumarket.board.domain.Board_FAQVO;
import com.jujumarket.board.domain.Criteria;


public interface Board_FAQService {
	
	public void register(Board_FAQVO faq);
		
	public Board_FAQVO get(String postingNo);

	public boolean modify(Board_FAQVO faq);
	
	public boolean remove(String postingNo);
	
	//public List<Board_FAQVO> getList();	// 구분 없이 전체 
	
	public List<Board_FAQVO> getList(Criteria cri);
	
	public List<Board_FAQVO> noticegetList(Criteria cri);

	public int getTotal(Criteria cri);
	
	public List<Board_FAQVO> faq();	// 자주 묻는 질문
	
	public List<Board_FAQVO> notice();	// 공지사항
	
	
	
   

	
	
}
