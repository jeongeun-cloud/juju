package com.jujumarket.main.service;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jujumarket.main.domain.BoardItemVO;
import com.jujumarket.main.domain.CategoryVO;
import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.SortVO;
import com.jujumarket.main.mapper.BoardItemMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
 

@Log4j
@Service
@AllArgsConstructor

public class BoardServiceImpl implements BoardService{
   
   @Setter(onMethod_ = @Autowired)
   private BoardItemMapper mapper;

   @Override
    public List<BoardItemVO> gets(String classCode) {
      log.info("gets...");
   return mapper.gets(classCode);
   }
   
   
   @Override
   public List<CategoryVO> category() {
     log.info("카테고리 체크....");
     return mapper.category();
  }
   
   
   @Override
   public List<BoardItemVO> getList(Criteria cri) {
      log.info("getList with Criteria"+cri);
      return mapper.getListWithPaging(cri);
   }
   

   
   @Override 
   public List<BoardItemVO> listSort(SortVO sort) {
   
  // System.out.println("serviceImpl 까지 들어왔다");
  // System.out.println("serviceImpl 에서의 cs는? " + sort.getClassCode());
  // System.out.println("serviceImpl 에서의 sort는? " + sort.getSort());

     
     if(sort.getSort().equals("best")) {
        return mapper.bestProduct(sort.getClassCode()); 
     }
     else if(sort.getSort().equals("highPrice")) { 
        return mapper.highPrice(sort.getClassCode()); 
     }  
     else if(sort.getSort().equals("lowPrice")) {
        return mapper.lowPrice(sort.getClassCode()); 
     }
     else {
        return mapper.newProduct(sort.getClassCode());
     }
   
     
     }

}