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

	<h2>아이디/비밀번호 찾기</h2>

	<div class="tab">

		<button class="tablinks">아이디(이메일)찾기</button>
		<button class="tablinks">비밀번호 찾기</button>
	</div>

	<div id="findId" class="tabcontent">
		<input type="radio" id="selectCustomer" name="memCode" value="CUSTOMER" checked="checked">일반고객회원
		 <input type="radio" id="selectSeller" name="memCode" value="SELLER"> 판매자 회원 <br>
		회원이름: <input type="text" id="memName" name="memName"><br>
		연락처: <input type="text" id="contact" name="contact"><br>

		<button type="submit" id="findIdBtn">확인</button>

		<div id="findIdResult">
			<ul id="resultUl"></ul>


		</div>
	</div>

	<div id="findPwd" class="tabcontent">
<form action="/member/findIdPwd" method="POST">
		가입된 이메일 주소로 인증번호를 받아 확인한 후 새로운 비밀번호를 설정할 수 있습니다. <br> <input
			type="text" id="emailAccount" name="emailAccount"
			placeholder="이메일을 입력해주세요"> <input type="hidden"
			id="duplicateCheck"> <input type="hidden"
			id="duplicateCheckResult" value="false">
		<button id="emailSendBtn">인증번호 받기</button>
		<br> <input type="text" id="inputCode" placeholder="인증번호를 입력해주세요">
		<input type="hidden" id="tempCode">
		<button id="emailAuthBtn">인증하기</button>
		<input type="hidden" id="authResult" value="false"> <br>



		<div id="myModal" class="modal">

			<div class="modal-content">
				<span class="close">&times;</span> 새로운 비밀번호: <input type="password"
					id="newPwd" name="pwd"><br> 비밀번호 확인 : <input
					type="password" id="newPwdChk"><br>


				<button type="submit" id="submitBtn">저장하기</button>
	</form>
			</div>


		</div>

	</div>

	<script>		
	
	let modal = document.getElementById("myModal");
	let span = document.getElementsByClassName("close")[0];



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
		
		let memName = $("#memName");
		let contact = $("#contact");

		let findPwd = $("#findPwd");
		let emailSendBtn = $("#emailSendBtn");
		let tempCode = $("#tempCode");
		let emailAuthBtn = $("#emailAuthBtn");
		let inputCode = $("#inputCode");
		let authResult = $("#authResult");
		let emailAccount = $("#emailAccount");
		let submitBtn = $("#submitBtn");
		let emailDuplicateCheckBtn = $("#emailDuplicateCheckBtn");
		let duplicateCheckResult = $("#duplicateCheckResult");
		
		
		
		for (let i = 0; i < tablinks.length; i++) {
			let tablink = tablinks[i];
			let tabName = tabNames[i];
			tablink.addEventListener("click", function(event) {
				openTabs(event, tabName);
				$("#"+tabName+"").find("input[type='text']").val("");
			});
		}
		
	

		findIdBtn.click(function(e){
			e.preventDefault();		
			let memCode = $(":checked");
			
			let memberInfo = {
					"memName" : memName.val(),
					"contact" : contact.val(),
					"memCode" : memCode.val()
			}
			
			findId(memberInfo)
			.then(function(response){
				if(response==""){
					alert("가입 정보가 없습니다.");
				}
				showResult(response);
			})
			.catch(function(error){
				console.log(error);
			});
			
		});
		
		function showResult(emailResults){
			
			let resultUl = $("#resultUl");
			let str = "";
			
			for(let i = 0; i<emailResults.length; i++){
				let emailResult = emailResults[i];
				str+="<li>"+emailResult+"</li>"
			}
				resultUl.html(str);
			
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
		
		//memberInfo는 아이디찾기에서 입력하는 이름, 연락처 정보임
		function findId(memberInfo){
			
		return $.ajax({
			type : 'POST',
			url  : '/member/findId',
			data : JSON.stringify(memberInfo),
			contentType: "application/json"
		});
		}
		
		emailAuthBtn.click(function(e){
			e.preventDefault();
			
			//return true일때와 각 input항목 유효성검사, 정규식 처리 이후 가입하기 submit 되도록 처리하기 				
			if(inputCode.val()==tempCode.val()){
				alert("이메일 인증에 성공했습니다.");
				authResult.val("true");
				inputCode.val("");
				modal.style.display = "block";
			} else {
				alert("이메일 인증에 실패했습니다.");
				inputCode.val("");
			}
		});
		
		emailSendBtn.click(function(e){
			
			e.preventDefault();
			
			if (!(emailAccountCheck())) {
				return false;
			} 
			
			let email =  emailAccount.val();
			
			duplicateCheck(email)
			.then(function(response){
				if(response){
					alert("가입정보가 없습니다");
					duplicateCheckResult.val("false");
				} else {
					emailAuth(email)
					.then(function(response){
						alert("인증번호가 발송되었습니다");
						console.log(response); //콘솔에 확인용(실제로 할 때는 지우자)
						tempCode.val(response);
					})
					.catch(function(error){
						console.log(error);
					});
				}
			})
			//자바의 트라이캐치문때문에 빨간줄이 떴다안떴다하는듯? 상관X 
			.catch(function(error){
				console.log(error);
			});
		});
		
		
		function emailAuth(email){
			return $.ajax({
				type : 'POST',
				url : '/member/emailAuth',
				data : email,
				contentType : "application/text; charset=UTF-8"
			});
		}
		
		
		function emailAccountCheck(){

			let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if (emailAccount.val().trim() == "" || emailAccount.val() == null) {
				alert("이메일 주소를 입력해주세요.");
				emailAccount.focus();
				return false;
			} else if (emailAccount.val().length > 30) {
				alert("30자까지만 입력할 수 있습니다.")
				emailAccount.focus();
				return false;
			} else if (!regExp.test(emailAccount.val())) {
				alert("이메일 주소를 양식에 맞게 다시 입력하세요.");
				emailAccount.focus();
				return false
			} else {
				return true;
			}
			
		};
		
		
		
		function duplicateCheck(emailAccount){
			return $.ajax({
				type : 'POST',
				url : '/member/duplicateCheck',
				data : emailAccount,
				contentType : "application/text; charset=UTF-8"
			});
		} 
	});
		
	</script>

</body>
</html>
