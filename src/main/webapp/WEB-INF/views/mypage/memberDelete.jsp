<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
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

div.deleteMemberInfo {
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

	<form action="/mypage/memberDelete" id="memberDelete" method="post">

		<div class="a">
			<h2>마이페이지</h2>
			<div class="b">
				<ul>
					<c:choose>
<%-- 						<c:when test="${fn:substring(sessionMember, 0, 1) eq 'c'}"> --%>
                           <c:when test="${sessionMember.memCode eq 'CUSTOMER'}">
							<li><a href="/mypage/customerInfoModify">개인 정보 수정</a></li>
						</c:when>
<%-- 						<c:when test="${fn:substring(sessionMember, 0, 1) eq 's'}"> --%>
                           <c:when test="${sessionMember.memCode eq 'SELLER'}">
							<li><a href="/mypage/sellerInfoModify">개인 정보 수정</a></li>
						</c:when>
					</c:choose>
					<li><a href="/mypage/memberDelete">회원탈퇴</a></li>
				</ul>

			</div>

			<div class="deleteMemberInfo">
				비밀번호 입력: <input type="password" name="pwd" id="pwd"
					placeholder="PASSWORD"><br> 탈퇴사유: <br>
				<textarea id="reason" name="reason" rows="3" cols="50"
					style="resize: none;"></textarea>
				<input type="hidden" id="idNo" name="idNo" value="${sessionMember.idNo}">
				<br>
				<button type="submit" id="submitBtn">탈퇴하기</button>

			</div>

		</div>
	</form>
	<input type="hidden" id="result" value="${result }">

	<script>
		$(document).ready(function() {

			let reason = $("#reason");
			let memberDelete = $("#memberDelete");
			
			
			let result = $("#result").val();
			alertResult(result);
			history.replaceState({}, null, null)

			function alertResult(result) {
				if (result === '' || history.state) {
					return;
				}
				alert(result);
			}
			

			submitBtn = $("#submitBtn");

			submitBtn.click(function(e) {
				e.preventDefault();

				if (!(reasonCheck())) {
					return false;
				} else {
					memberDelete.submit();
				}

			});

			function reasonCheck() {

				if (reason.val().length > 300) {
					alert("300자까지만 입력할 수 있습니다.")
					reason.focus();
					return false;
				} else {
					return true;
				}

			}
			;

		});
	</script>
</body>
</html>