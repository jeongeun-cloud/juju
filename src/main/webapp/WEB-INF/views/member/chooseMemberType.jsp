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

	button{
  			background-color: #8FA691;
        	border: 1px solid #8FA691;
        	border-radius: 5px;
        	margin: 0;
        	outline: none;
        	color: #FFFFFF;
        	padding: 15px 175px;
        	cursor: pointer;
        	margin-bottom: 5px;
		}
		
	#chooseMemberType{
		position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
	}
</style>
<body>
	<div id="chooseMemberType" align="center">
		<h1>주주마켓 회원가입</h1>
		<h6>회원타입별 가입안내문구 추가하기</h6>
		
		<br><br>
		<button onClick="location.href='/member/customerJoinForm'">일반회원가입</button><br><br>
		<button onClick="location.href='/member/sellerJoinForm'">상인회원가입</button>
	</div>
</body>
</html>