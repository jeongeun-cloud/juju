package com.jujumarket.order.service;

import java.util.ArrayList;
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
      
      List<DeliveryVO> deliveryList = new ArrayList<DeliveryVO>();
      
      deliveryList = deliveryMapper.readByOrderCode(orderCode);
      
      // 최근 주문이 없을때 처리(null 에러 방지) 
      if(deliveryList.size()==0) {
         
         deliveryList = new ArrayList<DeliveryVO>();
         DeliveryVO dv = new DeliveryVO();
         deliveryList.add(dv);
      }
      
      return deliveryList.get(0);
      
      
   }

   @Override
   public void register(DeliveryVO delivery) {
      deliveryMapper.insertSelectKey(delivery);
   }


}