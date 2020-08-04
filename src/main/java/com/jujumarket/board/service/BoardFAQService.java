package com.jujumarket.board.service;

import java.util.List;

import com.jujumarket.board.domain.BoardFAQVO;
import com.jujumarket.board.domain.Criteria;


public interface BoardFAQService {
	
	public void register(BoardFAQVO faq);
		
	public BoardFAQVO get(String postingNo);

	public boolean modify(BoardFAQVO faq);
	
	public boolean remove(String postingNo);
	
	//public List<Board_FAQVO> getList();	// 구분 없이 전체 
	
	public List<BoardFAQVO> getList(Criteria cri);
	
	public List<BoardFAQVO> noticegetList(Criteria cri);

	public int getTotal(Criteria cri);
	
	
	public int getnoticeTotal(Criteria cri);
	
	
	public List<BoardFAQVO> faq();	// 자주 묻는 질문
	
	public List<BoardFAQVO> notice();	// 공지사항
	
	
	//관리자,상인 페이지의  공지사항 끌고 오기 

	public List<BoardFAQVO> getnotice();
	
	public List<BoardFAQVO> getfaq();
	
	
	
   

	
	
}
