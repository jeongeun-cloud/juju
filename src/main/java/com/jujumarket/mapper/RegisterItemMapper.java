package com.jujumarket.mapper;

import java.util.List;


import com.jujumarket.domain.RegisterItemVO;

public interface RegisterItemMapper {
	
	public List<RegisterItemVO> getList();
	
	public void insert(RegisterItemVO register);
	
	public void insertSelectKey(RegisterItemVO register);
	
	public RegisterItemVO read(String itemCode);
	
	public int delete(String itemCode);
	
	public int update(RegisterItemVO register);
}
