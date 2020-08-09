package com.jujumarket.order.service;

import java.util.List;

import com.jujumarket.main.domain.BasketVO;
import com.jujumarket.order.domain.OrderInfoVO;
import com.jujumarket.order.domain.OrderMemberVO;
import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.domain.OrderResponseVO;
import com.jujumarket.order.domain.OrderVO;
import com.jujumarket.order.domain.PaymentVO;

public interface OrderService {
   
   
   public void register(OrderRequestVO order);
   
   public OrderVO get(String orderCode);
   
   public boolean modify(OrderVO order);
   
   public boolean remove(String orderCode);
   
   public List<OrderVO> getList();

   public List<OrderResponseVO> getOrderResponse(String idNo);

   public List<OrderResponseVO> showOrderList(String orderCode);
   
   public String getRecentOrderCode(String idNo);
   
   public BasketVO getOne(String baskId);
   
   public void orderInfoRegister(OrderInfoVO orderInfo);
   
   public OrderInfoVO getMakeInfoAndHistory(String baskId);
   
   public void orderHistoryRegister(OrderInfoVO orderInfo);

   public void paymentRegister(PaymentVO payment);

   public void guestInsert(OrderMemberVO orderMember);

   public OrderVO readByIdno(String idNo);

   public void socialMemUpdate(OrderMemberVO orderMember);
   
   
}