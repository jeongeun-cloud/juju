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
  
  
  img {
  display: block;
  margin:0px auto;}
  

ul {
  padding: 0;
  margin: 0;
  list-style: none; }
  ul li {
    margin: 0 1.75rem 0 0; }

a {
  color: #888;
  text-decoration: none;
  transition: all 0.2s ease; }
  a:hover {
    color: #333; }
  a.active {
    color: #333; }

h1,
h2,
h3,
h4 {
  color: #333;
  font-weight: normal;
  margin: 1.75rem 0 1rem 0; }

h1 {
  font-size: 2.5rem; }

h2 {
  font-size: 2.125rem;
  margin: 0; }

h3 {
  font-size: 2rem; }

h4 {
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

.item-describe {
  border-top: 0.0625rem solid #e3dddd;
  margin: 2rem 0;
  padding: 1rem 0 0 0; }

.add-to-basket {
  position: relative;
  display: inline-block;
  background: #3e3e3f;
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
  .add-to-basket:hover::before {
    transform: scaleX(1); }
  .add-to-basket::before {
    position: absolute;
    content: "";
    z-index: -1;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: #565657;
    transform: scaleX(0);
    transform-origin: 0 50%;
    transition: transform 0.3s ease-out; }

.itemContainer {
  margin: auto;
  padding: 0 1rem;
  max-width: 75rem;
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
    display: block; }
    .product-image img {
      height: 52vh; }
      .product-image img.active {
        display: block;
        margin: 0 0 0.75rem 0; }

  .image-list {
    display: flex;
    overflow: hidden; 
    }
    .image-list li {
      margin: 0 0.75rem 0 0;
      flex-basis: 100%; }
      .image-list li:nth-child(3) {
        margin: 0; }
    .image-list img {
      height: 10rem;
      width: 100%;
      transition: opacity 0.3s ease;
      cursor: pointer; }
      .image-list img:hover {
        opacity: 0.7; }

/* 아이템 상세페이지 css 끝 */ 





      
         /* 장바구니 css 시작 */      
        .basketContainer {
            position: fixed;
            top: 0px;
            
            z-index: 999;
            
            /* 반응 없음 */
            /* overflow: scroll; */
            /* overflow: auto; */
        }

        #basketNav {
            right: -20%;
        }

        .basketNavBar {
            position : fixed;
            width: 20%;
            height : 100%;
            /* 메뉴바 전체 배경색 */
            background-color: rgb(0,158,219);
            
            color: white;

            border-style:solid;
            border-color: lightgray;

            text-align: center;
            align-items: center;
            transition : 0.800s ease;
            z-index: 1;
            
            /* 반응 없음 */
            /* overflow: auto; */
            
        }

        .basket-toggle-collapse {
            float: left;
            margin-left: -3.685em;
            margin-top: 17em;
            content: "";
            outline: inherit;
            border: 0px;
            background: transparent;
        }

        .basket-toggle-icon,
        .basket-toggle-icon::before,
        .basket-toggle-icon::after{
            content:"";
            position: fixed;
            background-color: transparent;
            border-radius: 2em;
            border: 0px solid transparent ; 
           
        }

        
       .basketList {
           margin-left: 0px;
           margin-top: 50px;
           width:100%;
           height: 60%;
           background-color: white;
           color: grey;
           text-align: left;
           border: 3px;
           font-size: 1em;
           
           /* 여기서 스크롤 생김(양 초과했을 때) */
           overflow: auto;
       }
       
       
       .basketItemImg {
          
          width: 100px;
          float: left;
          
          border : 3px;
          margin-top: 25px;
          margin-left : 10px;
       
       }
       
       .basketItemDescribe {
       
      /*  text-align: left;
       border: 3px; */
       
       }
       
       
       #basketImg {
       
       width: 120px;
       height: 100px;
       float: left;
       margin: 3px;
       
       
       
       }
       
       #basketContent {
       
       width: 120px;
       height: 100px;
       float: left;
       margin: 3px;
       
       
       }
       
       
       #dltBtn {
       
       width: 10px;
       heigth: 10px;
       
       }
       
       #dltBtnImg{
       
       width: 10px;
       height: 10px;
       
       }
    
       /* 장바구니 css 끝 */  





