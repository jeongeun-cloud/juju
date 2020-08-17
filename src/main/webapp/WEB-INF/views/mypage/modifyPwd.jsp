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
   background-color: #8FA691; 
   color: white;
    height: 40px;
   text-align: left;
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

.modifyPwd {
	margin-top: 25px;
}

        input[type=text] {
          width: 365px;
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
      
      input[type=password] {
          width: 365px;
          height: 54px;
          margin-left: 20px;
          margin-bottom: 10px;
          padding: 0 19px;
          border: none;
          border-bottom: 1px solid #ccc;
          background-color: #fff;
          font-size: 14px;
          line-height: 20px;
          outline: none;
      }
      
      label {
        padding-right: 5px;
        width: 130px;
        font-size: 16px;
        margin: 0;
        position: relative;
        top: 3px;
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
	            <p>비밀번호 수정</p>
	   		</div>
   </div>
	
   <form action="/mypage/modifyPwd" id="modifyPwd" method="post">

         <div class="modifyPwd">
            <label>현재 비밀번호 </label><input type="password" name="pwd" id="pwd" placeholder="현재 비밀번호를 입력해주세요"><br> 
			<label>새로운 비밀번호 </label><input type="password" id="newPwd" name="newPwd" placeholder="비밀번호는 6~12자의 영문+숫자입니다."><br>
			<label>비밀번호 확인  </label><input type="password" id="newPwdChk" placeholder="새로운 비밀번호를 한 번 더 입력해주세요."><br>
            <input type="hidden" id="idNo" name="idNo" value="${sessionMember.idNo}">
            <br>
            <button type="submit" id="submitBtn">비밀번호변경하기</button>

         </div>

   		</form>
      </div>
   <input type="hidden" id="result" value="${result }">
</div>

</body>

<script>

   $(document).ready(function(){
      let pwd = $("#pwd");
      let newPwd = $("#newPwd");
      let newPwdChk = $("#newPwdChk");
      let result = $("#result").val();
      let submitBtn = $("#submitBtn");
      let modifyPwd = $("#modifyPwd");

      alertResult(result);
      history.replaceState({}, null, null)

      submitBtn.click(function(e) {
         e.preventDefault();
          if (!(newPwdCheck())) {
            return false;
         } else if (!(newPwd.val()===newPwdChk.val())){
            alert("비밀번호확인은 비밀번호와 같아야 합니다.");
            newPwd.focus();
            return false;
         } else {
            modifyPwd.submit();
         }

      });
      
      
      function alertResult(result) {
         if (result === '' || history.state) {
            return;
         }
         alert(result);
      }
      
      function newPwdCheck(){
         
		let regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
         
         if (newPwd.val().trim() == "" || newPwd.val() == null) {
            alert("비밀번호를 입력해주세요.");
            newPwd.focus();
            return false;
         } else if (newPwd.val().length > 30) {
            alert("30자까지만 입력할 수 있습니다.")
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
      
      
      
      
   });

</script>
</html>
   <%@include file="../includes/footer.jsp" %>   