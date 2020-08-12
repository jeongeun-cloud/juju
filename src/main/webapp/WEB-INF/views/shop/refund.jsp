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
 		
 		  <input class="quick_btn" type="button" value="전체주문보기" onClick="location.href='/shop/searchorder'">
   			 <input class="quick_btn" type="button" value="송창처리" onClick="location.href='/shop/shipping'">
   			 <input class="quick_btn" type="button" value="환불요청보기" onClick="location.href='/shop/refund'">
  
		      <form id='searchForm' action="/shop/refund" method = 'get'>  
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
					    <input type=""  name ='pageNum' value='${pageMaker.cri.pageNum}'>
					    <input type=""  name ='amount' value='${pageMaker.cri.amount}'>               

						      <br>
						      주문일<input id='date1' name='date1' type='date'>~<input id='date2' name='date2' type='date'>
						      <br>

		
		          <div > 주문상태
		                 <input name='orderStat' type="radio" value = '환불처리요청'>환불처리요청
		                 <input name='orderStat' type="radio" value = '환불처리완료'>환불처리완료
		                
		      			
		      			 <button class='btn btn-default' id="searchBtn"> 검색 </button> 
		                <button type = 'reset'> 초기화 </button> 
		          
		          </div>  
		        </form>    
		      <br>
		      
		             
		             <input type="button" id="refundBtn" value='완료처리'>
			
		              <table tit aria-setsize="500px">
		                  <thead>
		                    <tr>
		                        <th><input id="checkAll" name ='checkAll'type="checkbox"></th>
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
		        
		                   <tr id="test" class ='test'> 
		                   <td><input id='checkbox' name='chk' type="checkbox"  value='<c:out value="${list.orderCode}"/>' ></td>
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
		                   <td style='visibility:hidden;'><c:out value="${list.baskId }" /></td>
			               <td style='visibility:hidden;'><c:out value="${list.itemCode }" /></td>   
		                        
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
		         
		         
		         <form id ='refundForm'  action="/shop/refund" method="post">
			          <input type='' id = 'orderval' type ='text' name = 'orderCode' value=''>
			 		  <input  type='' id = 'statval'type ='text' name = 'orderStat'value=''>
			          <input  type='' id = 'baskval'type ='text' name = 'baskId'value=''>
			          <input  type='' id = 'itemCodeval'type ='text' name = 'itemCode'value=''>
			          <input type='' name='pageNum' value = '${pageMaker.cri.pageNum}'>
			          <input type='' name='amount' value = '${pageMaker.cri.amount}'>
			       	  <input type='' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
			          <input  type='' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
	          </form>
		         
		       <!-- paging form-->
		       
		         <form id='actionForm' action="/shop/refund" method='get'>
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
    
       //상태변경처리
		$("#refundBtn").on("click", function(e) {

		
		    var checkRow = "";
		    var statRow = "";
		    var baskRow = "";
		    var itemRow = "";
		    
		    
		    $("input[name='chk']:checked").each (function (){
		       checkRow = checkRow + $(this).val()+"," ; //주문번호
		       statRow = statRow + $(this).closest('tr')[0].children[4].childNodes[0].nodeValue+ ","; //주문상태
	           baskRow = baskRow + $(this).closest('tr')[0].children[12].childNodes[0].nodeValue + ","; //바스크아이디
 		       itemRow = itemRow + $(this).closest('tr')[0].children[13].childNodes[0].nodeValue + ","; //아이템코드

	           
		       
		    });
		      checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
		      statRow = statRow.substring(0,statRow.lastIndexOf(",")); //맨끝 콤마 지우기
		      baskRow = baskRow.substring(0,baskRow.lastIndexOf(",")); //맨끝 콤마 지우기
		      itemRow = itemRow.substring(0,itemRow.lastIndexOf(",")); //맨끝 콤마 지우기

			  var orderForm =  $("#refundForm").find("#orderval").val(checkRow); //주문번호
			  var statval =  $("#refundForm").find("#statval").val(statRow); //주문상태
		      var baskval =  $("#refundForm").find("#baskval").val(baskRow); //바스크아이디
		      var itemCodeal =  $("#refundForm").find("#itemCodeval").val(itemRow);

	
		      $("#refundForm").submit();

	});
      
	
});
</script>
</html>
                 
        

