<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>

        .season_tit {
            height: 50px;
            background-color: #a6dbd6;
            display: inline-block;
            width: 100%;
            margin-top: 20px;
            margin-bottom: 20px;
            font-size: 0px;
            
           
        }
        .season_btn{
            float: right;
            padding-top: 15px;
            padding-right: 10px;
         
        }
        .season_ban{
            margin-top: 30px;
            margin-bottom: 30px;
            width: 100%;
        }
        .season_tit h3{
            display: inline;
            font-size: 30px;
        }
        .season_body{
            width: 1300px;
            margin-left: 100px;
        }
    </style>
</head>
<body>
<%@include file="includes/header.jsp" %>
<%@include file="includes/menuBar.jsp" %> 
<div class="season_body">
    <!-- 제철 기획 -->
    <div class="seanson_food" style="height:400px">
        <div class="season_tit">
             <h3>[이달의 음식!]</h3> 
            <span class="season_btn">       	
              <input type="button" value="월별 제철 음식">
            </span> 
            <div class="season_ban">
              <a href="#"><img src="/resources/images/season_banner.PNG" style="height: 300px; width:100%"></a>
            </div> 
        </div>
    </div>  
    <!-- 제철 기획 끝  -->

    <!-- 푸드 칼럼  -->
    <div class="seaon_column">
        <div class="season_tit">
            <h3>[푸드 칼럼!]</h3>   
        </div>
        <div class="season_ban">
          <a href="#"><img src="/resources/images/food_colmn.PNG" style="width:100%;"></a>
        </div>
    </div>
    <!--푸드 칼럼 끝  -->

    <div class="season_recipe">
        <div class="season_tit">
            <h3>[제철 레시피]</h3>
        </div>
        <div class="season_ban">
           <a href="#"><img src="/resources/images/season_reci.PNG" style="width:100%;"></a>
        </div>
        <div class="season_pro">
            <p style="font-size: 20px; display: inline; color: orangered;">+관련상품</p>
            <span class="season_btn">
                <input type="button" value="장바구니에 다담기">
            </span>
            <div>
                 <img src="/resources/images/season_pro.PNG" style="height: 300px;"> 
            </div>   
        </div>
    </div>
    
</div>
</body>
</html>