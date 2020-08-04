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

      <form id='searchForm' action="/shop/shipping" method = 'get'>  
				         
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

		           <input type="button" id="shippingBtn" value='승인처리'>
		            
		              <table tit aria-setsize="500px" id ="hazy">
		                  <thead>
		                	  <tr>
			                        <th><input id="checkAll" name ='checkAll'type="checkbox"></th>
			                        <th>No</th>
			                        <th>상인계정</th>
			                        <th>이름</th>
			                        <th>연락처</th>
			                        <th>권한</th>
			                        <th>사업자등록체크</th>
			                        <th>상호명</th>
			                      
		 					   </tr>
		            	 </thead>
		            	 
		            	           <c:forEach items="${list}" var="list">
		               
		  
		              	      <tr id="test" class ='test'>
			                  <td><input id='checkbox' name='chk' type="checkbox"  value='<c:out value="${list.orderCode}"/>' ></td>             
			                  <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.orderDate }" /></td>
		         			  <td><input type ='text' id ='orderCode' value='<c:out value="${list.orderCode}"/>'></td>
			               	  <td><input id ="shippingCode" type='text'></td>     
			                  <td><c:out value="${list.orderStat }" /></td>
			                  <td><c:out value="${list.itemName }" /></td>   
			                  <td><c:out value="${list.itemNum }" /></td>  
			                  <td><c:out value="${list.price }" /></td>  
			                       
			               </tr> 
		               </c:forEach>
		             </table>
       
         		</div>  
 
               <div class='pull-right'>
		               		<ul class="shippingpaging">
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

         
</body>
</html>