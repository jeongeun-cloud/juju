<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="./../includes/header.jsp" %>
<%@include file="./../includes/menuBar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
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


	.regi_main h3{
	font-weight:500;
	}
	.regi_main p{
		color: #b9b9b9;
	}
	
.regi_main .regi_tit{
   font-size: 30px;
   margin-bottom:50px;
   text-align: center;
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

  b{
    
    font-size: 22px;
    
    }
    
    .title{
            height: 40px;
          	width:150px;
          	padding:5px;
          	border-bottom: 1px solid #8fa691;
          	color: #8fa691;
          	text-align:center;
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
<%@include file="../includes/mypage_sidebar.jsp" %>
   </div>
<!-- side 끝-->        
     </div>
     <!-- 1nb_list -->
  </div>
<!-- side 끝-->


<!-- regi_main 시작 -->      
<!-- regi_main 시작 -->      
<div class="regi_main">
   
   <!-- regi_tit 시작 -->
    <div class="mainContent">
 		         <div class="title">
                   <b>나의 상품문의</b>               
                </div>
   <!-- regi_tit 끝 -->

         
         <table tit aria-setsize="500px">
            <thead>
               <tr>
                  <th>상품명</th>    
                  <th>내용</th>   
                  <th>등록일</th>  
               </tr>
            </thead>
            <!-- postingNo
            title
            replyBool
                 regdata -->
                 <!-- 페이징처리 -->
            <tbody id="myPrdReplyTable">                 
            <c:forEach items="${myPrdReplyList}" var="myPrdReply">
               <tr>
                 <td><a style='color:black' href="/product/item?itemCode=${myPrdReply.itemCode}"><c:out value="${myPrdReply.itemName}" /></a></td>              
                 <td><c:out value="${myPrdReply.replyContent}" /></td>              
                 <td><fmt:formatDate pattern="yyyy/MM/dd" value="${myPrdReply.regDate }" /></td>              

               </tr>

            </c:forEach>
            </tbody>

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
                                     <a class="paging" href="/mypage/myPrdReply/page/${num}">${num}</a></li>
                                
                                </c:forEach>
        
                                <c:if test="${pageMaker.next}">
                                     <li class="paginate_button1 next">
                                        <a href="${pageMaker.endPage +1 }">&raquo;</a>
                                    </li>
                                </c:if>
                            </ul> 
                        </div>
         
      </div>
      <!-- p2-->
</div>
<!-- regi_main 끝 -->     

</div>


<script type="text/javascript">

$(document).ready(function(){
	
	var pageTags = $(".paging");
	var myPrdReplyTable = $("#myPrdReplyTable");
	
	pageTags.on().click(function(e){
		e.preventDefault();
		var pageNum = e.target.innerText;
		console.log(pageNum);
		getListByPage(pageNum)
		.then(function(response){
			console.log(response);
			drawmyPrdReplyList(response);
		})
		.catch(function(error){
			console.log(error);
		});
		
	});
	
	function drawmyPrdReplyList(myPrdReplyList){
		myPrdReplyTable.html("");
		for(var i = 0; i<myPrdReplyList.length; i++){
			var str = "";
			var myPrdReply = myPrdReplyList[i];
			var tr = document.createElement("tr");
		
			str += "<td><a href='/product/item?itemCode="+myPrdReply.itemCode+"'>"+myPrdReply.itemName+"</a></td>";
	        str += '<td>'+myPrdReply.replyContent+'</td>';
	       
	        var regDate = myPrdReply.regDate;
	        var date = new Date(regDate);
	        str += '<td>'+formatDate(date)+'</td>';
	        tr.innerHTML = str;
			myPrdReplyTable.append($(tr));
		}
	}
	
	
	/* 	ajax 방식으로 페이징 처리 */
	function getListByPage(pageNum) {
		return $.ajax({
			type: "GET",
			url: "/mypage/myPrdReply/page/"+pageNum,
			contentType : "application/json; charset=UTF-8"
		});
	}
	
	/* 연/월/일만 가져오는 함수 */
	function formatDate(date) { 
		var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
		if (month.length < 2) month = '0' + month; 
		if (day.length < 2) day = '0' + day; 
		return [year, month, day].join('/'); }

	
});
</script>

   <%@include file="../includes/footer.jsp" %>   

</body>
</html>
