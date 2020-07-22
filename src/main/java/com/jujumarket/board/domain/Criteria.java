package com.jujumarket.board.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;

	private String type;
	private String keyword;
	
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;

	}
	/*
	 * public Criteria(int pageNum, int amoutn, String type, String keyword) {
	 * this.pageNum = pageNum; this.amount = amoutn; this.keyword = keyword;
	 * this.type = type; }
	 */

	public String[] getTypeArr() {

		return type == null ? new String[] {} : type.split("");

	}

	public String getListLink() {

		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("keyword", this.getKeyword())
				.queryParam("type", this.getType());

		return builder.toUriString();

	}
}
