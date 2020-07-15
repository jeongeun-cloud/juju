package com.jujumarket.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jujumarket.board.domain.Criteria;
import com.jujumarket.board.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(String postingNo);

	public int delete(String replyNo);
	
	public int update(ReplyVO reply);

	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("postingNo") String postingNo);

}
