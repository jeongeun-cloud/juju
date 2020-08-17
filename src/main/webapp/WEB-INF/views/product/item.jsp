<%@ page language="java" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8"%>
   
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>item</title>


<style>




/* 전체에 적용되는 css 시작 */
 * {
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
       box-sizing: border-box;
        }
/* 전체에 적용되는 css 끝 */




  
/* 아이템 상세페이지 css 시작 */
.itemDiv {
  font-family: "Pontano Sans", sans-serif;
  font-size: 1.125rem;
  line-height: 1.5;
  margin: 0;
  padding: 0;
  color: #888;
  background: #fff;
  text-rendering: optimizeLegibility; }
  
  
  .itemDiv img {
  display: block;
  /*
  margin:0px auto;
  */
  }
  

.itemDiv ul {
  padding: 0;
  margin: 0;
  list-style: none; 
  width: 100%;
  
  }
.itemDiv  ul li {
    margin: 0; }

.itemDiv a {
  color: #888;
  text-decoration: none;
  transition: all 0.2s ease; }
.itemDiv  a:hover {
    color: #333; }
.itemDiv  a.active {
    color: #333; }

.itemDiv h1,
.itemDiv h2,
.itemDiv h3,
.itemDiv h4 {
  color: #333;
  font-weight: normal;
  margin: 1.75rem 0 1rem 0; }

.itemDiv h1 {
  font-size: 2.5rem; }

.itemDiv h2 {
  font-size: 2.125rem;
  margin: 0; }

.itemDiv h3 {
  font-size: 2rem; }

.itemDiv h4 {
  font-size: 1.5rem;
  margin: 1rem 0 0.5rem 0; }



.image-item {
  max-width: 100%;
  height: auto;
  object-fit: cover; }

.price {
  margin: 0; }

.category-list {
  display: flex;
  flex-wrap: wrap;
  padding: 0;
  margin: 1rem 0 0 0;
  list-style: none; }
  .category-list li {
    font-size: 0.85rem;
    letter-spacing: 0.125rem;
    text-transform: uppercase; }

.category.active {
  color: #333; }
.category + .category::before {
  content: "/";
  display: inline-block;
  padding: 0 0.5rem;
  color: #d5d5d5; }

.item-describe-line {
  border-top: 0.0625rem solid #e3dddd;
  margin: 2rem 0;
  padding: 1rem 0 0 0; }

.add-to-basket ,
.add-to-alarm{
  position: relative;
  display: inline-block;
  background: #637365;
  color: #fff;
  border: none;
  border-radius: 0;
  padding: 1.25rem 2.5rem;
  font-size: 1rem;
  text-transform: uppercase;
  cursor: pointer;
  transform: translateZ(0);
  transition: color 0.3s ease;
  letter-spacing: 0.0625rem; }
  .add-to-basket:hover::before,
  .add-to-alarm:hover::before {
    transform: scaleX(1); }
  .add-to-basket::before ,
  .add-to-alarm::before {
    position: absolute;
    content: "";
    z-index: -1;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: #8FA691;
    transform: scaleX(0);
    transform-origin: 0 50%;
    transition: transform 0.3s ease-out; }

.itemContainer {
  margin: auto;
  padding: 0 1rem;
  max-width: 80rem;
  width: 100%; }

.grid > [class*="column-"] {
  padding: 1rem; }
.grid.menu, .grid.product {
  border-bottom: 0.0625rem solid #e3dddd; }
.grid.menu > [class*="column-"] {
  padding: 0.5rem 1rem 0.5rem 1rem; }
.grid.product {
  padding: 0 0 1.5rem 0; }
.grid.second-nav > [class*="column-"] {
  padding: 0.5rem 1rem; }


.product-image {
  display: none; }

.image-list li {
  margin: 0; }

@media (min-width: 500px) {
  .product-image img,
  .image-list img {
    width: 100%; }

  .product-image {
    display: block; 
    width: 430px;
    
    }
    .product-image img {
      height: 52vh; }
      .product-image img.active {
        display: block;
        width: 430px;
        height: 552px;
        margin: 0 0 5px 0; }

  .image-list {
    display: flex;
    overflow: hidden; 
    }
      .image-list li:nth-child(3) {
        margin: 0; }
    .image-list img {
      height: 180px;
      width: 140px;
      transition: opacity 0.3s ease;
      cursor: pointer; 
      margin-right:5px;
      }
      .image-list img:hover {
        opacity: 0.7; }




	.product-gallery {
		float: left;
	
	}


	.grid.product {
		width: 100%;
		height: 800px;
	}

	.column-xs-12.column-md-5 {
		float: right;
		width: 300px;
		height: 500px;
	
	}
	
	.column-xs-4.column-md-6 {
		margin-top: 50px;
	}
	
	
	.category.active,
	.category::before,
	.category a {
		font-size: 15px;
		color: #888888;
	}


/* 아이템 상세페이지 css 끝 */ 



/* 지울 부분 시작 */

   
#prdInfo{

width:70%;
margin-left: 15%;

}

#prdReview{

width:70%;
margin: 0 auto;
padding-bottom: 50px;

}

#prdQnA{

width:70%;
margin-left: 15%;

}

#delieveryInfo{

width:70%;
margin-left: 15%;

}

#refundInfo{

width:70%;
margin-left: 15%;

} 


#moveContentTitle {
	font-size: 20px;
	margin-top: 15px;

}

   

/* 지울 부분 끝 */







/* 수량 증감 화살표 부분 시작 */

.up-down{
/*   border:1px solid #aaa; */
  display:inline-block;
  font-size:1.2vw;
}
#numup{
/*   margin-top:0.2%; */
/*   position:absolute; */
/*   height:3px; */
  border:1px solid #637365;
  background-color: #637365;
  color: white;
  height: 25px;
 
}
#numdown{
/*   position:absolute; */
/*   height:10px; */
/*   margin-top:0.2%; */
/*   width:50px; */
   border:1px solid #637365;
  background-color: #637365;
  color: white;
  height: 25px;
}

/* 수량 증감 화살표 부분 끝 */


/*댓글 dropdown*/
.dropbtn {
  background-color: white;
  color: black;
  padding: 10px;
  font-size: 8px;
  border: none;
  cursor: pointer;
  font-weight: 600;
}
/* 버튼색상  */
.dropbtn:hover, .dropbtn:focus {
  background-color: white;
}

