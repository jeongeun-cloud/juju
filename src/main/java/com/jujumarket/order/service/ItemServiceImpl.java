package com.jujumarket.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.order.domain.ItemVO;
import com.jujumarket.order.mapper.ItemMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ItemServiceImpl implements ItemService{
	
	@Setter(onMethod_ = @Autowired)
	private ItemMapper mapper;

	@Override
	public void register(ItemVO item) {
		log.info("register....." + item);
		mapper.insertSelectKey(item);
		
	}

	@Override
	public ItemVO get(String itemCode) {
		log.info("get......" + itemCode);
		return mapper.read(itemCode);
	}

	@Override
	public boolean modify(ItemVO item) {
		log.info("modify......" + item);
		return mapper.update(item) == 1;
	}

	@Override
	public boolean remove(String itemCode) {
		log.info("remove....." + itemCode);
		return mapper.delete(itemCode) == 1;
	}

	@Override
	public List<ItemVO> getList() {
		log.info("getList..........");
		return mapper.getList();
	}
	
	

}
