package com.jujumarket.admin.domain;

import lombok.Data;


@Data
public class AuthorityVO {

	String emailAccount;//상인계정
	String memName;//이름
	String contact1;//연락처
	String memCode;//회원유형코드 t_member 업데이트 m_history는 insert	
	String shopName;// 상점이름
	String idNo;
	
    String memAddr;//회원주소
    String contact2;//연락처2
    String postCode;//우편번호 nullable 
    String shopAddr;//상점주소  nullable
	String businessRegFile;// 사업자등록증이미지
	String businessCode;//번호
    




}
