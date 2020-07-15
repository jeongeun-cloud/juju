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
               
        /* 사이드 메뉴바 시작 */
        .container {
            position: fixed;
            top: 0px;
        }

        #navID {
            right: -20%;
        }
        /* 사이드 메뉴바 끝 */


        .navbar {
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

        .toggle-collapse {
            float: left;
            margin-left: -3.685em;
            margin-top: 17em;
            content: "";
            outline: inherit;
            border: 0px;
            background: transparent;
        }

        .toggle-icon,
        .toggle-icon::before,
        .toggle-icon::after{
            content:"";
            position: fixed;
            background-color: transparent;
            border-radius: 2em;
            border: 0px solid transparent ; 
            cursor: pointer;
            transition: 0.800s ease;
            margin-top: 0.8em;     
        }

        
       .cartList {
           margin-left: 0px;
           margin-top: 50px;
           width:100%;
           height: 95%;
           background-color: white;
           color: grey;
       }
      

</style>
</head>
<body>


<!-- 사이드메뉴바 시작 -->
<div class="container">
    <nav class="navbar" id="navID">

        <button type="button" onclick="myFnc(this)" class="toggle-collapse" id="toggle-button" > 
            <span class="toggle-icon"> </span>
            <img src="https://postfiles.pstatic.net/MjAyMDA2MjlfMjEg/MDAxNTkzNDM0MTcyMjA1.88gzgV5fOBxNdrVHMP30f8M0QYJrvSab6jH2NfuZ6dQg.t1i-emD2OypaNqJsiUJYOdSci8sM9Dal67XTAMfJyf0g.PNG.glgltwwofus/cart.png?type=w773"/>
        </button>   

        <br>장바구니

        <div class="cartList">
        
        <%-- <h1><c:out value="${basket.baskId}" default="stock"/></h1> --%>
        
        <!-- 고객 id 에 해당하는 장바구니 다 가져오려다가 실패함 - list.jsp로 분리함. 대신 얘는 http://localhost/basket/detail?idNo=cus000001 이런식으로 호출하면 나옴 -->
        
        <c:out value = "${basket.baskId}"/>
        
        <c:forEach items="${list}" var="basket">
        
        <h1>
        <c:out value = "${basket.baskId}"/>
        </h1>
        
        </c:forEach>
        
        </div>


    </nav>
</div>
<!-- 사이드메뉴바 끝 -->




<!-- 사이드메뉴바 스크립트 시작 -->
<script>
 
    function myFnc(e) {
           e.classList.toggle("show");
           var elem = document.getElementById("navID"),
           Style = window.getComputedStyle(elem),
           right = Style.getPropertyValue("right");
           //console.log(right);
           if(right === "0px") {
               elem.style.right = "-20%";

           }else {
               elem.style.right = "0%";
           }
       }
</script>
<!-- 사이드메뉴바 스크립트 끝 -->
</body>
</html>