
package com.jujumarket.member.mapper;

import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;
//상인상세 m_shop_info 테이블 변경하는 메서드들
public interface SellerInfoMapper {
	
	//상인 회원가입 정보 히스토리에 추가 m_history
	public void insertShopInfo(SellerVO seller);
	//상인 회원정보수정 m_shop_info
	public int modifySellerInfo(MemberVO member);
	//상인 회원탈퇴 m_shop_info 
	public int deleteSellerInfo(String idNo);
	//사업자등록번호 중복체크 
	public String bcUniqueCheck(String businessCode);

}
