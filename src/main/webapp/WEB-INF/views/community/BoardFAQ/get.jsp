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

</head>
<body>
   <div class="row">
      <div class="col-lg-12">
         <h1 class="page-header"><c:out value="자묻질"/></h1>
      </div>
   </div>
   <!--  col-lg-12 end -->


   <div class="row">
      <div class="col-lg-12">
         <div class="panel panel-default">
            <div class="panel-heading"><c:out value="${BoardFAQ.content}"/></div>
            <div class="panel-body">
                   <form id = "actionForm" role="form" method="post">


               <div class="from-group">
                  <label>Title</label><input class="form-control" name='title'
                     value='<c:out value="${BoardFAQ.title}"/>'
                  readonly="readonly">
               </div>

               <div class="from-group">
                  <label>내용</label>
                  <textarea class="form-control" rows="10" name='content'
                  readonly="readonly"><c:out value="${BoardFAQ.content}"/></textarea>
               </div>


               <div class="from-group">
                  <label>게시글타입</label><input class="form-control" name='boardType'
                     value='<c:out value="${BoardFAQ.boardType}"/>'readonly="readonly">
               </div>
               
               <div class="from-group">
                  <label>작성자</label><input class="form-control" name='idNo'
                     value='<c:out value="${BoardFAQ.idNo}"/>'readonly="readonly">
               </div>
               
               <div class="from-group">
                  <label>글번호</label><input class="form-control" name='postingNo' id="postingNo"
                     value='<c:out value="${BoardFAQ.postingNo}"/>'readonly="readonly">
               </div>
               
                   <input type="hidden"  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                       <input type="hidden" name ='amount' value='<c:out value="${cri.amount}"/>'>  
                       <input type ="hidden" name= 'type' value='<c:out value="${cri.type}"/>'>
                       <input type ="hidden" name= 'keyword' value='<c:out value="${cri.keyword}"/>'>  
               
               <button data-oper='modify' class="btn btn-default">수정</button>
               <button data-oper='remove' type="submit" class="btn btn-default">삭제</button>
               
                    <button data-oper='list' class="btn btn-info">리스트</button>
          </form>
               
               <form id='operForm' action="/commuinty/BoardFAQ/modify" method="get">
                <input type="hidden"  id='postingNo' name='postingNo' value='<c:out value="${BoardFAQ.postingNo}"/>'>
                   <input type="hidden"  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                   <input  type="hidden" name ='amount' value='<c:out value="${cri.amount}"/>'>  
                   <input type ="hidden" name= 'type' value='<c:out value="${cri.type}"/>'>
                   <input type ="hidden" name= 'keyword' value='<c:out value="${cri.keyword}"/>'>
                   
               </form>            
            
            </div><!--  panel body end -->
         </div>
      </div>

   </div>
   <!-- row end -->

               
               
               
               
   
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
</body>
</html>