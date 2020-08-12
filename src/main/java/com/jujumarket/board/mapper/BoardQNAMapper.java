package com.jujumarket.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jujumarket.board.domain.BoardQNAVO;
import com.jujumarket.board.domain.Criteria;


public interface BoardQNAMapper {

	//@Select("select * from T_Board_QNA ")
	public List<BoardQNAVO> getList();
	
	public List<BoardQNAVO> getList(Criteria cri);
	
	public List<BoardQNAVO> getListWithPaging(Criteria cri);
	
	public List<BoardQNAVO> getResultListhPaging(Criteria cri);
	
	public List<BoardQNAVO> qna();
	
	public void insert(BoardQNAVO qna);
	
	public void insertSelectKey(BoardQNAVO qna);
		
	public BoardQNAVO read(String postingNo);
	
	public int delete(String postingNo);
	
	public int update(BoardQNAVO qna);
	

	public int getTotalCount(Criteria cri);
	
	public int getResultTotal(Criteria cri);
	
//	이거 4개 추가함~
	
	public List<BoardQNAVO> getListByIdNo(String idNo);
	
	public List<BoardQNAVO> getListWithPagingByIdNo(Criteria cri, String idNo);

	public int getResultTotalByIdNo(Criteria cri, String idNo);

	public String getIdNoByPostingNo(String postingNo);

	public List<BoardQNAVO> getMyQnAListByIdNo(@Param("idNo") String idNo,@Param("cri") Criteria cri);

	public int getMyQnACountByIdNo(@Param("idNo") String idNo,@Param("cri") Criteria cri);

}
