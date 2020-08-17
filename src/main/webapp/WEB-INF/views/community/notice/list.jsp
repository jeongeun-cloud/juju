<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/menuBar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
 <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">  메뉴바 겹침--> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>notice</title>
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 정체모를 import -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

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
   margin-bottom: 7%;
   background-color: white;
} 

.regi_content{
	   width: 1300px;
	   height: 700px;
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
#regBtn {
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
  
#searchBtn {
  background-color: #8FA691; 
  border: none;
  color: white;
  padding: 0px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  height: 30px;
  border-radius: 10%;
}

#searchBtn:hover {
  background-color: #F0F2F0 ; 
  color: #8FA691; 
  padding: 0px 20px;
  border: 2px solid #8FA691;
}

#regBtn:hover {
  height: 43.75px;
  background-color: #F0F2F0 ; 
  color: #8FA691; 
  padding: 0px 20px;
  border: 2px solid #8FA691;
 
}

#regBtn:focus,
#searchBtn:focus { 
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

.page_num a{
     color: #637365;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    
   
}


.page_num {
        display: inline-block;
        padding-left:50%;
        float: left;
        width: 950px
        }
        
        
    
.paginations a:hover:not(.active) {
          background-color:#F0F2F0;
          border-radius: 50%;
          }
          
.paging{
    
 background-color: white;
 color: #f6dd90;
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
      <div class="mainContent">
      		<div class="title">
            <h3>공지사항</h3>
            <p>공지글을 확인하세요.</p>
             
 
   </div>
   <!-- regi_tit 끝 -->

               <!-- 검색창 form-->
           <div class='row'>
      <div class="col-lg-12">
      
      <form id='searchForm' action="/community/notice/list" method='get'>
      <select id='selected' name='type'>
      <option value=""
      <c:out value="${pageMaker.cri.type ==null?'selected':''}"/>>--</option>
      <option value="T"
      <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
      <option value="C"
      <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
      <option value="I"
      <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>

      </select>
      
      <input id='keyword'  type='text' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
      <input  type="hidden" name ='pageNum' value='${pageMaker.cri.pageNum}'>
      <input type="hidden"  name ='amount' value='${pageMaker.cri.amount}'>
       <button id="searchBtn" class ='btn btn-default'>검색</button>
      
      </form>
      </div>
      </div><!-- 검색창마지막 -->
      
   		   <c:if test="${sessionMember.memCode eq 'ADMIN'}">
         <button id='regBtn' type="button" class="btn btn-xs pull-right">글쓰기</button>
         </c:if>
         
         <table tit aria-setsize="500px">
            <thead>
               <tr>
                  <th>번호</th>
                  <th>글 제목</th>
      

                  <th>등록일</th>
               </tr>
            </thead>
            
                 
             
            <c:forEach items="${notice}" var="notice">
               <tr>
                  <td><c:out value="${notice.rowNum+1-((pageMaker.cri.pageNum-1)*10)}" /></td>

                        <td><a style='color:black' class ='move' href='<c:out value="${notice.postingNo}"/>'>
                  <c:out value="${notice.title }" /></a></td>

  
                  <td><fmt:formatDate pattern="yyyy/MM/dd"
                        value="${notice.regDate }" /></td>



               </tr>

            </c:forEach>

         </table>
         
		
    
         
               <!-- Paging -->   
           <div class='page_num'>
                            <ul class="paginations">
                                <c:if test="${pageMaker.prev}">
                                    <li class="paginate_button1 pervious">
                                        <a href="${pageMaker.startPage -1}">&laquo;</a>
                                    </li>
                                </c:if>
        
                                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                    <li class='paginate_button1 ${pageMaker.cri.pageNum == num ? " active" : "" } '>
                                          <a href="${num}">${num}</a></li>
                                
                                </c:forEach>
        
                                <c:if test="${pageMaker.next}">
                                     <li class="paginate_button1 next">
                                        <a href="${pageMaker.endPage +1 }">&raquo;</a>
                                    </li>
                                </c:if>
                            </ul> 
                        </div>
         
         
         
         <!-- paging form end-->
         <form id='actionForm' action="/community/notice/list" method='get'>
            <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
            <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
             <input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
                <input type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
         </form>

      
      
   
      
</div>
<!-- regi_main 끝 -->      
      
      
      
      
      
      
      
      
</div>
<!-- regi_content 끝 -->
      
         
<!-- modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
   <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header" style="border-bottom:none;">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
    </div>
    <div class="modal-body">처리가 완료되었습니다.</div>
    <div class="modal-footer"  style="border-top:none;">
    <button id="closeBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
  
    </div>

  </div><!--  modal-content -->
   </div><!--  modal dialog -->
</div><!-- modal 마지막 -->   

      
      
      
      

      <script type="text/javascript">
        var actionForm = $("#actionForm");
   
      
      $(document).ready(
               function() {

                  var result = '<c:out value="${result}"/>';

                  checkModal(result);

                  function checkModal(result) {

                     if (result === '') {
                        return;
                     }

                     if (parseInt(result) > 0) {

                        
                        $(".modal-body").html(
                              "게시글" + parseInt(result)
                                    + "번이 등록되었습니다.");

                     }
                     $("#myModal").modal("show");

                  }

                  $("#regBtn").on("click", function() {

                     self.location = "/community/notice/register"
                  });
                  
               });
         
                    
            $(".paginate_button1 a").on("click", function(e){
              
           
               e.preventDefault();
               
               console.log('click');
            
               actionForm.find("input[name='pageNum']").val($(this).attr("href"));
               actionForm.submit();
            });
            
            $(".move").on("click",function(e){
                 

                e.preventDefault();
                actionForm.append("<input type='hidden' name='postingNo' value = '" + $(this).attr("href") + "'>");
                actionForm.attr("action", "/community/notice/get");
                actionForm.submit();
                
             });
            
            <!--검색 스크립트 start-->
            var searchForm =$("#searchForm");
            
            $("#searchForm button").on("click" , function(e){
                  
               if(!searchForm.find("option:selected").val()){
                  alert("검색종류를 선택하세요");
                  return false;
                  
               }
               if(!searchForm.find("input[name='keyword']").val()){
                  alert("검색어 입력하세요");
                  return false;
                  
               }
               
               searchForm.find("input[name='pageNum']").val("1");
               e.preventDefault();
               
               searchForm.submit();
               
               
                });
            
            <!--검색 스크립트 end-->
      </script>





   <%@include file="../../includes/footer.jsp" %>   

</body>

</html>