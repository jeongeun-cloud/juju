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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<style> <!-- 모달창 가져오는 과정에서 스타일이 붙은것임  -->
body {
   font-family: Arial, Helvetica, sans-serif;
}

.joinForm{
   display: none;
   position: absolute;
   left: 50%;
   top: 80%;
   transform: translate(-50%, -50%);
   width: 500px;
   height: 400px;
}

 .active {
   display: block;
}
 
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
   crossorigin="anonymous"></script>
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
   <form action="/member/sellerJoinForm"  id="sellerJoinForm" method="post" enctype="multipart/form-data">
      <!-- step1 -->
      <div class="joinForm active">
       이메일:
      <input type="text" id="emailAccount" name="emailAccount"  placeholder="필수입력"> <button id="emailDuplicateCheckBtn">가입여부확인</button> <br>
      <input type="hidden" id="duplicateCheck">
      <input type="hidden" id="duplicateCheckResult" value="false">
      이메일 인증: <button id="emailSendBtn">인증번호받기</button><br>
      인증번호입력<input type="text" id="inputCode"> <button id="emailAuthBtn">인증하기</button>
      <div id="emailAuthMessage"></div>
      <input type="hidden" id="tempCode">
      <input type="hidden" id="authResult" value="false">
      <button class="next">다음</button>
      </div>
   	  <!-- step2 -->
      <div class="joinForm">
      비밀번호: <input type="password" id="pwd" name="pwd"> <br>
      비밀번호확인 :<input type="password" id="pwdChk" name="pwdChk"> 
      <div id="pwdChkMessage"></div>
      <button class="prev">이전</button>
      <button class="next">다음</button>
      </div>
      <!-- step3 -->
      <div class="joinForm">
      상점명: <input type="text" id="shopName" name="shopName"  placeholder="필수입력"> <br>
      회원이름 <input type="text" id="memName" name="memName"  placeholder="필수입력"> <br>
       연락처1: <input type="text" id="contact1" name="contact1"  placeholder="XXX-XXXX-XXXX,필수">
      <br> 연락처2: <input type="text" id="contact2" name="contact2" placeholder="XXX-XXXX-XXXX">
      <br>우편번호: <input type="text" id="postCode" name="postCode" size="5" value="" readonly="readonly"> 
               <a id="memApi" href="">우편번호검색</a> <br>
      도로명 주소: <input type="text" id="roadAddr" name="roadAddr" size="50" value="" readonly="readonly"/><br>
      나머지 주소: <input type="text" id="namujiAddr" name="namujiAddr">
      <input type="hidden" id="memAddr" name="memAddr"><br>
      <button class="prev">이전</button>
      <button class="next">다음</button>
      </div>
     <!-- step4 -->
      <div class="joinForm">
         사업자 등록번호
         <input type="text" id="businessCode" name="businessCode"  placeholder="필수입력"> <button id="bcUniqueCheckBtn">사업자 등록번호 확인</button> <br>
         <input type="hidden" id="bcUniqueCheck">
         <input type="hidden" id="bcUniqueCheckResult" value="false"> 
         사업자등록증(이미지, 필수)
         <input type="file" id="businessRegFile" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg"> <br>
         <img id="businessRegThumb" alt="" src=""><br>
         사업장 소재지
         <br> 우편번호 <input type="text" id="shopPostCode" name="shopPostCode">
         <a id="shopApi" href="">우편번호검색</a> <br>
         도로명 주소: 
         <input type="text" id="shopRoadAddr" name="shopRoadAddr" readonly="readonly"/><br>  
         상점주소: 
         <input type="text" id="shopNamujiAddr" name="shopNamujiAddr"  placeholder="필수입력" /> <br>
         <input type="hidden" id="shopAddr" name="shopAddr"  placeholder="필수입력" />
         <td>사업자 계좌번호</td>
         <td><select id="bank" name="bank">
               <option value="은행선택">은행선택</option>
               <option value="신한은행">신한은행</option>
               <option value="국민은행">국민은행</option>
               <option value="기업은행">기업은행</option>
               <option value="우리은행">우리은행</option>
               <option value="카카오뱅크">카카오뱅크</option>
         </select> <input type="text" name="bankAccount" id="bankAccount"  placeholder="필수입력"></td> <br>
         상점이미지(필수)
         <input type="file" id="thumbImg" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg"> <br>
         <img id="thumbThumb"alt="" src=""><br>
         배경이미지 
         <input type="file" id="backImg" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg"> <br>
         <img id="backThumb" alt="" src=""><br>
      <button class="prev">이전</button>
      <button type = "submit" id="submitBtn"> 가입하기 </button> 
      </div>
   </form>



   <script>
      
   $(document).ready(function(){
      aTags = $("a");
      aTags.on().click(function(e){
         e.preventDefault();
         let targetId = $(e.target).prop("id");
         execDaumPostcode(targetId);
      })
      
         
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
         memAddr = $("#memAddr");
         roadAddr = $("#roadAddr");
         namujiAddr = $("#namujiAddr");
         shopAddr = $("#shopAddr");
         shopRoadAddr = $("#shopRoadAddr");
         shopNamujiAddr = $("#shopNamujiAddr");
         contact1 = $("#contact1");
         contact2 = $("#contact2");
         bankAccount = $("#bankAccount");
         businessRegFile = $("#businessRegFile");
         thumbImg = $("#thumbImg");
         backImg = $("#backImg");
         
         emailAuthBtn = $("#emailAuthBtn");
         inputCode = $("#inputCode");
         authResult = $("#authResult");
         
         emailAuthMessage = $("#emailAuthMessage");
         pwdChkMessage = $("#pwdChkMessage");
         bcUniqueCheckBtn = $("#bcUniqueCheckBtn");
         bcUniqueCheckResult = $("#bcUniqueCheckResult");
         emailDuplicateCheckBtn = $("#emailDuplicateCheckBtn");
         duplicateCheckResult = $("#duplicateCheckResult");
         
         joinForm = $(".joinForm");
         prev = $(".prev");
         next = $(".next");
         currentTab = 0;
         const MAX = 3;
         const MIN = 0;
         
         console.log(joinForm);
         
         prev.on().click(function(e){
            e.preventDefault();
            if(currentTab>=MIN){
            currentTab -= 1;
            joinForm.removeClass("active");
            $(joinForm[currentTab]).addClass("active");
            }
         });
         
         next.on().click(function(e){
            e.preventDefault();
            if(currentTab<MAX){
            currentTab += 1;
            joinForm.removeClass("active");
            $(joinForm[currentTab]).addClass("active");
            }
         });
         
         
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
               emailAuthMessage.html("이메일 인증에 성공했습니다.");
               emailAuthMessage.css("color", "green");
               authResult.val("true");
               inputCode.val("");
            } else {
               emailAuthMessage.html("이메일 인증에 실패했습니다.");
               emailAuthMessage.css("color", "red");
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
               //인증번호 개발자도구에서 확인하고싶으면 
               //console.log(response); 
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
            bcUniqueCheckResult.val("false");
            emailAuthMessage.html("");
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
         
         
         pwdChk.keyup(function(){
            if(pwdChk.val()==pwd.val()){
               pwdChkMessage.html("비밀번호와 비밀번호 확인이 일치합니다.");
               pwdChkMessage.css("color", "green");
            } else {
               pwdChkMessage.html("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
               pwdChkMessage.css("color", "red");
            }
         });
         
         
         //사업자등록번호 중복체크
         bcUniqueCheckBtn.click(function(e){
            e.preventDefault();
            if (!(businessCodeCheck())) {
               return false;
            }
            
            bcUniqueCheck(businessCode.val())
            .then(function(response){
               
            if(response==true){
               alert("등록 가능합니다.");
               bcUniqueCheckResult.val("true")
               
            } else{
               alert("이미 등록된 사업자등록번호입니다.");
               bcUniqueCheckResult.val("false")
                           
            }
            bcUniqueCheckBtn.val(response);
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
         
         
         
         submitBtn = $("#submitBtn");
         sellerJoinForm = $("#sellerJoinForm");
      
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
         } else if (!(shopNameCheck())) {
            return false;
         } else if (!(memNameCheck())) {
            return false;
         } else if (!(contact1Check())) {
            return false;
         } else if (!(memAddrCheck())) {
            return false;
         } else if (!(businessCodeCheck())) {
            return false;
         } else if (!(bcUniqueCheck())){
            return false;
         } else if (businessRegFile.val()==null||businessRegFile.val()=="") {
            alert("사업자 등록증을 업로드해주세요.");
            modal.style.display = "block";
            businessRegFile.focus();
            return false;
         } else if (!(shopAddrCheck())) {
            return false;
         } else if (!(bankAccountCheck())) {
            return false;
         } else if (thumbImg.val()==null||thumbImg.val()==""){
            alert("썸네일을 업로드해주세요.");
            modal.style.display = "block";
            thumbImg.focus();
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
            sellerJoinForm.submit();
         }
      });
      
      function emailAccountCheck(){
         let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         
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
         let regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
         if (pwd.val().trim() == "" || pwd.val() == null) {
            alert("비밀번호를 입력해주세요.");
            pwd.focus();
            return false;
         } else if (pwd.val().length > 20) {
            alert("20자까지만 입력할 수 있습니다.")
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
      
      
   function businessCodeCheck(){
         
         let regExp =  /[^1-15]/g;
         
         if (businessCode.val().trim() == "" || businessCode.val() == null) {
            alert("사업자등록번호를 입력해주세요.");
            businessCode.focus();
            return false;
         } else if (businessCode.val().length > 30) {
            alert("30자까지만 입력할 수 있습니다.")
            businessCode.focus();
            return false;
         } else if (!regExp.test(businessCode.val())) {
            alert("사업자등록번를 1~15자리의 숫자로 입력하세요.");
            businessCode.focus();
            return false
         } else {
            return true;
         }
      };
      
      function bankAccountCheck(){
         
         let regExp =  /[^1-15]/g;
         
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
         let regExp =/^[가-힣a-zA-Z\s]+$/;
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
         let regExp = /^[가-힣]{1,5}|[a-zA-Z]{1,10}\s[a-zA-Z]{1,10}$/;
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
         let regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
         if (contact1.val().trim() == "" || contact1.val() == null) {
            alert("연락처1을 입력해주세요.");
            contact1.focus();
            return false;
         } else if (contact1.val().length > 13) {
            alert("13자까지만 입력할 수 있습니다.")
            contact1.focus();
            return false;
         } else if (!regExp.test(contact1.val())) {
            alert("연락처1을 양식에 맞게 입력해주세요.(XXX-XXXX-XXXX, 필수입력)");
            contact1.focus();
            return false
         } else {
            return true;
         }
         
      };
      
      
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
            alert("나머지 주소를 입력해주세요.");
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
            alert("도로명 주소를 입력해주세요.");
            shopRoadAddr.focus();
            return false;
         } else if (shopNamujiAddr.val().trim() == "" || shopNamujiAddr.val() == null){
            alert("나머지 주소를 입력해주세요.");
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
      function duplicateCheck(emailAccount){
            return $.ajax({
               type : 'POST',
               url : '/member/duplicateCheck',
               data : emailAccount,
               contentType : "application/text; charset=UTF-8"
               
               
                     })
               }    
      
      function bcUniqueCheck(businessCode){
            return $.ajax({
               type : 'POST',
               url : '/member/bcUniqueCheck',
               data : businessCode,
               contentType : "application/text; charset=UTF-8"
               
               
                     })
               }    
      
      inputFile = $("input[type='file']");
      
      inputFile.change(function(e){
         
         imgTarget = $(e.target);
         
         if(this.files){
            let reader = new FileReader;
                reader.onload = function(data) {
                    imgTarget.next().next().attr("src", data.target.result).width(100);
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
</body>
</html>