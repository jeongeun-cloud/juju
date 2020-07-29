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


           <form id='searchForm' action="/shop/shipping" method = 'get'>  
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
					
						      <br>
						          <div>
						              주문일<input type='date'>~<input type='date'>


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
               <button class='btn btn-default'> 검색 </button>  
		       <button type = 'reset'> 초기화 </button>  
  </div>
  </form>
            <div>

             	<input type="button" id="shippingBtn" value='배송처리'>
            
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
             
	                 <form id ='shippingForm' role="form" action="/shop/shipping" method="post">
                  <td><input id='checkbox' name='chk' type="checkbox"  value='<c:out value="${list.orderCode }"/>' ></td>             
                  <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.orderDate }" /></td>
            
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
             
             
            <!-- 페이징시작 -->
           <div class='pull-right'>
             <ul class="searchpaging">
            
               <c:if test="${pageMaker.prev}">
               <li class="paginate_button pervious">
               <a href="${pageMaker.startPage -1}">Pervious</a>
               </li>
               </c:if>
               
               <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
               <li class='paginate_button ${pageMaker.cri.pageNum == num? "active":""}'>
               <a href="${num}">${num}</a></li>
               </c:forEach>
               
               <c:if test="${pageMaker.next}">
               <li class="paginate_button next">
               <a href="${pageMaker.endPage +1}">Next</a>
               </li>
               </c:if>
            
            </ul>
         </div> <!-- 페이징 끝!! -->
         
          <form id='actionForm' action="/shop/shipping" method='get'>
            <input type=hidden'' name='pageNum' value = '${pageMaker.cri.pageNum}'>
            <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
       		<input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
            <input  type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
              </form>
        <!-- paging form end--> 
           

    

<script type="text/javascript">

$(document).ready(function(){
	
	
		    //페이징처리
		     $("#searchForm").find(".btn").on("click", function(e) {
		   
		  	 e.preventDefault();
		 	  var actionForm = $("#actionForm");
		       
		       
		      var ac =  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		       console.log(ac);
		       actionForm.submit();
		       
		       
		    });
    
		    //검색부분
		    var searchForm = $("#searchForm");
		    $("#searchForm button").on("click", function(e){
		
		  
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
	
	
	
	$("#shippingBtn").on("click", function(e) {
		
	    alert('dfdf');
	    var checkRow = "";
	    $("input[name='chk']:checked").each (function (){
	       checkRow = checkRow + $(this).val()+"," ;
	    });
      checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
      
      console.log("체크한애" + checkRow);
      
      var shipping = $("#shippingBtn").closest("#shippingCode").val()+",";
      
      
      console.log(shipping);
	});
	
	
//송장입력
var shippingBtn = $("#shippingBtn");

var shippingForm = $("#shippingForm");

$(document).on("click","button[id='shippingBtn']", function(e) {


      var target = e.target;
      var shipping = $(target).parents().find("#orderCode").val() 
      var order = $(target).parents().find("#shippingCode").val();
      var check = $(target).parents().find("#checkbox").val();
      
            
	alert(target);
	alert(shipping);
	alert(order);


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