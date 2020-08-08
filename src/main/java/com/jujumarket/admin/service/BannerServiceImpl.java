package com.jujumarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.admin.domain.BannerVO;
import com.jujumarket.admin.domain.ColumnVO;
import com.jujumarket.admin.domain.ListItemVO;
import com.jujumarket.admin.mapper.BannerMapper;
import com.jujumarket.shop.domain.ItemCriteria;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BannerServiceImpl implements BannerService {
	
	@Setter(onMethod_ = @Autowired)
	private BannerMapper mapper;

	@Override
	public void register(BannerVO vo) {
		log.info("register banner... " + vo);
		
		mapper.insertSelectKey(vo);
	}
	
	@Override
	public List<BannerVO> getBanner(String bannerType) {
		log.info("Banner 불러오기...");
		
		return mapper.getBanner(bannerType);
	}

	@Override
	public int remove(String imgNo) {
		log.info("remove.... " + imgNo);
		
		return mapper.delete(imgNo);
	}

	@Override
	public BannerVO get(String imgNo) {
		log.info("get...." + imgNo);
		
		return mapper.read(imgNo);
	}

	@Override
	public List<ListItemVO> getItemList(ItemCriteria cri) {
		log.info("getItemList....");
		
		return mapper.getItemList(cri);
	}

	@Override
	public ListItemVO getItem(String itemCode) {
		log.info("getItem....");
		
		return mapper.getItem(itemCode);
	}

	@Override
	public void regSeason(ListItemVO vo) {
		log.info("regSeason......");
		
		mapper.regSeason(vo);
	}

	@Override
	public List<ListItemVO> getSeason() {
		log.info("getSeason......");
		
		return mapper.getSeason();
	}

	@Override
	public int getItemTotal(ItemCriteria cri) {
		log.info("getItemTotal......");
		
		return mapper.getItemTotal(cri);
	}

	@Override
	public void deleSeason(String itemCode) {
		log.info("deleSeason......");
		
		mapper.deleSeason(itemCode);
	}

	@Override
	public void addColumn(ColumnVO vo) {
		log.info("addColumn......");
		
		mapper.addColumn(vo);
	}

	@Override
	public List<ColumnVO> getColumn() {
		log.info("getColumn......");
		
		return mapper.getColumn();
	}

	@Override
	public void modifyColumn(ColumnVO vo) {
		log.info("modifyColumn......");
		
		mapper.modifyColumn(vo);
	}

}
