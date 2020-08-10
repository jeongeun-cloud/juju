package com.jujumarket.main.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jujumarket.admin.domain.ColumnVO;
import com.jujumarket.admin.domain.ListItemVO;
import com.jujumarket.admin.service.BannerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/")
@AllArgsConstructor
public class SeasonalController {

   private BannerService service;
   
   @GetMapping("/seasonal")
   public void list(Model model) {
      log.info("controller 작동중");
      
      List<ColumnVO> list = service.getColumn();
//      for(int i=0; i<list.size(); i++) {
//         ColumnVO column = list.get(i);
//         
//        column.setColumn1(column.getColumn1().replace("\r\n", "<br>"));
//        column.setColumn2(column.getColumn2().replace("\r\n", "<br>"));
//      }
      
      model.addAttribute("column", list);
      model.addAttribute("seasonal", service.getBanner("seasonal"));
      model.addAttribute("seasonItem", service.getSeason());
   }


}