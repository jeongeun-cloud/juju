package com.jujumarket.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.main.mapper.PrdReplyMapper;
import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.PrdReplyPageDTO;
import com.jujumarket.main.domain.PrdReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PrdReplyServiceImpl implements PrdReplyService {
	
	@Setter(onMethod_= {@Autowired})
	private PrdReplyMapper mapper;

	@Override
	public int register(PrdReplyVO vo) {
	    log.info("register........." + vo);
		
		return mapper.insert(vo);
	}
	
	@Override
	public int replyRgister(PrdReplyVO vo) {

		 log.info("register2........." + vo);
			
			return mapper.insert2(vo);
	}


	@Override
	public int modify(PrdReplyVO vo) {
	log.info("modify......" + vo);
		
		return mapper.update(vo);
	}

	@Override
	public int remove(int replyNo) {
		log.info("remove......." + replyNo);
		
		return mapper.delete(replyNo);
	
	}


	@Override
	public PrdReplyVO get(String itemCode) {
	log.info("get........." + itemCode);
		
		return mapper.read(itemCode);
	}

	@Override
	public List<PrdReplyVO> getList(Criteria cri, String itemCode) {
		log.info("get Reply List of a getList" + itemCode);
		
		System.out.println("get Reply List of a getList" + itemCode);
		
	
	    
	return	mapper.getListWithPaging(cri, itemCode);
	
	}

	@Override
	public PrdReplyPageDTO getPrdReplyListPage(Criteria cri, String itemCode) {
		return new PrdReplyPageDTO(
				mapper.getCountByitemCode(itemCode),
				mapper.getListWithPaging(cri,itemCode) 
		);
	
	
	}


	

}
