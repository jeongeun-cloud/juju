package com.jujumarket.order.mapper;

import java.util.List;

import com.jujumarket.order.domain.MemberVO;
import com.jujumarket.order.domain.OrderMemberVO;

public interface MemberMapper {
	public List<MemberVO> getList();
	public int insertCustomer(MemberVO member);
	public int insertSeller(MemberVO member);
	public MemberVO read(String em);
	
	public String readIdno(String id);//id를 집어넣으면 idno가 나옴
	public String getPwd(String idno);
	
	//이메일찾기
	public String getEmail1(String memname);//idno정보를 가져옴
	public String getEmail3(String memname);//이메일을 가져옴
	
	//비밀번호 변경하기
	//1.idno가져오기(readIdno)
	public int update(MemberVO member);
	
	public int delete(String id);
	
	public OrderMemberVO orderMemberInfo(String idNo);
	
	
}
