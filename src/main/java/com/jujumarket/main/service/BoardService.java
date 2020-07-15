package com.jujumarket.main.service;

import java.util.List;

import com.jujumarket.main.domain.BoardItemVO;
import com.jujumarket.main.domain.CategoryVO;
import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.SortVO;

public interface BoardService {
   
   
   public List<BoardItemVO> gets(String classCode);
   
   public List<CategoryVO> category();
   
   public List<BoardItemVO> getList(Criteria cri);
   
    public List<BoardItemVO> listSort(SortVO sort); 
   

   
   
   
}