<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> <!-- 모달창 가져오는 과정에서 스타일이 붙은것임  -->
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
	<form action="/member/sellerJoinForm"  id="sellerJoinForm" method="post">

		이메일 계정(필수):
		<input type="text" id="emailAccount" name="emailAccount"> <button id="emailDuplicateCheckBtn">중복확인</button> <br>
		<input type="hidden" id="duplicateCheck">
		<input type="hidden" id="duplicateCheckResult" value="false">
		이메일 인증: <button id="emailSendBtn">인증번호받기</button>  인증번호입력<input type="text" id="inputCode"> <button id="emailAuthBtn">인증하기</button>
		<input type="hidden" id="tempCode">
		<input type="hidden" id="authResult" value="false">
		<br>
		비밀번호(1q2w3e4r로 통일): <input type="password" id="pwd" name="pwd"> <br>
		비밀번호확인(1q2w3e4r로 통일) : 
		<input type="password" id="pwdChk" name="pwdChk">  <br>
		상점이름(필수): <input type="text" id="shopName" name="shopName"> <br>
		회원이름(필수): <input type="text" id="memName" name="memName"> <br>
		회원주소:	<input type="text" id="postCode" name="postCode" size="5" value="" readonly="readonly"> 
					<a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
		지번 주소: <input type="text" id="jibunAddress" name="jibunAddress" size="50" value="" /><br> 
		도로명 주소: <input type="text" id="roadAddress" name="roadAddress" size="50" value="" /><br>
		나머지 주소: <input type="text" id="memAddr" name="memAddr" size="50" value="" /> <br>
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
			<input type="text" class="shopNameModal" name="shopNameModal" readonly="readonly"> readonly <br> 
			대표자이름(회원이름과 동일): 
			<input type="text" id="memNameModal" name="memNameModal" readonly="readonly">readonly <br>
			<!-- 상점이름  -->
			사업자 등록번호 (필수)
			<input type="text" id="businessCode" name="businessCode"> <br> 
			사업자등록증 업로드하기
			<input type="text" id="businessRegFile" name="businessRegFile" readonly = "readonly"> <br>
			사업장 소재지
			<br> 우편번호 <input type="text" id="shopPostCode" name="shopPostCode">
			<a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
			지번 주소: 
			<input type="text" id="jibunAddress" name="jibunAddress"/><br> 
			도로명 주소: 
			<input type="text" id="roadAddress" name="roadAddress" /><br>  
			나머지 주소(필수): 
			<input type="text" id="shopAddr" name="shopAddr" /> <br>
			<td>사업자 계좌번호(필수)</td>
			<td><select id="bank" name="bank">
					<option value="은행선택">은행선택</option>
					<option value="신한">신한은행</option>
					<option value="국민">국민은행</option>
					<option value="기업">기업은행</option>
					<option value="우리">우리은행</option>
					<option value="카카오">카카오뱅크</option>
			</select> <input type="text" name="bankAccount" id="bankAccount"></td> <br>
			상점이미지(썸네일) 업로드하기
			<input type="text" id="thumbImg" name="thumbImg" readonly = "readonly"> <br>
		
			<button id="sellerAuthBtn">확인</button>
			<br>

		</div>
	</div>
		<button type = "submit" id="submitBtn"  > 가입하기 </button> 
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
			
			emailSendBtn = $("#emailSendBtn");
			emailAccount = $("#emailAccount");
			tempCode = $("#tempCode");
			pwd = $("#pwd");
			pwdChk = $("#pwdChk");
			shopName = $("#shopName");
			shopNameModal = $("#shopNameModal");
			memName = $("#memName");
			memNameModal = $("#memNameModal");
			businessCode = $("#businessCode");
			businessRegFile = $("#businessRegFile");
			memAddr = $("#memAddr");
			shopAddr = $("#shopAddr");
			contact1 = $("#contact1");
			contact2 = $("#contact2");
			bankAccount = $("#bankAccount");
			
			emailAuthBtn = $("#emailAuthBtn");
			inputCode = $("#inputCode");
			authResult = $("#authResult");
			
			emailDuplicateCheckBtn = $("#emailDuplicateCheckBtn");
			duplicateCheckResult = $("#duplicateCheckResult");
			
			
			
			emailAuthBtn.click(function(e){
				e.preventDefault();
				
				if (!(emailAccountCheck())) {
					return false;
				} else if (duplicateCheckResult.val()=="false") {
					alert("중복체크를 하지 않았습니다.");
					return false;
				}
				
				if(inputCode.val().trim()=="" || inputCode.val()==null || inputCode.val().trim().length==0 ){
					return false;
				}
				
				
				//return true일때와 각 input항목 유효성검사, 정규식 처리 이후 가입하기 submit 되도록 처리하기 				
				if(inputCode.val()==tempCode.val()){
					alert("이메일 인증을 성공했습니다.");
					authResult.val("true");
					inputCode.val("");
				} else {
					alert("이메일 인증을 실패했습니다.");
					inputCode.val("");
				}
			});
			
			//이메일보내기 버튼을 누르면 실행되는 함수 
			emailSendBtn.click(function(e){
				
				e.preventDefault();
				
				if (!(emailAccountCheck())) {
					return false;
				} else if (duplicateCheckResult.val()=="false") {
					alert("중복체크를 하지 않았습니다.");
					return false;
				}
				
				var email =  emailAccount.val();
				
				emailAuth(email)
				.then(function(response){
					console.log(response);
					tempCode.val(response);
				})
				//자바의 트라이캐치문때문에 빨간줄이 떴다안떴다하는듯? 상관X 
				.catch(function(error){
					console.log(error);
				});
			});
			
			//가입폼 중간에 이메일 주소값이 바뀌면 중복체크,인증결과를 전부 false로 변경
			emailAccount.change(function(e){
				duplicateCheckResult.val("false");
				authResult.val("false");
			});
			
			
			//이메일 중복체크
			emailDuplicateCheckBtn.click(function(e){
				e.preventDefault();
				if (!(emailAccountCheck())) {
					return false;
				}
				
				duplicateCheck(emailAccount.val())
				.then(function(response){
					
				if(response==true){
					alert("사용가능한 이메일계정입니다.");
					duplicateCheckResult.val("true")
					
				} else{
					alert("이미 가입된 이메일입니다. 다른 이메일주소를 입력해주세요.");
					duplicateCheckResult.val("false")
									
				}
				emailDuplicateCheckBtn.val(response);
				})
				
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
			
			
			
			var submitBtn = $("#submitBtn");
			var sellerJoinForm = $("#sellerJoinForm");
		
			submitBtn.click(function(e) {
			e.preventDefault();

			if (!(emailAccountCheck())) {
				return false;
			} else if (duplicateCheckResult.val()=="false") {
				alert("중복체크가 안됐습니다.");
				return false;
			} else if (authResult.val()=="false") {
				alert("인증이 필요합니다.");
				return false;
			} else if (!(pwdCheck())) {
				return false;
			} else if (!(pwdChk.val()===pwd.val())){
				alert("비밀번호확인은 비밀번호와 같아야 합니다.");
				pwdChk.focus();
				return false;
			} else if (!(memNameCheck())) {
				return false;
			} else if (!(shopNameCheck())) {
				return false;
			} else if (!(contact1Check())) {
				return false;
			}  else if (!(bankAccountCheck())) {
				return false;
			} else if (!(businessCodeCheck())) {
				return false;
			}else {
				sellerJoinForm.submit();
			}

		});
		
		function emailAccountCheck(){

			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if (emailAccount.val().trim() == "" || emailAccount.val() == null) {
				alert("이메일주소를 입력해주세요.");
				emailAccount.focus();
				return false;
			} else if (emailAccount.val().length > 30) {
				alert("30자까지만 입력할 수 있습니다.")
				emailAccount.focus();
				return false;
			} else if (!regExp.test(emailAccount.val())) {
				alert("이메일을 양식에 맞게 다시 입력하세요.");
				emailAccount.focus();
				return false
			} else {
				return true;
			}
			
		};
		
		
		
		function pwdCheck(){
			
			var regExp = /^[A-Za-z0-9]{6,12}$/;
			
			if (pwd.val().trim() == "" || pwd.val() == null) {
				alert("비밀번호를 입력해주세요.");
				pwd.focus();
				return false;
			} else if (pwd.val().length > 20) {
				alert("20자까지만 입력할 수 있습니다.")
				pwd.focus();
				return false;
			} else if (!regExp.test(pwd.val())) {
				alert("비밀번호를 양식에 맞게 다시 입력하세요. (6~12자리의 문자+숫자)");
				pwd.focus();
				return false
			} else {
				return true;
			}
		};
		
		
	function businessCodeCheck(){
			
			var regExp =  /[^1-15]/g;
			
			if (businessCode.val().trim() == "" || businessCode.val() == null) {
				alert("사업자등록번호를 입력해주세요.");
				businessCode.focus();
				return false;
			} else if (businessCode.val().length > 30) {
				alert("30자까지만 입력할 수 있습니다.")
				businessCode.focus();
				return false;
			} else if (!regExp.test(businessCode.val())) {
				alert("사업자등록번를 양식에 맞게 다시 입력하세요.(1~15자리의 숫자)");
				businessCode.focus();
				return false
			} else {
				return true;
			}
		};
		
		function bankAccountCheck(){
			
			var regExp =  /[^1-15]/g;
			
			if (bankAccount.val().trim() == "" || bankAccount.val() == null) {
				alert("계좌번호를 입력해주세요.");
				bankAccount.focus();
				return false;
			} else if (bankAccount.val().length > 30) {
				alert("30자까지만 입력할 수 있습니다.")
				bankAccount.focus();
				return false;
			} else if (!regExp.test(bankAccount.val())) {
				alert("계좌번호를 양식에 맞게 다시 입력하세요.(1~15자리의 숫자)");
				bankAccount.focus();
				return false
			} else {
				return true;
			}
		};
		
		
		function shopNameCheck(){
			var regExp = /^[가-힣]{1,10}|[a-zA-Z]{1,10}\s[a-zA-Z]{1,10}$/;

			if (shopName.val().trim() == "" || shopName.val() == null) {
				alert("상점이름을 입력해주세요.");
				shopName.focus();
				return false;
			} else if (shopName.val().length > 30) {
				alert("30자까지만 입력할 수 있습니다.")
				shopName.focus();
				return false;
			} else if (!regExp.test(shopName.val())) {
				alert("상점이름을 양식에 맞게 다시 입력하세요. (한글,영어10자)");
				shopName.focus();
				return false
			} else {
				return true;
			}
			
		};
		
		
		function memNameCheck(){
			var regExp = /^[가-힣]{1,5}|[a-zA-Z]{1,10}\s[a-zA-Z]{1,10}$/;

			if (memName.val().trim() == "" || memName.val() == null) {
				alert("회원이름을 입력해주세요.");
				memName.focus();
				return false;
			} else if (memName.val().length > 30) {
				alert("30자까지만 입력할 수 있습니다.")
				memName.focus();
				return false;
			} else if (!regExp.test(memName.val())) {
				alert("회원이름을 양식에 맞게 다시 입력하세요.(한글5자,영어10자)");
				memName.focus();
				return false
			} else {
				return true;
			}
			
		};
		
		function contact1Check(){
			var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

			if (contact1.val().trim() == "" || contact1.val() == null) {
				alert("연락처1을 입력해주세요.");
				contact1.focus();
				return false;
			} else if (contact1.val().length > 13) {
				alert("13자까지만 입력할 수 있습니다.")
				contact1.focus();
				return false;
			} else if (!regExp.test(contact1.val())) {
				alert("연락처1을 양식에 맞게 다시 입력하세요.(XXX-XXXX-XXXX)");
				contact1.focus();
				return false
			} else {
				return true;
			}
			
		};
		
		
		function shopAddrCheck(){
			var regExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;

			if (shopAddr.val().trim() == "" || shopAddr.val() == null) {
				alert("상점주소를 입력해주세요.");
				shopAddr.focus();
				return false;
			} else if (shopAddr.val().length > 50) {
				alert("50자까지만 입력할 수 있습니다.")
				shopAddr.focus();
				return false;
			} else if (!regExp.test(shopAddr.val())) {
				alert("상점주소를 양식에 맞게 다시 입력하세요.");
				shopAddr.focus();
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
					
					
							})
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