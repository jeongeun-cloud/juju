<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>registerInfo<br>가입이완료되었습니다</h1>
		<h6>			
			-u should check!
		</h6>
		<form action="">
		<table border="1">
		<thread>
		<tr>
			<th>이름</th>
			<th>이메일</th>
		</tr>
		</thread>
		<tr>
			<td><c:out value="${member.memName}"/></td>
			<td><c:out value="${member.emailAccount}"/></td>
		</tr>
		
		
		</table>
		<br><br>	
					
	</form>
		<button onClick="location.href='/member/login/login'">로그인하기</button>
	</div>
</body>
</html>