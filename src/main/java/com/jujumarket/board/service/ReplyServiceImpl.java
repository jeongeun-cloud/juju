package com.jujumarket.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.domain.ReplyVO;
import com.jujumarket.board.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= {@Autowired})
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		
		log.info("register........." + vo);
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(String postingNo) {
		
		log.info("get........." + postingNo);
		
		return mapper.read(postingNo);
	}

	@Override
	public int modify(ReplyVO vo) {
		
		log.info("modify......" + vo);
		
		return mapper.update(vo);
	}

	@Override
	public int remove(String replyNo) {
		
		log.info("remove......." + replyNo);
	
		return mapper.delete(replyNo);
	
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, String postingNo) {
	
		log.info("get Reply List of a getList" + postingNo);
		
	
	    
	return	mapper.getListWithPaging(cri, postingNo);
		
	}
}
