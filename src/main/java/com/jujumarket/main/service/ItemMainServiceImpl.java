package com.jujumarket.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.main.domain.ItemMainVO;
import com.jujumarket.main.mapper.ItemMainMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ItemMainServiceImpl implements ItemMainService{
	
	@Setter(onMethod_ = @Autowired)
	private ItemMainMapper mapper;

	@Override
	public void register(ItemMainVO item) {
		log.info("register....." + item);
		mapper.insertSelectKey(item);
		
	}

	@Override
	public ItemMainVO get(String itemCode) {
		log.info("get......" + itemCode);
		return mapper.get(itemCode);
	}

	@Override
	public boolean modify(ItemMainVO item) {
		log.info("modify......" + item);
		return mapper.update(item) == 1;
	}

	@Override
	public boolean remove(String itemCode) {
		log.info("remove....." + itemCode);
		return mapper.delete(itemCode) == 1;
	}

	@Override
	public List<ItemMainVO> getList() {
		log.info("getList..........");
		return mapper.getList();
	}

	@Override
	public String getShop(String itemCode) {
		log.info("getShop..........");
		
		return mapper.getShop(itemCode);
	}

}
