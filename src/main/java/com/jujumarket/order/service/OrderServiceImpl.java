package com.jujumarket.order.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jujumarket.main.domain.BasketVO;
import com.jujumarket.order.domain.OrderInfoVO;
import com.jujumarket.order.domain.OrderMemberVO;
import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.domain.OrderResponseVO;
import com.jujumarket.order.domain.OrderVO;
import com.jujumarket.order.domain.PaymentVO;
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
   public void register(OrderRequestVO order) {
      log.info("register1......");
      // t_order 에 넣는 부분 (선택 주문 해도 이 부분은 문제 없음) 
      orderMapper.insert(order);
      
      
      
      // 선택 주문 이라는 기능 때문에 이 아래는 못쓸 것 같다..아니면 baskIdArr 를 아예 여기로 넘겨줘서?? 
      //List<OrderResponseVO> itemList = orderMapper.orderResponse(order.getIdNo());

      //log.info("크기: " + itemList.size());
     // Long totalSum = 0L;
      //Long totalDiscount = 0L;
      // itemList.size() = i
      //t_order에는 1개, t_order_info, t_order_history, t_delivery에는 i개의 row를 insert
      //for (int i = 0; i < itemList.size(); i++) {
//         OrderResponseVO item = itemList.get(i);
//         order.setItemCode(item.getItemCode());
//         order.setBaskId(item.getBaskId());
//         order.setItemNum(item.getItemNum());
//         order.setDisAmount(item.getNormPrice() - item.getPrice());
//         order.setTotalPrice(item.getPrice() * item.getItemNum());
//         orderInfoMapper.insertSelectKey(order);
//         orderHistoryMapper.insertSelectKey(order);
//         // t_delivery에 OrderRequestVO에서 받아온 정보들을 insertSelectKey()로 register()
//         deliveryMapper.insertSelectKey(order);

//         totalSum += item.getNormPrice() * item.getItemNum();
//         totalDiscount += (item.getNormPrice() - item.getPrice()) * item.getItemNum();
//      }
//      order.setTotalSum(totalSum);
//      order.setTotalDiscount(totalDiscount);
//      order.setTotalPay(totalSum - totalDiscount);
//      return order.getOrderCode();
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

   @Override
   public String getRecentOrderCode(String idNo) {
      return orderMapper.getRecentOrderCode(idNo);
   }

   @Override
   public List<OrderResponseVO> showOrderList(String orderCode) {
      return orderMapper.showOrderList(orderCode);
   }

   @Override
   public BasketVO getOne(String baskId) {
      return orderMapper.getone(baskId);
   }

	@Override
	public void orderInfoRegister(OrderInfoVO orderInfo) {
		orderInfoMapper.insert(orderInfo);
	}

	@Override
	public OrderInfoVO getMakeInfoAndHistory(String baskId) {
		return orderInfoMapper.makeInfoAndHistory(baskId);
	}
	
	@Override
	public void orderHistoryRegister(OrderInfoVO orderInfo) {
		orderHistoryMapper.insert(orderInfo);
	}

	@Override
	public void paymentRegister(PaymentVO payment) {
		orderMapper.paymentRegister(payment);
	}

	@Override
	public void guestInsert(OrderMemberVO orderMember) {
		orderMapper.guestMemberInsert(orderMember);
		orderMapper.guestCustomerInsert(orderMember);
		
	}
	
	@Override
	public OrderVO readByIdno(String idNo) {
		return orderMapper.readByIdno(idNo);
		
	}

	@Override
	public void socialMemUpdate(OrderMemberVO orderMember) {
		orderMapper.socialMemUpdateM(orderMember);
		orderMapper.mSocialUpdate(orderMember);
	}
	

}