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
<title>Insert title here</title>


<style>
/* css 영역 */



/* 사이드 메뉴 */
.side{
          
     width: 200px;
     height: 500px;
     background-color: white;
     float: left;
     margin-right: 90px;
     border:solid;
            
}

 .regi_side_tit{
      padding-top: 12px;
      padding-bottom:12px ;
      text-align: center;
      width: 100%;
      background-color: #ffc30b;
      font-size: 20px;
      font-weight: 900;
            
}
/* 사이드 메뉴 끝 */








/* 등록, 리셋 버튼 시작 */
#regBtn,
#resetBtn {
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


#regBtn:hover,
#resetBtn:hover {
  background-color: white; 
  color: #ffc30b; 
  border: 2px solid #ffc30b;
}
#regBtn:focus,
#resetBtn:focus { 
    outline: none; 
}


/* 등록, 리셋 버튼 끝 */










        
.regi_main{
   float:  right;
   width: 1000px;
   height: 1000px;
   background-color: white;
} 

.regi_main .regi_tit{
   font-size: 30px;
   margin-bottom:50px;

}




.regi_content{
   width: 1300px;
   height: 1000px;
   margin:0 auto;
   border: solid;
}
        
.regi_wrap{
                 
   position: relative;
   display: inline-block;
   padding-top: 30px;
   background-color: cornsilk;
}
        


#registerForm1 {

width: 85%;
margin: auto;

}








</style>



</head>
<body>


<div class="regi_content">
 <div class="regi_wrap">




<!-- side 시작 -->
   <div class="side">
      <div class="1nb_list">
         <div class="regi_side_tit">고객센터</div>
           <div class="regi_side_menu">
               <ul class="regi_menu">
                    <p><b>쇼핑 이용 정보</b></p>
                    <li> <a href='#'>-주문내역</a></li>
                    <li><a href='#'>-장바구니</a></li>
                    <br>
                    <p><b>게시판 이용 내역</b></p>
                    <li> <a href='#'>-1:1문의</a></li>
                    <li><a href='#'>-나의 상품평</a></li>
                    <li><a href='#'>-나의 상품 문의</a></li>
                    <br>
                    <p><b>개인정보 수정</b></p>
                    <li> <a href='#'>-개인정보 수정</a></li>
                    <li><a href='#'>-비밀번호 변경</a></li>
                    <li><a href='#'>-회원 탈퇴</a></li>

                </ul>
           </div>
     </div>
     <!-- 1nb_list -->
  </div>
<!-- side 끝-->
      
      
      
      


<!-- regi_main 시작 -->      
<div class="regi_main">
   
   <!-- regi_tit 시작 -->
    <div class="regi_tit">
       <p><b>[1:1문의 등록하기]</b></p>
   </div>
   <!-- regi_tit 끝 -->






   <div class="row">
      <div class="col-lg-12">
         <div class="panel1 panel-default1">
            <div class="panel-body1">
               <form  id = 'registerForm1' role="form" action="/mypage/myQna/register" method="post">
                  <div class="from-group1">
                     <label>Title</label><input  id ='title' class="form-control" name='title' placeholder ='제목은 1~30자에 맞게 입력해주세요'>
                  </div>
                  <div class="form-group1">
                     <label>내용</label>
                     <textarea class="form-control" id ='content' rows="10" name='content' placeholder ='내용은 1~600자에 맞게 입력해주세요'></textarea>
                  </div>

                  <div class="form-group1">
                     <label>답글여부</label>
                     <textarea class="form-control" name='replyBool' >2</textarea>
                  </div>

                  <div class="form-group1">
                     <label>작성자</label><input class="form-control" name='idNo' value='운영자'>
                  </div>
                  
                  <div class="form-group1">
                     <label>게시글타입</label><input class="form-control" name='boardType' readonly ='readonly' value = '3'>
                  </div>

                  <button type="submit" id="regBtn" class="btn btn-default">글쓰기</button>
                  <button type="reset" id="resetBtn" class="btn btn-default">초기화</button>
   
                  
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
   

</body>
</html>