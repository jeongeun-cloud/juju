<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
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

div.customerInfo {
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

<form action ="/mypage/customerInfoModify" id="customerInfoModify" method = "post">

	<div class="a">
		<h2>마이페이지</h2>
		<div class="b">
			<ul>
				<li><a href="/mypage/customerInfoModify">회원수정</a></li>
				<li><a href="/mypage/modifyPwd">비밀번호 변경</a></li>
				<li><a href="/mypage/memberDelete">회원탈퇴</a></li>
			</ul>

		</div>
		<div class="customerInfo">

			<table border="1" cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="150" />
					<col width="400" />
				</colgroup>

				<tr>
					<th>이메일 계정</th>
					<td>${customerInfo.emailAccount}</td>
					
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="memName" name="memName"
						value="${customerInfo.memName}"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" id="contact" name="contact"
						value="${customerInfo.contact}"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="memAddr" name="memAddr"
						value="${customerInfo.memAddr}"></td>
				</tr>

			</table>
				<input type="hidden" id="idNo" name="idNo" value="${sessionMember}">
			<br>
			<button type="submit" id="submitBtn">수정하기</button>

		</div>

	</div>
		</form>
		<input type="hidden" id="result" value="${result }">

<script>

$(document).ready(function(){
	
	customerInfoModify = $("#customerInfoModify");
	
	memName = $("#memName");
	memAddr = $("#memAddr");
	contact = $("#contact");
	
	 let result = $("#result").val();
     alertResult(result);
     history.replaceState({},null,null)
     
     function alertResult(result){
        if (result ==='' || history.state){
           return;
        }
        alert(result);
     }
	
	submitBtn = $("#submitBtn");
	

     submitBtn.click(function(e) {
		e.preventDefault();

		if (!(memNameCheck())) {
			return false;
		} else if (!(contactCheck())) {
			return false;
		} else if (!(memAddrCheck())) {
			return false;
		}else {
			customerInfoModify.submit();
		}

	});
	
	
	
	function memNameCheck(){
		let regExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;

		if (memName.val().trim() == "" || memName.val() == null) {
			alert("값을 입력해주세요.");
			memName.focus();
			return false;
		} else if (memName.val().length > 30) {
			alert("30자까지만 입력할 수 있습니다.")
			memName.focus();
			return false;
		} else if (!regExp.test(memName.val())) {
			alert("이름을 양식에 맞게 다시 입력하세요.");
			memName.focus();
			return false
		} else {
			return true;
		}
		
	}
	
	function contactCheck(){
		let regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

		if (contact.val().trim() == "" || contact.val() == null) {
			alert("값을 입력해주세요.");
			contact.focus();
			return false;
		} else if (contact.val().length > 13) {
			alert("13자까지만 입력할 수 있습니다.")
			contact.focus();
			return false;
		} else if (!regExp.test(contact.val())) {
			alert("연락처를 양식에 맞게 다시 입력하세요.");
			contact.focus();
			return false
		} else {
			return true;
		}
		
	};
	
	function memAddrCheck(){

		
		if (memAddr.val().trim() == "" || memAddr.val() == null) {
			alert("값을 입력해주세요.");
			memAddr.focus();
			return false;
		} else if (memAddr.val().length > 30) {
			alert("30자까지만 입력할 수 있습니다.")
			memAddr.focus();
			return false;
		} else {
			return true;
		}
		
	};
	
		
});
</script>
</body>
</html>