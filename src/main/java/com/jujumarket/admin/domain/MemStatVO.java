package com.jujumarket.admin.domain;

import lombok.Data;

@Data
public class MemStatVO {
	//index 빠르게 찾기
	private int iT;
	private int iTodayT;
	private int iWithdrawT;
	private int iTodayWithdrawT;

	//탈퇴
	private int rn;
	private String withdrawIdNo;
	private String withdrawReason;
	private String withdrawDay;
	
	private Integer customerNum;
	private Integer sellerNum;
	private Integer totalNum;
	
	//회원가입한 회원 통계
	private String regiday;
	private int regiMem;
	
	private String withday;
	private int withMem;
	
	//1:1문의 회원 수 (오늘)
	private int cNum;
	private int sNum;
	
	
	public int getCustomerNum() {
		return customerNum;
	}
	public void setCustomerNum(int customerNum) {
		this.customerNum=customerNum;
	}
	
	public int getSellerNum() {
		return sellerNum;
	}
	public void setSellerNum(int sellerNum) {
		this.sellerNum=sellerNum;
	}
	
}
