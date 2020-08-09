package com.jujumarket.member.mapper;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.MemberVO;
//import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;
import com.jujumarket.member.domain.SocialVO;
import com.jujumarket.order.domain.OrderMemberVO;

public interface MemberMapper {
	//일반고객 회원가입 시 t_member에 회원정보추가
	public void insertCustomer(CustomerVO customer);
	//상인고객 회원가입 시 t_member에 회원정보추가
	public void insertSeller(SellerVO seller);
	//세션정보에 id넣기
	public String getIdNoByEmailAccount(String emailAccount);
	//비밀번호 받아서 회원정보 삭제
	public String getPwdByIdNo(String idNo);
	//로그인
	public String getPwdByEmailAccount(String emailAccount);
	//이메일 중복체크
	public String getEmailAccount(String emailAccount);
	//t_member 회원정보수정
	public int modifyMemberInfo(MemberVO member);
	//회원탈퇴
	//t_member, m_customer, m_shop, m_shop_info에서 회원정보 삭제, m_history에 insert
	public int deleteMember(String idNo);
	//주문자정보확인
	public OrderMemberVO orderMemberInfo(String idNo);
	
	public OrderMemberVO orderSellerInfo(String idNo);
	
	public OrderMemberVO orderSocialInfo(String idNo);
	//비밀번호변경
	public int updatePwd(MemberVO member);
	//세션 회원정보 불러오기
	public MemberVO getMemberInfo(String emailAccount);




	
}
