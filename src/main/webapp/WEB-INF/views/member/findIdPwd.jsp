<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="./../includes/header.jsp" %>
<%@include file="./../includes/menuBar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<style>
        .cont_centrar {
            position: absolute;
            width: 500px;
            left: 50%;
            top: 75%;
            transform: translate(-50%, -50%);
            float: left;
            background-color: #FFFFFF;
            transition: all 0.5s;
            padding: 40px 0px;
        }

        .cent_active {
            box-shadow: 5px 5px 10px 0px rgba(0, 0, 0, 0.21);
        }


        .cont_tabs_login {
            position: relative;
            float: left;
            width: 100%;
        }

        .ul_tabs>li {
            position: relative;
            float: left;
            width: 44%;
            list-style: none;
            text-align: center;
			cursor: pointer;
        }

        .ul_tabs>li>a {
            text-decoration: none;
            font-size: 16px;
            color: #999;
            line-height: 14px;
            padding: 20px;
            display: block;
            transition: all 0.5s;
        }

        .ul_tabs>.active>a {
            color: #637365;
            font-weight: bold;

        }

        .linea_bajo_nom {
            position: relative;
            width: 100%;
            float: left;
            background-color: #999;
            height: 2px;
        }

        .active .linea_bajo_nom {
            position: relative;
            width: 100%;
            float: left;
            background-color: #637365;
            height: 2px;
        }

        .cont_text_inputs {
            position: relative;
            float: left;
            width: 100%;
            margin-top: 20px;
        }
        
        input[type=text] {
    		width: 405px;
    		height: 54px;
    		margin-left: 40px;
    		margin-top: 10px;
    		/* margin-bottom: 10px; */
    		padding: 0 19px;
    		border: none;
    		border-bottom: 1px solid #ccc;
    		background-color: #fff;
    		font-size: 14px;
    		line-height: 20px;
    		outline: none;
		}
		
		input[type=radio] {
			margin-left: 40px;
		}
		
		input[type=password] {
    		width: 405px;
    		height: 54px;
    		margin-left: 40px;
    		margin-bottom: 10px;
    		padding: 0 19px;
    		border: none;
    		border-bottom: 1px solid #ccc;
    		background-color: #fff;
    		font-size: 14px;
    		line-height: 20px;
    		outline: none;
		}
        
        button, input[type="submit"] {
        	background-color: #8FA691;
        	border: 1px solid #8FA691;
        	margin: 0;
        	outline: none;
        	color: #FFFFFF;
        	margin-left: 40px;
        	padding: 15px 187px;
        	cursor: pointer;
        	margin-bottom: 5px;
        }
        
        #emailSendBtn {
        	padding: 15px 160px;
        }
        
        #emailAuthBtn {
        	padding: 15px 173px;
        }

        .input_form_sign {
            position: relative;
            float: left;
            width: 90%;
            border: none;
            border-bottom: 1px solid #B0BEC5;
            background-color: transparent;
            font-size: 14px;
            outline: none;
            transition: all 0.5s;
            height: 0px;
            margin: 0px;
            padding: 0px;
            opacity: 0;
            display: none;
        }

        .active_inp {
            margin: 5% 5%;
            padding: 10px 0px;
            opacity: 1;
            height: 5px;
        }


        .input_form_sign:focus {
            border-bottom: 1px solid #FF8383;
        }


        .cont_btn {
            position: relative;
            float: left;
        }
        
        #emailAuthMessage {
        	margin-left: 40px;
        	margin-bottom: 10px;
        }
        
        .emailBtns {
        	background-color: #FFFFFF;
        	border: 1px solid #8FA691;
        	color: #8FA691;
        }
        
        .emailBtns:hover {
        	background-color: #8FA691;
        	color: #FFFFFF;
        }
        
        #findPwd, #modifyPwd {
        	display: none;
        }
        
        .cont_btn button, input[type="submit"] {
            margin-left: 40px;
        	padding: 18px 188px;
        	background-color: #8FA691;
        	color: #FFFFFF;
        }
        
        input[type=radio] {
			margin-left: 100px;
        }
        
        #submitBtn {
        	padding: 18px 175px;
        }
        
        #resultUl{
        	margin-top : 20px;
        	margin-bottom : 20px;
        	margin-left : 30px;
        	padding : 0px 30px;
        	
        }
        
        p {
		margin-left: 40px;
        }
        
       #pwdChkMessage {
         font-size : 12px;
         margin-left: 50px;
         margin-bottom: 10px;
        }
      
      
      
</style>
</head>


