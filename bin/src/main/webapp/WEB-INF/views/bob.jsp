<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/heroic-features.css" rel="stylesheet">

    <style>
    .best-wrap{
            width:1000px;
           
            /* border: solid red; */
            margin-left:180px ;
          
            
        }

    .best_bnr{
         height: 50px;
         
        
    }
    .best-list-wrap{
     /* border:solid black;    */
     height: 1600px;
     width: 100%;
     margin-top:30px;
    }
    .best_pro{
        /* ul */
        display: table;
        width: 100%;
        margin: 0 auto;
        text-align: left;
    }
    li{
        list-style: none;
    }
    .best_pro > li {
        display: inline-block;
        width: 33.33%;
        text-align: center;
    }
    .best_pro .best_box{
        /* ul> li */      
        width:310px;
        height: 470px;
        margin-left:-30px;    
        margin-top: 30px;  
        border: solid gray;
      
    }
    .best_pro .best_box .best_box_img{
        overflow: hidden;
        position: absolute;
        z-index: 1;
        width: 100%;
        margin: 0 auto;
        width: 300px;
        height: 310px;
        z-index:-1;
        /* border: dotted blue; */
    }
    .best_pro .best_box .best_box_info{
        display: block;
       position: absolute;
        margin-top: 320px;
        text-align: left;
        padding-top: 10px;
        width: 310px;
        height: 130px;
        /* border: solid green; */
    }
    .best_box_info .best-price-info .cost{
        display: inline-block;
        padding:6px;
        font-size:13px;
        text-decoration: line-through;
        line-height: 21px;
    }
  	.best_box .best_box_img{
  	
  	}
    </style>

    
   
</head>
<body>
<%@include file="./includes/header.jsp" %>
<%@include file="./includes/menuBar.jsp" %>
    <div class="best-wrap" style="display:grid;">

        <div class="best-list-wrap" >
                <div class="best_bnr" style="background-color: darkorange;">
                 <h1>판매량 베스트</h1>   
                </div>
                <ul class="best_pro">
                    <li>
                        <div class="best_box">
                            <div class="best_box_img">
                              <a href="#">
                                  <img src="/resources/images/juIMG.png">
                              </a>  
                            </div>
                            <div class="best_box_info">
                                <p class="best-name-info">
                                    <p>자연산 싱싱 오징어</p>
                                </p>
                                <p class="best-shop-name-info">
                                    <p>주주 바다 <p>
                                </p>
                                <p class="best-price-info">
                                    <p class="sale">
                                        <h2><strong>29900원</strong></h2>
                                    </p>
                                    <p class="cost" style="text-decoration: line-through;">
                                       
                                    </p>
                                      
                                </p>
                                <p class="best-cart"></p>
                            </div>    
                        </div>
                    </li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                </ul>

            
                
        </div>            
        <div class="best-list-wrap">
                <div class="best_bnr" style="background-color: skyblue;">
                    <h1>리뷰 베스트</h1>
                </div>
                <ul class="best_pro">
                    <li><div class=best_box></div></li> 
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>    
                </ul>
        </div>
        <div class="best-list-wrap">
                <div class="best_bnr" style="background-color: pink;">
                    <h1>유기농 베스트</h1>
                </div>
                <ul class="best_pro">
                    <li><div class=best_box></div></li> 
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>
                    <li><div class=best_box></div></li>    
                </ul>
        </div>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
     <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>