/* 지울 부분 시작 */

   
#prdInfo{

width:70%;
margin-left: 15%;

}

#prdReview{

width:70%;
margin-left: 15%;

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
  border:1px solid #aaa;
}
#numdown{
/*   position:absolute; */
/*   height:10px; */
/*   margin-top:0.2%; */
/*   width:50px; */
  border:1px solid #aaa;
}

/* 수량 증감 화살표 부분 끝 */


/*댓글 dropdown*/
.dropbtn {
  background-color: #;
  color: white;
  padding: 10px;
  font-size: 8px;
  border: none;
  cursor: pointer;
}
<!-- 버튼색상 -->
.dropbtn:hover, .dropbtn:focus {
  background-color: #ddd;
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
       color: red;
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
     background-color: #f1f1f1;
   }
   
   .btn {
     background-color: #008CBA;
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

</style>
    
</head>
<body>


<jsp:include page="../includes/header.jsp" flush="false"/>
<jsp:include page="../includes/menuBar.jsp" flush="false"/>

<jsp:include page="RecentlySeen.jsp" flush="false"/>


<!-- 아이템 상세페이지 body 시작 -->
<div class = "itemDiv">


   <!-- 아이템 요약 body 시작 -->
    <div class="itemContainer">
          <div class="grid menu">
            <div class="column-xs-8 column-md-6">
              <p id="highlight">JUJU MARKET</p>
            </div>
            <div class="column-xs-4 column-md-6">
              
              <ul>
                <li class="nav-item"><a href="#">{상점명}</a></li>
              </ul>
            </div>
          </div>
        </div>
  
        <div class="itemContainer">
          <div class="grid second-nav">
            <div class="column-xs-12">
              <nav>
                <ol class="category-list">
                  <li class="category"><a href="#">{대분류}</a></li>
                  <li class="category"><a href="#">{중분류}</a></li>
                  
                  <li class="category active">{소분류}</li>
                </ol>
              </nav>
            </div>
          </div>

          
          <div class="grid product">
            <div class="column-xs-12 column-md-7">
              <div class="product-gallery">
                <div class="product-image">
                  <img class="active" src="<c:out value="${product.itemImg1}"/>">
                </div>
                <ul class="image-list">
                  <li class="image-item"><img src="<c:out value="${product.itemImg1}"/>"></li>
                  <li class="image-item"><img src="<c:out value="${product.itemImg2}"/>"></li>
                  <li class="image-item"><img src="<c:out value="${product.itemImg3}"/>"></li>
                </ul>
              </div>
            </div>



<!-- 테스트용 form 태그 -->
<!-- <form id="addToBasket" name=addToBasket  method="post"> -->



            <div class="column-xs-12 column-md-5">
              <h1><c:out value="${product.itemName}" default="itemName"/></h1>
              <h2><c:out value="${product.price}" default="price"/>원 -> <c:out value="${product.normPrice}" default="normPrice"/>원</h2>
              <h5> 적립 포인트 : 120 포인트 </h5>
              <h5> 재고 수량 : <c:out value="${product.stock}" default="stock"/> </h5>
              
              <!-- 수량 증감 부분 시작 -->
              <div>
                 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1" crossorigin="anonymous">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            
            <input value="1" min="1" size="2" id="input-view" name="number" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
            <div class="up-down">
              <button id="numup"><i class="fas fa-plus"></i></button>
              <button id="numdown"><i class="fas fa-minus"></i></button>
            </div>
              </div>
              
              <!-- 수량 증감 부분 끝 -->
              
              
              <h5> 배송비 : 0원 </h5>
              <h5> 총 결제금액 : ${product.normPrice}원 </h5>
              <div class="item-describe">
                <p><c:out value="${product.itemContent}" default="itemContent"/></p>
              </div>
              
              
              
              <button type="submit" class="add-to-basket" onclick="addToBasketEvent()" >장바구니 담기</button>
            </div>

            <input type="hidden" value="${product.itemCode}" id="itemCode"/>
            


<!-- </form> -->
<!-- 테스트용 form 태그 -->




          </div>
         
        </div>
        <!-- 아이템 요약 body 끝 -->
     
     
     
     
     
        <!-- 상품 상세 정보 body 시작 -->
        
        <div id="prdInfo">
        
        <jsp:include page="MoveBar.jsp" flush="false"/>
        
        <!-- <h1>상품 상세 정보 영역</h1> -->
        <img src="<c:out value="${product.imgDetail}"/>">
        
        </div>
     
        <!-- 상품 상세 정보 body 끝 -->
     
     
     
     
     
        <!-- 상품평 body 시작 -->
     
     <div id="prdReview">
     
     <jsp:include page="MoveBar.jsp" flush="false"/>
        <h1>상품평 영역</h1>
        <!-- 리뷰 갯수 표시 -->
        <h4 id="reviewAmount"></h4> 
        
        <!-- 평균 별점 구현 중 -->
        <div id="starAvg">
           <a style="text-decoration:none; font-size:30px;">★</a>
           <a>★</a>
           <a>★</a>
           <a>★</a>
           <a>★</a>
           <p id="avg"><strong>4.8</strong></p> <span>/</span> <span>5.0</span>
        </div>
      
      <!-- 리뷰 남기기 버튼 -->
        <button onclick="orderCheck()" style="width:auto; float:right;">리뷰 남기기</button>
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
        
      <!-- 리뷰 등록 모달 영역 -->
      <div id="review" class="modal">
        <div class="modal-content animate" style="max-width:798px;">
          <div class="imgcontainer">
            <span onclick="document.getElementById('review').style.display='none'" class="closeBtn" title="Close Modal">&times;</span>
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
           
              <input type="hidden" name="idNo" id="idNo" value="idNo">
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
     
     <h1>상품 문의 영역</h1>
     <img src="https://lh3.googleusercontent.com/proxy/65nlh6HvxRv9iVxxf4PHNLPFCf9tJIRvU982P2WGPkEDI5i_RWu5McYd-dZp3Lv5sDPVXtzukdCOYyiHZVefYUzkb9nnPsBL73WYidkw5KTXh-qTJCr6psOnqRzKVzEvW7SBUyUfXpmZBTX9BBbOruToIkwj">
     
     </div>
  
     <!-- 상품 문의 body 끝 -->
        
        
     <!-- 상품 문의 댓글 영역 -->
         <div class = "reply-main">
               <h4 class="reply-title" id="replytitle">댓글쓰기</h4>
         
            
              <div id = "regiBtn">
               <div class="form-grop">
               <label>replyContent</label>
               <textarea class ="form-control replyContent" id="replyContentBtn"  rows='5'  name='replyContent' placeholder ='댓글은 1~600자에 맞게 입력해주세요'></textarea></div>

              
               <div class="form-grop">
               <label>id</label>
               <input class ="form-control" id ="idNoBtn"  name='idNo' value='idNo' readonly="readonly"></div>
               <div class="form-grop">
          <!--      <label>replyDepth</label>
                <input class ="form-control" id ="replyDepth"  name='replyDepth' value='1' readonly="readonly"></div> -->
                <div class="form-grop">
                 <label>replyCount</label>
                <input class ="form-control" id ="replyCount"  name='replyCount' value='1' readonly="readonly"></div>
               <div class="form-grop">
         <!--        <label>replyCode</label>
                <input class ="form-control" id ="replyCode"  name='replyCode' value='1' readonly="readonly"></div> -->
                <div class="form-grop">
                 <label>itemCode</label>
                <input class ="form-control" id ="itemCode"  name='itemCode' value='itemCode' readonly="readonly"></div>
            
    
               
         <!--       <div class="form-grop">
               <label>replyDate</label>
               <input class ="form-control" name='regDate' value=''></div> -->
               
              
                <div class="panel-heading">
               <i class="fa fa-comments fa-fw"></i>Reply
               <button id ='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 입력하기</button>
               </div> <!-- /,panel-heading -->
               </div><!-- regiBtn -->
   
             </div>  <!-- reply-main end -->
   
         
               <div id ="list">   
               <div class="panel-body">  <!-- 댓글 목록 리스트 -->          
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
               
                        <div class="panel-footer">
               
               
                         </div>
               <!--  /.panel .chat-panel -->
                 </div><!-- RemoveBtn end -->
        
        <!-- 상품 문의 댓글 영역  끝-->
        
        <!-- 배송안내 body 시작 -->
     
        <div id="delieveryInfo">
        
        <jsp:include page="MoveBar.jsp" flush="false"/>
        
        <h1>배송 안내</h1>
        
           <div>

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
        
        <h1>교환 및 반품</h1>
        
        <body>
          교환 및 반품은 배송 완료 후 7일 이내까지 가능 <br>
         - 제품 품질 이상, 오 배송의 경우 교환 및 반품 비용은 회사에서 부담합니다. <br>
         - 고객님의 단순 변심의 경우 교환 및 반품 비용은 본인 부담입니다. <br>
          ※ 상품을 확인하기 위해 택배 박스의 포장은 제거할 수 있으나, 내부 상품을 보호하는 <br>
         비닐을 제거할 경우 반품할 수 없습니다. 내부 상품을 보호하는 비닐은 투명 비닐을 <br>
         사용했기 때문에 비닐을 제거하지 않아도 충분히 상품을 확인할 수 있습니다. <br>
      
      </body>
      
      <h1> </h1>
        
        </div>
       <!-- 교환 및 반품 body 끝 -->       
     
        
     
     
     
     
     
     
     
     
     
     
     
     
     
     

</div>

<!-- 아이템 상세페이지 body 끝 -->    
















<!-- 장바구니 사이드메뉴바 body 시작 -->
<div class="basketContainer">
    <nav class="basketNavBar" id="basketNav">

        <button type="button" onclick="basketClicked(this)" class="basket-toggle-collapse" > 
            <span class="basket-toggle-icon"> </span>
            <img src="/resources/images/basket.png"/>
        </button>   

        <br>장바구니

        <ul class="basketList" id="basketList">
        
        
        <!-- 장바구니 리스트 영역 시작 -->
         
      <%--   <c:forEach items="${list}" var="basket">
        
        
        <div id="basketImg">
        <img src="<c:out value="${basket.itemImg1}"/>" class="basketItemImg"/>
        </div>
        
        <div id="basketContent">
        <h5 class="basketItemDescribe">
        <c:out value = "${basket.itemName}"/><br>
        <c:out value = "${basket.price}"/>원<br>
        <c:out value = "${basket.itemNum}"/>개<br>
        <input type="hidden"><c:out value = "${basket.baskId}"/><br>
        </h5>
        <br>
        </div>
        
        
        
        </c:forEach>  --%>
          
        <!-- 장바구니 리스트 영역 끝 -->
        
        
        
        </ul>


    </nav>
</div>
<!-- 장바구니 사이드메뉴바 body 끝 -->





     
</body>

<!-- 상품평 스크립트 -->
<script type="text/javascript" src="/resources/js/prdreply.js"></script>  <!--댓글 스크립트. 경로인듯  -->
<script type="text/javascript">
 
   
$(document).ready(function(){

         var itemCode = $("#itemCode").val();
         var replyUL = $(".chat");
   
         showList(1);//<댓글 호출 매서드
   
               function showList(page){

              console.log("showList" + page);
              prdreplyService.getList({itemCode:itemCode,page: page || 1},
                 function(prdReplyCnt,list){
                    
                 console.log("prdReplyCnt" + prdReplyCnt);
                 console.log("list" + list);
                 console.log(list);
                   
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
            for(var i = 0, len =list.length || 0; i <len; i++){
            
           var replyDepth = list[i].replyDepth;
           console.log(replyDepth);
            str += "<ul><li class='left clearfix' data-replyNo ='"+list[i].replyNo+"' data-text='"+list[i].replyContent+"'>";

                 if(replyDepth==0){
                     str += "<div class='header'><strong class='primary-font'>"+list[i].idNo+"</strong>";
                     str += "<div><small class ='pull-right text-muted'>"+prdreplyService.displayTime(list[i].regDate)+"</div></small>" ;    
                     str += "<div><textarea class='text' id='text' rows='5'>"+list[i].replyContent+"</textArea>";
                     str += "<div><input type ='hidden' value='"+list[i].replyDepth+"'></input>";
                     str += '<button id="replybtn" class ="replybtn" >답글달기</button> <br></div></div></div>'; 
               
                 }else{
      
              
                    str += "<div class='header'><strong class='primary-font'>"+list[i].idNo+"</strong>";
                      str += "<div><small class ='pull-right text-muted'>"+prdreplyService.displayTime(list[i].regDate)+"</div></small>" ;    
                      str += "<div>"+'&nbsp; >Re:'+"<textarea class='text' id='text' rows='5'>"+list[i].replyContent+"</textArea>";
                      str += "<div><input type ='hidden' value='"+list[i].replyDepth+"'></input>";
                   /*    str += '<button id="replybtn" class ="replybtn" >답글달기</button> <br></div></div></div>';  */
                     
                    
                 }
            //문의글 , 답글 구현 end
            
            
            str += '<div class="dropdown">';
            str += '<button class="dropbtn">:</button>';
            str += '<div id="myDropdown" class="dropdown-content">';
            str += '<button id="modify" class ="modify">수정</button> <br>';
            str += '<button id="delete" class ="deletebtn">삭제</button>';
            str += '</div></div></li></ul>'
            
         }
         replyUL.html(str);
         showReplyPage(prdReplyCnt);
  
         
                });//end function
                
                
               }//end showList
               
               
              //문의 입력  start
               var regiBtn = $("#regiBtn")
                
               
               regiBtn.find('button').on("click",function(e){
               if($("#replyContentBtn").val() == ''||$("#replyContentBtn").val().trim()==""||$("#replyContentBtn").val().length>600){
                     
                    alert("댓글양식에 맞게 입력해주세요(1~600자)");
                    return false;
                      
               }
      
               prdreplyService.add(
                    {idNo:$("#idNoBtn").val(), replyContent:$("#replyContentBtn").val(),  itemCode:$("#itemCode").val(),
                    replyDepth:$("#replyDepth").val(), replyCount:$("#replyCount").val(), replyCode:$("#replyCode").val(),
                    },
                         
                         
                        
                function(result){
                            
                
                    var replyContent = $(".replyContent").val();
                    console.log(replyContent);
                alert("댓글이 등록되었습니다. : " + result);
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
   
                      prdreplyService.replyadd(
                         {idNo:'idNo', replyContent:replyRegister,       
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

       window.onclick = function(e) {
       
   
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
             
     }//: . dropDown 클릭시발생하는 이벤트 end
       
       
        
      $(document).on("click","button[id='delete']", function(e) {
               
       console.log("삭제ddd");
              
            
          var target = e.target;
          
          console.log(target);
          //var replyLi = $(target).parent().parent().parent();
          var replyLi = $(target).closest("li");
          
          console.log(replyLi+"LLLIII");
          var replyNo = replyLi.data("replyno");
          
          var ids = replyLi.data("id");
          
          console.log("replyNo == " + replyNo);
          
       
       
        
          prdreplyService.remove(replyNo , function(count){
            
             console.log(count);
             
             if(count === "success"){
                showList(pageNum);
                alert("REMOVED");
                
                
             }
          }, function(err){
           alert('ERROR....')   
             
          }); 
 
    });       //문의글 삭제, 댓글 삭제end
    
 
          //문의글 수정, 댓글수정
          $(document).on("click","button[id='modify']",function(e){
                
               var target = e.target;
               var replyLi = $(target).closest("li");
               var replyNo = replyLi.data("replyno");
               var itemCode = replyLi.data("itemCode");         
               var replyContent =  $(target).parent().parent().parent().find("#text").val();
             
               
              
               //대댓글의경우 replyContent null, parent() 한개더 줘서 replyContetn 값을 줌
               if(replyContent==null){
                  
                  var replyContent =  $(target).parent().parent().parent().parent().find("#text").val();
                  $(target).parent().parent().parent().parent().find("#text").hide();
                  
               }else{
               
                  $(target).parent().parent().parent().find("#text").hide();
                  $(target).parent().parent().parent().find("#replybtn").hide();
               }
               
               
               var replyDiv = document.createElement("div");
               replyDiv.setAttribute("class", "replyDiv");

               var textArea = document.createElement("textarea");
               textArea.setAttribute("id", "replyTextarea");
               textArea.setAttribute("placeholder", "댓글을 입력해주세요");

               var replyNo = document.createElement("input");
               replyNo.setAttribute("id","replyNo");
               replyNo.setAttribute("type","hidden");
/*                replyNo.setAttribute("value",replyNodata);
 */

        
               replyDiv.appendChild(textArea);
               replyDiv.appendChild(replyNo);

       
               
               $(target).parent().parent().after(replyDiv);
               
               
               
           
                if(replyContent==''||replyContent.trim()==''||replyContent.length>600){
                   
                   alert("댓글은 1~600자에 맞게 입력해주세요")
                   return false;
                }
          
                prdreplyService.update({
                      
                      replyNo  : replyNo,    
                      itemCode : itemCode,
                      replyContent : replyContent

               
               },function(result){
                  
                     alert("수정 완료 ........")
                     showList(pageNum);
                  
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
                str+= "<li class='page-item'><a class='page-link' href='"+(startNum - 1)+"'>Previous</a><li>";
             }
                     
                 for(var i = startNum; i <= endNum; i++){
                    
                     var active = pageNum == i?"active":"";
                     
                     str+= "<li class='page-item"+active+"'><a class='page-link' href='"+i+"'>"+i+"</a><li>";        
                 }
                 if(next){
                    str+="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a><li>";  
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
   
 
   
   
</script>
<script>


/* 상품 상세페이지 이미지 누르면 확대되는 기능 시작 */
const activeImage = document.querySelector(".product-image .active");
const productImages = document.querySelectorAll(".image-list img");

function changeImage(e) {
  activeImage.src = e.target.src;
}

productImages.forEach(image => image.addEventListener("click", changeImage));
/* 상품 상세페이지 이미지 누르면 확대되는 기능 끝 */






// 브라우저 열리자마자 장바구니 리스트 가져오기 시작
$(document).ready(
         
          getBasketList()
         
         .then(function(response){ 
            
           console.log("getBasketList 결과는?");
            console.log(response);  
            console.log("draw 실행");
            draw(response); // 가져온 결과를 화면에 다시 그리기 
            
            }) 
      
)
// 브라우저 열리자마자 장바구니 리스트 가져오기 끝
      
      
      



// 장바구니 한도
var basketMax = 30;




// 장바구니 담기 onclick 이벤트 시작
function addToBasketEvent() {
   
      
   // 1. 장바구니에 담긴 물건 리스트를 불러온다 
   getBasketList()
   .then(function(response){
      
      //1-1. 장바구니에 담긴 물건이 max 초과이면 
      if(response.length>basketMax){
         //1-1-1. 담을 수 없음을 알림 
         alert("장바구니에 담을 수 있는 상품은 "+basketMax+"개 이하입니다.");
         
      //1-2. 장바구니에 담긴 물건이 max 넘지 않으면    
      }else{
         //1-2-1. 장바구니에 담는 일련의 과정 실행 
         insert2Basket();
      }
   
})

}
//장바구니 담기 onclick 이벤트 끝




// 장바구니에 담는 일련의 과정 function 시작
 function insert2Basket() {
    
   var $itemCode = $("#itemCode");
   
   var $num = $("#input-view");
   
   var data = {
         itemNum : $num.val(),
         idNo : "cus000001",
         itemCode : $itemCode.val()
   };
   
   insertData(data) // 해당 페이지 상품을 db 에 넣기 
   
   .then(function(response){
      
     console.log("insertData 결과는?");
      console.log(response)
      console.log("getBasketList 실행");
      return getBasketList();}) // 장바구니 리스트를 DB에서 ajax 로 가져오기 
   
   .then(function(response){ 
      
     console.log("getBasketList 결과는?");
      console.log(response);  
      console.log("draw 실행");
      draw(response); // 가져온 결과를 화면에 다시 그리기 
      
      }) 
   
   .then(function(){
      moveBasket(); }) // 장바구니 슬라이드 자동으로 열고 닫게 하기 
   
}
//장바구니에 담는 일련의 과정 function 끝
 
 
 
 
 
 
//해당 페이지 상품을 db 에 넣기  function 시작
function insertData(data) {
   
   console.log("insertData 실행");

   return $.ajax({
      url: "/product/basket",
      type: "POST",
      data: JSON.stringify(data),
      contentType: "application/json"
   });
}
//해당 페이지 상품을 db 에 넣기  function 끝
 
 
 
 

/* 장바구니 리스트 ajax 로 불러오기 시작 */
function getBasketList() {
   
   return $.ajax({
      url: "/product/basket",
      type: "GET",
      dataType: "JSON",
      error : function(){console.log("통신실패")},
      success : function(){console.log("통신성공")}
      
      });
   
}
/* 장바구니 리스트 ajax 로 불러오기 끝 */

 
 
 
 


// html 구조 안에다가 장바구니 내용 넣기 function 시작
function draw(jsonData) { // JSONdata 에 xml 형태의 JSON이 들어온다 왜? 
   
   var $basketList = $("#basketList");
   
   $basketList.empty();
   
   console.log("결과 : " + jsonData)
   
   for(var i=0; i<jsonData.length; i++) {
      
      $basketList.append("<div id='basketImg'><img src=\""+jsonData[i].itemImg1+"\" style= \"width:100px; border: 3px; float:left; margin-left: 10px; margin-top:10px; margin-bottom:30px; \" /></div>");
      
      $basketList.append("<div id='basketContent'><h5>"+jsonData[i].itemName+"<br>"+jsonData[i].price+"원<br>"+jsonData[i].itemNum+"개<br>"+jsonData[i].baskId+"<br></h5></div>");

      
      // 이게 삭제 버튼 있는 버전 
      //$basketList.append("<div id='basketContent'><h5>"+jsonData[i].itemName+"<br>"+jsonData[i].price+"원<br>"+jsonData[i].itemNum+"개<br>"+jsonData[i].baskId+"<br></h5><button id='dltBtn'><img id='dltBtnImg' src='/resources/images/deleteBasketBtn.png'></button></div>");

      
      //$basketList.append("<button id='dltBtn'><img id='dltBtnImg' src='/resources/images/deleteBasketBtn.png'></button>")
      
      // <img src='/resources/images/deleteBasketBtn.png'>
      
      
      
      
   }
   
   $("#basketList").append("<div id='endOfBasket'>end of basket</div>");
   $("#endOfBasket").css("background-color","white");
   $("#endOfBasket").css("color","white");
   $("#endOfBasket").css("display","block");
   $("#endOfBasket").css("width","240px");
   $("#endOfBasket").css("height","50px");
   $("#endOfBasket").css("float","left");
   
   $("#basketList").css("text-align","left");
   $("#basketList").css("font-size","13px");
   $("#basketList").css("font-weight","bold");
   
   
   //$("#dltBtn").css("width","10px");
   //$("#dltBtnImg").css("width","10px");
   
   
}
//html 구조 안에다가 장바구니 내용 넣기 function 끝

 



/* 장바구니 슬라이드 열렸다 닫히는 기능 시작 */
function moveBasket() {
 
      /* basket 가 열렸다 닫혔다 하는 부분 시작 */
       var elem = document.getElementById("basketNav"),
       Style = window.getComputedStyle(elem),
       right = Style.getPropertyValue("right");
      
      
        /* 장바구니 슬라이드 스크롤 맨 아래로 내리기*/
       location.href="#endOfBasket";

        /* 장바구니를 펼쳤다가 */
       elem.style.right = "0%";
        
        /* 1초 후에 장바구니를 닫아라 */
       setTimeout(function(){elem.style.right = "-20%";},1000);
       /* basket 가 열렸다 닫혔다 하는 부분 끝 */
      

}
/* 장바구니 슬라이드 열렸다 닫히는 기능 끝 */







/* 장바구니 누르면 펼쳐졌다 닫혔다 하는 기능 시작 */

function basketClicked(e) {
       e.classList.toggle("show");
       var elem = document.getElementById("basketNav"),
       Style = window.getComputedStyle(elem),
       right = Style.getPropertyValue("right");

       /* 장바구니가 열려있으면 */
       if(right === "0px") {
           /* 장바구니를 닫고 */
           elem.style.right = "-20%";

        /* 그게 아니면 */
       }else {
           /* 장바구니를 펼쳐라 */
           elem.style.right = "0%";
       }
   }
/* 장바구니 누르면 펼쳐졌다 닫혔다 하는 기능 끝 */






/* 수량 증감 부분 시작 */

$(document).ready(function(){
  x = $('#input-view').val();
    $('#numup').click(function(){
      x++;
      $('#input-view').val(x);
    })
  $('#numdown').click(function(){
      x--;
      if(x <= 0){
          x=1;
          $('#input-view').val(x);
        }else{
          $('#input-view').val(x);
        }  
    });


    // reviewList 출력
     showList(1);
  
});
 
/* 수량 증감 부분 끝 */

/* 리뷰 부분 시작 */

   // 리뷰 남기기 모달 띄우기
      var modal = document.getElementById('review');
   
      // 모달 끄기
      window.onclick = function(event) {
      if (event.target == modal) {
           modal.style.display = "none";
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
       if($("#idNo").val() != 'idNo') {
           alert("상품 후기는 상품을 구매하시고 배송온료된 회원 분만 한달 내 작성 가능합니다.");
        return false;
         }
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
      }
      
      // 이미지 체크
      var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|PNG)$");
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
                     idNo:$('#idNo').val(), itemCode:$('#itemCode').val()
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
            
            // 리뷰 개수표시
            $("#reviewAmount").html("리뷰 (" + list.length + ")개");
            
           var avgNum = "";
            // list html 본문에 뿌리기
         for(var i = 0, len =list.length || 0; i <len; i++){
              var star = "";
               var stars = new Array();

                 for(var j=0; j<list[i].score; j++) {
                   star += "★";
                 }
                 for(var x=list[i].score; x<5; x++) {
                    star += "☆";
                 }
                 stars[i] = star;
                 
                 var path = "";
                 if(list[i].reviewImg != null) {
                    path = "src='/resources/review/" + list[i].itemCode + "/" + list[i].reviewImg + "'";
                 }
                 
                 if(list[i].reviewContent == null) {
                    list[i].reviewContent = "";
                 }

                 str += "<div style='width:100%; overflow:hidden;'>";
                 str += "<div style='float: left; width: 20%; font-weight:bold;'>"+ list[i].idNo +"</div>"; 
                 str += "<div style='float: left; width: 80%; font-weight:bold; text-align:right;'>"+ displayTime(list[i].regDate) +"</div>"; 
                 str += "<div style='float: left; width: 100%; font-weight:bold; color:red;'>"+ stars[i] +"</div>"; 
                 str += "<div style='float: left; width: 20%;'><img class='resultImg' style='height:75px;' "+ path +" /></div>"; 

                 str += "<div style='width:80%; float:left'>"; 
                  str += "<button class='collapsible'>"+ list[i].reviewTitle + "</button>";
                str += "<div class='content'>";
                str += "<p style=''>"+ list[i].reviewContent +"</p>";
                str += "<button id='removeBtn' data-oper='"+ list[i].reviewNo +"' class='btn' style='background-color: #f44336;'>삭제</button>";
                str += "<button id='modifyBtn' data-oper='"+ list[i].reviewNo +"' class='btn'>수정</button>";
                str += "</div>";
                str += "</div>";

                str += "</div>";
                str += "<br><hr>"
                //console.log(list[i].reviewContent);
               
                avgNum += list[i].score;
              }
            avgNum /= list.length;
            $("#avg").html();
              
            reviewList.html(str);
              showReviewPage(reviewCnt);     

              // 리뷰 리스트 효과
         var coll = $(".collapsible");
             
              for (i = 0; i < coll.length; i++) {
                 coll[i].addEventListener("click", function() {
                   this.classList.toggle("active");
                    var content = this.nextElementSibling;
                    
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
             var mi = dateObj.getMonth() + 1 ;//getMonth() is zero-based
             var ss = dateObj.getDate();

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

      // 1. 모달 띄우기 (당사자에게만 보일거지만 그래도 한 번 더 구별 해주기)
         if($("#idNo").val() != 'idNo') {
           alert("당사자만 수정할 수 있습니다.");
            return false;
         }
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
      });   // 수정기능 끝
   
     
/* 리뷰 부분 끝 */



</script>


</html>