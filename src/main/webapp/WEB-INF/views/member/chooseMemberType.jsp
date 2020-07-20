<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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