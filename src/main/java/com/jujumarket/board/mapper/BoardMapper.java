package com.jujumarket.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.jujumarket.board.domain.BoardVO;


public interface BoardMapper {
	
	@Select("select * from T_BOARD ")
	public List<BoardVO> getList();

}
