package com.jujumarket.member.service;

import java.util.List;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.DangolVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;

public interface MemberService {
	//로그인 시 이메일계정,비밀번호 확인
	public boolean loginCheck(String emailAccount, String pwd);
	//회원가입 할 때 중복된 이메일계정이 있는 지 체크
	public boolean duplicateCheck(String emailAccount);
	//일반고객 회원정보 수정 시 기존 정보 불러오기 
	public CustomerVO getCustomerInfoByIdNo(String idNo);
	//상인고객 회원정보 수정 시 기존 정보 불러오기
	public SellerVO getSellerInfoByIdNo(String idNo);
	//[마이페이지]회원탈퇴: 비밀번호 일치여부 체크 후 회원 탈퇴처리
	public boolean checkPwd(String idNo, String pwd);
	//아이디찾기
	public List<String> getEmailList(MemberVO member);
	//[마이페이지]비밀번호 변경 
	public boolean updatePwd(MemberVO member);
	//세션에 회원정보 가져올 때
	//회원아이디, 이메일계정, 회원이름, 분류코드 네 가지 가져옴.(MemberMapper.xml참조) 
	public MemberVO getMemberInfo(String emailAccount);
	
	//단골 추가, 취소 
	public void addDangol(DangolVO vo);
	
	public void cancelDangol(DangolVO vo);
	
	//단골 list불러 오기 
	public List<DangolVO> getDangol(String shopName);
	
	//단골 신청 했는지 안했는지 확인하기 
	public int checkDangol(DangolVO vo);
	
	//총 단골 수 
	public Integer totalDangol(String shopName);
}
