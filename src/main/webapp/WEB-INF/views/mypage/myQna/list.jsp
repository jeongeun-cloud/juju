<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/menuBar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
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
   margin-bottom: 15%;
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

.default_btn{
        background-color: #ffc30b;
        border: solid #ffc30b;
        border-radius:10px;
        color:white;
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
       
<!-- regi_main 시작 -->      
<div class="regi_main">
		<div class="mainContent">
	      	<div class="title">
	            <h3>1:1 문의</h3>
	            <p>문의 목록</p>
	   		</div>
   </div>
   <!-- regi_tit 끝 -->
          

               <!-- 검색창 form-->
           <div class='row'>
      <div class="col-lg-12">
      
      <form id='searchForm' action="/mypage/myQna/list" method='get'>
      <select id='selected' name='type' id='selected'>
      <option value=""
      <c:out value="${pageMaker.cri.type ==null?'selected':''}"/>>--</option>
      <option value="T"
      <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
      <option value="C"
      <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
      <option value="TC"
      <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
 
      
      </select>
      
      <input id='keyword'   type='text' name='keyword' id="keyword" value = '<c:out value="${pageMaker.cri.keyword}"/>'>
      <input type="hidden"  name ='pageNum' value='${pageMaker.cri.pageNum}'>
      <input type="hidden"  name ='amount' value='${pageMaker.cri.amount}'>

       <button id="searchBtn" class ='btn btn-default'>검색</button>
      
      </form>
      </div>
      </div><!-- 검색창마지막 -->
         
             <button id='regBtn' type="button" class="btn btn-xs pull-right">글쓰기</button>  
         <table tit aria-setsize="500px">
            <thead>
               <tr>
                  <th>번호</th>    
                  <th>제목</th>   
                  <th>등록일</th>  
               </tr>
            </thead>
            <!-- postingNo
            title
            replyBool
                 regdata -->
                 <!-- 페이징처리 -->
            <tbody>
            <c:forEach items="${qna}" var="myQna">
               <tr>
                  <td><c:out value="${total - myQna.rn + 1}" /></td>

                  <td><a class ='move'  style='color:black' href='/mypage/myQna/get?postingNo=<c:out value="${myQna.postingNo}"/>'>
                  <c:out value="${myQna.title }" /></a></td>
                  
           
               
                  <td><fmt:formatDate pattern="yyyy/MM/dd"
                        value="${myQna.regDate }" /></td>                   
               </tr>

            </c:forEach>
            </tbody>

         </table>
              
      <!-- Paging -->
       <div class='page_num'>
                            <ul class="paginations">
                                <c:if test="${pageMaker.prev}">
                                    <li class="paginate_button previous">
                                        <a href="${pageMaker.startPage -1}">&laquo;</a>
                                    </li>
                                </c:if>
        
                                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                    <li class='paginate_button ${pageMaker.cri.pageNum == num ? " active" : "" } '>
                                          <a class="paging" href="/mypage/myQna/list/page/${num}">${num}</a></li>
                                
                                </c:forEach>
        
                                <c:if test="${pageMaker.next}">
                                    <li class="paginate_button next">
                                        <a href="${pageMaker.endPage +1 }">&raquo;</a>
                                    </li>
                                </c:if>
                            </ul> 
         </div>
                        <!-- end pagination -->
         <input type="hidden" id="total" value="${total}">
         <!-- paging form
         <form id='actionForm' action="/mypage/myQna/list" method='get'>
            <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
             <input  type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
         </form> paging form end-->     

      </div>
      <!-- p2-->
              
</div>
<!-- regi_main 끝 -->        
      
</div>
<!-- regi_content 끝 -->
      
      
<script type="text/javascript">
        var actionForm = $("#actionForm");
      	$(document).ready(
               function() {
            	   
            	  //0811 kw  
            	  var pageTags = $(".paging");
            	  var myQnATable = $("tbody");
            	  var total = $("#total");
                  var result = '<c:out value="${result}"/>';
                  
                //0811 kw 
              	pageTags.on().click(function(e){
            		e.preventDefault();
            		var pageNum = e.target.innerText;
            		console.log(pageNum);
            		getListByPage(pageNum)
            		.then(function(response){
            			console.log(response);
            			drawmyQnAList(response);
            		})
            		.catch(function(error){
            			console.log(error);
            		});
            		
            	});
            	
                
            	/* 	ajax 방식으로 페이징 처리 */
            	function getListByPage(pageNum) {
            		return $.ajax({
            			type: "GET",
            			url: "/mypage/myQna/list/page/" + pageNum,
            			contentType : "application/json; charset=UTF-8"
            		});
            	}
            	
            	
            	function drawmyQnAList(myQnAList){
            		myQnATable.html("");
            		for(var i = 0; i<myQnAList.length; i++){
            			var str = "";
            			var myQnA = myQnAList[i];
            			var tr = document.createElement("tr");
            		
            			str += "<td>"+ (total.val() - myQnA.rn + 1) +"</td>"
            			str += "<td><a href='/mypage/myQna/get?postingNo="+myQnA.postingNo+"'>"+myQnA.title+"</a></td>";
            	        var regDate = myQnA.regDate;
            	        var content = myQnA.content;
            	        var date = new Date(regDate);
            	        str += '<td>'+content+'</td>';
            	        str += '<td>'+formatDate(date)+'</td>';
            	  
            	        tr.innerHTML = str;
            	        myQnATable.append($(tr));
            		}
            	}
            	
            	
            	/* 연/월/일만 가져오는 함수 */
            	function formatDate(date) { 
            		var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
            		if (month.length < 2) month = '0' + month; 
            		if (day.length < 2) day = '0' + day; 
            		return [year, month, day].join('/'); }
            	
              	
                  checkModal(result);
                  
                  function checkModal(result) {
                     if (result === '') {
                        return;
                     }
                     if (parseInt(result) > 0) {
                        $(".modal-body").html( "게시글" + parseInt(result) + "번이 등록되었습니다.");
                     }
                     $("#myModal").modal("show");
                  }

                  $("#regBtn").on("click", function() {
                     self.location = "/mypage/myQna/register"
                  });
                  
               });
      	
      	
                    
/*             $(".paginate_button1 a").on("click", function(e){
               e.preventDefault();
               console.log('click');
               actionForm.find("input[name='pageNum']").val($(this).attr("href"));
               actionForm.submit();
            });
            
            $(".move").on("click",function(e){
                e.preventDefault();
                actionForm.append("<input type='hidden' name='postingNo' value = '" + $(this).attr("href") + "'>");
                actionForm.attr("action", "/mypage/myQna/get");
                actionForm.submit();
             }); */
            
             
             
             
             
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