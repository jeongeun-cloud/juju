<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="./../includes/header.jsp" %>
<%@include file="./../includes/menuBar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>Insert title here</title>


<style>

body {
   font-family: Arial, Helvetica, sans-serif;
   color: #303030;
}

li {
   list-style: none;
}


table {
		border-collapse: collapse;
		width: 70%;
		margin-left: 20px;
		margin-right: 40px;
        margin-top: 30px;
        border: none;
	}

/* 배치 */
th, td {
   padding: 8px;
   text-align: left;
   border-bottom: 1px solid #ddd;
   max-height : 7em;
}

th {
    color: #404040;
    height: 40px;
}

tr:hover {
   background-color: #f5f5f5;
}


/* 사이드 메뉴 */
.side{
	     width: 300px;	     
	     float: left;
	      margin-right: 20px;
	     margin-top:25px;
	}
	
	.regi_main{
	   float:  right;
	   width: 950px;	   
	   background-color: white;
}

.regi_content{
	   width: 1300px;
	   margin:0 auto;
      
	}

.regi_wrap{
   position: relative;
   display: inline-block;
   padding-top: 30px;
}

.regi_main .title {
	margin-left: 20px;
	}
	.regi_main h3{
	font-weight:500;
	}
	.regi_main p{
		color: #b9b9b9;
	}
	


/* 글쓰기, 검색 버튼 끝 */
/* 페이지 버튼 디자인 시작 */



  #submitBtn{
    float: right;
    color: white;
     height: 43.75px;
    background-color: #8FA691;
    padding: 10px 20px;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 8%;
  transition-duration: 0.4s;
  cursor: pointer;
  border: none;
   
}

#submitBtn:hover{
  height: 43.75px;
  background-color: #F0F2F0 ; 
  color: #8FA691; 
  padding: 0px 20px;
  border: 2px solid #8FA691;
  float:rigth;
  

}


.pagination1 a:hover:not(.active) {
    background-color: #F0F2F0;
    border-radius: 50%;
}

/* 페이지 버튼 디자인 끝 */
/* 모달디자인 시작  */
.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: white;
  color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: white;
  color: white;
}

#closeBtn {
  background-color: #ffc30b; 
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

#closeBtn:hover {
  background-color: white; 
  color: #ffc30b; 
  border: 2px solid #ffc30b;

}

#closeBtn:focus {
    outline: none; 

}
/* 모달 디자인 끝 */


/* 검색바 */
.col-lg-12 {
	text-align: center;
    margin: 10px 0 30px 0;
    
}

#selected{
    width: 100px;
    height: 30px;
}

