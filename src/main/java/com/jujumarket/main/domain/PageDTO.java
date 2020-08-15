package com.jujumarket.main.domain;

import com.jujumarket.shop.domain.ItemCriteria;

import lombok.Getter;
import lombok.ToString;


@Getter
@ToString
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	private ItemCriteria itemcri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri=cri;
		this.total=total;
		
		this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage = this.endPage-9;

		int realEnd=(int)(Math.ceil((total*1.0)/cri.getAmount()));
		
		if(realEnd <this.endPage) {
			this.endPage=realEnd;
		}
		this.prev = this.startPage>1;
		this.next=this.endPage<realEnd;
	}
	
	
	public PageDTO(ItemCriteria itemcri, int total) {
		this.itemcri=itemcri;
		this.total=total;
		
		this.endPage=(int)(Math.ceil(itemcri.getPageNum()/10.0))*10;
		this.startPage = this.endPage-9;

		int realEnd=(int)(Math.ceil((total*1.0)/itemcri.getAmount()));
		
		if(realEnd <this.endPage) {
			this.endPage=realEnd;
		}
		this.prev = this.startPage>1;
		this.next=this.endPage<realEnd;
	}
	
}
