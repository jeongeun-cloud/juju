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
<title>상인 승인</title>
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

    
        <div>

		           <input type="button" id="authorityBtn" value='승인처리'>
		            
		              <table tit aria-setsize="500px" id ="hazy">
		                  <thead>
		                	  <tr>
			                        <th><input id="checkAll" name ='checkAll'type="checkbox"></th>
			                        <th>상인계정</th>
			                        <th>이름</th>
			                        <th>연락처</th>		                        
			                        <th>승인여부</th>
			                        <th>상호명</th>
			                        <th>권한</th>
			                      
		 					   </tr>
		            	 </thead>

		            	 
		            	           <c:forEach items="${list}" var="list">
		               
		
		              	   <tr id="test" class ='test'>
			                  <td><input id='checkbox' name='chk' type="checkbox"  value='<c:out value="${list.idNo}"/>' ></td>                       
		         			  <td><c:out value="${list.emailAccount}"/></td>
			                  <td><c:out value="${list.memName }" /></td>
			                  <td><c:out value="${list.contact1 }" /></td>   
			                  <td><a href='/admin/authorityget?emailaccount=<c:out value= "${list.emailAccount}"/>'>대기중</a></td>  
			                  <td><c:out value="${list.shopName }" /></td>  
			                  <td><c:out value="${list.memCode }" /></td>  
			              

			               </tr> 
		               </c:forEach>
		             </table>
       
         		</div>  
		         
		      <form id ='authorityForm'  action="/admin/authority" method="post">
			          <input type='hidden' id = 'idNoval' type ='text' name = 'idNo' value=''>
	          </form>
		         		
				
</body>
<script type='text/javascript'>
$(document).ready(function(){
 
    //전체 체크처리	
		$("#checkAll").click(function(){

		      if( $("#checkAll").is(':checked') ){
		        $("input[name=chk]").prop("checked", true);
		      }else{
		        $("input[name=chk]").prop("checked", false);
		      }
		});
    
       //체크된것
		$("#authorityBtn").on("click", function(e) {
			var checkRow ="";
		    var idNorow = "";
	    $("input[name='chk']:checked").each (function (){
	    	  
	    	  checkRow = checkRow + $(this).val()+",";	    	
	    });
	  
	   	idNorow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
	   	if(idNorow===""){
               alert("승인하실 아이디를 체크해주세요");
               return false;
               
        } 
		var idNorow =  $("#authorityForm").find("#idNoval").val(idNorow);

     	  		alert("승인 성공");
		   		 $("#authorityForm").submit();
 		});
      
	
});
</script>

         
</body>
</html>