<body>
<div class="cont_centrar">
            <div class="cont_login">
                    <div class="cont_tabs_login">
                        <ul class='ul_tabs'>
                            <li id="tab1" class="active"><a>아이디찾기</a>
                                <span class="linea_bajo_nom"></span>
                            </li>
                            <li id="tab2"><a>비밀번호찾기</a><span class="linea_bajo_nom"></span>
                            </li>
                        </ul>
                    </div>
                    <div class="cont_text_inputs" id="findId">
                       		<input type="radio" id="selectCustomer" name="memCode" value="CUSTOMER" checked="checked">일반고객회원
							<input type="radio" id="selectSeller" name="memCode" value="SELLER"> 판매자 회원 <br>
							<input type="text" id="memName" name="memName" placeholder="회원이름"><br>
							<input type="text" id="contact" name="contact" placeholder="연락처"><br>


							<div id="findIdResult">
							 <ul id="resultUl"> </ul>


							</div>
							<button type="submit" id="findIdBtn">확인</button>
                    </div>
                    <form action="/member/findIdPwd" method="POST">
                    <div class="cont_text_inputs" id="findPwd">
						&ensp; &ensp; &ensp; &ensp;*가입된 이메일 주소로 인증번호를 받아 확인해주세요<br> 
						<input type="text" id="emailAccount" name="emailAccount" placeholder="이메일을 입력해주세요"> 
						<input type="hidden" id="duplicateCheck">
						<input type="hidden" id="duplicateCheckResult" value="false">
						<button id="emailSendBtn" class="emailBtns">인증번호받기</button><br>
						<input type="text" id="inputCode" placeholder="인증번호를 입력해주세요">
						<input type="hidden" id="tempCode">
						<button id="emailAuthBtn" class="emailBtns">인증하기</button>
						<input type="hidden" id="authResult" value="false">
                    </div>
                    <div class="cont_text_inputs" id="modifyPwd">
                    	 <p>새로운 비밀번호를 입력해주세요.</p>
						<input type="password" id="newPwd" name="pwd" placeholder="새로운 비밀번호"><br> 
						<input type="password" id="newPwdChk" placeholder="비밀번호 확인">
						<div id="pwdChkMessage"></div>
						<button type="submit" id="submitBtn">저장하기</button>
                    </div>
					</form>
            </div>

        </div>

	<script>		

/* 	$sellerAuthBtn.click(function(e) {
		e.preventDefault();
		modal.style.display = "none";
	}); */

	
	$(document).ready(function() {
		
		let findIdBtn = $("#findIdBtn");
		
		let memName = $("#memName");
		let contact = $("#contact");

		let findIdDiv = $("#findId");
		let findPwd = $("#findPwd");
		let modifyPwd = $("#modifyPwd");
		let emailSendBtn = $("#emailSendBtn");
		let tempCode = $("#tempCode");
		let emailAuthBtn = $("#emailAuthBtn");
		let inputCode = $("#inputCode");
		let authResult = $("#authResult");
		let emailAccount = $("#emailAccount");
		let submitBtn = $("#submitBtn");
		let emailDuplicateCheckBtn = $("#emailDuplicateCheckBtn");
		let duplicateCheckResult = $("#duplicateCheckResult");
        let pwdChkMessage = $("#pwdChkMessage");
        let newPwd = $("#newPwd");
        let newPwdChk = $("#newPwdChk");
        let formObj = $("form");
		
		let tab1 = $("#tab1");
		let tab2 = $("#tab2");
		findIdDiv.css("display", "block");
		
		
		submitBtn.click(function(e){
			e.preventDefault();
			if (!(pwdCheck())) {
				return false;
			} else if (newPwdChk.val() != newPwd.val()) {
				newPwdChk.focus();
				return false;
	        } else {
	        	formObj.submit();
	        }
		})
		
		
		tab1.click(function(e){
			e.preventDefault();
			tab1.addClass("active");
			tab2.removeClass("active");
			findIdDiv.css("display", "block");
			findPwd.css("display", "none");
			findPwd.find("input").val("");
			modifyPwd.css("display", "none");
			modifyPwd.find("input").val("");
		});
		
		tab2.click(function(e){
			e.preventDefault();
			tab1.removeClass("active");
			tab2.addClass("active");
			findIdDiv.css("display", "none");
			findIdDiv.find("input").val("");
			findPwd.css("display", "block");
			modifyPwd.css("display", "none");
			modifyPwd.find("input").val("");
		});
				

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
		
		
		newPwdChk.keyup(function () {
            if (newPwdChk.val() == newPwd.val()) {
               pwdChkMessage.html("비밀번호와 비밀번호 확인이 일치합니다.");
               pwdChkMessage.css("color", "green");
            } else {
               pwdChkMessage.html("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
               pwdChkMessage.css("color", "red");
            }
         });

		
		function pwdCheck() {
            let regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
            if (newPwd.val().trim() == "" || newPwd.val() == null) {
               alert("비밀번호를 입력해주세요.");
               newPwd.focus();
               return false;
            } else if (newPwd.val().length > 20) {
               alert("20자까지만 입력할 수 있습니다.")
               newPwd.focus();
               return false;
            } else if (!regExp.test(newPwd.val())) {
               alert("패스워드는 6~12자 사이의 문자+숫자 조합으로 입력해주세요.");
               newPwd.focus();
               return false
            } else {
               return true;
            }
         };
		
		function showResult(emailResults){
			
			let resultUl = $("#resultUl");
			let str = "";
			
			for(let i = 0; i<emailResults.length; i++){
				let emailResult = emailResults[i];
				str+="<li>"+emailResult+"</li>"
			}
				resultUl.html(str);
			
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
				findIdDiv.css("display", "none");
				findIdDiv.find("input").val("");
				findPwd.css("display", "none");
				modifyPwd.css("display", "block");
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
						console.log(response); 
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
