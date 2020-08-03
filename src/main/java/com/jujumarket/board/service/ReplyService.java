package com.jujumarket.board.service;

import java.util.List;

import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public ReplyVO get(String postingNo);
	
	public int modify(ReplyVO vo);
	
	public int remove(String replyNo);
	
	public List<ReplyVO> getList(Criteria cri, String postingNo);
	

}