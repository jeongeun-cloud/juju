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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Resister</h1>
		</div>
	</div>
	<!--  col-lg-12 end -->


	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board Register</div>
				<div class="panel-body">
					<form id = 'registerForm' role="form" action="/community/notice/register" method="post">
						<div class="from-group">
							<label>Title</label><input  id= 'title' class="form-control" name='title'>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" id='content' rows="10" name='content'></textarea>
						</div>

						<div class="form-group">
							<label>게시글타입</label>
							<textarea class="form-control" name='boardType'  readonly ="readonly" >2</textarea>
						</div>

						<div class="form-group">
							<label>작성자</label><input class="form-control"  readonly ="readonly" name='idNo' value='운영자'>
						</div>

						<button type="submit" class="btn btn-default">글쓰기</button>
						<button type="reset" class="btn btn-default">초기화</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- row end -->
	
	    <script type="text/javascript">
   $(document).ready(function(){
   
   var registerForm = $("#registerForm");
	   
   $(".btn").on("click" , function(e){

  	 if(!registerForm.find("#title").val()){
  		 alert("제목입력 입력해주세요");
  		 return false;
  		 
  	 }
  		 
  		 if(!registerForm.find("#content").val()){
  	  		 alert("내용을 입력해주세요");
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