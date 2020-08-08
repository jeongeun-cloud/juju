package com.jujumarket.main.mapper;

import java.util.List;

import com.jujumarket.main.domain.BoardItemVO;
import com.jujumarket.main.domain.CategoryVO;
import com.jujumarket.main.domain.Criteria;



public interface BoardItemMapper {
   
   public List<BoardItemVO> listSort(String order);
   
   public List<BoardItemVO> getListWithPaging(Criteria cri);
   
   public List<BoardItemVO> gets(String classCode);

   public List<CategoryVO> category();
   
   public List<BoardItemVO> lowPrice(String classCode);
   
   public List<BoardItemVO> highPrice(String classCode); 
   
   public List<BoardItemVO> bestProduct(String classCode);   
   
   public List<BoardItemVO> newProduct(String classCode);   
   
   
      
   }


