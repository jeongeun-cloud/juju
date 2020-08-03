package com.jujumarket.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.member.domain.MyPageVO;

public interface MyPageMapper {

	public List<MyPageVO> getMyReviewListByIdNo(@Param("idNo") String idNo, @Param("cri") Criteria cri);

	public int getMyReviewCountByIdNo(@Param("idNo") String idNo, @Param("cri") Criteria cri);

	public List<MyPageVO> getMyPrdReplyListByIdNo(@Param("idNo") String idNo, @Param("cri") Criteria cri);

	public int getMyPrdReplyCountByIdNo(@Param("idNo") String idNo, @Param("cri") Criteria cri);


}
