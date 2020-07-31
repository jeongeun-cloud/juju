package com.jujumarket.main.mapper;

import java.util.List;

import com.jujumarket.main.domain.AlarmVO;
import com.jujumarket.main.domain.ItemMainVO;

public interface ItemMainMapper {
	
//	@Select("select * from t_item")
	public List<ItemMainVO> getList();

	public void insert(ItemMainVO item);
	
	public void insertSelectKey(ItemMainVO item);
	
	public ItemMainVO get(String ItemCode);
	
	public int delete(String ItemCode);
	
	public int update(ItemMainVO item);
	
	//알람 받기 서비스 
	public void applyAlarm(AlarmVO alarmvo);
	
	public void cancelAlarm(AlarmVO alarmvo);
	
}
