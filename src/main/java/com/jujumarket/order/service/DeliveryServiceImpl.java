package com.jujumarket.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jujumarket.order.domain.DeliveryVO;
import com.jujumarket.order.mapper.DeliveryMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DeliveryServiceImpl implements DeliverySerivce{
	
	private DeliveryMapper deliveryMapper;

	@Override
	public DeliveryVO get(String orderCode) {
		List<DeliveryVO> deliveryList = deliveryMapper.readByOrderCode(orderCode);
		return deliveryList.get(0) ;
		
	}

	@Override
	public void register(DeliveryVO delivery) {
		deliveryMapper.insertSelectKey(delivery);
	}

}