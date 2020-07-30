<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
	
	<style>
h2 {
	position: absolute;
	left: 20px;
}

div.a {
	position: relative;
	height: 600px;
	/* border: 3px solid red; */
}

div.b {
	position: absolute;
	left: 20px;
	top: 70px;
	width: 200px;
	height: 500px;
	border: 1px solid black;
}

div.modifyPwd {
	position: absolute;
	left: 250px;
	top: 70px;
	width: 700px;
	height: 500px;
	border: 1px solid black;
}

a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>




	<form action="/mypage/modifyPwd" id="modifyPwd" method="post">

		<div class="a">
			<h2>마이페이지</h2>
			<div class="b">
				<ul>
					
					<c:choose>
<%-- 						<c:when test="${fn:substring(sessionMember, 0, 1) eq 'c'}"> --%>
                           <c:when test="${sessionMember.memCode eq 'CUSTOMER'}">
							<li><a href="/mypage/customerInfoModify">회원정보수정</a></li>
						</c:when>
<%-- 						<c:when test="${fn:substring(sessionMember, 0, 1) eq 's'}"> --%>
                           <c:when test="${sessionMember.memCode eq 'SELLER'}">
							<li><a href="/mypage/sellerInfoModify">회원정보수정</a></li>
						</c:when>
					</c:choose>
					<li><a href="/mypage/modifyPwd">비밀번호변경</a></li>
					<li><a href="/mypage/memberDelete">회원탈퇴</a></li>
				</ul>

			</div>

			<div class="modifyPwd">
				현재 비밀번호: <input type="password" name="pwd" id="pwd" placeholder="PASSWORD"><br> 
				새로운 비밀번호: <input type="password" id="newPwd" name="pwd"><br>
				비밀번호 확인 : <input type="password" id="newPwdChk"><br>
				<input type="hidden" id="idNo" name="idNo" value="${sessionMember.idNo}">
				<br>
				<button type="submit" id="submitBtn">비밀번호변경하기</button>

			</div>

		</div>
	</form>
	<input type="hidden" id="result" value="${result }">


</body>


</html>