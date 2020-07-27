<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial;
}

/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
</head>
<body>

	<h2>아이디(이메일 계정)/비밀번호 찾기</h2>

	<div class="tab">

		<button class="tablinks">아이디(이메일)찾기</button>
		<button class="tablinks">비밀번호 찾기</button>
	</div>

	<div id="findId" class="tabcontent">
		<input type="radio" id="selectCustomer" name="memCode"
			value="CUSTOMER" checked="checked">일반고객회원 <input type="radio"
			id="selectSeller" name="memCode" value="SELLER"> 판매자 회원 <br>
		회원이름: <input type="text" id="memName" name="memName"><br>
		연락처: <input type="text" id="contact" name="contact"><br>

		<button type="submit" id="findIdBtn">확인</button>

	</div>

	<div id="findPwd" class="tabcontent">
		가입된 이메일 주소로 인증번호를 받아 확인한 후 새로운 비밀번호를 설정할 수 있습니다. <br> <input type="text" id="emailAccount"
			name="emailAccount" placeholder="이메일을 입력해주세요">
		<button id="emailSendBtn">인증번호 받기</button>
		<br> <input type="text" id="inputCode" placeholder="인증번호를 입력해주세요">
		<input type="hidden" id="tempCode">
		<button id="emailAuthBtn">인증하기</button>
		<input type="hidden" id="authResult" value="false">
		<br>

		<div id="myModal" class="modal">

			<div class="modal-content">
			<span class="close">&times;</span> 

				새로운 비밀번호: <input type="text" id="setPwd" name="setPwd"><br>
				비밀번호 확인 : <input type="text" id="setPwdChk" name="setPwdChk"><br>

				<button type="submit" id="submitBtn">저장하기</button>
			</div>
		</div>

	</div>


	<script>		
	
	let modal = document.getElementById("myModal");
	let btn = document.getElementById("emailAuthBtn");
	let span = document.getElementsByClassName("close")[0];

	btn.onclick = function(e) {
		e.preventDefault();
		modal.style.display = "block";
	}

	span.onclick = function() {
		modal.style.display = "none";
	}

	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}

/* 	$sellerAuthBtn.click(function(e) {
		e.preventDefault();
		modal.style.display = "none";
	}); */

	
	$(document).ready(function() {
		
		$("#findId").css("display", "block");
		let modal = document.getElementById("myModal");
		let tablinks = $(".tablinks");
		let tabNames = [ "findId", "findPwd" ];
		let findIdBtn = $("#findIdBtn");
		
		
		
		for (let i = 0; i < tablinks.length; i++) {
			let tablink = tablinks[i];
			let tabName = tabNames[i];
			tablink.addEventListener("click", function(event) {
				openTabs(event, tabName);
			});
		}

		function openTabs(event, tabName) {
			let i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(tabName).style.display = "block";
			event.target.className += 'active';
		}
	});
	
	</script>

</body>
</html>
