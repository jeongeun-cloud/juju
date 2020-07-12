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

.add-to-cart {
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
  .add-to-cart:hover::before {
    transform: scaleX(1); }
  .add-to-cart::before {
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
    overflow: hidden; }
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
           height: 95%;
           background-color: white;
           color: grey;
       }
       
       
       .basketItemImg {
       	
       	width: 100px;
       	float: left;
       	
       	border : 3px;
       	margin-left : 10px;
       
       }
       
       .basketItemDescibe {
       
       text-align: left;
       border: 3px;
       
       }
       
       /* 장바구니 css 끝 */  








</style>
    
</head>
<body>


<!-- 장바구니 html을 include -->


<!-- 아이템 상세페이지 body 시작 -->
<div class = "itemDiv">

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
              <h5> 수량 : <c:out value="${product.stock}" default="stock"/> </h5>
              <h5> 배송비 : 2500원 </h5>
              <h5> 총 결제금액 : 2600원 </h5>
              <div class="item-describe">
                <p><c:out value="${product.itemContent}" default="itemContent"/></p>
              </div>
              <button type="submit" class="add-to-cart" onclick="dbinsertbyAjaxtest()" >Add To Cart</button>
            </div>

				
				


<!-- </form> -->
<!-- 테스트용 form 태그 -->




          </div>
         
        </div>
     

</div>

<!-- 아이템 상세페이지 body 끝 -->    
















<!-- 장바구니 사이드메뉴바 body 시작 -->
<div class="basketContainer">
    <nav class="basketNavBar" id="basketNav">

        <button type="button" onclick="basketClicked(this)" class="basket-toggle-collapse" > 
            <span class="basket-toggle-icon"> </span>
            <img src="https://postfiles.pstatic.net/MjAyMDA2MjlfMjEg/MDAxNTkzNDM0MTcyMjA1.88gzgV5fOBxNdrVHMP30f8M0QYJrvSab6jH2NfuZ6dQg.t1i-emD2OypaNqJsiUJYOdSci8sM9Dal67XTAMfJyf0g.PNG.glgltwwofus/cart.png?type=w773"/>
        </button>   

        <br>장바구니

        <ul class="basketList">
        
        
          <!-- ajax 이용한 장바구니 리스트 영역 시작 -->
          
          
          
          
          
          
          <!-- ajax 이용한 장바구니 리스트 영역 끝 -->
          
        
        
        
        
        
        
        
        
        
        <!-- 장바구니 리스트 영역 시작 -->
         <!--
        <c:forEach items="${list}" var="basket">
        
        <img src="<c:out value="${basket.itemImg1}"/>" class="basketItemImg"/>
        <h5 class="basketItemDescibe">
        <c:out value = "${basket.itemName}"/><br>
        <c:out value = "${basket.price}"/>원<br>
        <c:out value = "${basket.itemNum}"/>개<br>
        <c:out value = "${basket.baskId}"/><br>
        <c:out value = "${basket.itemCode}"/><br>
        </h5>
        
        </c:forEach>
          -->
        <!-- 장바구니 리스트 영역 끝 -->
        
        
        
        </ul>


    </nav>
</div>
<!-- 장바구니 사이드메뉴바 body 끝 -->













     
</body>


<script>









/* 상품 상세페이지 이미지 누르면 확대되는 기능 시작 */
const activeImage = document.querySelector(".product-image .active");
const productImages = document.querySelectorAll(".image-list img");

function changeImage(e) {
  activeImage.src = e.target.src;
}

productImages.forEach(image => image.addEventListener("click", changeImage));
/* 상품 상세페이지 이미지 누르면 확대되는 기능 끝 */








/* ajax 로 데이터 넣는 것만 해볼 것. 그리고 슬라이드 열렸다 닫히는 거는 좀 나중에 */


/* 
var $addToCart = $('.add-to-cart');


$addToCart.on('click', function(){
	
	
	

	})
 */






 
 function dbinsertbyAjaxtest() {
	
	var data = {
	
			baskId : "baskID123",
			itemNum : 1,
			idNo : "cus000001",
			itemCode : "abcd1020"
	
	};
	
	insertData(data)
	.then(function(){getBasketList();}) // 장바구니 리스트를 DB에서 ajax 로 가져오기 
	.then(function(){ setTimeout(function(){draw();},1000); }) // html 구조 안에다가 forEach 문을 넣는다 
	.then(function(){ setTimeout(function(){moveCart();},2000); }) // 장바구니 슬라이드 자동으로 열고 닫게 하기 
	
	
	
}
 
 
function insertData(data) {
	return $.ajax({
		url: "/product/item",
		type: "POST",
		data: JSON.stringify(data),
		contentType: "application/json"
	});
}
 
 
 



/* add to Cart 버튼 onclick 기능 시작 - 일단은 장바구니 슬라이드 열렸다 닫히는 것만 넣었음 */


function moveCart() {


 
 
 
 		/* t_basket DB에 해당 상세페이지 insert 시작 */
 		
 	
 
  		/* t_basket DB에 해당 상세페이지 insert 끝 */
  		
  
 
  		
 
 
		/* cart 가 열렸다 닫혔다 하는 부분 시작 */
       var elem = document.getElementById("basketNav"),
       Style = window.getComputedStyle(elem),
       right = Style.getPropertyValue("right");

        /* 장바구니를 펼쳤다가 */
       elem.style.right = "0%";

        /* 1초 후에 장바구니를 닫아라 */
       setTimeout(function(){elem.style.right = "-20%";},1000);
       /* cart 가 열렸다 닫혔다 하는 부분 끝 */
      

}


/* add to Cart 버튼 onclick 기능 끝 */







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







$(document).ready(function(){draw();})


/* 장바구니 리스트 ajax 로 불러오기 시작 */


function getBasketList() {
	
	
	
	return $.ajax({
		url: "/product/item?itemCode=abcd1020",
		type: "GET",
		dataType: "json"
	
		})
	
	
}



function draw() {

	alert("장바구니 리스트 가져올게");
	
	var basketList = $(".basketList");
	
	var str = '';
	
	str = '<c:forEach items="${list}" var="basket"> <img src="<c:out value="${basket.itemImg1}"/>" class="basketItemImg"/>';
	str += '<h5 class="basketItemDescibe"><c:out value = "${basket.itemName}"/><br><c:out value = "${basket.price}"/>원<br>';
	str += '<c:out value = "${basket.itemNum}"/>개<br><c:out value = "${basket.baskId}"/><br><c:out value = "${basket.itemCode}"/><br></h5></c:forEach>';
	basketList.html(str);
	
}




/* 장바구니 리스트 ajax 로 불러오기 끝 */






</script>


</html>




