<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
   float:  right;
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


#regBtn {

margin-right: 8%;

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
        <div class="mainContent">
      		<div class="title">
            <h3>자주묻는질문</h3>
            <p>자주하는 질문</p>
             
  	 </div>
     			
               
         
            
              
                            <form id = "actionForm" method="post">

                                    <div class="from-group">
                                        <label>제목</label><input class="form-control" name='title'
                                            value='<c:out value="${BoardFAQ.title}"/>'
                                        readonly="readonly">
                                    </div>

                                    <div class="from-group">
                                        <label>내용</label>
                                        <textarea class="form-control" rows="10" name='content'
                                        readonly="readonly"><c:out value="${BoardFAQ.content}"/></textarea>
                                    </div>
                                    <div class="from-group">
                                    <input type='hidden' class="form-control" rows="10" name='postingNo'
                                    value='<c:out value="${BoardFAQ.postingNo}"/>'>
                                    </div>


                                    
                                        <input type="hidden"  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                                        <input type="hidden" name ='amount' value='<c:out value="${cri.amount}"/>'>  
                                        <input type ="hidden" name= 'type' value='<c:out value="${cri.type}"/>'>
                                        <input type ="hidden" name= 'keyword' value='<c:out value="${cri.keyword}"/>'>  
                                    
                                        <div class="jaju_regbtn">
                                        <c:if test="${sessionMember.memCode eq 'ADMIN' }">
                                        <button data-oper='modify' id="mBtn" class="btn btn-default">수정</button>
                                        <button data-oper='remove' id="rBtn" type="submit" class="btn btn-default">삭제</button>  
                                        </c:if>          
                                        <button data-oper='list' id="lBtn" class="btn btn-info">리스트</button>
                                        </div>
                            </form>
                
                            <form id='operForm' action="/commuinty/BoardFAQ/modify" method="get">
                                <input type="hidden"  id='postingNo' name='postingNo' value='<c:out value="${BoardFAQ.postingNo}"/>'>
                                <input type="hidden"  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                                <input type="hidden"  name ='amount' value='<c:out value="${cri.amount}"/>'>  
                                <input type ="hidden" name= 'type' value='<c:out value="${cri.type}"/>'>
                                <input type ="hidden" name= 'keyword' value='<c:out value="${cri.keyword}"/>'>
                            </form>            
                    
           
        </div>
        <!-- jaju_main -->
    </div>       
     <!--jaju_wrap  -->
</div>
</div>
<!-- jaju_content -->

                 
   
     <script type="text/javascript">
     $(document).ready(function(){
        
        
        
        
        var formObj = $("#actionForm");
       
       $('button').on("click", function(e){
          e.preventDefault();
          
          var operation = $(this).data("oper");
          
          console.log(operation);

           if(operation === 'remove'){
              
              formObj.attr("action","/community/BoardFAQ/remove");
           }
           formObj.submit();
       });
        
           
        var operForm = $("#operForm");
        

        
         $("button[data-oper='modify']").on("click", function(e){
        
           operForm.attr("action","/community/BoardFAQ/modify").submit();
           
        });
        
        $("button[data-oper='list']").on("click",function(e){
           
          operForm.find("#postingNo").remove();
          operForm.attr("action","/community/BoardFAQ/list");
          operForm.submit();
           
        });
     });
     
     </script>
     
     
   <%@include file="../../includes/footer.jsp" %>       
     
</body>
</html>