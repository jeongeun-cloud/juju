<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="css/heroic-features.css" rel="stylesheet">

    <style>
        .bob_content{
            width: 1300px;
            height: 100%;
            margin:0 auto;
           
        }
        .bob_wrap{
           position: relative;
           padding-top: 30px;
        }

        .bob_tit{
            height: 40px;
          	width:130px;
          	padding:5px;
          	border-bottom: 1px solid #8fa691;
          	color: #8fa691;
          	text-align:center;
        }
    
        a{
            text-decoration: none;
        }
        a:hover{
        	text-decoration:none;
        	}
        li{
            list-style: none;
        }
        .bob_pro{

        	height: 2100px;
            width: 1000px;
            margin: 30px auto;

        }
        .pro_module{
            width: 336px;
            height: 540px;          
        }
        .pro_img_wrap{
            width: 100%;
            height: 396px;
            background-color: black;
            position: relative;
            overflow: hidden;
        }
         .pro_img_wrap img{
        display:block;
        width:100%;
        height:100%;
        position: absolute;
        top:0;
        bottom:0;
        left:0;
        right:0;
        }
        .pro_module .txt_wrap{
            position: relative;
            margin-top: 16px;
         /*    background-color: greenyellow; */
            width: 100%;
            height: 170px;
        }
        .txt_wrap .pro_flag_wrap{
            margin-left: 1px;
             height:25px;
        }
        .pro_flag_wrap .flag{
            border: 1px solid #8fa691;
            background-color: #8fa691;
            display: inline-block;
            min-width: 55px;
            height: 25px;
            margin: 0 0 0 -1px;
            font-size: 12px;
            line-height: 22px;
            text-align: center;
            font-weight: 800;
            color: white;
        }
        .tit_info .info_itemName{
            display: block;
            color: black;
            font-weight: bold;
            font-size: 20px;
            word-break: break-all;
            padding: 8px 0 0;
        }
        .price_info{
            padding-top: 8px;
            font-size: 0;
        }
        .price_info .sale{
            display: inline-block;
            margin-right: 5px;
            vertical-align: middle;
           
            
        }
        .price_info .sale .price{
            display: inline-block;
            vertical-align: top;
            font-size: 21px;
            line-height: 27px;
            font-weight: 800;
            color: black;
        }
        .price_info .normPrice{
            display: inline-block;
            padding-left: 6px;
            color: black;
            font-size: 13px;
            line-height: 21px;
            text-decoration: line-through;
            vertical-align: middle;
        }
        .pro_module .cart_btn{
            position: static;
            margin-top: 5px;
        }
        .pro_list .pro_list_ul .pro_list_li{
            float: left;
            margin: 80px 0 0 25px;
            min-height: 600px;
        } 
           .soldout{
           text-align:center;
           width:100%;
           bottom: 50px; 
           font-size: 3.5em;
           font-weight: bold; 
           position: absolute; 
           color: white;
        
       }
       .add_to_cart{
        border:none;
        background-color:white;
        right:0;
        top: 40px;
        display:inline;
        position:absolute;
        }
        .add_to_cart:focus{
        outline:none;
        }
        
    </style>
    
   
