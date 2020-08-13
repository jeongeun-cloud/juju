<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>탈퇴가 완료되었습니다</h1>
		
		<button type="button" onclick="location.href='/member/chooseMemberType'">회원가입하기</button>
		<button type="button" onclick="location.href='/'">메인으로 가기</button>
	</div>
	
   <%@include file="../includes/footer.jsp" %>   	
	
</body>
</html>


