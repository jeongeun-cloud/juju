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
	    height: 1000px;
	    width: 1000px;
	    margin: 0 auto;
	}
	
	.event_tit{
	    height: 50px;
	}
	
	.banner {
		width: 1000px;
		height : 220px;
		padding-bottom : 30px;
	}

        
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

<%@include file="./includes/footer.jsp" %>

</body>
</html>