package com.jujumarket.order.domain;

import lombok.Data;

@Data
public class OrderRequestVO {
	//t_order
	private String orderCode;
	
	private Long totalPay;
	private Long totalSum;
	private Long totalDiscount;
	private Long deliCharge;
	//private Timestamp orderDate;
	private String isMember;
	private String idNo;
	private String nonMemPwd;
	//t_order_info
	private String itemCode;
	private String baskId;
	//OrderInfoVO에만 존재하는 컬럼 
	private Long itemNum;
	private Long disAmount;
	private Long totalPrice;
	private String orderStat;
	
	//주문자 정보
	private String memName;
	private String contact;
	
	//배송지정보에 들어가는 column
	private Long deliveryNo;
	private String shippingCode;
	private String receiver;
	private String receivContact;
//	private String roadAddr;
//	private String jibunAddr;
	private String receivAddr;
	private String reqNote;
	
	private String historyNo;
	
	
	
}
