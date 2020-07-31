
package com.jujumarket.order.domain;

import lombok.Data;

@Data
public class DeliveryVO {
	private Long deliveryNo;
	private String shippingCode;
	private String receiver;
	private String receivAddr;
	private String receivContact;
	private String reqNote;
	private String postCode;
	private String orderCode;
	// 아이템코드는 nullable
	private String baskId;

}
