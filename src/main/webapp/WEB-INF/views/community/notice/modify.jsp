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




li {
   list-style: none;

}

.regi_menu a{
   text-decoration: none;
   color: #303030;
   font-size: 17px;
}





/* 사이드 메뉴 */
.side{
          
     width: 200px;
     height: 200px;
     background-color: white;
     float: left;
     margin-right: 90px;
     border:solid #ffc30b;
            
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

.regi_menu {
	margin-top:20px;

}

/* 사이드 메뉴 끝 */









        
.regi_main{
   float:  right;
   width: 1000px;
   height: 1000px;
   background-color: white;
} 

.regi_main .regi_tit{
   font-size: 30px;
   margin-bottom:50px;
   text-align: center;

}




.regi_content{
   width: 1300px;
   height: 1000px;
   margin:0 auto;
}
        
.regi_wrap{
                 
   position: relative;
   display: inline-block;
   padding-top: 30px;
}
        







/* 등록, 리셋 버튼 시작 */
#modifyBtn,
#deleteBtn,
#listBtn {
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


#modifyBtn:hover,
#deleteBtn:hover,
#listBtn:hover {
  background-color: white; 
  color: #ffc30b; 
  border: 2px solid #ffc30b;
}

#modifyBtn:focus,
#deleteBtn:focus,
#listBtn:focus { 
    outline: none; 
}

.btns {
margin-top : 20px;
}


/* 등록, 리셋 버튼 끝 */










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
                    <ul class="regi_menu" style="margin-top:20px">
                        <li> <a href='/community/notice/list'><i class="fa fa-check" ></i>공지사항</a></li>
                        <li><a href='/community/BoardFAQ/list'><i class="fa fa-check" ></i>자주 묻는 질문</a></li>
                    </ul>
                </div>
            </div>
            <!-- 1nb_list -->
</div>
<!-- side -->







<!-- regi_main 시작 -->      
<div class="regi_main">
   
   <!-- regi_tit 시작 -->
    <div class="regi_tit">
       <p><b>공지 수정하기</b></p>
   </div>
   <!-- regi_tit 끝 -->






	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">수정하기</h1>
		</div>
	</div>
	<!--  col-lg-12 end -->


	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">수정하기</div>
				<div class="panel-body">
				
                	<!-- 페이지정보 얻는폼. pagenum amount , 검색 타입. 검색어 -->
                   <form id ='modifyForm' role="form" action="/community/notice/modify" method="post">
                   <input  type='hidden'  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                   <input type='hidden'  name='amount' value='<c:out value="${cri.amount}"/>'>
                   <input  type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
                   <input type='hidden'  name='keyword' value='<c:out value="${cri.keyword}"/>'>
                   
                   
					<div class="from-group">
						<label>Title</label><input id ='title' class="form-control" name='title'
							value='<c:out value="${BoardFAQ.title}"/>'>
					</div>

					<div class="from-group">
						<label>내용</label>
						<textarea class="form-control" id ='content' rows="10" name='content'
					 ><c:out value="${BoardFAQ.content}"/></textarea>
					</div>


					<div style='display:none' class="from-group">
						<label>게시글타입</label><input class="form-control" name='boardType'
							value='<c:out value="${BoardFAQ.boardType}"/>'readonly="readonly">
					</div>
					
					<div style='display:none' class="from-group">
						<label>작성자</label><input class="form-control" name='idNo'
							value='<c:out value="${BoardFAQ.idNo}"/>'readonly="readonly">
					</div>
					
					<div style='display:none' class="from-group">
						<label>글번호</label><input class="form-control" name='postingNo'
							value='<c:out value="${BoardFAQ.postingNo}"/>'readonly="readonly">
					</div>

					
					<div class="btns">
					<button type="submit" data-oper='modify' class="btn btn-default" id="modifyBtn">수정완료</button>
					<button type="submit" data-oper='remove' class="btn btn-danger" id="deleteBtn">삭제</button>
					<button type="submit" data-oper='list' class="btn btn-info" id="listBtn">리스트</button>
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
		
		var formObj = $("form");
		
		$('button').on("click", function(e){
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
	

		 if(operation === 'remove'){
			 
			 formObj.attr("action","/community/notice/remove");
		 }else if(operation ==='list'){
			 
		 
			 //move to list
				formObj.attr("action", "/community/notice/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
			 	var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone(); 
				 
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);			
				formObj.append(keywordTag);
				formObj.append(typeTag); 		

		 }else{
			 
			 var modifyForm = $("#modifyForm");
			   
			   if(!modifyForm.find("#title").val()||modifyForm.find("#title").val().trim()==""||modifyForm.find("#title").val().length>30){
				   alert("양식에 맞게 제목입력 입력해주세요(1~30자)");
		  		 return false;
		  		 
		  	 }
		  		 
		  		 if(!modifyForm.find("#content").val()||modifyForm.find("#content").val().trim()==""||modifyForm.find("#content").val().length>600){
		  	  		 alert("양식에 맞게 내용입력 입력해주세요(1~600자)");
		  	  		 return false;
		  		 
		  	 }
			  
			 
		 }
			 formObj.submit();
	
		
	});
	});
	
	</script>
	
   <%@include file="../../includes/footer.jsp" %>   	

</body>
</html>