.dropdown {
  float: right;
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 40px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  right: 0;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
/*댓글 dropdown end*/








/* 리뷰 모달 스타일 시작 */
.reviewtext {
     width: 100%;
     padding: 12px 20px;
     margin: 8px 0;
     display: inline-block;
     border: 1px solid #ccc;
     box-sizing: border-box;
   }
   
   /* Extra styles for the register button */
   .reviewBtn {
     width: 100%;
     padding: 10px 18px;
     background-color: #f44336;
     background-color: #4CAF50;
     padding: 14px 20px;
     margin: 8px 0;
     border: none;
     cursor: pointer;
     color : white;
     font-weight:bold;
     font-size:14px;
   }
   
   .reviewBtn:hover {
      opacity : 0.8;
   }
   
   .reviewContainer {
     padding: 16px;
     max-width: 970px;
   }
   
   /* The Modal (background) */
   .modal {
     display: none; /* Hidden by default */
     position: fixed; /* Stay in place */
     z-index: 1; /* Sit on top */
     left: 0;
     top: 0;
     width: 100%; /* Full width */
     height: 100%; /* Full height */
     overflow: auto; /* Enable scroll if needed */
     background-color: rgb(0,0,0); /* Fallback color */
     background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
     padding-top: 60px;
   }
   
   .modal label {
      font-size:14px;
   }
   
   /* Modal Content/Box */
   .modal-content {
     background-color: #fefefe;
     margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
     border: 1px solid #888;
     width: 80%; /* Could be more or less, depending on screen size */
   }
   
   /* The Close Button (x) */
   .closeBtn {
     position: absolute;
     right: 25px;
     top: 0;
     color: #000;
     font-size: 35px;
     font-weight: bold;
   }
   
   .closeBtn:hover,
   .closeBtn:focus {
     color: red;
     cursor: pointer;
   }
   
   /* Add Zoom Animation */
   .animate {
     -webkit-animation: animatezoom 0.6s;
     animation: animatezoom 0.6s
   }
   
   @-webkit-keyframes animatezoom {
     from {-webkit-transform: scale(0)} 
     to {-webkit-transform: scale(1)}
   }
     
   @keyframes animatezoom {
     from {transform: scale(0)} 
     to {transform: scale(1)}
   }
   
   /* Change styles for span and cancel button on extra small screens */
   @media screen and (max-width: 300px) {
     .reviewBtn {
        width: 100%;
     }
   }
/* 리뷰 모달 스타일 끝 */

/* 별점 스타일 */
   #star_grade {
      margin : 0;
   }
   #star_grade a{
       text-decoration: none;
       color: gray;
       font-size : 25px;
   }
   #star_grade a.on{
       color: #D98E04;
   }
   
   #starAvg p, #resultStar span {
         font-size : 25px;
   }
   
   #starAvg a {
         text-decoration:none; 
         font-size:30px;
   }

/* 별점 스타일 끝 */

/* 리뷰 리스트 스타일 */
   .collapsible {
    /*  background-color: #777;
     color: white; */
     background-color : white;
     color : grey;
     cursor: pointer;
     padding: 18px;
     width: 100%;
     border: none;
     text-align: left;
     outline: none;
     /* font-size: 15px; */
   }
   
   .active, .collapsible:hover {
     /* background-color: #555; */
   }
   
   .content {
     padding: 0 18px;
     max-height: 0;
     overflow: hidden;
     transition: max-height 0.2s ease-out;
   }
   
   .rBtn {
     background-color: #637365; 
     border: none;
     color: white;
     padding: 3px 12px;
     text-align: center;
     text-decoration: none;
     display: inline-block;
     font-size: 16px;
     margin: 4px 2px;
     cursor: pointer;
     float:right;
   }
   
   #addReplyBtn,
   #writeReviewBtn {
    height: 43.75px;
	  background-color: #8FA691; 
	  border: none;
	  color: white;
	  padding: 10px 20px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  transition-duration: 0.4s;
	  cursor: pointer;
	   float:  right;
   }
   
   #addReplyBtn:hover,
   #writeReviewBtn:hover {
   height: 43.75px;
	  background-color: #F0F2F0 ; 
	  color: #8FA691; 
	  padding: 0px 20px;
	  border: 2px solid #8FA691;
   
   }
   
   #addReplyBtn:focus,
   #writeReviewBtn:focus{ 
    outline: none; 
}
   
   
   .pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 2;
    color: #fff;
    cursor: default;
    background-color: #637365 !important;
    border-color: #637365 !important;
    
    
}
   
    #prdReviewContent {
    	padding-top: 50px;
    }
    
/* 리뷰 리스트 끝 */

/* 평균 별점 스타일 */
input[type=range] {
   opacity: 0;
   width: 100%;
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   bottom: 0;
}

.star-rating-container {
   background: url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIwIDIwOyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+PHN0eWxlIHR5cGU9InRleHQvY3NzIj4uc3Qwe2ZpbGw6I0U2RTZFNTt9PC9zdHlsZT48cG9seWdvbiBjbGFzcz0ic3QwIiBwb2ludHM9IjEyLjgsMTEuOSAxNC43LDE3LjUgMTAsMTMuOCA1LjMsMTcuNSA3LjIsMTEuOSAyLjUsOC4xIDguMSw4LjEgMTAsMi41IDExLjksOC4xIDE3LjUsOC4xICIvPjwvc3ZnPg==");
   width: 198px;
   background-size: 40px 40px;
   height: 40px;
   position: relative;
   float : left;
}

.star-rating-container .avg {
   background: url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIwIDIwOyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+PHN0eWxlIHR5cGU9InRleHQvY3NzIj4uc3Qwe2ZpbGw6I0Q5OEUwNDt9PC9zdHlsZT48cG9seWdvbiBjbGFzcz0ic3QwIiBwb2ludHM9IjEyLjgsMTEuOSAxNC43LDE3LjUgMTAsMTMuOCA1LjMsMTcuNSA3LjIsMTEuOSAyLjUsOC4xIDguMSw4LjEgMTAsMi41IDExLjksOC4xIDE3LjUsOC4xICIvPjwvc3ZnPg==");
   background-size: 40px 40px;
   height: 100%;
   position: absolute;
   top: 0;
   left: 0;
   right: 100%;
}

/* 평균 별점 끝 */
</style>
    
</head>
<body>


<jsp:include page="../includes/header.jsp" flush="false"/>
<jsp:include page="../includes/menuBar.jsp" flush="false"/>

<jsp:include page="RecentlySeen.jsp" flush="false"/>

<%@include file="../includes/basketSlide.jsp" %>

<!-- 아이템 상세페이지 body 시작 -->
<div class = "itemDiv">


   <!-- 아이템 요약 body 시작 -->
    <div class="itemContainer">
          <div class="grid menu">
            <div class="column-xs-4 column-md-6">
              <ul>
                <li class="nav-item" style="font-size:20px; ">
                   <a class='move'>
                      <c:out value="${shopName}"/>
                   </a>
                </li>
              </ul>
            </div>
            <form id='actionForm' action="/product/store" method='get'>
             <input type='hidden' name='idNo' id="idNo" value='<c:out value="${product.idNo}"/>'>
         </form> 
          </div>
        </div>
  
        <div class="itemContainer">
        
        <!-- 
          <div class="grid second-nav">
            <div class="column-xs-12">
              <nav>
                <ol class="category-list">
                  <li class="category"><a href="#" style="color:#888888;">대분류</a></li>
                  <li class="category"><a href="#" style="color:#888888;">중분류</a></li>
                  
                  <li class="category active">소분류</li>
                </ol>
              </nav>
            </div>
          </div>
         -->

          
          <div class="grid product">
            <div class="column-xs-12 column-md-7">
              <div class="product-gallery">
                <div class="product-image">
                  <img class="active" src="/resources/upload/<c:out value="${product.idNo}"/>/<c:out value="${product.itemImg1}"/>">
                </div>
                <ul class="image-list">
                  <li class="image-item"><img src="/resources/upload/<c:out value="${product.idNo}"/>/<c:out value="${product.itemImg1}"/>" ></li>
                  <li class="image-item"><img src="/resources/upload/<c:out value="${product.idNo}"/>/<c:out value="${product.itemImg2}"/>"></li>
                  <li class="image-item"><img src="/resources/upload/<c:out value="${product.idNo}"/>/<c:out value="${product.itemImg3}"/>"></li>
                </ul>
              </div>
            </div>



