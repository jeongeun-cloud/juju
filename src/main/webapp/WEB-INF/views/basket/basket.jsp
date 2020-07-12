<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Basket List</title>

    
    <style>
        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
               
               
               
           /* 장바구니 css 시작 */      
        .basketContainer {
            position: fixed;
            top: 0px;
            
            
            
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
       
       
       
       
       /* 장바구니 css 끝 */  


</style>
</head>
<body>



<!-- 장바구니 사이드메뉴바 body 시작 -->
<div class="basketContainer">
    <nav class="basketNavBar" id="basketNav">

        <button type="button" onclick="basketClicked(this)" class="basket-toggle-collapse" > 
            <span class="basket-toggle-icon"> </span>
            <img src="/resources/images/cart.png"/>
        </button>   

        <br>장바구니

        <ul class="basketList" id="basketList">
        
        
        <!-- 장바구니 리스트 영역 시작 -->
         
        <c:forEach items="${list}" var="basket">
        
        <div id="basketImg">
        <img src="<c:out value="${basket.itemImg1}"/>" class="basketItemImg"/>
        </div>
        
        <div id="basketContent">
        <h5 class="basketItemDescribe">
        <c:out value = "${basket.itemName}"/><br>
        <c:out value = "${basket.price}"/>원<br>
        <c:out value = "${basket.itemNum}"/>개<br>
        <c:out value = "${basket.baskId}"/><br>
        </h5>
        <br>
        </div>
        
        
        
        </c:forEach> 
          
        <!-- 장바구니 리스트 영역 끝 -->
        
        
        
        </ul>


    </nav>
</div>
<!-- 장바구니 사이드메뉴바 body 끝 -->





<script>
 
 

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

 	
 	
</script>
</body>
</html>