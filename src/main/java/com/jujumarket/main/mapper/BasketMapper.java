package com.jujumarket.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.jujumarket.main.domain.BasketVO;

public interface BasketMapper {
	
//	@Select("select * from t_basket")
	public List<BasketVO> getList(String id);
	
	  public void insert(BasketVO basket);
	  
	  public void insertSelectKey(BasketVO basket);
	  
	  public BasketVO read(String baskId);
	  
	  public int delete(String baskId);
	  
	  public int update(BasketVO basket);

	  public String makeGuestId();

	  public Integer getBasketTotal(String id);
	
	 
	

}
