package com.jujumarket.service;

import java.util.List;

import com.jujumarket.domain.RegisterItemVO;

public interface RegisterItemService {

	public void register(RegisterItemVO register);
	
	public RegisterItemVO get(String itemCode);
	
	public boolean modify(RegisterItemVO register);
	
	public boolean remove(String itemCode);
	
	public List<RegisterItemVO> getList();
}
