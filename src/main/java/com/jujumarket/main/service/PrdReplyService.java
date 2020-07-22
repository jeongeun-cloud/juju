package com.jujumarket.main.service;

import java.util.List;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.PrdReplyPageDTO;
import com.jujumarket.main.domain.PrdReplyVO;


public interface PrdReplyService {

	public int register(PrdReplyVO vo);
	
	public int replyRgister(PrdReplyVO vo);
	
	public PrdReplyVO get(String itemCode);
	
	public int modify(PrdReplyVO vo);
	
	public int remove(int replyNo);
	
	public List<PrdReplyVO> getList(Criteria cri, String itemCode);
	
	public PrdReplyPageDTO getPrdReplyListPage(Criteria cri, String itemCode);
	
}
