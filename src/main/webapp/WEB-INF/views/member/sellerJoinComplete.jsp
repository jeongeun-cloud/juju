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
<style>
	
	table {
	  border-top: 3px solid #8FA691;
	  margin: 0 auto;
	  width: 450px;
	  text-align: left;
	  font-size: 16px;
	  margin-bottom: 30px;
	}
	
	h2 {
	  margin: 20px;
	  font-weight: bold;
	}
	
	.tdHead {
	  width: 150px;
	  font-weight: bold;
	  text-align: justify;
	}
	
	tr {
	  border-bottom: 1px solid gray;
	}
	
	td {
	  padding: 20px 5px;
	}
	
	button{
  		background-color: #8FA691;
       	border: 1px solid #8FA691;
       	margin: 0;
       	outline: none;
       	color: #FFFFFF;
       	padding: 15px 85px;
       	cursor: pointer;
       	margin-bottom: 5px;
	}
	
	#mainBtn {
		padding: 15px 90px;
	}
	
	#completeMemberInfo{
		position: absolute;
        left: 50%;
        top: 75%;
        transform: translate(-50%, -50%);
	}
</style>
</head>
<body>
	<div id="completeMemberInfo" align="center">
		<h2>회원가입이 완료되었습니다</h2>
		<div class="memberInfo">
			<table>
				<tr>
					<td class="tdHead">이메일</td>
					<td>${seller.emailAccount}</td>
				</tr>
				<tr>
					<td class="tdHead">이름</td>
					<td>${seller.memName}</td>
				</tr>
				<tr>
					<td class="tdHead">상점명</td>
					<td>${seller.shopName}</td>
				</tr>
				<tr>
					<td class="tdHead">가입일</td>
					<td id="regDate"></td>
				</tr>
			</table>
		</div>
		
		<button type="button" onclick="location.href='/member/login'">로그인</button>
		<button type="button" id="mainBtn" onclick="location.href='/'">메인</button>
	</div>
	
	
	<script>
		$(document).ready(function(){
			var regDate = $("#regDate");
			var today = new Date();
			
			
			regDate.text(formatDate(today));
			
			/* 연/월/일만 가져오는 함수 */
			function formatDate(date) { 
				var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
				if (month.length < 2) month = '0' + month; 
				if (day.length < 2) day = '0' + day; 
				return [year, month, day].join('-'); }
			
		});
	</script>
</body>
</html>