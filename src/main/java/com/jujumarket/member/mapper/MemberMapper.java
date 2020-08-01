package com.jujumarket.member.mapper;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberVO;
//import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;
import com.jujumarket.member.domain.SocialVO;
import com.jujumarket.order.domain.OrderMemberVO;

public interface MemberMapper {
	
	public void insertCustomer(CustomerVO customer);

	public void insertSeller(SellerVO seller);
	
	//세션정보에 id넣기
	public String getIdNoByEmailAccount(String emailAccount);
	//비밀번호 받아서 회원정보 삭제
	public String getPwdByIdNo(String idNo);
	//login
	public String getPwdByEmailAccount(String emailAccount);
	//duplicate check
	public String getEmailAccount(String emailAccount);
	//회원정보수정
	public int modifyMemberInfo(MemberVO member);
	//delete memberInfo t_member, m_customer, m_shop, m_shop_info , m_history에 insert
	public int deleteMember(String idNo);
	//주문자정보확인
	public OrderMemberVO orderMemberInfo(String idNo);

	public int updatePwd(MemberVO member);

	public MemberVO getMemberInfo(String emailAccount);




	
}
