<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<form id='searchForm'>
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
              <input type="button" value="배송처리">
              <table tit aria-setsize="500px">
                  <thead>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th>주문일</th>
                        <th>주문번호</th>
                        <th>송장번호</th>
                         <th>주문상태</th>
                        <th>상품명</th>
                        <th>고객명</th>
                        <th>주문상태</th>
                        <th>결제금액</th>
                        <th>연락처</th>

                    </tr>
                  </thead>
                     <c:forEach items="${list}" var="list">
                     <tr>
  
               <tr>
                  <td><input type="checkbox"></td>
                  <td><fmt:formatDate pattern="yyyy/MM/dd"
                        value="${list.orderDate }" /></td>
                  <td><c:out value="${list.orderCode }" /></td>
                   <td><input type='text'></td>   
                   <td><c:out value="${list.orderStat }" /></td>
                  
                   
                     <td><c:out value="${list.itemName }" /></td>  
                    
					<td><c:out value="${list.totalPay}"/></td>
                      <td><c:out value="${list.receiver }" /></td>  
                        <td><c:out value="${list.receivContact }" /></td>  
                   <td><c:out value="${list.receivAddr }" /></td>
                        
                    </tr> 
                    
                  </c:forEach>
                  </table>
          
            </div>
      </form>

</body>
</html>