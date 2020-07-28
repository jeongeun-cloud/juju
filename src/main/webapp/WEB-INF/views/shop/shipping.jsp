<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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


          <div> 검색어
                <select>
                      <option value="">주문번호</option>
                      <option value="">상품명</option>
                      <option value="">고객명</option>
                      <option value="">연락처</option>
                </select>
                <input type="text">
          </div>
      <br>
          <div>
              주문일
              <input type='date'>~<input type='date'>


          </div>
      <br>
          <div> 주문상태
                <input type="checkbox">전체
                <input type="checkbox">상품준비중
                <input type="checkbox">배송준비중
                <input type="checkbox">배송중
                <input type="checkbox">배송완료
          </div>      
      <br>
     
 	  
              <button> 검색 </button>  
              <button> 초기화 </button>  

            <div>

             	<button type="submit" id="shippingBtn">배송처리</button>
            
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
  
               <tr>
             
                  <td><input type="checkbox"></td>             
                  <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.orderDate }" /></td>
                  <form id='shippingForm' action="/shop/shipping" method="POST"> 
                  <td><input type ='text' name='orderCode' id ='orderCode' value='<c:out value="${list.orderCode }"/>'></td>
               	  <td><input id ="shippingCode" name='shippingCode' type='text'></td>
                  </form>
            
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
           </div>
    

<script type="text/javascript">

$(document).ready(function(){
	
//송장입력
var shippingBtn = $("#shippingBtn");

var shippingForm = $("#shippingForm");


$("#shippingBtn").on("click" , function(e){

	
	var orderCode = $("#orderCode").val();
	var shippingCode = $("#shippingCode").val();
	
	alert(shippingCode);
	alert(orderCode);

	
	shippingForm.submit();
	

	
	

	  /*  
	   if(!modifyForm.find("#title").val()||modifyForm.find("#title").val().trim()==""||modifyForm.find("#title").val().length>30){
		 alert("양식에 맞게 제목입력 입력해주세요(1~30자)");
		 return false;
		 
	 }
		 
		 if(!modifyForm.find("#content").val()||modifyForm.find("#content").val().trim()==""||modifyForm.find("#content").val().length>600){
	  		 alert("양식에 맞게 내용입력 입력해주세요(1~600자)");
	  		 return false;
		 
	 }
	  */
	 
	
    });

});

</script>

</body>
</html>