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
	.event_content{
	    width: 1300px;
	    height: 100%;
	    margin:0 auto;
	}
	
	.event_wrap{
	   position: relative;
	   padding-top: 30px;
	}
	
	.event_pro{
	    /* height: 2000px; */
	    width: 1000px;
	    margin: 0 auto;
	}
	
	.event_tit{
	    height: 50px;
	    background-color: #9dc6d8;
	}
	
	.banner {
		width: 1000px;
		height : 220px;
		padding-bottom : 30px;
	}

        
/* 장바구니 css 시작 */      
	.basketContainer {
    	position: fixed;
        top: 0px;
        z-index: 999;
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
</style>
    
   
</head>
<body>
<%@include file="./includes/header.jsp" %>
<%@include file="./includes/menuBar.jsp" %>
<%@include file="./includes/basketSlide.jsp" %>

<div class="event_content">
	<div class="event_wrap">
        <div class="event_pro">
            <div class="event_tit">
	            <c:forEach items="${event }" var="event">
	           		<img class="banner" alt="" src='/resources/banner/<c:out value="${event.imgPath}"/>/<c:out value="${event.uuid}"/>_<c:out value="${event.imgName}"/>' >
	           	</c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>