package com.jujumarket.shop.domain;

import lombok.Data;

@Data
public class WholeStaVO {
   
   private int orderT;
   private String dday; 
   
   /* private String itemCode; */
   private String itemName;
   private int orderCnt;
   

   private int orderTotalD;
   private String dayD;
   
   private int orderTotalM;
   private String dayM;
   
   private int orderTotalY;
   private String dayY;
}