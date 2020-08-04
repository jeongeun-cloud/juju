package com.jujumarket.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.main.domain.ReviewVO;
import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.ReviewPageDTO;
import com.jujumarket.main.mapper.ReviewMapper;
import com.jujumarket.order.domain.OrderRequestVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;
	
	@Override
	public List<ReviewVO> getList(String itemCode) {
		log.info("getList.....");
		
		return mapper.getList(itemCode);
	}

	@Override
	public int register(ReviewVO register) {
		log.info("register......" + register);
		
		return mapper.insertSelectKey(register);
	}

	@Override
	public ReviewVO get(String reviewNo) {
		log.info("get......." + reviewNo);
		
		return mapper.read(reviewNo);
	}

	@Override
	public int modify(ReviewVO register) {
		log.info("modify........" + register);
		
		return mapper.update(register);
	}

	@Override
	public int remove(String reviewNo) {
		log.info("remove......" + reviewNo);
		
		return mapper.delete(reviewNo);
	}

	@Override
	public ReviewPageDTO getListPage(Criteria cri, String itemCode) {
		
		return new ReviewPageDTO(
				mapper.getCountByItemCode(itemCode),
				mapper.getListWithPaging(cri, itemCode));
	}

	@Override
	public List<ReviewVO> mainReview() {
		log.info("main Review....");
		return mapper.getMainReview();
	}

	@Override
	public List<OrderRequestVO> getOrderStat(String idNo) {
		log.info("getOrderStat.....");
		return mapper.getOrderStat(idNo);
	}

//	@Override
//	public int getTotal(Criteria cri) {
//		log.info("get total count");
//		return mapper.getTotalCount(cri);
//	}
	
	

}