<!-- 테스트용 form 태그 -->
<!-- <form id="addToBasket" name=addToBasket  method="post"> -->



            <div class="column-xs-12 column-md-5">
              <p style="color:#404040; font-size:25px; font-weight:bold; margin-bottom: 0px; "><c:out value="${product.itemName}" default="itemName"/></p>
                <p style="font-size:15px; font-weight:bold; margin-bottom:20px;"><c:out value="${product.itemContent}" default="itemContent"/></p>
                
                <p style="margin-bottom: 0px; color:#404040;">주주할인가</p>
              <p style="color:#404040; font-size:25px; font-weight:bold; margin-bottom:0px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}" /><span style="font-size:20px;">원</span><span id="dcPercent"></span></p>
                <p style="text-decoration:line-through; color:#C6C6C6; font-size: 17px; font-weight:bold;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.normPrice}" />원  </p>
              
              
              
              <div class="item-describe-line"></div>
              
              <div style="font-size:15px;">
              
              <div>
              	배송구분	<span style="float:right; font-weight:bold;">택배배송</span>
              </div>
              
               <div class="item-describe-line"></div>
              
              <div>
              	원산지	<span style="float:right; font-weight:bold;">국산</span>
              </div>
              
               <div class="item-describe-line"></div>
              
              <div>
              	포장타입	<span style="float:right; font-weight:bold;">종이포장</span>
              </div>
              
              </div>
               <div class="item-describe-line"></div>
              
              <!-- 수량 증감 부분 시작 -->
              
              <div>
              
              <span>구매수량</span>
              
              
              <div style="float:right">
                 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            
            <div class="up-down">
              <button id="numdown"><i class="fas fa-minus"></i></button>
            <input value="1" min="1" size="2" id="input-view" name="number" readonly="readonly" style="height:25px; border:solid 1px #637365; text-align: center;" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
              <button id="numup"><i class="fas fa-plus"></i></button>
            </div>
              </div>
              
              </div>
              <!-- 수량 증감 부분 끝 -->
              
               <div class="item-describe-line"></div>
              
              <p style="color:#404040; font-size:15px; margin-bottom:20px; float:right;"> 총 상품금액 : <span id="totalPrice" style="color:#404040; font-size:25px; font-weight:bold;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}" /></span>원 </p>
              
              <!-- 품절, 판매중지 인 상품 장바구니로 못넘어가게 하기 -->
              <c:if test="${product.saleStat=='품절'||product.saleStat=='판매중지'}">
                 <button type="submit" class="add-to-basket" value="${product.itemCode}"  onclick="alert('죄송합니다. 구매 불가한 상품입니다.')" style="font-size: 15px; float:right;" >장바구니 담기</button>
              </c:if>
              <c:if test="${product.saleStat!='품절' && product.saleStat!='판매중지'}">
                 <button type="submit" class="add-to-basket" value="${product.itemCode}"  onclick="addToBasketEvent(this.value)" style="font-size: 15px; float:right;" >장바구니 담기</button>
              </c:if>
              
             
            </div>
            

            <input type="hidden" value="${product.itemCode}" id="itemCode"/>
            <input type="hidden" value="${product.price}"  id="itemPrice"/>
            

<!-- </form> -->
<!-- 테스트용 form 태그 -->




          </div>
         
        </div>
        <!-- 아이템 요약 body 끝 -->
     
     
     
     
     
        <!-- 상품 상세 정보 body 시작 -->
        
        <div id="prdInfo">
        
        <jsp:include page="MoveBar.jsp" flush="false"/>
        
        <!-- <h1>상품 상세 정보 영역</h1> -->
        <img style="margin: 0px auto; margin-top: 20px; margin-bottom: 20px;" src="/resources/upload/<c:out value="${product.idNo}"/>/<c:out value="${product.imgDetail}"/>">
        
        </div>
     
        <!-- 상품 상세 정보 body 끝 -->
     
     
     
     
     
     
     
        <!-- 상품평 body 시작 -->
     
     <div id="prdReview">
     
     <jsp:include page="MoveBar.jsp" flush="false"/>
     
     	<div id="prdReviewContent">
     
     
        	<p id="moveContentTitle">상품평</p>
        <!-- 리뷰 갯수 표시 -->
        <h4 id="reviewAmount"></h4> 
        
      

        <!-- 평균 별점 구현 중 -->
        <div id="starAvg">
           <div id="resultStar" class="star-rating-container" data-star-rating-average=""></div>
              &nbsp;&nbsp;
              <span id="avg"></span> <span>/5.0</span>
        </div>
      
      <!-- 리뷰 남기기 버튼 -->
        <button id="writeReviewBtn" onclick="orderCheck()" style="width:auto; float:right;">리뷰 남기기</button>
        <br>
        
        <!-- 리뷰 리스트 영역 -->
        <div id="reviewDiv">
            <!-- 
            <div style="float: left; width: 20%; font-weight:bold;">아이디 자리</div> 
              <div style="float: left; width: 80%; font-weight:bold; text-align:right;">
               2020/07/19
            </div>
              <div style="font-weight:bold;">별점자리</div>
            
              <div style="float: left; width: 20%;">
               <img style="height:75px;" src="/resources/images/noImg.png">
            </div>
              <div style="width:80%; float:left">
                 <button class="collapsible">위치보기</button>
               <div class="content">
                 <p style="">위치 조절중..</p>
                 <button class="btn" style="background-color: #f44336;">삭제</button>
                 <button class="btn">수정</button>
               </div>
              </div> 
              -->
        </div>
        
        
               
     	</div> 
        
        
      <!-- 리뷰 등록 모달 영역 -->
      <div id="review" class="modal">
        <div class="modal-content animate" style="max-width:798px;">
          <div class="imgcontainer">
            <span onclick="modalClose();" class="closeBtn" title="Close Modal">&times;</span>
          </div>
      
          <div class="reviewContainer">
             <label for="title"><b>리뷰 제목</b></label>
            <input type="text" name="reviewTitle" id="reviewTitle" class="reviewtext" placeholder="리뷰 제목을 남겨주세요." required> <br>
      
            <label for="content"><b>리뷰 내용</b></label>
            <textarea name="reviewContent" id="reviewContent" class="reviewtext" rows=5 cols=40 placeholder="내용을 입력하세요.&#10;※ 욕설, 영업에 방해되는 글은 관리자에 의해 삭제됩니다." style="resize:none;"></textarea>
            
            <label for="img"><b>이미지 첨부</b></label>
            <input type='file' name="reviewImg" id="reviewImg" accept="image/gif, image/jpeg, image/png, image/jpg" />
         <input type="hidden" id="imgValue">
         
            <label for="score"><b>별점</b></label> <br>
              <p id="star_grade">
              <a href="#" id="score1" score="1" onclick="scoreAction($(this).attr('score'));">★</a>
              <a href="#" id="score2" score="2" onclick="scoreAction($(this).attr('score'));">★</a>
              <a href="#" id="score3" score="3" onclick="scoreAction($(this).attr('score'));">★</a>
              <a href="#" id="score4" score="4" onclick="scoreAction($(this).attr('score'));">★</a>
              <a href="#" id="score5" score="5" onclick="scoreAction($(this).attr('score'));">★</a>
              </p>
           
            <!-- 로그인 idNo -->
              <input type="hidden" id="sessionId" value='<c:out value="${sessionMember.idNo}"/>'>
              <input type="hidden" id="sellerId" value='<c:out value="${product.idNo}"/>'>
            <!-- 글쓴이 idNo -->
              <input type="hidden" name="idNo" id="idNo">
              <input type="hidden" name="score" id="score" value="0">
              <input type="hidden" name="itemCode" value="${product.itemCode}">
              <input type="hidden" name="reviewNo" id="reviewNo">
            
            <button class="reviewBtn" id="reviewBtn">등록하기</button>
            <button style="display:none;" class="reviewBtn" id="updateBtn">수정하기</button>
          </div>
        </div>
      </div>
      
      <div class="reviewPage">
      
      </div>
     </div> <!-- prdReview 끝 -->
     <!-- 상품평 body 끝 -->
     

      <!-- 상품 문의 body 시작 -->
     
     <div id="prdQnA">
     
     <jsp:include page="MoveBar.jsp" flush="false"/>
     
     <p id="moveContentTitle">상품 문의</p>
     
     <!-- 상품 문의 댓글 영역 -->
         <div class = "reply-main"  id = "regiBtn">
               <h4 class="reply-title" id="replytitle"></h4>
               <div id = "" class=''>
                     <div class="form-grop regiBtn">
                           <textarea class ="form-control replyContent" id="replyContentBtn"  rows='5'  name='replyContent' placeholder ='문의글은 1~600자에 맞게 입력해주세요' style='resize:none;'></textarea></div>
                            <button id ='addReplyBtn' class='btn btn-primary btn-xs pull-right'>문의글 남기기</button>
                            
                            <div class="form-grop">
                             <input class ="form-control"  type="hidden"id ="idNoBtn"  name='idNo' value="${sessionMember.idNo}" readonly="readonly"></div>
                             <input class ="form-control"  type="hidden" id =""  name='' value="${sessionMember.emailAccount}" readonly="readonly"></div>
                             <div class="form-grop">
                                
                             <input class ="form-control"  type="hidden" type="hidden" id ="replyDepth"  name='replyDepth' value='0' readonly="readonly"></div> 
                           
                             <input class ="form-control" type="hidden" id ="replyCount"  name='replyCount' value='1' readonly="readonly"></div>
                             <div class="form-grop">
                           
                            <input class ="form-control" type="hidden" id ="replyCode"  name='replyCode' value='1' readonly="readonly"></div>
                            <div  style='display:none' class="form-grop">
                        
                            <input class ="form-control" type="hidden" id ="itemCode"  name='itemCode' value='itemCode' readonly="readonly"></div>
                                 <div class="panel-heading">
              
                               <!--       <div class="form-grop">
                                <label>replyDate</label>
                                <input class ="form-control" name='regDate' value=''></div> -->                                      
                                              
   <!--             </div>regiBtn
   
             </div>  reply-main end -->
   
         
               <div id ="list">   
               <div class="panel-body" style="padding:0; margin-top: 30px;">  <!-- 댓글 목록 리스트 -->          
               <ul class="chat">
               <!--  start reply -->
               <li class="left clearfix" data-itemCode='itemCode'>
                    <div>
                       <div class="header">
                       <strong class="primary-font">작동이앙대</strong>
                       <small class="pull-rigth text-muted">2018-01-01 13:13</small>
                      </div>
                   <p>Good jop!</p>
                   </div>
                   </li>
                   <!--  end reply -->
               </ul> <!--  end ul -->
                
                   </div><!-- 댓글 div 마지막 -->
               
                        <div class="panel-footer" style="background-color: white; border-top: none;">
               
               
                         </div>
               <!--  /.panel .chat-panel -->
                 </div><!-- RemoveBtn end -->
        
        <!-- 상품 문의 댓글 영역  끝-->
               </div> <!-- /,panel-heading -->
        
     </div>
  
     <!-- 상품 문의 body 끝 -->
        
        
        
        <!-- 배송안내 body 시작 -->
     
        <div id="delieveryInfo">
        
        <jsp:include page="MoveBar.jsp" flush="false"/>
        
        <p id="moveContentTitle">배송 안내</p>
        
           <div style="font-size: 15px;  line-height: 25px;">

              기본 배송료 : 2500원 (도서산간 지역 배송비 추가) <br>
              무료 배송 : 100,000원 이상 구매 시 (도서산간 지역 200,000원 이상 구매 시) <br>
              상품배송 <br>
                  - 결제 완료 후 1~2일 이내 도착 <br>
                  - 영업일 오후 3시 이전 주문 시 : 당일 발송 <br>
                  - 영업일 오후 3시 이후 주문 시 : 명일 발송 <br>
                  - 토, 일 공휴일 주문 시  : 휴일 이후 영업일 첫날 발송 <br>
              ※ 천재지변, 명절(설/추석)에는 택배사 배송 물량 폭주로 배송이 지연될 수 있으니 양해 부탁드립니다. <br>
              
      
      
          </div>
          
          <h1> </h1>
        
        </div>
     
        <!-- 배송안내 body 끝 -->
     
     
     
       <!-- 교환 및 반품 body 시작 -->       
     
        <div id="refundInfo">
        
        <jsp:include page="MoveBar.jsp" flush="false"/>
        
       <p id="moveContentTitle">교환 및 반품</p>
        
        <div  style="font-size: 15px; line-height: 25px;">
		          교환 및 반품은 배송 완료 후 7일 이내까지 가능 <br>
		         - 제품 품질 이상, 오 배송의 경우 교환 및 반품 비용은 회사에서 부담합니다. <br>
		         - 고객님의 단순 변심의 경우 교환 및 반품 비용은 본인 부담입니다. <br>
		          ※ 상품을 확인하기 위해 택배 박스의 포장은 제거할 수 있으나, 내부 상품을 보호하는 <br>
		         비닐을 제거할 경우 반품할 수 없습니다. 내부 상품을 보호하는 비닐은 투명 비닐을 <br>
		         사용했기 때문에 비닐을 제거하지 않아도 충분히 상품을 확인할 수 있습니다. <br>
      
      </div>
      
      <h1> </h1>
        
        </div>
       <!-- 교환 및 반품 body 끝 -->       

