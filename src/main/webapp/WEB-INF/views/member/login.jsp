<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	html{
		font-family: "쌍문동_타이포";
	}
	button{
			width: 300px;
			height:30px;
	}
</style>
</head>



<body>
	<div align="center">
		<h1>로그인</h1>
		<h4>			
			회원
		</h4>
		<form action="/member/login"  method="post">
			<input type="text" name="emailAccount" id="emailAccount" placeholder="ID"><br>
			<input type="password" name="pwd" id="pwd" placeholder="PASSWORD"><br>
	
			<input type="submit" value="로그인"><br>
			<a href="/member/login/findIdPwd">아이디찾기/비밀번호 찾기(아직안됨 누르지마셈)</a><br>
<!-- 			<button type="button">네이버 로그인</button><br>
			<button type="button">페이스북 로그인</button><br>
			<button type="button">카카오톡 로그인</button><br> -->
<!-- 			<button type="button" onClick="location.href='/member/chooseMemberType'">회원가입</button> -->
		</form>
		
	</div>
</body>
</html>