package com.jujumarket.shop.domain;

import java.util.Date;

import lombok.Data;


@Data
public class ManagementVO {

     
	 private Date orderDate;   //주문일
	 private String	orderCode; //주문번호
	 private String orderStat; //주문상태	 
	 private String itemName;  //상품명
	 private String shippingCode; //송장번호
	 private String receivAddr; //주소
	 private String receivContact;  //연락처
	 private String itemCode; //상품코드
	 private String receiver; //수취인명
	 private String idNo; //상인계정불러올것
	 
	 private String baskId; //바스켓아이디
	 private Date prgDate;//진행시간
	 
	 private String date1; 
	 private String date2; 

	 private int itemNum; //상품수량
	 private int totalPrice;  //결제금액
	 private int price;// 판매가
	 private int historyNo;// 히스토리넘버. 시퀀스


     
     
}