</div>

<!-- 아이템 상세페이지 body 끝 -->    

</body>

<!-- 상품평 스크립트 -->
<script type="text/javascript" src="/resources/js/prdreply.js"></script>  <!--댓글 스크립트. 경로인듯  -->
<script type="text/javascript">
 
/* 상품 문의 댓글 시작 */   
   
$(document).ready(function(){

         var itemCode = $("#itemCode").val();
         var replyUL = $(".chat");
   
         showList(1);//<댓글 호출 매서드
   
               function showList(page){

              console.log("showList" + page);
              prdreplyService.getList({itemCode:itemCode,page: page || 1},
                 function(prdReplyCnt,list){
                    
              
                   
                 if(page == -1){
                    pageNum = Math.ceil(prdReplyCnt/10.0);
                    showList(pageNum);
                    return;
                  }
                 
                 
                   var str="";
                          if(list == null || list.length == 0){
                          replyUL.html("");
                         return;
                          }

          //문의글 , 답글 구현
          var j = 0;
            for(var i = 0, len =list.length || 0; i <len; i++){
            
           var replyDepth = list[i].replyDepth;
           var replyCount = list[i].replyCount;
     
           
            

                 if(replyDepth==0){
                	 str += "<ul><li class='left clearfix' data-replyNo ='"+list[i].replyNo+"' data-text='"+list[i].replyContent+"'>";
                	 str += "<div class='header'><input type='hidden' class='primary-font' value='"+list[i].idNo+"'>";
                     
                     str += "<div class='emaile'><strong class='primary-font'>"+list[i].emailAccount+"</strong>";
                     str += "<div><small class ='pull-right text-muted'>"+prdreplyService.displayTime(list[i].regDate)+"</div></small>" ;    
                     str += "<div><pre style='background-color: white; border: none;' class='text' id='text' rows='5'>"+list[i].replyContent+"</pre>";
                     str += "<div id='reDiv"+i+"'><input type ='hidden' value='"+list[i].replyDepth+"'></input>";
                     str += '<button id="replybtn" class ="replybtn" >답글달기</button> <br></div></div></div>'; 
                   
                     j=i
                     }else{
      
                    str += "<ul><li class='left clearfix' data-replyNo ='"+list[i].replyNo+"' data-text='"+list[i].replyContent+"'>";
                    str += "<div class='header'><input type='hidden' class='primary-font' value='"+list[i].idNo+"'>";
                    str += "<div class='emaile'><strong class='primary-font'>"+list[i].emailAccount+"</strong>";
                    str += "<div><small class ='pull-right text-muted'>"+prdreplyService.displayTime(list[i].regDate)+"</div></small>" ;    
                    str += "<div>"+'&nbsp&nbsp; >>>답글:'+"<pre class='text' id='text' rows='5'>"+list[i].replyContent+"</pre>";
                    str += "<div id='reDiv"+i+"'><input type ='hidden' value='"+list[i].replyDepth+"'></input>";
                    str += '<button id="replybtn" class ="replybtn" style="display:none" >답글달기</button> <br></div></div></div>';
                     
                    
                 }
            //문의글 , 답글 구현 end
           
            str += '<div class="dropdown">';
            str += '<button class="dropbtn">:</button>';
            str += '<div id="myDropdown" class="dropdown-content">';
            str += '<button id="modify" class ="modify" style="background-color: white; border: solid 1px lightgray;">수정</button> <br>';
            str += '<button id="delete" class ="deletebtn" style="background-color: white;  border: solid 1px lightgray;">삭제</button>';
            str += '</div></div></li></ul>'
      
         }
         replyUL.html(str);
         showReplyPage(prdReplyCnt);
         
          //글쓴사람만 삭제가능
          var idSession = $("#idNoBtn").val();
          var idCode = "";
          for(var i = 0; i< $(".header").length;i++){
        	  
		   		idCode = $(".header")[i].children[0].value;
		   		
	   			if(idCode!=idSession){
	   				 	$(".header")[i].children[2].children[0].style.display = "none"; 
	   				 	$(".header")[i].children[2].children[1].style.display = "none"; 
	   					$(".header")[i].children[2].children[1].children[0].style.display = "none"
	   					$(".header")[i].children[2].children[1].children[1].style.display = "none"
	   					$(".header")[i].children[2].children[1].children[2].style.display = "none"
	   			}
       	   
          }
          
          var sessionId = $("#sessionId").val();
          var sellerId = $("#sellerId").val();
    		
          console.log(sessionId);
          console.log(sellerId);
          
           if(sessionId!=sellerId){
        	   for(var i = 0; i <=j; i++){
        		   $("#reDiv"+i)[0].style.display ="none";
        	   }
        	   //$(".header")[0].children[1].children[2].children[1].children[1].style.display="none"; 
        	 
        
        	   
           }
      //    <input type="hidden" id="sessionId" value='<c:out value="${sessionMember.idNo}"/>'>
      //    <input type="hidden" id="sellerId" value='<c:out value="${product.idNo}"/>'>
      
      
           
         
                });//end function
                
                
               }//end showList
               
               
               
               
              //문의 입력  start
               var regiBtn = $("#regiBtn")
  
               $("#regiBtn").on("click","button[id='addReplyBtn']",function(e){
                  
               
               if($("#replyContentBtn").val() == ''||$("#replyContentBtn").val().trim()==""||$("#replyContentBtn").val().length>600){
                     
                    alert("댓글양식에 맞게 입력해주세요(1~600자)");
                    return false;
                      
               }
               console.log("#idNoBtn");
             console.log("#replyContentBtn");
             console.log("#replyDepth");
             console.log("여기야야양ㄻㅇㄴㄹㅇㄴㄻㄴㄹㅇㄴ");
             
      
               prdreplyService.add(
                     
                    
                    {idNo:$("#idNoBtn").val(), replyContent:$("#replyContentBtn").val(),  itemCode:$("#itemCode").val(),
                    replyDepth:$("#replyDepth").val(), replyCount:$("#replyCount").val(), replyCode:$("#replyCode").val(),
                    },
                         
                         
                        
                function(result){
                            
                
                    var replyContent = $(".replyContent").val();
                    console.log(replyContent);
                alert("댓글이 등록되었습니다.");
                 $("#replyContentBtn").val("");
                   showList(pageNum);
                 }); 
            });
             //문의 입력 end
             
             
             //답글글처리(대댓글)
             $(document).on("click","button[id='replybtn']", function(e) {
               
               
                   var replybtn = $("#replybtn")
                   var target = e.target; 
                   var replyLi = $(target).closest("li");
                   var replyNodata = replyLi.data("replyno");
                        
                   console.log(replyNodata);

                   $(".replyDiv").remove();
                   $(".commentEditDiv").remove();
                 

                 
                    var replyDiv = document.createElement("div");
                    replyDiv.setAttribute("class", "replyDiv");
                  
                    var textArea = document.createElement("textarea");
                    textArea.setAttribute("id", "replyTextarea");
                    textArea.setAttribute("placeholder", "댓글을 입력해주세요");
                    textArea.setAttribute("style", "width:100%; height:100px;");           
                    /* textArea.setAttribute("style", "height:1000px;");   */         
                    textArea.setAttribute("resize", "none");
                    
                    
                    var replyNo = document.createElement("input");
                    replyNo.setAttribute("id","replyNo");
                    replyNo.setAttribute("type","hidden");
                    replyNo.setAttribute("value",replyNodata);
                    
                    
                    var reCommentRegBtn = document.createElement("button");
                    reCommentRegBtn.setAttribute("class", "reCommentRegBtn");
                    reCommentRegBtn.innerHTML="답변 등록";

                    replyDiv.appendChild(textArea);
                    replyDiv.appendChild(replyNo);
                    
                    replyDiv.appendChild(reCommentRegBtn);
                     
                    e.target.after(replyDiv);
               //대댓글처리 창 만들기 end
             
             
             });
      
               // 대댓글 등록버튼 이벤트
          $(document).on("click","button[class='reCommentRegBtn']", function(e){
      
             var replyRegister = $("#replyTextarea").val()
             var replyNo = $("#replyNo").val()
             var sessionId = $("#sessionId");
   
                      prdreplyService.replyadd(
                         {idNo: sessionId.val() , replyContent:replyRegister,       
                          itemCode:$("#itemCode").val(),replyDepth:1,
                         replyCount:$("#replyCount").val(), replyCode:01 ,  
                         replyNo : replyNo
                         },
                                  
                         function(result){
                        e.preventDefault();
                         var replyContent = $(".replyContent").val();                                       
                         console.log(replyContent);
                         alert("댓글이 등록되었습니다. : " + result);
                         $("#replyContentBtn").val("");
                         showList(1);
                  }); 
                 
          });
      
             // 대댓글 등록버튼 이벤트 end

       //: . dropDown 클릭시발생하는 이벤트


       $(document).on("click","button[class='dropbtn']", function(e){

           var target = e.target
             //var replyLi = $(target).parent().parent().parent();
             var replyLi = $(target).closest("li");
             var replyNo = replyLi.data("replyno");
           
             $(target).parent().find("#myDropdown").toggle("show");

             
              if (!event.target.matches('.dropbtn')) {
                  var dropdowns = $(target).parent().find("#myDropdown");
                   var i;
                          for (i = 0; i < dropdowns.length; i++) {
                         var openDropdown = dropdowns[i];
                              if (openDropdown.classList.contains('show')) {
                               openDropdown.classList.remove('show');
               
                               }
                          }
            }
             
     });//: . dropDown 클릭시발생하는 이벤트 end
       
       
        
      $(document).on("click","button[id='delete']", function(e) {
               
          var target = e.target;
          
          console.log(target);
          //var replyLi = $(target).parent().parent().parent();
          var replyLi = $(target).closest("li");
 
          var replyNo = replyLi.data("replyno");
          
          var ids = replyLi.data("id");
          
          
          var replyContent = '삭제된 댓글입니다.';
          var replyCount = '2';
          console.log("replyNo == " + replyNo);
          
       
                
                  prdreplyService.update({
                      
                     
                      replyNo  : replyNo,    
                      itemCode : itemCode,
                      replyContent : replyContent,
                      replyCount : replyCount

               
               },function(result){
                  
                     alert("수정 완료 ........")
                     showList(pageNum);
                  
                     
                });
        
          /* prdreplyService.remove(replyNo , function(count){
            
             console.log(count);
             
             if(count === "success"){
                showList(pageNum);
                alert("REMOVED");
                
                
             }
          }, function(err){
           alert('ERROR....')   
             
          });  */
 
    });       //문의글 삭제, 댓글 삭제end
    
 
          //문의글 수정, 댓글수정
          $(document).on("click","button[id='modify']",function(e){
             if(e.preventDefault()){
                e.preventDefault();
             }else{
                e.returnValue = false;
             }
            
             $("#text").css("display","block");

               $(".replyDiv").remove();
               var target = e.target;
               var replyLi = $(this).closest("li");
               var replyNo = replyLi.data("replyno");
               var replyContent = replyLi.data("text");        
               

          
               //대댓글의경우 replyContent null, parent() 한개더 줘서 replyContetn 값을 줌

                  $(target).parent().parent().parent().parent().find("#text").css("display","none");
                  $(target).parent().parent().parent().find("#text").css("display","none");
                  $(target).parent().parent().parent().find("#replybtn").css("display","none");
             
               //수정하기 텍스트 구현
               var replyDiv = document.createElement("div");
               replyDiv.setAttribute("class", "replyDiv");

               var textArea = document.createElement("textarea");
               textArea.setAttribute("id", "replyTextarea");
               textArea.setAttribute("style", "width:100%; height:100px;");     
               $(textArea).html(replyContent);     

  /*              var replyNo = document.createElement("text");
               replyNo.setAttribute("id","replyNo");
               replyNo.setAttribute("visibility","hidden");
               textArea.setAttribute("resize", "none"); */
               
               
               var upBtn = document.createElement("input");      
               upBtn.setAttribute("id","upBtn");
               upBtn.setAttribute("type","button");
               upBtn.setAttribute("value","수정완료");
            
           
               /*replyNo.setAttribute("value",replyNodata);  */


        
               replyDiv.appendChild(textArea);
               replyDiv.appendChild(upBtn);
   /*          replyDiv.appendChild(replyNo); */
       /*         replyDiv.appendChild(replyNo); */

       
               
               $(target).parent().parent().after(replyDiv);
       
               
               $(document).on("click","input[id='upBtn']",function(e){
   
                  console.log("aaaa"+replyNo);
                  console.log("bbb"+itemCode);
                  console.log("ccc"+textArea.value);
                  replyContent = textArea.value;
                  
            
           /*      if(replyContent==''||replyContent.trim()==''||replyContent.length>600){
                   
                   alert("댓글은 1~600자에 맞게 입력해주세요")
                   return false;
                } */
          
                prdreplyService.update({
                      
                   
                      replyNo  : replyNo,    
                      itemCode : itemCode,
                      replyContent : replyContent

               
               },function(result){
                  
                     alert("수정 완료 ........")
                     showList(pageNum);
                  
                     
                });
                
                
               });
                  
          });//문의글 수정, 댓글수정 end
            
     
          
          //댓글 페이징처리 start
          var pageNum =1;
          var replyPageFooter = $(".panel-footer");
          
          function showReplyPage(prdReplyCnt){
               
             var endNum = Math.ceil(pageNum / 10.0) * 10;
             var startNum = endNum - 9;
             
             var prev = startNum !=1;
             var next = false;
             
             if(endNum * 10 >= prdReplyCnt){
                endNum = Math.ceil(prdReplyCnt/10.0);
             }
             if(endNum * 10 < prdReplyCnt){
                next = true;
             }
             
             var str = "<ul class='pagination pull-rigth'>";
             
             if(prev){
                str+= "<li class='page-item'><a style='background-color: #637365; border-color: white; color: white; border-top-right-radius: 4px; border-bottom-right-radius: 4px;' class='page-link' href='"+(startNum - 1)+"'>Previous</a><li>";
             }
                     
                 for(var i = startNum; i <= endNum; i++){
                    
                     var active = pageNum == i?"active":"";
                     
                     str+= "<li class='page-item"+active+"'><a style='background-color: #637365; border-color: white; color: white; border-top-right-radius: 4px; border-bottom-right-radius: 4px;'  class='page-link' href='"+i+"'>"+i+"</a><li>";        
                 }
                 if(next){
                    str+="<li class='page-item'><a style='background-color: #637365; border-color: white; color: white; border-top-right-radius: 4px; border-bottom-right-radius: 4px;'  class='page-link' href='"+(endNum+1)+"'>Next</a><li>";  
                 }
                  str += "</ul></div>";
                  console.log(str);
                  replyPageFooter.html(str);
          }
          
          
          replyPageFooter.on("click", "li a", function(e){
              e.preventDefault();
              console.log("page click");
              
             var targetPageNum = $(this).attr("href");
             
             console.log("targetPageNum:"  + targetPageNum );
             pageNum = targetPageNum;
             
             showList(pageNum);
          })
          
          
});//ready end
/* 상품 문의 댓글 끝 */
</script>

