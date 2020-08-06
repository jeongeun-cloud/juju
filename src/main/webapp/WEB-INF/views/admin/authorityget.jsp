<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>상인 정보</title>
</head>

<style>
  table {
    border-collapse: collapse;
  }
  
  table, td, th {
    border: 1px solid black;
  }
  </style>
<body>



 			  <a>대표자 이 동 환</a>            <a href='/admin/authority'>목록으로가기</a> 
	   
 			 		   <div id='cal'>
            		  <table>
                         
                           <c:forEach items="${list}" var="list">
                        
		                          <td>상점이름</td>
		                          <td><c:out value="${list.shopName }" /></td>  
             		              <tr>
		                          <td>이메일</td>
		                          <td><c:out value="${list.emailAccount }" /></td> 
		                          <tr>
		                          <td>연락처</td>
		                          <td><c:out value="${list.contact1 }" /></td>
		                          <tr>
		                          <td>사업자</td>
		                          <td ><img src='/resources/seller/<c:out value="${list.businessCode}"/>/<c:out value="${list.businessRegFile}"/>'></td>
		                          <tr id="catal" class ='catal'>
		                          <td>사업자 주소지</td>
		                          <td><c:out value="${list.shopAddr }" /></td>
		                          <td style='visibility:hidden;'><c:out value="${list.idNo }"/></td>
		                          
		                          
		                          
		                   </c:forEach>
		                  
                	</table>
                	
                
                 		<input type='button' id='workBtn' value='상인신청 승인'>
              		    <input type='button' id= 'reBtn'value='취소'>
                 </div>
     
                <!-- 승인처리 뒤로가기 -->
               	<form id='work'  action="/admin/authority" method='POST'>
                      <input type='hidden' name='idNo' id='workidNo'>
                </form>
                 
                 <!-- 취소버튼 뒤로가기 -->
                 <form id='re'  action="/admin/authority" method='get'></form>
                 
                          
<script type="text/javascript">
$(document).ready(function(e) {
	     //승인버튼
	     $("#workBtn").on("click",function(e) {
	    	 
	    	 alert("ㅅㅅ");
	    	 
	    	 
 	 var catal =  this.closest("div").children[0].children[0].children[4].children[2].childNodes[0].nodeValue;
			$("#workidNo").val(catal);
			$("#work").submit();
	     });
	    
	     //취소버튼
	     $("#reBtn").on("click",function(e) {
	    	 $("#re").submit();
	     });
	
	    
	
	
	
	
});
</script>
</body>
</html>