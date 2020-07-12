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



<!-- 장바구니 사이드메뉴바 body 시작 -->
<div class="basketContainer">
    <nav class="basketNavBar" id="basketNav">

        <button type="button" onclick="basketClicked(this)" class="basket-toggle-collapse" > 
            <span class="basket-toggle-icon"> </span>
            <img src="https://postfiles.pstatic.net/MjAyMDA2MjlfMjEg/MDAxNTkzNDM0MTcyMjA1.88gzgV5fOBxNdrVHMP30f8M0QYJrvSab6jH2NfuZ6dQg.t1i-emD2OypaNqJsiUJYOdSci8sM9Dal67XTAMfJyf0g.PNG.glgltwwofus/cart.png?type=w773"/>
        </button>   

        <br>장바구니

        <div class="basketList">
        
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
        
        </div>


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
           if(right === "0px") {
               elem.style.right = "-20%";

           }else {
               elem.style.right = "0%";
           }
       }
    /* 장바구니 누르면 펼쳐졌다 닫혔다 하는 기능 끝 */
 	
 	
</script>
</body>
</html>