#keyword{
    height: 30px;
}


 a:link { color: balck; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #8FA691; text-decoration: none;}
        


div.a {
   position: relative;
   height: 600px;
   /* border: 3px solid red; */
}


a {
   text-decoration: none;
   color: black;
}

.tHead{
	text-align: justify;
}

input[readonly=readonly]{
	border: none;
	outline: none;
	background: none;
}

</style>
</head>
<body>

<div class="regi_content">
 <div class="regi_wrap">
     <div class="1nb_list">
     
<!-- side 시작 -->
	<div class="side">
<%@include file="../includes/mypage_sidebar.jsp" %>
   </div>
<!-- side 끝-->        
     </div>
     <!-- 1nb_list -->
  </div>
<!-- side 끝-->



	<div class="regi_main">
	
	<div class="mainContent">
      	<div class="title">
            <h3>나의 정보</h3>
            <p>개인정보 수정</p>
   		</div>
   </div>
	<div class="sellerInfo">
	<form action="/mypage/sellerInfoModify" id="sellerInfoModify"
		method="post" enctype="multipart/form-data">

				<table cellpadding="0" cellspacing="0">
					<colgroup>
						<col width="150" />
						<col width="400" />
					</colgroup>

					<tr>
						<th class="tHead">이메일 계정</th>
						<td><input type="text" id="emailAccount" name="emailAccount"
							value="${sellerInfo.emailAccount}" readonly="readonly" placeholder="readonly"></td>

					</tr>
					<tr>
						<th class="tHead">회원이름</th>
						<td><input type="text" id="memName" name="memName"
							value="${sellerInfo.memName}" placeholder="필수입력"></td>
					</tr>
					<tr>
						<th class="tHead">상점이름</th>
						<td><input type="text" id="shopName" name="shopName" value="${sellerInfo.shopName}" placeholder="필수입력" ></td>
					</tr>
					<tr>
						<th class="tHead">연락처1</th>
						<td><input type="text" id="contact1" name="contact1"
							value="${sellerInfo.contact1}"  placeholder="필수입력"></td>
					</tr>
					<tr>
						<th class="tHead">연락처2</th>
						<td><input type="text" id="contact2" name="contact2"
							value="${sellerInfo.contact2}"></td>
					</tr>
					<tr>
						<th class="tHead">주소</th>
						<td>우편번호: <input type="text" id="postCode" name="postCode" size="5" value="${sellerInfo.postCode}" readonly="readonly"> 
					<a class="daumApi" id="memApi" href="">우편번호검색</a> <br>
					도로명 주소: <input type="text" id="roadAddr" name="roadAddr" size="50" readonly="readonly"/><br>
					나머지 주소: <input type="text" id="namujiAddr" name="namujiAddr"> <br>
					<input type="hidden" id="memAddr" name="memAddr" value="${sellerInfo.memAddr}"><br>
					<input type="hidden" id="jibunAddr" name="jibunAddr" size="50" value="" /></td>
					</tr>
					<tr>
						<th class="tHead">상점주소</th>
						<td>우편번호: <input type="text" id="shopPostCode" name="shopPostCode" size="5" value="${sellerInfo.shopPostCode}" readonly="readonly"> 
						<a class="daumApi" id="shopApi" href="">우편번호검색</a> <br>
						도로명 주소: <input type="text" id="shopRoadAddr" name="shopRoadAddr" size="50" readonly="readonly"/><br>
						나머지 주소: <input type="text" id="shopNamujiAddr" name="shopNamujiAddr"> <br>
						<input type="hidden" id="shopAddr" name="shopAddr" value="${sellerInfo.shopAddr}"><br>
						<input type="hidden" id="jibunAddr" name="jibunAddr" size="50" value="" /></td>
					</tr>
					<tr>
						<th class="tHead">계좌번호</th>
						<td><select id="bank" name="bank">
								<option value="은행선택">은행선택</option>
								<option value="신한은행">신한은행</option>
								<option value="국민은행">국민은행</option>
								<option value="기업은행">기업은행</option>
								<option value="우리은행">우리은행</option>
								<option value="카카오뱅크">카카오뱅크</option>
						</select> <input type="hidden" id="bankTmp" value="${sellerInfo.bank}">
							<input type="text" name="bankAccount" id="bankAccount"
							value="${sellerInfo.bankAccount }"  placeholder="필수입력"></td>
					</tr>

					<tr>
						<th class="tHead">썸네일 변경<input type="file" style="color:transparent"  id="thumbImg" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg">
						<td><img src='/resources/seller/<c:out value="${sellerInfo.businessCode}"/>/<c:out value="${sellerInfo.thumbImg}"/>'></td>
					</tr>

					<tr>
						<th class="tHead">배경이미지 변경<input type="file" style="color:transparent" id="backImg" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" >
						</th>
						
						<td>
						<c:if test="${!empty sellerInfo.backImg}">
						<img src='/resources/seller/<c:out value="${sellerInfo.businessCode}"/>/<c:out value="${sellerInfo.backImg}"/>'>
						</c:if>
						<c:if test="${empty sellerInfo.backImg}">
						<img src=''>
						</c:if>
						</td>
					</tr>
				</table>
				<input type="hidden" id="idNo" name="idNo" value="${sessionMember.idNo}">
				<input type="hidden" id="businessCode" name="businessCode" value="${sellerInfo.businessCode}">
				<input type="hidden" id="thumbImg" name="thumbImg" value="${sellerInfo.thumbImg}">
				<input type="hidden" id="backImg" name="backImg" value="${sellerInfo.backImg}">
				<br>
				<button type="submit" id="submitBtn">수정하기</button>

	</form>
			</div>

		</div>
	<input type="hidden" id="result" name="result" value="${result}">
</div>

	<script>
		$(document)
				.ready(
						function() {

							sellerInfoModify = $("#sellerInfoModify");

							memName = $("#memName");
							shopName = $("#shopName");
							shopName = $("#shopName");
							memAddr = $("#memAddr");
							roadAddr = $("#roadAddr");
							namujiAddr = $("#namujiAddr");
							shopAddr = $("#shopAddr");
							shopRoadAddr = $("#shopRoadAddr");
							shopNamujiAddr = $("#shopNamujiAddr");
							contact1 = $("#contact1");
							contact2 = $("#contact2");
							bankAccount = $("#bankAccount");
							bank = $("#bank");
							bankTmp = $("#bankTmp");
							
							addrs = memAddr.val().split("/");
							roadAddr.val(addrs[0]);
							namujiAddr.val(addrs[1]);
							
							shopAddrs = shopAddr.val().split("/");
							shopRoadAddr.val(shopAddrs[0]);
							shopNamujiAddr.val(shopAddrs[1]);

							option = bank.find("option");
							
							aTags = $(".daumApi");
							aTags.on().click(function(e){
								e.preventDefault();
								let targetId = $(e.target).prop("id");
								execDaumPostcode(targetId);
							})

							for (var i = 0; i < option.length; i++) {
								var bankName = $(option[i]);
								console.log(bankName);
								if (bankName.val() == bankTmp.val()) {
									bankName.prop("selected", "true");
								}
							}

							submitBtn = $("#submitBtn");

							submitBtn.click(function(e) {
								e.preventDefault();

								if (!(memAddrCheck())) {
									return false;
								} else if (!(memNameCheck())) {
									return false;
								} else if (!(shopNameCheck())) {
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
									if (namujiAddr.val().trim() == "" || namujiAddr.val() == null
											&& roadAddr.val() == "" || roadAddr.val() == null){
										memAddr.val(null);
									} else {
										memAddr.val(roadAddr.val()+"/"+namujiAddr.val());
									}
									shopName.val($.trim(shopName.val()));
									shopAddr.val(shopRoadAddr.val()+"/"+shopNamujiAddr.val());
									sellerInfoModify.submit();
								}

							});

							result = $("#result").val();
							alertResult(result);
							history.replaceState({}, null, null)

							function alertResult(result) {
								if (result === '' || history.state) {
									return;
								}
								alert(result);
							}

							function memNameCheck() {
								let regExp = /^[가-힣a-zA-Z]+$/;

								if (memName.val().trim() == ""
										|| memName.val() == null) {
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

							}
							;

							function shopNameCheck() {
								let regExp =/^[가-힣a-zA-Z\s]+$/;
								

								if (shopName.val().trim() == ""
										|| shopName.val() == null) {
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

							}
							;

							function memAddrCheck(){

								if (roadAddr.val() == "" || roadAddr.val() == null){
									if (!(namujiAddr.val().trim() == "" || namujiAddr.val() == null)) {
									alert("도로명 주소를 입력해주세요.");
									roadAddr.focus();
									return false;
									} else {
										return true;
									}
								} else if (namujiAddr.val().trim() == "" || namujiAddr.val() == null
										&& !(roadAddr.val() == "" || roadAddr.val() == null)){
									alert("회원의 나머지 주소를 입력해주세요.");
									namujiAddr.focus();
									return false;
								} else if (namujiAddr.val().length > 30) {
										alert("30자까지만 입력할 수 있습니다.")
										namujiAddr.focus();
										return false;
								} else {
									return true;
								}
								
							};

							function shopAddrCheck(){

								if (shopRoadAddr.val() == "" || shopRoadAddr.val() == null) {
									alert("상점주소는 낫널입니다 더미를 지워주세요");
									shopRoadAddr.focus();
									return false;
								} else if (shopNamujiAddr.val().trim() == "" || shopNamujiAddr.val() == null){
									alert("상점의 나머지 주소를 입력해주세요.");
									shopNamujiAddr.focus();
									return false;
								} else if (shopNamujiAddr.val().length > 30) {
									alert("30자까지만 입력할 수 있습니다.")
									shopNamujiAddr.focus();
									return false;
								} else {
									return true;
								}
								
							};
							
							
							function contact1Check() {
								let regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

								if (contact1.val().trim() == ""
										|| contact1.val() == null) {
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

							}
							;

							function contact2Check() {
								let regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

								if (contact2.val().trim() == ""
										|| contact2.val() == null) {
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

							}
							;

							function bankCheck() {
								if (bank.val().trim() == ""
										|| bank.val() == null
										|| bank.val().trim() == "은행선택") {
									alert("은행을 선택해주세요.");
									bank.focus();
									return false;
								} else {
									return true;
								}
							}
							;

							function bankAccountCheck() {

								let regExp = /[^1-15]/g;

								if (bankAccount.val().trim() == ""
										|| bankAccount.val() == null) {
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
							
							let inputFile = $("input[type='file']");
							
							console.log(inputFile);
							
							inputFile.attr("title", " ");
							
							inputFile.change(function(e){
								
								imgTarget = $(e.target);
								
								if(this.files){
									let reader = new FileReader;

					                reader.onload = function(data) {
					                	imgTarget.parent().next().children().attr("src", data.target.result).width(300);
					                 }
					                 reader.readAsDataURL(this.files[0]);
					             }
								
									});
							

						});
		
		
		
		function execDaumPostcode(targetId) {
			let postCode = "";
			let roadAddr = "";
			if(targetId=="memApi"){
				postCode = "postCode";
				roadAddr = "roadAddr";
			} else if (targetId=="shopApi") {
				postCode = "shopPostCode";
				roadAddr = "shopRoadAddr";
			}
			new daum.Postcode(
					{
						
							oncomplete : function(data) {

								let fullRoadAddr = data.roadAddress;
								let extraRoadAddr = '';

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

								document.getElementById(postCode).value = data.zonecode;
								document.getElementById(roadAddr).value = fullRoadAddr;

							}
						}).open()

			};
			
	</script>
	
	   <%@include file="../includes/footer.jsp" %>   
	
</body>
</html>