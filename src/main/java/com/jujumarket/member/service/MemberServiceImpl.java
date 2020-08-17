package com.jujumarket.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jujumarket.member.domain.CustomerVO;
import com.jujumarket.member.domain.DangolVO;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;
//import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.mapper.CustomerMapper;
import com.jujumarket.member.mapper.MemberMapper;
import com.jujumarket.member.mapper.SellerMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	// t_member
	private MemberMapper memberMapper;
	// m_customer
	private CustomerMapper customerMapper;
	// m_shop
	private SellerMapper sellerMapper;

	// [로그인]ID/PW확인
	@Override
	public boolean loginCheck(String emailAccount, String pwd) {
		return pwd.equals(memberMapper.getPwdByEmailAccount(emailAccount));
	}

	// [회원가입]이메일계정 중복체크
	@Override
	public boolean duplicateCheck(String emailAccount) {
		if (memberMapper.getEmailAccount(emailAccount) == null) {
			return true;
		} else {
			return false;
		}
	}

	// [회원정보수정][일반고객]기존 정보 불러오기
	@Override
	public CustomerVO getCustomerInfoByIdNo(String idNo) {
		return customerMapper.getCustomerInfoByIdNo(idNo);
	}

	// [회원정보수정][상인고객]기존 정보 불러오기
	@Override
	public SellerVO getSellerInfoByIdNo(String idNo) {
		return sellerMapper.getSellerInfoByIdNo(idNo);
	}

	// [마이페이지][회원탈퇴]비밀번호 일치여부 체크 후 탈퇴처리
	@Override
	public boolean checkPwd(String idNo, String pwd) {
		String originPwd = memberMapper.getPwdByIdNo(idNo);
		if (pwd == null) {
			return false;
		} else if (pwd.equals(originPwd)) {
			return true;
		}
		return false;
	}

	// [아이디찾기]일반고객:contact, 상인고객:contact1  이원적으로 처리
	@Override
	public List<String> getEmailList(MemberVO member) {
		if (member.getMemCode().equals("SELLER") || member.getMemCode().equals("JUNIOR")) {
			member.setContact1(member.getContact());
			return sellerMapper.getEmailList(member);
		} else {
			return customerMapper.getEmailList(member);
		}
	}

	// [마이페이지]비밀번호 변경
	@Override
	public boolean updatePwd(MemberVO member) {
		return memberMapper.updatePwd(member) == 1;
	}

	// [세션] 회원아이디, 이메일계정, 회원이름, 분류코드 가져옴.(MemberMapper.xml참조)
	@Override
	public MemberVO getMemberInfo(String emailAccount) {
		return memberMapper.getMemberInfo(emailAccount);
	}

	// 단골 되기
	@Override
	public void addDangol(DangolVO vo) {
		sellerMapper.addDangol(vo);
	}

	// 단골 취소
	@Override
	public void cancelDangol(DangolVO vo) {
		sellerMapper.cancelDangol(vo);

	}

	// 단골 리스트
	@Override
	public List<DangolVO> getDangol(String shopName) {
		return sellerMapper.getDangol(shopName);
	}

	@Override
	public int checkDangol(DangolVO vo) {
		return sellerMapper.checkDangol(vo);
	}

	// 총 단골 수
	@Override
	public Integer totalDangol(String shopName) {
		return sellerMapper.totalDangol(shopName);
	}

}
