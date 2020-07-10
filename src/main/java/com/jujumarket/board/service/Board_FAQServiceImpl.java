package com.jujumarket.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.board.domain.Board_FAQVO;
import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.mapper.Board_FAQMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class Board_FAQServiceImpl implements Board_FAQService {

	@Setter(onMethod_ = @Autowired)
	private Board_FAQMapper mapper;

	@Override
	public void register(Board_FAQVO faq) {

		log.info("regisert......" + faq);

		mapper.insertSelectKey(faq);

	}

	@Override
	public Board_FAQVO get(String postingNo) {

		log.info("get......" + postingNo);
		return mapper.read(postingNo);
	}

	@Override
	public boolean modify(Board_FAQVO faq) {

		log.info("modify...." + faq);
		return mapper.update(faq) == 1;
	}

	@Override
	public boolean remove(String postingNo) {

		log.info("modify...." + postingNo);
		return mapper.delete(postingNo) == 1;
	}

	
	/*
	 * @Override public List<Board_FAQVO> getList() {
	 * 
	 * log.info("getList.........:");
	 * 
	 * return mapper.getList(); }
	 */

	@Override
	public List<Board_FAQVO> faq() {

		log.info("get FAQ......");
		return mapper.faq();
	}

	@Override
	public List<Board_FAQVO> notice() {

		log.info("get notice....");
		return mapper.notice();
	}

	@Override
	public List<Board_FAQVO> getList(Criteria cri) {

		log.info("get List with criteria :" + cri);

		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public List<Board_FAQVO> noticegetList(Criteria cri) {

		log.info("get List with criteria :" + cri);

		return mapper.noticegetListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}



}
