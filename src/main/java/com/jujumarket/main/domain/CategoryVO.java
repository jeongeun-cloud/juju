package com.jujumarket.main.domain;

import lombok.Data;

@Data
public class CategoryVO {
   
   private String classCode;
   private String mainCateg;
   private String midCateg;
   private String item;
   private String fullPath;
   private int lv;
}