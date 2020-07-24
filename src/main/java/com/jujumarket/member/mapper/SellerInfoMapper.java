
  package com.jujumarket.member.mapper;
  
  import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SellerVO;
  
  public interface SellerInfoMapper { 
	  public void insertShopInfo(SellerVO seller);
	  
	  public int modifySellerInfo(MemberVO member);
  
  
  }
 