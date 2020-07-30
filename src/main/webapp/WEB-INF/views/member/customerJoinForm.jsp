<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
	<form action ="/member/customerJoinForm" id="customerJoinForm" method = "post">
		이메일 계정(필수):
		<input type="text" id="emailAccount" name="emailAccount"> <button id="emailDuplicateCheckBtn">중복확인</button> <br>
		<input type="hidden" id="duplicateCheck">
		<input type="hidden" id="duplicateCheckResult" value="false">
		<button id="emailSendBtn">인증번호받기</button> <input type="text" id="inputCode" placeholder="인증번호입력"> <button id="emailAuthBtn">인증하기</button>
		<input type="hidden" id="tempCode">
		<input type="hidden" id="authResult" value="false">
		<br>
		비밀번호 : 
		<input type="password" id="pwd" name="pwd" placeholder="6~12자 영문+숫자">  <br>
		비밀번호확인 : 
		<input type="password" id="pwdChk" name="pwdChk">  <br>
		이름:
		<input type="text" id="memName" name="memName"> <br>
		<!-- 회원코드
		<input type="text" id="memCode" name="memCode">
		 -->
		 연락처:
		<input type="text" id="contact" name="contact" placeholder="XXX-XXXX-XXXX"> <br>
		주소:
		<input type="text" id="memAddr" name="memAddr"> <br>
		우편번호: 
		<input type="text" id="postCode" name="postCode">  <br>
 		<button type = "submit" id="submitBtn"  > 가입하기 </button> 
	
	</form>
	<script>
		$(document).ready(function(){
		
			emailSendBtn = $("#emailSendBtn");
			emailAccount = $("#emailAccount");
			tempCode = $("#tempCode");
			pwd = $("#pwd");
			pwdChk = $("#pwdChk");
			memName = $("#memName");
			memAddr = $("#memAddr");
			contact = $("#contact");
			
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
					alert("가입여부를 확인해주세요.");
					return false;
				}
				
				if(inputCode.val().trim()=="" || inputCode.val()==null || inputCode.val().trim().length==0 ){
					return false;
				}
				
				
				//return true일때와 각 input항목 유효성검사, 정규식 처리 이후 가입하기 submit 되도록 처리하기 				
				if(inputCode.val()==tempCode.val()){
					alert("이메일 인증에 성공했습니다.");
					authResult.val("true");
					inputCode.val("");
				} else {
					alert("이메일 인증에 실패했습니다.");
					inputCode.val("");
				}
			});
			
			//이메일보내기 버튼을 누르면 실행되는 함수 
			emailSendBtn.click(function(e){
				
				e.preventDefault();
				
				if (!(emailAccountCheck())) {
					return false;
				} else if (duplicateCheckResult.val()=="false") {
					alert("가입여부를 확인해주세요.");
					return false;
				}
				
				let email =  emailAccount.val();
				
				emailAuth(email)
				.then(function(response){
					alert("인증번호가 발송되었습니다");
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
			
			
			function duplicateCheck(emailAccount){
				return $.ajax({
					type : 'POST',
					url : '/member/duplicateCheck',
					data : emailAccount,
					contentType : "application/text; charset=UTF-8"
					
					
				})
			} 
			
		});
		
		
		let submitBtn = $("#submitBtn");
		let customerJoinForm = $("#customerJoinForm");

		submitBtn.click(function(e) {
			e.preventDefault();

			if (!(emailAccountCheck())) {
				return false;
			} else if (duplicateCheckResult.val()=="false") {
				alert("가입 여부를 확인해주세요.");
				return false;
			} else if (authResult.val()=="false") {
				alert("이메일주소를 인증해주세요.");
				return false;
			} else if (!(pwdCheck())) {
				return false;
			} else if (!(pwdChk.val()===pwd.val())){
				alert("비밀번호확인은 비밀번호와 같아야 합니다.");
				pwdChk.focus();
				return false;
			} else if (!(memNameCheck())) {
				return false;
			} else if (!(contactCheck())) {
				return false;
			} else {
				customerJoinForm.submit();
			}

		});
		
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
				alert("이메일을 양식에 맞게 다시 입력하세요.");
				emailAccount.focus();
				return false
			} else {
				return true;
			}
			
		};
		
		
		
		function pwdCheck(){
			
			let regExp = /^[A-Za-z0-9]{6,12}$/;
			
			if (pwd.val().trim() == "" || pwd.val() == null) {
				alert("비밀번호를 입력해주세요.");
				pwd.focus();
				return false;
			} else if (pwd.val().length > 30) {
				alert("30자까지만 입력할 수 있습니다.")
				pwd.focus();
				return false;
			} else if (!regExp.test(pwd.val())) {
				alert("패스워드는 6~12자 사이의 문자+숫자 조합으로 입력해주세요.");
				pwd.focus();
				return false
			} else {
				return true;
			}
		};
		
		function memNameCheck(){
			let regExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;

			if (memName.val().trim() == "" || memName.val() == null) {
				alert("이름을 입력해주세요.");
				memName.focus();
				return false;
			} else if (memName.val().length > 30) {
				alert("30자까지만 입력할 수 있습니다.")
				memName.focus();
				return false;
			} else if (!regExp.test(memName.val())) {
				alert("2~10자 사이의 문자열을 입력해주세요.");
				memName.focus();
				return false
			} else {
				return true;
			}
			
		};
		
		function contactCheck(){
			let regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

			if (contact.val().trim() == "" || contact.val() == null) {
				alert("연락처를 입력해주세요.");
				contact.focus();
				return false;
			} else if (contact.val().length > 13) {
				alert("13자까지만 입력할 수 있습니다.")
				contact.focus();
				return false;
			} else if (!regExp.test(contact.val())) {
				alert("연락처를 양식에 맞게 입력해주세요.(XXX-XXXX-XXXX)");
				contact.focus();
				return false
			} else {
				return true;
			}
			
		};
		
		
		
		
	</script>
</body>
</html>