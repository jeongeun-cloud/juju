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

.regi_main .title {
	margin-left: 20px;
	}
	.regi_main h3{
	font-weight:500;
	}
	.regi_main p{
		color: #b9b9b9;
	}
	

/* 글쓰기, 검색 버튼 시작 */
.btn {
  float:right;
  height: 43.75px;
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

.btn:hover {
  height: 43.75px;
  background-color: #F0F2F0 ; 
  color: #8FA691; 
  padding: 0px 20px;
  border: 2px solid #8FA691;
 
}

.btn:focus{ 
    outline: none; 
}



/* 글쓰기, 검색 버튼 끝 */
/* 페이지 버튼 디자인 시작 */

.pageBtns {
	text-align: center;
	margin-right: 8%;
}

.pageBtns a{
    color: #637365;
    float: right;
    padding: 8px 16px;
    text-decoration: none;
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

.regi_main .title {
	margin:40px 0px 40px 20px;
	}
	.regi_main h3{
	font-weight:500;
	}
	.regi_main p{
		color: #b9b9b9;
	}

    .mainContent{
     height: 700px;
    }


</style>


</head>
<body>


<div class="regi_content">
   <div class="regi_wrap">
     <div class="1nb_list">
       <!-- side 시작 -->
	    <div class="side">
			<%@include file="../../includes/community_sidebar.jsp" %>
       </div>	
<!-- side 끝-->        
    </div>
     <!-- 1nb_list -->
  </div>
<!-- side 끝-->

<!-- regi_main 시작 -->      
<div class="regi_main">
   
   <!-- title 시작 -->
     <div class="mainContent">
 		         <div class="title">
                   <h3>공지사항</h3>
              	     <p>공지사항 수정.</p>
       
                </div>
   <!-- title 끝 -->


	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				
				<div class="panel-body">
					<form id = 'registerForm' role="form" action="/community/notice/register" method="post">
						<div class="from-group">
							<label>제목</label><input  id= 'title' class="form-control" name='title' placeholder ='제목은 1~30자에 맞게 입력해주세요'>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" id='content' rows="10" name='content'  placeholder ='내용은 1~600자에 맞게 입력해주세요'></textarea>
						</div>

					

						<div class="form-group">
							<label>작성자</label><input class="form-control"  readonly ="readonly" name='idNo' value='운영자'>
						</div>
						
						<div style='display:none' class="form-group">
							<label>게시글타입</label>
							<textarea class="form-control" name='boardType'  readonly ="readonly" >2</textarea>
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
   
   var registerForm = $("#registerForm");
	   
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