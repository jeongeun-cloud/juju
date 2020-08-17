<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../includes/header.jsp" %>
<%@include file="./../includes/menuBar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

	#deleteDiv {
		margin:  180px 0px;
		height : 350px;
	}

   	h3 {
	  margin: 30px;
	  font-weight: bold;
	}
	
	button, input[type="submit"] {
		background-color: #8FA691;
		border: 1px solid #8FA691;
		margin: 0;
		outline: none;
		color: #FFFFFF;
		padding: 15px 70px;
		cursor: pointer;
		margin-bottom: 5px;
		font-size: 14px;
	}
</style>
</head>
<body>
	<div id="deleteDiv" align="center">
		<h3>주주마켓 탈퇴가 완료되었습니다</h3>
		
		<br>
		<button type="button" onclick="location.href='/member/chooseMemberType'">회원가입</button>
		<button type="button" onclick="location.href='/'">메인으로 </button>
	</div>
	
   <%@include file="../includes/footer.jsp" %>   	
	
</body>
</html>


