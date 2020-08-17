package com.jujumarket.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.member.domain.DangolVO;
import com.jujumarket.member.domain.MyPageVO;
import com.jujumarket.member.domain.MyPerchaseVO;

public interface MyPageMapper {

	public List<MyPageVO> getMyReviewListByIdNo(@Param("idNo") String idNo, @Param("cri") Criteria cri);

	public int getMyReviewCountByIdNo(@Param("idNo") String idNo, @Param("cri") Criteria cri);

	public List<MyPageVO> getMyPrdReplyListByIdNo(@Param("idNo") String idNo, @Param("cri") Criteria cri);

	public int getMyPrdReplyCountByIdNo(@Param("idNo") String idNo, @Param("cri") Criteria cri);

	public List<MyPerchaseVO> getMyPerchaseListByIdNo(@Param("idNo")String idNo,@Param("cri") Criteria cri);

	public int getMyPerchaseCountByIdNo(@Param("idNo") String idNo, @Param("cri") Criteria cri);

	//나의 단골가게 보기
	public List<DangolVO> getMyDangol(String memidNo);

	public List<MyPerchaseVO> getGuestPurchaseListByOrderCode(String orderCode);
}
