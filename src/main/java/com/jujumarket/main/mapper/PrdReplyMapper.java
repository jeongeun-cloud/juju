package com.jujumarket.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.PrdReplyVO;



public interface PrdReplyMapper {

	public int insert(PrdReplyVO vo);

	public int insert2(PrdReplyVO vo);
	
	public PrdReplyVO read(String itemCode);

	public int delete(int replyNo);
	
	public int update(PrdReplyVO reply);

	public List<PrdReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("itemCode") String itemCode);
	
	public int getCountByitemCode(String itemCode);
	
}