</head>
<body>
<%@include file="./includes/header.jsp" %>
<%@include file="./includes/menuBar.jsp" %>
<%@include file="./includes/basketSlide.jsp" %>
        <div class="bob_content">
        <div class="bob_wrap">
            <div class="bob_pro">
                <div class="bob_tit">
               <h4><b>구매량 베스트</b></h4> 
                </div>
                <div class="bob_pro_li">
                    <c:forEach items="${BestBob}" var="bob">
	         
							<section id="pro_container"> 
							
							    <div class="pro_list">
							        <ul class="pro_list_ul">
							            <li class="pro_list_li">
							                <div class="pro_module">
							                  <c:if test="${bob.saleStat=='판매중'}">
                                            <div class="pro_img_wrap">
                                        
                                               <a href="/product/item?itemCode=<c:out value='${bob.itemCode}'/>" class="conts">

                                                      <img class="active" src="/resources/upload/<c:out value="${bob.idNo}"/>/<c:out value="${bob.itemImg1}"/>">
                                               </a>
                                
                                                  </div>    
                                                   </c:if>
                                                   
                                            <!-- 품절일때  -->
                                            <c:if test="${bob.saleStat=='품절'}">
                                            <div class="pro_img_wrap">
                                        
                                                <a href="/product/item?itemCode=<c:out value='${bob.itemCode}'/>" class="conts" style="opacity:0.2;">

                                               <img class="active" src="/resources/upload/<c:out value="${bob.idNo}"/>/<c:out value="${bob.itemImg1}"/>">

                                               </a>
                                                  <div class="soldout">
                                                         <p>품절</p>
                                                         </div>
                                                  </div>    
                                                   </c:if>
                                                   
                                                   <!--판매 중지일때  -->
                                            <c:if test="${bob.saleStat=='판매중지'}">
	                                           	 <div class="pro_img_wrap">
	                                        
	                                              	  <a href="/product/item?itemCode=<c:out value='${bob.itemCode}'/>" class="conts" style="opacity:0.2;">
	
	                     							 <img class="active" src="/resources/upload/<c:out value="${bob.idNo}"/>/<c:out value="${bob.itemImg1}"/>">

	                                             	  </a>
	                                               		    <div class="soldout">
	                                                         <p>판매 중지</p>
	                                                         </div>
	                                                  </div>    
                                              </c:if>
							                <!-- END img_wrap -->
							                <div class="txt_wrap">
							                
							                 <!--cart버튼  -->
							                    <div class="cart_btn">
							                    <c:if test="${bob.saleStat=='품절'||bob.saleStat=='판매중지'}">
							                    	   <button type="button" class="add_to_cart" value="${bob.itemCode}" onclick="alert('죄송합니다. 구매 불가한 상품입니다.')"><img src="/resources/images/addcart.png"></button>
							                    </c:if>
							                    <c:if test="${bob.saleStat!='품절'&& bob.saleStat!='판매중지'}">
							            			 <button type="button" class="add_to_cart" value="${bob.itemCode}" onclick="addToBasketEvent(this.value)"><img src="/resources/images/addcart.png"></button> 
							            	 	</c:if>
							                    </div>
							                    <!--cart버튼 끝  -->
							                    
							                	 <a href="/product/item?itemCode=<c:out value='${bob.itemCode}'/>" class="conts">
							                        <div class="pro_flag_wrap">
                                          
		                                            <c:if test="${bob.itemChr!='default'}">
		                                                 <span class="flag"> <c:out value="${bob.itemChr}" /></span>                                                                                
		                                             </c:if>
		                                             
		                                           </div>
							                        <!-- END pro_flag_wrap -->
							                        <div class=tit_info>
							                            <span class="info_itemName"> <c:out value="${bob.itemName}" /> </span>							                            
							                        </div>
							                        <!-- END tit_info -->
							                        <div class="price_info">
							                                <p class="sale">
							                                    <span class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${bob.price}" />
							                                        <span class="won">원</span>
							                                    </span>
							                                </p>
							                                <p class="normPrice">
							                                  <c:out value="${bob.normPrice}" />
							                                  <span class="won">원</span>
							                                </p>
							                        </div>
							                  		 </a>

							                </div>
							                <!-- END txt_wrap -->
							                
							                </div>
							                <!-- END pro_moduel  -->
							            </li>     
							        </ul>    
							    </div>
							    <!--END pro_list  -->
							</section>     
	                   
	               </c:forEach>

                </div>
                <!--bob_pro_li  -->
            </div>
            <!--bob_pro  -->
            

            <!--후기 베스트 시작  -->
            <div class="bob_pro">
                 <div class="bob_tit">
               <h4><b>리뷰 베스트</b></h4> 
                </div>
                <div class="bob_pro_li">
                    <c:forEach items="${ReviewBob}" var="bob">
	         
							<section id="pro_container"> 
							
							    <div class="pro_list">
							        <ul class="pro_list_ul">
							            <li class="pro_list_li">
							                <div class="pro_module">
							                  <c:if test="${bob.saleStat=='판매중'}">
                                            <div class="pro_img_wrap">
                                        
                                               <a href="/product/item?itemCode=<c:out value='${bob.itemCode}'/>" class="conts">

                                                      <img class="active" src="/resources/upload/<c:out value="${bob.idNo}"/>/<c:out value="${bob.itemImg1}"/>">
                                               </a>
                                
                                                  </div>    
                                                   </c:if>
                                                   
                                            <!-- 품절일때  -->
                                            <c:if test="${bob.saleStat=='품절'}">
                                            <div class="pro_img_wrap">
                                        
                                                <a href="/product/item?itemCode=<c:out value='${bob.itemCode}'/>" class="conts" style="opacity:0.2;">

                                               <img class="active" src="/resources/upload/<c:out value="${bob.idNo}"/>/<c:out value="${bob.itemImg1}"/>">

                                               </a>
                                                  <div class="soldout">
                                                         <p>품절</p>
                                                         </div>
                                                  </div>    
                                                   </c:if>
                                                   
                                                   <!--판매 중지일때  -->
                                            <c:if test="${bob.saleStat=='판매중지'}">
	                                           	 <div class="pro_img_wrap">
	                                        
	                                              	  <a href="/product/item?itemCode=<c:out value='${bob.itemCode}'/>" class="conts" style="opacity:0.2;">
	
	                     							 <img class="active" src="/resources/upload/<c:out value="${bob.idNo}"/>/<c:out value="${bob.itemImg1}"/>">

	                                             	  </a>
	                                               		    <div class="soldout">
	                                                         <p>판매 중지</p>
	                                                         </div>
	                                                  </div>    
                                              </c:if>
							                <!-- END img_wrap -->
							                <div class="txt_wrap">
							                
							                 <!--cart버튼  -->
							                    <div class="cart_btn">
							                    <c:if test="${bob.saleStat=='품절'||bob.saleStat=='판매중지'}">
							                    	   <button type="button" class="add_to_cart" value="${bob.itemCode}" onclick="alert('죄송합니다. 구매 불가한 상품입니다.')"><img src="/resources/images/addcart.png"></button>
							                    </c:if>
							                    <c:if test="${bob.saleStat!='품절'&& bob.saleStat!='판매중지'}">
							            			 <button type="button" class="add_to_cart" value="${bob.itemCode}" onclick="addToBasketEvent(this.value)"><img src="/resources/images/addcart.png"></button> 
							            	 	</c:if>
							                    </div>
							                    <!--cart버튼 끝  -->
							                    
							                	 <a href="/product/item?itemCode=<c:out value='${bob.itemCode}'/>" class="conts">
							                        <div class="pro_flag_wrap">
                                          
		                                            <c:if test="${bob.itemChr!='default'}">
		                                                 <span class="flag"> <c:out value="${bob.itemChr}" /></span>                                                                                
		                                             </c:if>
		                                             
		                                           </div>
							                        <!-- END pro_flag_wrap -->
							                        <div class=tit_info>
							                            <span class="info_itemName"> <c:out value="${bob.itemName}" /> </span>							                            
							                        </div>
							                        <!-- END tit_info -->
							                        <div class="price_info">
							                                <p class="sale">
							                                    <span class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${bob.price}" />
							                                        <span class="won">원</span>
							                                    </span>
							                                </p>
							                                <p class="normPrice">
							                                  <c:out value="${bob.normPrice}" />
							                                  <span class="won">원</span>
							                                </p>
							                        </div>
							                  		 </a>

							                </div>
							                <!-- END txt_wrap -->
							                
							                </div>
							                <!-- END pro_moduel  -->
							            </li>     
							        </ul>    
							    </div>
							    <!--END pro_list  -->
							</section>     
	                   
	               </c:forEach>


                </div>
                <!--bob_pro_li  -->
            </div>
            <!--bob_pro  -->
            

            
        </div>
        <!--bob_wrap  -->
    </div>
    <!--bob_content  -->


<%@include file="./includes/footer.jsp" %>


</body>
</html>