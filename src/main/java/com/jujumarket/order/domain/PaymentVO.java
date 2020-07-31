package com.jujumarket.order.domain;

import lombok.Data;

@Data
public class PaymentVO {

	private String orderCode;
	private String jujuName;
	private String jujuContact;
	private String jujuAddr;
	private String jujuCeo;
	private Long subTotal;
	private Long tax;
	private Long vat;
	private Long totalPay;
	private Long card;
	private String cardCompany;
	private String cardNum;
	private String approvalNum;
	private String monthlyPay;
	
	
}
