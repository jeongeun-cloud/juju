package com.jujumarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.domain.RegisterItemVO;
import com.jujumarket.mapper.RegisterItemMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RegisterServiceImpl implements RegisterItemService {
	
	@Setter(onMethod_ = @Autowired)
	private RegisterItemMapper mapper;

	@Override
	public void register(RegisterItemVO register) {
		log.info("register......" + register);
		
		mapper.insertSelectKey(register);
		
	}

	@Override
	public List<RegisterItemVO> getList() {
		log.info("getList.....");
		return mapper.getList();
	}
	
	@Override
	public RegisterItemVO get(String itemCode) {
		log.info("get......" + itemCode);
		return mapper.read(itemCode);
	}

	@Override
	public boolean modify(RegisterItemVO register) {
		log.info("modify........" + register);
		return mapper.update(register) == 1;
	}

	@Override
	public boolean remove(String itemCode) {
		log.info("remove......" + itemCode);
		return mapper.delete(itemCode) == 1;
	}

}
