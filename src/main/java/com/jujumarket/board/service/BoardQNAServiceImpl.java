package com.jujumarket.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.board.domain.BoardQNAVO;
import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.mapper.BoardQNAMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardQNAServiceImpl implements BoardQNAService {

	@Setter(onMethod_ = @Autowired)
	private BoardQNAMapper mapper;

	@Override
	public void register(BoardQNAVO qna) {

		log.info("regisert......" + qna);

		mapper.insertSelectKey(qna);

	}

	@Override
	public BoardQNAVO get(String postingNo) {

		log.info("get......" + postingNo);
		return mapper.read(postingNo);
	}

	@Override
	public boolean modify(BoardQNAVO qna) {

		log.info("modify...." + qna);
		return mapper.update(qna) == 1;
	}

	@Override
	public boolean remove(String postingNo) {

		log.info("modify...." + postingNo);
		return mapper.delete(postingNo) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardQNAVO> getList(Criteria cri) {
		log.info("get List with criteria :" + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<BoardQNAVO> qna() {

		log.info("get FAQ......");

		return mapper.qna();
	}

	@Override
	public int getResultTotal(Criteria cri) {
		return mapper.getResultTotal(cri);
	}

//	이거 3개 추가함~
	@Override
	public List<BoardQNAVO> getListByIdNo(String idNo) {
		return mapper.getListByIdNo(idNo);
	}

	@Override
	public List<BoardQNAVO> getListWithPagingByIdNo(Criteria cri, String idNo) {
		return mapper.getListWithPagingByIdNo(cri, idNo);
	}

	@Override
	public int getResultTotalByIdNo(Criteria cri, String idNo) {
		return mapper.getResultTotalByIdNo(cri, idNo);

	}

	@Override
	public String getIdNoByPostingNo(String postingNo) {
		return mapper.getIdNoByPostingNo(postingNo);
	}

	@Override
	public List<BoardQNAVO> getMyQnAListByIdNo(String idNo, Criteria cri) {
		return mapper.getMyQnAListByIdNo(idNo, cri);
	}

	@Override
	public int getMyQnACountByIdNo(String idNo, Criteria cri) {
		return mapper.getMyQnACountByIdNo(idNo, cri);
	}

}
