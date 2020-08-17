<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>   
<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/menuBar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>


<style>
/* css 영역 */


body {
   font-family: Arial, Helvetica, sans-serif;
   color: #303030;
}

li {
   list-style: none;
}


/* 사이드 메뉴 */

.side{
	     width: 300px;	     
	     float: left;
	     margin-right: 20px;
	     margin-top:25px;
	}

	
.regi_content{
   width: 1300px;
   height: 600px;
   margin:0 auto;
}

.regi_wrap{
   position: relative;
   display: inline-block;
   margin-right: 0px;
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
	
	      
.regi_main{
   float:  right;
   width: 950px;
   height: 600px;
   background-color: white;
} 

.regi_main .regi_tit{
   font-size: 30px;
   margin-bottom:50px;
   text-align: center;

}

        
.regi_wrap{
                 
   position: relative;
   display: inline-block;
   padding-top: 30px;
}

table {
		border-collapse: collapse;
		width: 90%;
		margin-left: 20px;
        margin-top: 30px;
	}
        

/* 등록, 리셋 버튼 시작 */
#regBtn,
#resetBtn {
  background-color: #8FA691; 
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


#regBtn:hover,
#resetBtn:hover {
  background-color: white; 
  color: #8FA691; 
  border: 2px solid #8FA691;
}
#regBtn:focus,
#resetBtn:focus { 
    outline: none; 
}


.btns {
	width: 30%;
	margin: auto;
	margin-top: 10px;
	
}

/* 등록, 리셋 버튼 끝 */


#registerForm1 {

width: 85%;
margin: auto;

}

</style>



</head>
<body>

<div class="regi_content">
 <div class="regi_wrap">
     <div class="1nb_list">
     
<!-- side 시작 -->
	<div class="side">
<%@include file="../../includes/mypage_sidebar.jsp" %>
   </div>
<!-- side 끝-->     
     </div>
     <!-- 1nb_list -->
  </div>
<!-- side 끝-->

\
<!-- regi_main 시작 -->      
<div class="regi_main">
   
   <!-- regi_tit 시작 -->
    <div class="regi_tit">
       <p><b>1:1문의 등록하기</b></p>
   </div>
   <!-- regi_tit 끝 -->






   <div class="row">
      <div class="col-lg-12">
         <div class="panel1 panel-default1">
            <div class="panel-body1">
               <form  id = 'registerForm1' role="form" action="/mypage/myQna/register" method="post">
                  <div class="from-group1">
                     <label>제목</label><input  id ='title' class="form-control" name='title' placeholder ='제목은 1~30자에 맞게 입력해주세요'>
                  </div>
                  <div class="form-group1">
                     <label>내용</label>
                     <textarea  style='resize:none' class="form-control" id ='content' rows="10" name='content' placeholder ='내용은 1~600자에 맞게 입력해주세요'></textarea>
                  </div>
  

                  <div class="form-group1">
                   <input type="hidden" class="form-control" name='idNo' value='${sessionMember.idNo}'>
                  </div>

				  <div class="btns">
                  <button type="submit" id="regBtn" class="btn btn-default">글쓰기</button>
                  <button type="reset" id="resetBtn" class="btn btn-default">초기화</button>
				  </div>
   
                  
               </form>
            </div>
         </div>
      </div>
   </div>
   <!-- row end -->
   
   
   
   
   
      
</div>
<!-- regi_main 끝 -->         
   
   
   
   
   
      
</div>
<!-- regi_content 끝 -->
</div>      
<!-- regi_wrap 끝 -->
      
   
   
   
   
<script type="text/javascript">
   $(document).ready(function(){
   
   var registerForm = $("#registerForm1");
      
   $("#regBtn").on("click" , function(e){

      if(!registerForm.find("#title").val()||registerForm.find("#title").val().trim()==""||registerForm.find("#title").val().length>30){
         alert("양식에 맞게 제목을 입력해주세요(1~30자)");
         return false;
         
      }
         
         if(!registerForm.find("#content").val()||registerForm.find("#content").val().trim()==""||registerForm.find("#content").val().length>600){
              alert("양식에 맞게 내용을 입력해주세요(1~600자)");
              return false;
         
      }
 
     
      searchForm.find("input[name='pageNum']").val("1");
      e.preventDefault();
      
      searchForm.submit();
      
      
       });
       });
   
   
</script>
   
      <%@include file="../../includes/footer.jsp" %>   

</body>
</html>