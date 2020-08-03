package com.jujumarket.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.board.domain.BoardFAQVO;
import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.mapper.BoardFAQMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardFAQServiceImpl implements BoardFAQService {

	@Setter(onMethod_ = @Autowired)
	private BoardFAQMapper mapper;

	@Override
	public void register(BoardFAQVO faq) {

		log.info("regisert......" + faq);

		mapper.insertSelectKey(faq);

	}

	@Override
	public BoardFAQVO get(String postingNo) {

		log.info("get......" + postingNo);
		return mapper.read(postingNo);
	}

	@Override
	public boolean modify(BoardFAQVO faq) {

		log.info("modify...." + faq);
		return mapper.update(faq) == 1;
	}

	@Override
	public boolean remove(String postingNo) {

		log.info("modify...." + postingNo);
		return mapper.delete(postingNo) == 1;
	}


	@Override
	public List<BoardFAQVO> faq() {

		log.info("get FAQ......");
		return mapper.faq();
	}

	@Override
	public List<BoardFAQVO> notice() {

		log.info("get notice....");
		return mapper.notice();
	}

	@Override
	public List<BoardFAQVO> getList(Criteria cri) {

		log.info("get List with criteria :" + cri);

		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public List<BoardFAQVO> noticegetList(Criteria cri) {

		log.info("get List with criteria :" + cri);

		return mapper.noticegetListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public int getnoticeTotal(Criteria cri) {
		
		
		log.info("get total count");
		return mapper.getnoticeTotalCount(cri);
	}
	//관리자,상인 페이지의  공지사항 끌고 오기 
	@Override
	public List<BoardFAQVO> getnotice() {
		return mapper.getnotice();
	}

	@Override
	public List<BoardFAQVO> getfaq() {
		return mapper.getfaq();
	}
}
