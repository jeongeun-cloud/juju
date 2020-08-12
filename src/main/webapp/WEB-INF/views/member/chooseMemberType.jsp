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
	html{
			font-family: "쌍문동_타이포";
		}
	button{
			width: 300px;
			height:30px;
		}
</style>
<body>
	<div align="center">
		<h1>주주마켓 회원가입</h1>
		<h6>
			
			- 제품을 구매만 할 경우는 ‘일반회원’으로 가입하세요<br>
			- 제품 구매 및 판매 할 경우는 ‘상인’으로 가입하세요<br>
			- 상인으로 가입시 사업자등록 인증이 필요합니다.<br>
			- 상인으로 가입시 관리자의 허가가 있어야 상점 등록 가능 합니다.
			
		</h6>
		<br><br>
		<button onClick="location.href='/member/customerJoinForm'">일반회원가입</button><br><br>
		<button onClick="location.href='/member/sellerJoinForm'">상인가입</button>
	</div>
</body>
</html>