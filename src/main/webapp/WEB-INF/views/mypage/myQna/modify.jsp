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
     height: 500px;
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

/* 사이드 메뉴 */
.side{
     width: 200px;
     height: 500px;
     background-color: white;
     float: left;
     margin-right: 90px;
     border:solid #637365;
}

 .regi_side_tit{
      padding-top: 12px;
      padding-bottom:12px ;
      text-align: center;
      width: 100%;
      background-color: #8FA691;
      font-size: 20px;
      font-weight: 900;
}

.regi_menu {
	margin-top:20px;
}

/* 사이드 메뉴 끝 */


/* 등록, 리셋 버튼 시작 */
#completeBtn,
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


#completeBtn:hover,
#deleteBtn:hover,
#listBtn:hover {
  background-color: white; 
  color: #ffc30b; 
  border: 2px solid #ffc30b;
}

#completeBtn:focus,
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
         <div class="regi_side_tit">마이페이지</div>
           <div class="regi_side_menu">
               <ul class="regi_menu">
                    <p><b>쇼핑 이용 정보</b></p>
                    <li><a href='/mypage/myPerchaseList'><i class="fa fa-check" ></i>주문내역</a></li>
                    <li><a href='/order/basketList'><i class="fa fa-check" ></i>장바구니</a></li>
                    <br>
                    <c:if test="${!empty sessionMember}">
                    <p><b>게시판 이용 내역</b></p>
                    <li> <a href='/mypage/myQna/list'><i class="fa fa-check" ></i>1:1문의</a></li>
                    <li><a href='/mypage/myReview'><i class="fa fa-check" ></i>나의 상품평</a></li>
                    <li><a href='/mypage/myPrdReply'><i class="fa fa-check" ></i>나의 상품 문의</a></li>
                    
                    
                    
                   		 <c:choose>
                           <c:when test="${sessionMember.memCode eq 'CUSTOMER'}">
                              <li><a href="/mypage/customerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                           <c:when test="${sessionMember.memCode eq 'SELLER'}">
                              <li><a href="/mypage/sellerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                           <c:when test="${sessionMember.memCode eq 'JUNIOR'}">
                              <li><a href="/mypage/sellerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                        </c:choose>
                        <c:choose>
  						<c:when test="${(sessionMember.memCode eq 'CUSTOMER'
                           				|| sessionMember.memCode eq 'JUNIOR'                           			
                           				|| sessionMember.memCode eq 'SELLER')                           			
                           				}">
                    <li><a href='/mypage/modifyPwd'><i class="fa fa-check" ></i>비밀번호 변경</a></li>
                    <li><a href='/mypage/memberDelete'><i class="fa fa-check" ></i>회원 탈퇴</a></li>
                    <br>
                    <p><b>단골 상점 </b></p>
                    <li> <a href='/mypage/myDangol'><i class="fa fa-check" ></i>상점 바로가기</a></li>
                        </c:when>
                        </c:choose>
                    </c:if>
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
       <p><b>1:1문의 수정하기</b></p>
   </div>
   <!-- regi_tit 끝 -->


	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">수정하기</div>
				<div class="panel-body">
				
                	<!-- 페이지정보 얻는폼. pagenum amount , 검색 타입. 검색어 -->
                   <form id ='modifyForm' role="form" action="/mypage/myQna/modify" method="post">
                   <input type='hidden'   name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                   <input type='hidden'  name='amount' value='<c:out value="${cri.amount}"/>'>
                   <input type='hidden'  name='type' value='<c:out value="${cri.type}"/>'>
                   <input type='hidden'  name='keyword' value='<c:out value="${cri.keyword}"/>'>
                   
                   
					<div class="from-group">
						<label>Title</label><input id ='title' class="form-control" name='title'
							value='<c:out value="${BoardQNA.title}"/>'>
					</div>

					<div class="from-group">
						<label>내용</label>
						<textarea class="form-control" id ='content' rows="10" name='content'
					 ><c:out value="${BoardQNA.content}"/></textarea>
					</div>

					
					<div class="from-group">
						<label>작성자</label><input class="form-control" name='idNo'
							value='<c:out value="${BoardQNA.idNo}"/>'readonly="readonly">
					</div>
					
<%-- 					<div class="from-group">
						<label>답글여부</label><input class="form-control" name='replyBool'
							value='<c:out value="${BoardQNA.replyBool}"/>'readonly="readonly">
					</div> --%>
					
					<div class="from-group">
						<label>글번호</label><input class="form-control" name='postingNo'
							value='<c:out value="${BoardQNA.postingNo}"/>'readonly="readonly">
					</div>
					
					
                  <div class="form-group1">
                   <input type="hidden" class="form-control" value='${sessionMember.idNo}'>
                  </div>
					
					
					<div class="btns">
					<button type="button" data-oper='modify' class="btn-default" id="completeBtn">수정완료</button>
					<button type="button" data-oper='remove' class="btn btn-danger" id="deleteBtn">삭제</button>
					<button type="button" data-oper='list' class="btn btn-info" id="listBtn">리스트</button>
					
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
		
		$('.btn').on("click", function(e){
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
	

		 if(operation === 'remove'){
			 
			 formObj.attr("action","/mypage/myQna/remove");
		 }else if(operation ==='list'){
			 //move to list
				formObj.attr("action", "/mypage/myQna/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
			 	var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone(); 
				 
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);			
				formObj.append(keywordTag);
				formObj.append(typeTag); 		

		 }
			 formObj.submit();
	
		
	});
		
	});
	
	 var modifyForm = $("#modifyForm");
	   
	   $(".btn-default").on("click" , function(e){
	  	
		   
		   if(!modifyForm.find("#title").val()||modifyForm.find("#title").val().trim()==""||modifyForm.find("#title").val().length>30){
	  		 alert("양식에 맞게 제목입력 입력해주세요(1~30자)");
	  		 return false;
	  		 
	  	 }
	  		 
	  		 if(!modifyForm.find("#content").val()||modifyForm.find("#content").val().trim()==""||modifyForm.find("#content").val().length>600){
	  	  		 alert("양식에 맞게 내용입력 입력해주세요(1~600자)");
	  	  		 return false;
	  		 
	  	 }
		  
	  	 
	  		modifyForm.submit();
	  	 
	  	 
	       });
	
</script>

   <%@include file="../../includes/footer.jsp" %>   

</body>
</html>