<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="./../includes/header.jsp" %>
<%@include file="./../includes/menuBar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

</head>
<style>



	h3 {
	  margin: 20px;
	  font-weight: bold;
	}
	
	button{
			
  			background-color: #8FA691;
        	border: 1px solid #8FA691;
        	margin: 0;
        	outline: none;
        	color: #FFFFFF;
        	padding: 15px 150px;
        	cursor: pointer;
        	margin-bottom: 10px;
		}
		
	#chooseMemberType{
		height: 350px;
	}
	
	#chooseMemberTypeAll{
		height: 350px;
		margin-top: 110px;
	}
</style>
<body>
<div id="chooseMemberTypeAll">
	<div id="chooseMemberType" align="center">
		<h3>회원가입</h3>
		<h6>회원 타입을 선택해주세요</h6>

		
		<br>
		<button onClick="location.href='/member/customerJoinForm'">일반회원</button><br>
		<button onClick="location.href='/member/sellerJoinForm'">상인회원</button>
	</div>
</div>
	
	<%@include file="../includes/footer.jsp" %>   
	
	
	
</body>
</html>