<script>

/* 상품 상세페이지 이미지 누르면 확대되는 기능 시작 */
const activeImage = document.querySelector(".product-image .active");
const productImages = document.querySelectorAll(".image-list img");

var totalPrice = document.getElementById("totalPrice");
var itemPrice = document.getElementById("itemPrice");

function changeImage(e) {
  activeImage.src = e.target.src;
}

productImages.forEach(image => image.addEventListener("click", changeImage));
/* 상품 상세페이지 이미지 누르면 확대되는 기능 끝 */


//3자리 단위마다 콤마 생성
    function addCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }


/* 수량 증감 부분 시작 */

$(document).ready(function(){
  x = $('#input-view').val();
    $('#numup').click(function(){
      x++;
      $('#input-view').val(x);
      totalPrice.innerHTML=addCommas(1*itemPrice.value*x);
      
    })
  $('#numdown').click(function(){
      x--;
      if(x <= 0){
          x=1;
          $('#input-view').val(x);
        }else{
          $('#input-view').val(x);
        }  
      totalPrice.innerHTML=addCommas(1*itemPrice.value*x);
      
    });


    // reviewList 출력
    showList(1);

});
 
/* 수량 증감 부분 끝 */


/* 리뷰 부분 시작 */

      var modal = document.getElementById('review');
   
      // 모달 다른 부분 눌러서 끄기
      window.onclick = function(event) {
      if (event.target == modal) {
           modal.style.display = "none";
          }
      }
      
    // 모달 x로 끄기
      function modalClose() {
         document.getElementById('review').style.display='none';
         // 이미지 초기화
         $("#imgValue").val('');
         // 별점 초기화
         for(var i=1; i<=5; i++) {
           $("#score"+i).parent().children("a").removeClass("on"); 
         }
      }
    
      // 별점 주기
      $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
          $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
          return false;
      });
   
      // 별점 가져오기
      function scoreAction(score) {
       $("#score").val(score);
      }
   
      // 주문 한 사람인지 비교
      function orderCheck() {
        var sessionId = $("#sessionId").val();
        var itemCode = $("#itemCode").val();
       
        $.ajax({
              url : '/review/orderCheck',
              data : {idNo : sessionId, itemCode : itemCode},
              type : 'POST',
              success : function(result) {
                 if(result == 'success') {
                    document.getElementById('review').style.display='block';
                     
                     // 버튼 및 내용 초기화
                     $("#reviewBtn").show();
                     $("#updateBtn").hide();
                     $("#reviewTitle").val("");
                     $("#reviewContent").val("");
                     $("#reviewImg").val("");
                     $("#score").val("0");
                     $("#reviewNo").val("");
                     $("#star_grade a").parent().children("a").removeClass("on");
                 }else {
                   alert("상품 후기는 상품을 구매하시고 배송완료된 회원 분만 작성 가능합니다.");
                    return false;
                 }
              }
           });
      }
      
      // 이미지 체크
      var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|PNG|JPG)$");
    var maxSize = 5242880;
    
    function checkExtension(fileType, fileSize) {
       if(fileSize >= maxSize) {
          alert("이미지 사이즈 초과입니다.");
          return false;
       }
       
       if(!regex.test(fileType)) {
          alert("이미지만 업로드 가능합니다!");
          return false;
       }
       return true;
    }
    
    // 리뷰 이미지 업로드 할 때
    //var uuidImgName = "";   // 업로드된 파일 이름 저장하기 위한 변수
    var uploadResult = false;   // 업로드 success 여부
    
    $("input[type='file']").change(function(e) {
       var formData = new FormData();
         var inputFile = $("input[name='reviewImg']");
         var files = inputFile[0].files;
         console.log(files);
         
         for(var i=0; i<files.length; i++) {
            if(!checkExtension(files[i].name, files[i].size) ) {
               return false;
            }
            formData.append("uploadFile", files[i]);
         }
        formData.append("itemCode", $("#itemCode").val());
         
         $.ajax({
            url : '/review/uploadAjaxAction',
            processData : false,
            contentType : false,
            data : formData,
            type : 'POST',
            dataType : 'json',
            success : function(result) {
               console.log(result);
               $("#imgValue").val(result.toString());
               uploadResult = true;
            }
      });   // $.ajax
         
    });
   
      // 리뷰 등록
      $("#reviewBtn").on("click", function(e) {
         console.log(uploadResult);

       if($('#reviewTitle').val()=='' || $('#reviewTitle').val().trim() == '') {
           alert('리뷰 제목을 입력해주세요.');
            $('#reviewTitle').focus();
            return false;
         }else if($('#score').val()=='0') {
           var scoreResult = confirm("별점을 선택하지 않으면 0점으로 반영됩니다. 그대로 진행하시겠습니까?");
            
           if(!scoreResult) {
               return false;
            }
         }
       
       if($('#reviewImg').val() != '' && uploadResult == false) {
          alert("이미지가 제대로 첨부되지 않았습니다. 다시 시도해주세요.");
          return false;
       }
       
         var sendData = JSON.stringify(
               {reviewTitle:$('#reviewTitle').val(), reviewContent:$('#reviewContent').val(), 
                     reviewImg:$('#imgValue').val(), score:$('#score').val(),
                     idNo:$('#sessionId').val(), itemCode:$('#itemCode').val()
               });

         $.ajax({
           url : '/review/regReview',
            data : sendData,
            type : 'POST',
            contentType : "application/json; charset=utf-8",
            success : function(result) {
               document.getElementById('review').style.display = "none";
               alert("상품평이 정상적으로 등록되었습니다.");
               showList(1);
            },error : function(er) {
               alert("통신 오류입니다. 잠시 후 다시 시도해주세요.");
               error(er);
            }
         }); // $.ajax
         
   }); // 등록 event
   
      // 상품 평 리스트 출력
    function getList(param, callback, error){
        
       var itemCode = param.itemCode;
        var page = param.page || 1;
        
        $.getJSON("/review/pages/"+itemCode+"/"+page+".json",
        function(data){
           if(callback){
               //callback(data);
               callback(data.reviewCnt, data.list);
             }
        }).fail(function(xhr,status, err){
           if(error){
               error();
              }
        });
   }
   
      var itemCode = $("#itemCode").val();
      var reviewList = $("#reviewDiv");
    
   function showList(page){
      
       getList({itemCode:itemCode,page: page || 1}, function(reviewCnt, list){
           //console.log(reviewCnt + " reviewCnt");
           //console.log(list + " list");
           
           if(page == -1) {
              pageNum = Math.ceil(reviewCnt/10.0);
              showList(pageNum);
              return;
           }
          
          var str="";
           
            if(list == null || list.length == 0){
               reviewList.html("");
                  return;
              }
            
            // list html 본문에 뿌리기
         for(var i = 0, len =list.length || 0; i <len; i++){
              var star = "";
               var stars = new Array();
            
               // 한 줄 마다 리스트
                 for(var j=0; j<list[i].score; j++) {
                   star += "★";
                 }
                 for(var x=list[i].score; x<5; x++) {
                    star += "☆";
                 }
                 stars[i] = star;
                 
                 // 한 줄 마다 사진
                 var path = "";
                 if(list[i].reviewImg != null) {
                    path = "src='/resources/review/" + list[i].itemCode + "/" + list[i].reviewImg + "'";
                 }
                 // 사진 없을 때
                 if(list[i].reviewContent == null) {
                    list[i].reviewContent = "";
                 }
                 
                 // 한 줄 마다 아이디 * 표시
                 var tmp = '';
                 for(z=0; z<list[i].emailAccount.substr(3).length; z++) {
                    tmp += '*';
                 }
                 var userId = list[i].emailAccount.substr(0,3).concat(tmp);
                 
                 str += "<div style='width:100%; overflow:hidden;'>";
                 str += "<div style='float: left; width: 20%; font-weight:bold;'>"+ userId +"</div>"; 
                 
                 str += "<div style='float: left; width: 80%; font-weight:bold; text-align:right;'>"+ displayTime(list[i].regDate) +"</div>"; 
                 str += "<div style='float: left; width: 100%; font-size:14px; font-weight:bold; color:#D98E04;'>"+ stars[i] +"</div>"; 
                 str += "<div style='float: left; width: 20%;'><img class='resultImg' style='height:75px;' "+ path +" /></div>"; 

                 str += "<div style='width:80%; float:left'>"; 
                 str += "<button class='collapsible'>"+ list[i].reviewTitle + "</button>";
                str += "<div class='content'>";
                str += "<input type='hidden' id='writer"+i+"' value="+ list[i].idNo +">"; 
                str += "<p style=''>"+ list[i].reviewContent +"</p>";
                str += "<button id='removeBtn' data-oper='"+ list[i].reviewNo +"' class='rBtn'>삭제</button>";
                str += "<button id='modifyBtn' data-oper='"+ list[i].reviewNo +"' class='rBtn'>수정</button>";
                str += "</div>";
                str += "</div>";

                str += "</div>";
                str += "<br><hr>"
            
              }
            
            // 아이디 체크해서 맞을 경우만 버튼 보이기
/*            var idNo = $("#writer").val();
           var sessionId = $("#sessionId").val();
           
           if(idNo != sessionId) {
               $('.rBtn').css('visibility', 'hidden');
           }else {
                 $('.rBtn').css('visibility', 'visible');
           }
 */
              reviewList.html(str);
            showReviewPage(reviewCnt); 
            getScore();

              
         // 리뷰 리스트 효과
         var coll = $(".collapsible");
             
              for (i = 0; i < coll.length; i++) {
                 coll[i].addEventListener("click", function() {
                       
                    this.classList.toggle("active");
                    var content = this.nextElementSibling;
                    
               console.log(this.nextElementSibling.children[2]);
               console.log(content.children[3]);
               var btn = content.children[3];
                    // 아이디 체크해서 버튼 숨기기
               var writer = content.children[0].value;
                    var sessionId = $("#sessionId").val();
                    
                    if(writer != sessionId) {
                       $(content.children[2]).css('visibility', 'hidden');
                       $(content.children[3]).css('visibility', 'hidden');
                      }else {
                       $(content.children[2]).css('visibility', 'visible');
                       $(content.children[3]).css('visibility', 'visible');
                      }
                       
                    if (content.style.maxHeight){
                         content.style.maxHeight = null;
                    } else {
                       content.style.maxHeight = content.scrollHeight + "px";
                    } 
            });
         }
             
      }); //end function
   } //end showList
   
   var pageNum = 1;
      var reviewPageFooter = $(".reviewPage");
      
      // review 페이징
      function showReviewPage(reviewCnt) {
         
         var endNum = Math.ceil(pageNum / 10.0) * 10;
         var startNum = endNum - 9;
         
         var prev = startNum != 1;
         var next = false;
         
         if(endNum * 10 >= reviewCnt) {
            endNum = Math.ceil(reviewCnt/10.0);
         }
         if(endNum * 10 < reviewCnt) {
            next = true;
         }
         
         var str = "<ul class='pagination pull-right'>";
         
         if(prev) {
            str += "<li class='page-item'><a class='page-link' href='" + (startNum -1) + "'> Previous </a></li>";
         }
         
         for(var i=startNum; i<=endNum; i++) {
            var active = pageNum == i ? "active" : "";
            str += "<li class='page-item " + active +" '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
         }
         
         if(next) {
            str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
         }
         
         str += "</ul></div>";
         //console.log(str);
         reviewPageFooter.html(str);
      }
      
      // 리뷰 페이지 이동
      reviewPageFooter.on("click", "li a", function(e) {
      e.preventDefault();
      // console.log("page click!");
      
      var targetPageNum = $(this).attr("href");
      // console.log("targetPageNum : " + targetPageNum);
      
      pageNum = targetPageNum;
      
      showList(pageNum);
      });
     
   // 시간 변환
      function displayTime(timeValue){
      
         var today = new Date();
         
         var gap = today.getTime() - timeValue;
         var dateObj = new Date(timeValue);
              
         var str = "";
           
         if (gap < (1000 * 60 * 60 * 24)){
           var hh = dateObj.getHours();
             var mi = dateObj.getMinutes() 
             var ss = dateObj.getSeconds();

             return[(hh > 9? '' : '0')+ hh, ':',(mi > 9 ? '': '0') + mi, ':',(ss > 9 ? '':'0') + ss].join('');
          
         }else {
              var yy = dateObj.getFullYear();
              var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
              var dd = dateObj.getDate();
   
              return [yy, '-', (mm > 9? '':'0') + mm, '-', (dd > 9 ? '' : '0') + dd].join('');
         }
      };
     
    // 삭제 기능
   $("#reviewDiv").on("click","button[id='removeBtn']", function(e){
      
        var target = e.target;
        var dataFormat = $(target).closest("button");
        var reviewNo = dataFormat.data("oper");
        console.log(reviewNo);
        
        var result = confirm("정말로 삭제하시겠습니까?");
        if (result) {
           $.ajax({
               type : 'delete',
                  url : '/review/' + reviewNo,
                  success : function(result){
                   alert("정상적으로 삭제되었습니다.");
                     showList(pageNum);
                  },error : function(er){
                    alert('통신 오류입니다. 잠시 후 다시 시도해주세요.');
                     error(er);
                  }
            });
         }else {
           return false;
        }
   });   // 삭제 function 끝
   
   
      // 수정할 내용 불러오기
      $("#reviewDiv").on("click","button[id='modifyBtn']",function(e){
         
         // 1. 모달 띄우기
         document.getElementById('review').style.display='block';
      
         // 2. 모달에 값 넣어진 채로(reviewNo 로 하나만 get해와야 할듯)
         var target = e.target;
        var dataFormat = $(target).closest("button");
        var reviewNo = dataFormat.data("oper");
        //console.log(reviewNo);
        $("#reviewNo").val(reviewNo);
      
         $.get("/review/" + reviewNo + ".json", function(result){
            // 버튼 보이기 숨기기, 각 값 넣어주기 
            $("#reviewBtn").hide();
            $("#updateBtn").show();
            $("#reviewTitle").val(result.reviewTitle);
            $("#reviewContent").val(result.reviewContent);
            $("#score").val(result.score);
            $("#reviewImg").val('');
            $("#imgValue").val(result.reviewImg);
         
            // 별점 불러와서 색칠
            $("#score"+result.score).trigger("click", function() {
               $(this).parent().children("a").removeClass("on"); 
               $(this).addClass("on").prevAll("a").addClass("on");
               return false;
            });

      }).fail(function(er){
           alert('통신 오류입니다. 잠시 후 다시 시도해주세요.');
            error(er);
         });
      });   // 수정할 내용 불러오기 끝
   
      // 3. 수정 버튼 눌렀을 때
      $("#updateBtn").on("click", function(e) {
      
       if($('#reviewTitle').val()=='' || $('#reviewTitle').val().trim() == '') {
           alert('리뷰 제목을 입력해주세요.');
            $('#reviewTitle').focus();
            return false;
         }else if($('#score').val()=='0') {
           var scoreResult = confirm("별점을 선택하지 않으면 0점으로 반영됩니다. 그대로 진행하시겠습니까?");
            if(!scoreResult) {
               return false;
            }
         }
      
         var reviewNo = $("#reviewNo").val();
         var sendData = JSON.stringify(
           {reviewTitle:$('#reviewTitle').val(), reviewContent:$('#reviewContent').val(), 
               reviewImg:$('#imgValue').val(), score:$('#score').val()
            });
      
         $.ajax({
            type : 'put',
            url : '/review/' + reviewNo,
            data : sendData,
            contentType : "application/json; charset=utf-8",
            success : function(result){
               document.getElementById('review').style.display = "none";
               alert("정상적으로 수정되었습니다.");
               showList(pageNum);
            },error : function(er){
               alert("통신 오류입니다. 잠시 후 다시 시도해주세요.");
               error(er);
            }
         });
         // 이미지  초기화
         $("#imgValue").val('');
        // 별점 초기화
         for(var i=1; i<=5; i++) {
           $("#score"+i).parent().children("a").removeClass("on"); 
         }
         
      });   // 수정기능 끝
      
    // 평균 별점 뽑아내기 위해
    function getScore(){
        
       var itemCode = $("#itemCode").val();
        
        $.getJSON("/review/pages/"+itemCode+".json",
        function(data){
           var avgNum = 0;
           for(var i=0; i<data.length; i++) {
              avgNum += data[i].score;
           }
           avgNum /= data.length;
           avgNum = avgNum.toFixed(1);
           
           $("#reviewAmount").html("리뷰 (" + data.length + ")개");
           $("#avg").html("<strong>"+ avgNum +"</strong>");
           
           $("#resultStar").data('star-rating-average', avgNum);
           
           // 평균 별점 찍기
           var StarRating = (function() {
               var setUpStars  = function() {
                 $('.star-rating-container').each(function(){
                   var numStars = 5;
                   var $starContainer = $(this);
                   var $user = $('<div />').addClass('user');
                   var $avg = $('<div />').addClass('avg');
                   var $val = $('<div />').addClass('user-value');
                   var avg = $starContainer.data('star-rating-average');
                   // console.log(avg + "평균");
                   var avgPct = 100 - avg / numStars * 100 + '%'

                   $starContainer.prepend($user).prepend($avg).prepend($val);

                   $avg.css({
                     right: avgPct
                   });

                 });

               }
               
               return {
                 init: function() {
                   setUpStars();
                 }
               }
             }());

             StarRating.init();
           
           // console.log(avgNum + "평균 점수");
              // console.log(data.length + "길이");
        }).fail(function(err){
           console.log("평균 별점 불러오기 에러입니다.");
        
        });
        
      
        }
 

/* 리뷰 부분 끝 */

/* 상점으로 이동하기 */
      var actionForm = $("#actionForm");
      $(".move").on("click", function(e) {
         e.preventDefault();
         
         actionForm.submit();
      });

/* 상점으로 이동하기 끝 */
</script>

   <%@include file="../includes/footer.jsp" %>

</html>