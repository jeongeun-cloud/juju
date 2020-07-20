<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<form action="/member/sellerJoinForm" method="post">

		상점이름(필수): <input type="text" class="shopName" name="shopName"> <br>
		회원이름(필수): <input type="text" class="memName" name="memName"> <br>
		이메일 계정(필수): <input type="text" id="emailAccount" name="emailAccount"> <br>
		이메일 인증: <button id="emailSendBtn">인증번호받기</button>  인증번호입력<input type="text" id="inputCode"> <button id="emailAuthBtn">인증하기</button>
		<input type="hidden" id="tempCode">
		<input type="hidden" id="authResult" value="false">
		<br>
		비밀번호(1234로 통일하자): <input type="password" id="pwd" name="pwd"> <br>
		회원주소:	<input type="text" id="postCode" name="postCode" size="5" value="" readonly="readonly"> 
					<a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
		지번 주소: <input type="text" id="jibunAddress" name="jibunAddress" size="50" value="" /><br> 
		도로명 주소: <input type="text" id="roadAddress" name="roadAddress" size="50" value="" /><br>
		나머지 주소(필수): <input type="text" id="shopAddr" name="shopAddr" size="50" value="" /> <br>
		사업자등록 :
		<button id="myBtn">사업자등록</button>
		<br> 연락처1(필수): <input type="text" id="contact1" name="contact1">
		<br> 연락처2(선택): <input type="text" id="contact2" name="contact2">
		<br> 우편번호(선택): <input type="text" id="postCode" name="postCode">
		<br>
		<!-- t_member -->




	
	<div id="myModal" class="modal">

		<div class="modal-content">
			<span class="close">&times;</span> 
			상점이름: 
			<input type="text" class="shopName" name="shopName" readonly="readonly"> <br> 
			대표자이름: 
			<input type="text" id="memName" name="memName"> <br>
			<!-- 상점이름  -->
			사업자 등록번호 (필수)
			<input type="text" id="businessCode" name="businessCode"> <br> 
			사업장 소재지
			<br> 우편번호 <input type="text" id="shopPostCode" name="shopPostCode">
			<a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
			지번 주소: 
			<input type="text" id="jibunAddress" name="jibunAddress" size="50" value="" /><br> 
			도로명 주소: 
			<input type="text" id="roadAddress" name="roadAddress" size="50" value="" /><br>  
			나머지 주소(필수): 
			<input type="text" id="memAddr" name="memAddr" size="50" value="" /> <br>
			<td>사업자 계좌번호(필수)</td>
			<td><select id="bank" name="bank">
					<option value="은행선택">은행선택</option>
					<option value="신한">신한은행</option>
					<option value="국민">국민은행</option>
					<option value="기업">기업은행</option>
					<option value="우리">우리은행</option>
					<option value="카카오">카카오뱅크</option>
			</select> <input type="text" name="bankAccount" id="bankAccount"></td> <br>
			<button id="sellerAuthBtn">확인</button>
			<br>

		</div>
	</div>
		<button type="submit">가입하기</button>
	</form>



	<script>
		var modal = document.getElementById("myModal");
		var btn = document.getElementById("myBtn");
		var span = document.getElementsByClassName("close")[0];
		var $sellerAuthBtn = $("#sellerAuthBtn");

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

		$sellerAuthBtn.click(function(e) {
			e.preventDefault();
			modal.style.display = "none";
		});

		
		$(document).ready(function(){
			
			$emailSendBtn = $("#emailSendBtn");
			$emailAccount = $("#emailAccount");
			$tempCode = $("#tempCode");
			$emailAuthBtn = $("#emailAuthBtn");
			$inputCode = $("#inputCode");
			$authResult = $("authResult");
			
			$emailAuthBtn.click(function(e){
				e.preventDefault();
				
				if($inputCode.val().trim()=="" || $inputCode.val()==null || $inputCode.val().trim().length==0 ){
					return false;
				}
				
				if($inputCode.val()==$tempCode.val()){
					alert("인증되었습니다");
					$authResult.val("true");
					$inputCode.val("");
				} else {
					alert("인증실패했습니다");
					$inputCode.val("");
				}
			});
			
			$emailSendBtn.click(function(e){
				
				e.preventDefault();
				var email =  $emailAccount.val();
				
				emailAuth(email)
				.then(function(response){
					console.log(response);
					$tempCode.val(response);
				})
				//자바의 트라이캐치문때문에 빨간줄이 떴다안떴다하는듯? 상관X
				.catch(function(error){
					console.log(error);
				});
			});
			
			//REST방식의 컨트롤러 MemberController에 페이지 이동 없이 비동기 방식으로  
			//인증키를 이메일로 보내고 가져와서 저장한다. 
			function emailAuth(email){
				return $.ajax({
					type : 'POST',
					url : '/member/emailAuth',
					data : email,
					contentType : "application/text; charset=UTF-8"
				});
			}
			
		});
		
		
		
		
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							var fullRoadAddr = data.roadAddress;
							var extraRoadAddr = '';

							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							document.getElementById('postCode').value = data.zonecode;
							document.getElementById('shopPostCode').value = data.zonecode;

							document.getElementById('roadAddress').value = fullRoadAddr;
							document.getElementById('jibunAddress').value = data.jibunAddress;

						}
					}).open()

		};
	</script>
</body>
</html>