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

      <form id='searchForm' action="/admin/authority" method = 'get'>  
				         
				                    주문일<input id ='date1' name='date1' type='date'>~<input id ='date2'  name='date2' type='date'>
				          <div> 검색어
				                <select name='type'>
				                
									  <option value=""
								      <c:out value="${pageMaker.cri.type ==null?'selected':''}"/>>--</option>
								      <option value="O"
								      <c:out value="${pageMaker.cri.type eq 'O'?'selected':''}"/>>주문번호</option>
								      <option value="I"
								      <c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>상품명</option>
								      <option value="R"
								      <c:out value="${pageMaker.cri.type eq 'R'?'selected':''}"/>>고객명</option>
								      <option value="P"
								      <c:out value="${pageMaker.cri.type eq 'P'?'selected':''}"/>>연락처</option>
								</select>
		 						<input  type='text' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
							    <input type="hidden"  name ='pageNum' value='${pageMaker.cri.pageNum}'>
							    <input type="hidden"  name ='amount' value='${pageMaker.cri.amount}'>
							    <button class='btn btn-default' id="searchBtn"> 검색 </button> 
		             			<button> 초기화 </button>  
		                  </div>
		          </form>
		          
           		 <br> 


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
 
               <div class='pull-right'>
		               		<ul class="authoritypaging">
		            <c:if test="${pageMaker.prev}">
					              		<li class="paginate_button pervious">
					           				<a href="${pageMaker.startPage -1}">Pervious</a>
					           			</li>
					              </c:if>		               
					               <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					               		<li class='paginate_button ${pageMaker.cri.pageNum == num? "active":""}'>
					               			<a href="${num}">${num}</a>
					               		</li>
					               </c:forEach>
					               <c:if test="${pageMaker.next}">
					               		<li class="paginate_button next">
					               <a href="${pageMaker.endPage +1}">Next</a>
					               		</li>
					               </c:if>
		            
		            		</ul>
		         </div><!-- endPaging -->
		         
		      <form id ='authorityForm'  action="/admin/authority" method="post">
			          <input type='' id = 'idNoval' type ='text' name = 'idNo' value=''>
			          <input type='' name='pageNum' value = '${pageMaker.cri.pageNum}'>
			          <input type='' name='amount' value = '${pageMaker.cri.amount}'>
			       	  <input type='' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
			          <input  type='' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
	          </form>
		         
		         
		       <!-- paging form-->
		       
		         <form id='actionForm' action="/admin/authority" method='get'>
		            <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
		            <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
		         	<input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
		            <input  type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
	                <input  type='' name='date1' value = '<c:out value="${pageMaker.cri.date1}"/>'>
		            <input  type='' name='date2' value = '<c:out value="${pageMaker.cri.date2}"/>'>
		            <input  type='' name='orderStat' value = '<c:out value="${pageMaker.cri.orderStat}"/>'>
		         </form>
					 <!-- paging form end--> 
			
					
			
				
</body>
<script type='text/javascript'>
$(document).ready(function(){

      //페이징처리
      $(".paginate_button a").on("click", function(e) {
     
    	 e.preventDefault();
   	  var actionForm = $("#actionForm");
   	  
   	var orderStat = $("#orderStat").val();
       
        var ac =  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
         console.log(ac);
         actionForm.submit();
      });
      
      //검색부분
      var searchForm = $("#searchForm");
      $("#searchForm").find(".btn").on("click", function(e){
    	  

              if(!searchForm.find("option:selected").val()){
                 alert("검색종류를 선택하세요");
                 return false;
                 
              }
              if(!searchForm.find("input[name='keyword']").val()){
                 alert("검색어 입력하세요");
                 return false;
     
              }
              searchForm.find("input[name='pageNum']").val("1");
             
              
              searchForm.submit();  
    	  
      });
      
      
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
               alert("승인하실 아이디를 체크해주세요ㄴ");
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