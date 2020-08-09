package com.jujumarket.order.mapper;

import java.util.List;

import com.jujumarket.main.domain.BasketVO;
import com.jujumarket.order.domain.OrderMemberVO;
import com.jujumarket.order.domain.OrderRequestVO;
import com.jujumarket.order.domain.OrderResponseVO;
import com.jujumarket.order.domain.OrderVO;
import com.jujumarket.order.domain.PaymentVO;

public interface OrderMapper {

//xml 만든 이후에
//   @Select("select * from t_order")
   public List<OrderVO> getList();
   public void insert(OrderRequestVO order);
   public void insertSelectKey(OrderRequestVO order);
   public OrderVO read(String orderCode);
   public OrderRequestVO requestRead(String orderCode);
   public int delete(String orderCode);
   public int update(OrderVO order);
   
   //타임스탬프 잘라서 주문번호 만들어주기 
   public int insertorderCode(String orderCode);
   //장바구니에서 넘어온 주문상품정보 (orderItemsForm.jsp), t_item, t_basket 조인
   public List<OrderResponseVO> orderResponse(String idNo);
   //주문서에서 넘어온 주문정보 (orderResult.jsp)t_item, t_order_info 조인
   public List<OrderResponseVO> showOrderList(String orderCode);
   //최근배송지 불러오기. idNo로 주문정보들 가져와서 desc 정렬 후 rownum = 1 정보 출력 
   public String getRecentOrderCode(String idNo);
   
   public BasketVO getone(String baskId);
   
   public void paymentRegister(PaymentVO payment);
   
   public void guestMemberInsert(OrderMemberVO orderMember);
   public void guestCustomerInsert(OrderMemberVO orderMember);
   
   public OrderVO readByIdno(String idNo);
   
   public void socialMemUpdateM(OrderMemberVO orderMember);
   
   public void mSocialUpdate(OrderMemberVO orderMember);
   
}


