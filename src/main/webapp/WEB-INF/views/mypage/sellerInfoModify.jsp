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

div.sellerInfo {
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

<form action ="/mypage/sellerInfoModify" id="sellerInfoModify" method = "post">

	<div class="a">
		<h2>마이페이지</h2>
		<div class="b">
			<ul>
				<li><a href="/mypage/sellerInfoModify">회원수정</a></li>
				<li><a href="/mypage/memberDelete">회원탈퇴</a></li>
			</ul>

		</div>
		<div class="sellerInfo">

			<table border="1" cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="150" />
					<col width="400" />
				</colgroup>

				<tr>
					<th>이메일 계정</th>
					<td><input type="text" id="emailAccount" name="emailAccount"
						value="${sellerInfo.emailAccount}" readonly= "readonly"></td>
					
				</tr>
				<tr>
					<th>대표자 이름(필수)</th>
					<td><input type="text" id="memName" name="memName"
						value="${sellerInfo.memName}"></td>
				</tr>
				<tr>
					<th>상점이름(필수)</th>
					<td><input type="text" id="shopName" name="shopName"
						value="${sellerInfo.shopName}"></td>
				</tr>
				<tr>
					<th>연락처1(필수)</th>
					<td><input type="text" id="contact1" name="contact1"
						value="${sellerInfo.contact1}"></td>
				</tr>
				<tr>
					<th>연락처2(선택)</th>
					<td><input type="text" id="contact2" name="contact2"
						value="${sellerInfo.contact2}"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="memAddr" name="memAddr"
						value="${sellerInfo.memAddr}"></td>
				</tr>
				<tr>
					<th>상점주소(필수)</th>
					<td><input type="text" id="shopAddr" name="shopAddr"
						value="${sellerInfo.shopAddr}"></td>
				</tr>
				<tr>
				<th>계좌번호(필수)</th>
			<td><select id="bank" name="bank" value="${sellerInfo.bank}">
					<option value="은행선택">은행선택</option>
					<option value="신한은행">신한은행</option>
					<option value="국민은행">국민은행</option>
					<option value="기업은행">기업은행</option>
					<option value="우리은행">우리은행</option>
					<option value="카카오뱅크">카카오뱅크</option>
			</select> <input type="text" name="bankAccount" id="bankAccount" value="${sellerInfo.bankAccount }"></td>
				</tr>
				
				<tr>
					<th>썸네일 이미지</th>
					<td><input type="text" id="thumbImg" name="thumbImg" value="${sellerInfo.thumbImg}"></td>
				</tr>

				<tr>
					<th>배경 이미지</th>
					<td><input type="text" id="backImg" name="backImg" value="${sellerInfo.backImg}"></td>
				</tr>
			</table>
				<input type="hidden" id="idNo" name="idNo" value="${sessionMember}">
			<br>
			<button type="submit" id="submitBtn">수정하기</button>

		</div>

	</div>
		</form>
		<input type="hidden" id="result" name="result" value="${result}">

<script>

$(document).ready(function(){
	
	var sellerInfoModify = $("#sellerInfoModify");
	
	var memName = $("#memName");
	var shopName = $("#shopName");
	var memAddr = $("#memAddr");
	var shopAddr = $("#shopAddr");
	var contact1 = $("#contact1");
	var contact2 = $("#contact2");
	var bankAccount = $("#bankAccount");
	var bank = $("#bank");
	
	$("option[value='"+bank.val()+"']").prop("selected", "true");
	
	
	var submitBtn = $("#submitBtn");

	submitBtn.click(function(e) {
		e.preventDefault();

		if (!(memNameCheck())) {
			return false;
		} else if (!(shopNameCheck())) {
			return false;
		} else if (!(memAddrCheck())) {
			return false;
		} else if (!(shopAddrCheck())) {
			return false;
		} else if (!(contact1Check())) {
			return false;
		} else if (!(contact2Check())) {
			return false;
		} else if (!(bankCheck())) {
			return false;
		} else if (!(bankAccountCheck())) {
			return false;
		} else {
			sellerInfoModify.submit();
		}

	});
	
	 var result = $("#result").val();
     alertResult(result);
     history.replaceState({},null,null)
     
     function alertResult(result){
        if (result ==='' || history.state){
           return;
        }
        alert(result);
     }
	
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
	
	
	
	function memAddrCheck(){
		var regExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;

		if (memAddr.val().trim() == "" || memAddr.val() == null) {
			alert("상점주소를 입력해주세요.");
			memAddr.focus();
			return false;
		} else if (memAddr.val().length > 50) {
			alert("50자까지만 입력할 수 있습니다.")
			memAddr.focus();
			return false;
		} else if (!regExp.test(memAddr.val())) {
			alert("상점주소를 양식에 맞게 다시 입력하세요.");
			memAddr.focus();
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
	
	function contact2Check(){
		var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

		if (contact2.val().trim() == "" || contact2.val() == null) {
			return true;
		} else if (contact2.val().length > 13) {
			alert("13자까지만 입력할 수 있습니다.")
			contact2.focus();
			return false;
		} else if (!regExp.test(contact2.val())) {
			alert("연락처2를 양식에 맞게 다시 입력하세요.(XXX-XXXX-XXXX)");
			contact2.focus();
			return false
		} else {
			return true;
		}
		
	};
	
function bankCheck(){
		
		if (bank.val().trim() == "" || bank.val() == null || bank.val().trim == "은행없음") {
			alert("은행을 선택해주세요.");
			bank.focus();
			return false;
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
	
	
	
		
});
</script>
</body>
</html>