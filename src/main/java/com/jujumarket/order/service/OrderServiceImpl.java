package com.jujumarket.order.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.domain.OrderResponseVO;
import com.jujumarket.order.domain.OrderVO;
import com.jujumarket.order.mapper.DeliveryMapper;
import com.jujumarket.order.mapper.OrderHistoryMapper;
import com.jujumarket.order.mapper.OrderInfoMapper;
import com.jujumarket.order.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {

	private OrderMapper orderMapper;
	private OrderInfoMapper orderInfoMapper;
	private OrderHistoryMapper orderHistoryMapper;
	private DeliveryMapper deliveryMapper;

	@Transactional
	@Override
	public String register(OrderRequestVO order) {
		log.info("register1......");
		orderMapper.insertSelectKey(order);
		List<OrderResponseVO> itemList = orderMapper.orderResponse(order.getIdNo());

		log.info("크기: " + itemList.size());
		Long totalSum = 0L;
		Long totalDiscount = 0L;
		// itemList.size()가 i개일때, t_order에는 1개의 row, t_order_info, t_order_history에는
		// i개의 row가 인서트됨. 반복문 사용으로 insert되도록 작성해야 함 .
		for (int i = 0; i < itemList.size(); i++) {
			OrderResponseVO item = itemList.get(i);
			order.setItemCode(item.getItemCode());
			order.setItemNum(item.getItemNum());
			order.setDisAmount(item.getNormPrice() - item.getPrice());
			orderInfoMapper.insertSelectKey(order);
			orderHistoryMapper.insertSelectKey(order);
			// t_delivery에 OrderRequestVO에서 받아온 정보들을 insertSelectKey()로 register()
			deliveryMapper.insertSelectKey(order);

			totalSum += item.getNormPrice() * item.getItemNum();
			totalDiscount += (item.getNormPrice() - item.getPrice()) * item.getItemNum();
		}
		order.setTotalSum(totalSum);
		order.setTotalDiscount(totalDiscount);
		order.setTotalPay(totalSum - totalDiscount);
		return order.getOrderCode();
	}

	@Override
	public OrderVO get(String orderCode) {
		log.info("get......." + orderCode);
		return orderMapper.read(orderCode);
	}

	@Override
	public boolean modify(OrderVO order) {
		log.info("modify....." + order);
		return orderMapper.update(order) == 1;
	}

	@Override
	public boolean remove(String orderCode) {
		log.info("remove......." + orderCode);
		return orderMapper.delete(orderCode) == 1;
	}

	@Override
	public List<OrderVO> getList() {
		log.info("getList..........");
		return orderMapper.getList();
	}

	@Override
	public List<OrderResponseVO> getOrderResponse(String idNo) {
		log.info("getList..........");
		return orderMapper.orderResponse(idNo);
	}

//	@Override
//	public String getRecentOrderCode(String idNo) {
//		return orderMapper.getRecentOrderCode(idNo);
//	}

}
