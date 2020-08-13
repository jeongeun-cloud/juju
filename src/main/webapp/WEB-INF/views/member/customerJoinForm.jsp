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

#customerJoinForm {
  background-color: #ffffff;
  margin: 100px auto;
  padding: 40px;
  width: 70%;
  min-width: 300px;
}

.title{
   left: 50%;
   top: 30%;
   transform: translate(-50%, -50%);
}
.joinForm{
   display: none;
   position: absolute;
   left: 50%;
   top: 50%;
   transform: translate(-50%, -50%);
   width: 500px;
   height: 400px;
}
.active {
   display: block;
}

h2 {
   top: 20%;
  text-align: center;  
}


input {
  padding: 10px;
  width: 100%;
  font-size: 17px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}



</style>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
   <form action ="/member/customerJoinForm" id="customerJoinForm" method = "post">

        <h2>회원가입</h2>

      <!-- step1 -->
      <div class="joinForm active">
      이메일 계정(필수):
      <input type="text" id="emailAccount" name="emailAccount"> <button id="emailDuplicateCheckBtn">중복확인</button> <br>
      <input type="hidden" id="duplicateCheck">
      <input type="hidden" id="duplicateCheckResult" value="false">
      <button id="emailSendBtn">인증번호받기</button> <input type="text" id="inputCode" placeholder="인증번호입력"> <button id="emailAuthBtn">인증하기</button>
      <div id="emailAuthMessage"></div>
      <input type="hidden" id="tempCode">
      <input type="hidden" id="authResult" value="false">
      <button class="next">다음</button>
      </div>
      <!-- step2 -->
      <div class="joinForm">
      비밀번호 : 
      <input type="password" id="pwd" name="pwd" placeholder="6~12자 영문+숫자">
      <br>
      비밀번호확인 : 
      <input type="password" id="pwdChk" name="pwdChk">
      <div id="pwdChkMessage"></div>
      <button class="prev">이전</button>
      <button class="next">다음</button>
      </div>
      <!-- step3 -->
      <div class="joinForm">
      이름:
      <input type="text" id="memName" name="memName"> <br>

       연락처:
      <input type="text" id="contact" name="contact" placeholder="XXX-XXXX-XXXX"> <br>
      
      우편번호: <input type="text" id="postCode" name="postCode" size="5" value="" readonly="readonly"> 
               <a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
      도로명 주소: <input type="text" id="roadAddr" name="roadAddr" size="50" value="" readonly="readonly"/><br>
      나머지 주소: <input type="text" id="namujiAddr" name="namujiAddr"> <br>
      <input type="hidden" id="memAddr" name="memAddr"><br>
      <input type="hidden" id="jibunAddr" name="jibunAddr" size="50" value="" />
       <button class="prev">이전</button>
       <button type = "submit" id="submitBtn"  > 가입하기 </button>
       </div> 
   
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
         roadAddr = $("#roadAddr");
         namujiAddr = $("#namujiAddr");
         contact = $("#contact");
         emailAuthBtn = $("#emailAuthBtn");
         inputCode = $("#inputCode");
         authResult = $("#authResult");
         emailDuplicateCheckBtn = $("#emailDuplicateCheckBtn");
         duplicateCheckResult = $("#duplicateCheckResult");
         emailAuthMessage = $("#emailAuthMessage");
         pwdChkMessage = $("#pwdChkMessage");
         
         joinForm = $(".joinForm");
         prev = $(".prev");
         next = $(".next");
         currentTab = 0;
         const MAX = 3;
         const MIN = 0;

         
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
            
            var email =  emailAccount.val();
            
            emailAuth(email)
            .then(function(response){
               alert("인증번호가 발송되었습니다");
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
            emailAuthMessage.html("");
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
         
         
         pwdChk.keyup(function(){
            if(pwdChk.val()==pwd.val()){
               pwdChkMessage.html("비밀번호와 비밀번호 확인이 일치합니다.");
               pwdChkMessage.css("color", "green");
            } else {
               pwdChkMessage.html("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
               pwdChkMessage.css("color", "red");
            }
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
         
         
         
         

      
      
      submitBtn = $("#submitBtn");
      customerJoinForm = $("#customerJoinForm");

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
         } else if (!(memAddrCheck())) {
            return false;
         } else {
            if (namujiAddr.val().trim() == "" || namujiAddr.val() == null
                  && roadAddr.val() == "" || roadAddr.val() == null){
               memAddr.val(null);
            } else {
               memAddr.val(roadAddr.val()+"/"+namujiAddr.val());
            }

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
         
         let regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
         
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
</body>
</html>