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
	<form action ="/member/customerJoinForm" method = "post">
		이메일 계정:
		<input type="text" id="emailAccount" name="emailAccount"> <br>
		이메일 인증: <button id="emailSendBtn">인증번호받기</button>  인증번호입력<input type="text" id="inputCode"> <button id="emailAuthBtn">인증하기</button>
		<input type="hidden" id="tempCode">
		<input type="hidden" id="authResult" value="false">
		<br>
		비밀번호: 
		<input type="password" id="pwd" name="pwd">  <br>
		이름:
		<input type="text" id="memName" name="memName"> <br>
		<!-- 회원코드
		<input type="text" id="memCode" name="memCode">
		 -->
		 연락처(선택입력):
		<input type="text" id="contact" name="contact"> <br>
		주소(선택입력):
		<input type="text" id="memAddr" name="memAddr"> <br>
		우편번호(선택입력): 
		<input type="text" id="postCode" name="postCode">  <br>
	<button onClick="location.href='/member/login'">가입하기</button>
<!-- 		<button type = "submit" > 가입하기 </button>  -->
	
	</form>
	<script>
		$(document).ready(function(){
		
			$emailSendBtn = $("#emailSendBtn");
			$emailAccount = $("#emailAccount");
			$tempCode = $("#tempCode");
			$emailAuthBtn = $("#emailAuthBtn");
			$inputCode = $("#inputCode");
			$authResult = $("#authResult");
			
			$emailAuthBtn.click(function(e){
				e.preventDefault();
				
				if($inputCode.val().trim()=="" || $inputCode.val()==null || $inputCode.val().trim().length==0 ){
					return false;
				}
				
				//return true일때와 각 input항목 유효성검사, 정규식 처리 이후 가입하기 submit 되도록 처리하기 				
				if($inputCode.val()==$tempCode.val()){
					alert("인증되었습니다");
					$authResult.val("true");
					$inputCode.val("");
				} else {
					alert("인증실패했습니다");
					$inputCode.val("");
				}
			});
			
			//이메일보내기 버튼을 누르면 실행되는 함수 
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
			//중복체크 작업중 0720 
			//이메일인증과 함께 상인가입폼에도 곧 적용할것임
/* 			function duplicateCheck(email){
				return $.ajax({
					type : 'POST',
					url : '/member/duplicateCheck',
					data : email,
					contentType : "application/text; charset=UTF-8"
					
					
				})
			} */
			
		});
		
	</script>
</body>
</html>