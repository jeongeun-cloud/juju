<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
  
		      <form id='searchForm' action="/shop/searchorder" method = 'get'>  
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
						      <br>
						          <div>
						              주문일<input type='date'>~<input type='date'>
		
		
		          </div>
		      <br>
		      </form> 
		      
		      	<form id="test" method="POST">
		          <div > 주문상태
		                <input name='orderStat' type="radio" value = 'all' checked>전체
		                <input name='orderStat' type="radio" value = '상품준비중'>상품준비중
		                <input name='orderStat' type="radio" value = '배송중'>배송중
		                <input name='orderStat' type="radio" value = 'orderStat'>배송완료
		                <button class='radioBtn' id="radioBtn"> 검색 </button>
		          </div>  
		          </form>    
		      <br>
		             
		              <button type = 'reset'> 초기화 </button>  
			
		              <table tit aria-setsize="500px">
		                  <thead>
		                    <tr>
		                        <th><input type="checkbox"></th>
		                        <th>주문일</th>
		                        <th>주문번호</th>
		                        <th>송장번호</th>
		                         <th>주문상태</th>
		                        <th>상품명</th>
		                        <th>상품수량</th>
		                        <th>판매가</th>
		                        
		                        <th>결제금액</th>
		                        <th>고객명</th>
		                        <th>연락처</th>
		                        <th>주소</th>
		
		                      
		                    </tr>
		                  </thead>
		                  
		                  
		                  
		              <c:forEach items="${list}" var="list">
		        
		                     <tr>
		    
		               <tr>
		               
		                  <td><input type="checkbox"></td>
		                  <td><fmt:formatDate pattern="yyyy/MM/dd"
		                        value="${list.orderDate }" /></td>
		                  <td><c:out value="${list.orderCode }" /></td>
		                  <td><c:out value="${list.shippingCode }" /></td>
		                   <td><c:out value="${list.orderStat }" /></td>
		                  
		                    <td><c:out value="${list.itemName }" /></td>   
		                     <td><c:out value="${list.itemNum }" /></td>  
		                     <td><c:out value="${list.price }" /></td>  
		                     
		         
		                    
							<td><c:out value="${list.totalPrice}"/></td>
		                      <td><c:out value="${list.receiver }" /></td>  
		                        <td><c:out value="${list.receivContact }" /></td>  
		                   <td><c:out value="${list.receivAddr }" /></td>
		                        
		                    </tr> 
		                  </c:forEach>
		                  

		                  </table>
		                  
		                  <!-- 페이징 처리 시작 -->
		                  
		                  
		                  
		           <div class='pull-right'>
		               		<ul class="searchpaging">
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
		         
		       <!-- paging form-->
		       
		         <form id='actionForm' action="/shop/searchorder" method='get'>
		            <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
		            <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
		         	<input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
		            <input  type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
			     </form>		      
					 <!-- paging form end--> 
			
					
			
				
</body>
<script type='text/javascript'>
$(document).ready(function(){

	
      //페이징처리
      $(".paginate_button a").on("click", function(e) {
     
    	 e.preventDefault();
   	  var actionForm = $("#actionForm");
         
         
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
      
      $("#radioBtn").on("click", function(e){

         var check = $("input:radio[name='orderStat']:checked").val();
         
    	 alert(check);
    	   
         $("#test").submit();
          /* $.ajax({
				url : '/shop/searchorder',
				data : {orderStat : check},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					alert("ㅂ뀜");
				}
			});  */	// $.ajax

      });
	
});
</script>
</html>
                 
        

