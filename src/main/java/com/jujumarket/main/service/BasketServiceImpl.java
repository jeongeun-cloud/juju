package com.jujumarket.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.main.domain.BasketVO;
import com.jujumarket.main.mapper.BasketMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class BasketServiceImpl implements BasketService {
	
	@Setter(onMethod_ = @Autowired)
	private BasketMapper mapper;

	@Override
	public void register(BasketVO basket) {
		log.info("register...." + basket);
		mapper.insertSelectKey(basket);
		
	}

	@Override
	public BasketVO get(String idNo) {
		log.info("get......" + idNo);
		return mapper.read(idNo);
	}

	@Override
	public boolean modify(BasketVO basket) {
		log.info("modify......" + basket);
		return mapper.update(basket) == 1;
	}

	@Override
	public boolean remove(String baskId) {
		log.info("remove......." + baskId);
		return mapper.delete(baskId) == 1;
	}

	@Override
	public List<BasketVO> getList(String id) {
		log.info("getList.........");
		return mapper.getList(id);
	}

	@Override
	public String makeGuestId() {
		return mapper.makeGuestId();
	}

	@Override
	public Integer getBasketTotal(String id) {
		return mapper.getBasketTotal(id);
	}
	
	

}




