package com.jujumarket.member.service;

public interface MemberSerivce {
	
	public boolean loginCheck(String emailAccount, String pwd);

	public boolean duplicateCheck(String email);
	
}
