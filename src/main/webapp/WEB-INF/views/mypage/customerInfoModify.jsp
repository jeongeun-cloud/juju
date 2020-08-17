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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


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
		width: 90%;
		margin-left: 20px;
        margin-top: 30px;
        border: none;
	}

/* 배치 */
th, td {
   padding: 8px;
   text-align: left;
   border-bottom: 1px solid #ddd;
}

th {
   background-color: #F4f4f4; 
   color: #404040;
    height: 40px;
   text-align: justify;
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
<form action="customerInfoModify" id="customerInfoModify" method="POST">
			<table border="1" cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="150" />
					<col width="400" />
				</colgroup>
                 <p>개인정보수정</p>
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
					<td>우편번호: <input type="text" id="postCode" name="postCode" size="5" value="${customerInfo.postCode}" readonly="readonly"> 
					<a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
		도로명 주소: <input type="text" id="roadAddr" name="roadAddr" size="50" readonly="readonly"/><br>
		나머지 주소: <input type="text" id="namujiAddr" name="namujiAddr"> <br>
		<input type="hidden" id="memAddr" name="memAddr" value="${customerInfo.memAddr}"><br>
		<input type="hidden" id="jibunAddr" name="jibunAddr" size="50" value="" />
 		</td>
				</tr>

			</table>
				<input type="hidden" id="idNo" name="idNo" value="${sessionMember.idNo}">
			<br>
			<button type="submit" id="submitBtn">수정하기</button>

		</form>
		</div>

	</div>
		<input type="hidden" id="result" value="${result }">

</div>

<script>

$(document).ready(function(){
	
	customerInfoModify = $("#customerInfoModify");
	
	memName = $("#memName");
	memAddr = $("#memAddr");
	contact = $("#contact");
	roadAddr = $("#roadAddr");
	namujiAddr = $("#namujiAddr");
	
	addrs = memAddr.val().split("/");
	roadAddr.val(addrs[0]);
	namujiAddr.val(addrs[1]);
	
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
			memAddr.val(roadAddr.val()+"/"+namujiAddr.val());
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

		if (roadAddr.val() == "" || roadAddr.val() == null) {
			alert("도로명 주소를 입력해주세요.");
			roadAddr.focus();
			return false;
		} else if (namujiAddr.val().trim() == "" || namujiAddr.val() == null){
			alert("나머지 주소를 입력해주세요.");
			namujiAddr.focus();
			return false;
		} else if (roadAddr.val().length > 30) {
			alert("30자까지만 입력할 수 있습니다.")
			roadAddr.focus();
			return false;
		} else if (namujiAddr.val().length > 30) {
			alert("30자까지만 입력할 수 있습니다.")
			namujiAddr.focus();
			return false;
		} else {
			return true;
		}
		
	};
});
	function execDaumPostcode() {
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

							document.getElementById('postCode').value = data.zonecode;
							document.getElementById('roadAddr').value = fullRoadAddr;
							document.getElementById('jibunAddr').value = data.jibunAddress;

						}
					}).open()

		};
	
		

</script>

   <%@include file="../includes/footer.jsp" %>   

</body>
</html>