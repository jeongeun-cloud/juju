package com.jujumarket.shop.domain;

import lombok.Data;

@Data
public class ShopManageVO {
	
	private String shopId;
	
	private Integer todayOrderTotal;
	private Integer prevOrderTotal;
	private Integer todayOrderCnt;
	private Integer prevOrderCnt;
	private Integer todayRefundTotal;
	private Integer prevRefundTotal;
	private Integer todayRefundCnt;
	private Integer prevRefundCnt;
	
	
	private String itemName;
	private int orderCnt;
	

	
	public String getShopIdNo() {
		return shopId;
	}
	public void setShopIdNo(String shopId) {
		this.shopId=shopId;
	}
	
//	오늘, 저번달 주문 총합
	public int getTodayOrderTotal() {
		return todayOrderTotal;
	}
	public void setTodayOrderTotal(int todayOrderTotal) {
		this.todayOrderTotal= todayOrderTotal;
	}
	
	public int getPrevOrderTotal() {
		return prevOrderTotal;
	}
	public void setPrevOrderTotal(int prevOrderTotal) {
		this.prevOrderTotal= prevOrderTotal;
	}
	
//오늘,저번달 주문 건수
	public int getTodayOrderCnt() {
		return todayOrderCnt;
	}
	public void setTodayOrderCnt(int todayOrderCnt) {
		this.todayOrderCnt= todayOrderCnt;
	}
	
	public int getPrevOrderCnt() {
		return prevOrderCnt;
	}
	public void setPrevOrderCnt(int prevOrderCnt) {
		this.prevOrderCnt= prevOrderCnt;
	}

//오늘,저번달 환불 금액
	public int getTodayRefundTotal() {
		return todayRefundTotal;
	}
	public void setTodayRefundTotal(int todayRefundTotal) {
		this.todayRefundTotal= todayRefundTotal;
	}
	
	public int getPrevRefundTotal() {
		return prevRefundTotal;
	}
	public void setPrevRefundTotal(int prevRefundTotal) {
		this.prevRefundTotal= prevRefundTotal;
	}
	

//오늘,저번달 환불 건수 
	public int getTodayRefundCnt() {
		return todayRefundCnt;
	}
	public void setTodayRefundCnt(int todayRefundCnt) {
		this.todayRefundCnt= todayRefundCnt;
	}
	
	public int getPrevReundCnt() {
		return prevRefundCnt;
	}
	public void setPrevRefundCnt(int prevRefundCnt) {
		this.prevRefundCnt= prevRefundCnt;
	}
	
	 

}
