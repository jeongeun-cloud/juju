<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.css">
<link rel="stylesheet"  href="../resources/css/admin.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.js"></script>



<style>
      li{
            list-style: none;
            
        }
        body{
            color: #303030;
        }
        a{
            text-decoration: none;
            color: #303030;
            font-size: 17px;
        }

 

    /* 테이블 */
       table {
		border-collapse: collapse;
		width: 100%;
        margin-top: 30px;
        margin-bottom:30px;
		}
	    th, td {
	        padding: 10px;
	        text-align: center;
	        border-bottom: 2px solid #ddd;
	        
	    }
	    
	    th {
	        background-color: #8FA691;
	        color: white;
	        text-align: left;
	        height: 30px;
	        text-align:center;
	    }
		.mainContent h3{
		font-weight:500;
		font-size:24px;
		margin-bottom:20px;
		}
		.mainContent p{
			color: #b9b9b9;
		}
		/*버튼  */
		.q_btn{
		float:right;
		margin-bottom: 30px;
		}

		.quick_btn{
            background-color: #8FA691; 
            border: none;
            color: white;
            padding: 8px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            margin: px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            font-weight: 900;
        }
        .quick_btn:hover {
        background-color: white; 
        color: #8FA691; 
        border: 2px solid #8FA691;
        }
		.quick_btn
         {
        background-color: #8FA691;
        color: white;
        
        
        }

        .quick_btn:focus { 
            outline: none; 
        }
        .ss{
        margin-top:20px;
        margin-bottom:20px;
        }
        .ss_label {
        width: 65px;
        }
        .s_btn{
        background-color: #8FA691;
        border: solid #8FA691;
        border-radius:10px;
        color:white;
        text-align:center;
        margin-left:10px;
        font-size:10px;
        }
        /*버튼 끝  */
        
        /* 페이징 */
        .page_num {
        display: inline-block;
        padding-left:70%;
        }
        
        .page_num a{
         color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
   
        }
        .searchpaging a:hover:not(.active) {
          background-color: #8FA691;
          border-radius: 50%;
          }
          /* 페이징 끝 */
          
              .stat_btn{
          float:right;
		  margin-bottom: 30px;
		  background-color: #8FA691; 
            border: none;
            color: white;
            padding: 8px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            margin: 10px 10px;
            transition-duration: 0.4s;
            cursor: pointer;
            font-weight: 900;
            
          
          }
          
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
</style>
<body>

<div class="container">
 <%@include file="./shopSideBar.jsp" %>		
 		
 		<div class="mainArea">
 		            <!-- BEGIN NAV -->
                <nav class="navTop row">
                    <div class="menuIcon fl"><span class="fa fa-bars"></span></div>
                    <div class="account fr">
                        <div class="name has-submenu"><c:out value="${sessionMember.idNo}"/><span class="fa fa-angle-down"></span></div>
                        <ul class="accountLinks submenu">
                            <li><a href="/">View website</a></li>
                            <li><a href="/member/logout">Log out<span class="fa fa-sign-out fr"></span></a></li>
                        </ul>
                    </div>
                </nav>
                
                <div class="mainContent">
 		         <div class="title">
                   <h3>환불처리</h3>
                   <p>환불요청 및 환불완료</p>
                </div>
 		
 		 <div class="q_btn">
 		 	 <input class="quick_btn" type="button" value="전체주문보기" onClick="location.href='/shop/searchorder'">
   			 <input class="quick_btn" type="button" value="배송준비중 보기" onClick="location.href='/shop/shipping'">
   			 <input class="quick_btn" type="button" value="환불요청보기" onClick="location.href='/shop/refund'">
         </div>   
		      <form id='searchForm' action="/shop/refund" method = 'get'>  
		           <div class="ss">
		          	<label class="ss_label">검색어</label> 
		                <select name='type' style="height:32px;">
		                
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
				  </div>
				  <div class="ss">
						    <label class="ss_label">주문일</label>  
						    <input id='date1' name='date1' type='date'> ~ <input id='date2' name='date2' type='date'>
			      </div>

		
		          <div class="ss"> 
		                 <input name='orderStat' type="radio" value = '환불처리요청'>환불처리요청
		                 <input name='orderStat' type="radio" value = '환불처리완료'>환불처리완료
		                
		      			
		      			 <button class='btn s_btn' id="searchBtn"> 검색 </button> 
		                <button class='s_btn' type = 'reset'> 초기화 </button> 
		          
		          </div>  
		        </form>    
		      <br>
		      
		             
		             <input type="button" class='stat_btn' id="refundBtn" value='환불승인'>
			
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
		                  
		                  
		                  
		           <div class='page_num'>
                            <ul class="paginations">
                                <c:if test="${pageMaker.prev}">
                                    <li class="paginate_button1 pervious">
                                        <a href="${pageMaker.startPage -1}">&laquo;</a>
                                    </li>
                                </c:if>
        
                                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                    <li class='paginate_button1 ${pageMaker.cri.pageNum == num ? " active" : "" } '>
                                          <a href="${num}">${num}</a></li>
                                
                                </c:forEach>
        
                                <c:if test="${pageMaker.next}">
                                     <li class="paginate_button1 next">
                                        <a href="${pageMaker.endPage +1 }">&raquo;</a>
                                    </li>
                                </c:if>
                            </ul> 
                        </div>
         
         
         
         <!-- paging form end-->
  
		         
		         
		         <form id ='refundForm'  action="/shop/refund" method="post">
			          <input type='hidden' id = 'orderval' type ='text' name = 'orderCode' value=''>
			 		  <input  type='hidden' id = 'statval'type ='text' name = 'orderStat'value=''>
			          <input  type='hidden' id = 'baskval'type ='text' name = 'baskId'value=''>
			          <input  type='hidden' id = 'itemCodeval'type ='text' name = 'itemCode'value=''>
			          <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
			          <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
			       	  <input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
			          <input  type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
	          </form><!-- endPaging -->
		         
		       <!-- paging form-->
		       
		         <form id='actionForm' action="/shop/refund" method='get'>
		            <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
		            <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
		         	<input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
		            <input  type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
	                <input  type='hidden' name='date1' value = '<c:out value="${pageMaker.cri.date1}"/>'>
		            <input  type='hidden' name='date2' value = '<c:out value="${pageMaker.cri.date2}"/>'>
		            <input  type='hidden' name='orderStat' value = '<c:out value="${pageMaker.cri.orderStat}"/>'>
		         </form>
					 <!-- paging form end--> 
			
		</div>
	</div>
</div>
					
			
				
</body>
<script src="../resources/js/admin.js"></script>
<script type='text/javascript'>
$(document).ready(function(){

      //페이징처리
      $(".paginate_button1 a").on("click", function(e) {
     
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
    	  
    	  
    	  
  /* 
    
              if(!searchForm.find("option:selected").val()){
                 alert("검색종류를 선택하세요");
                 return false;
                 
              }
              if(!searchForm.find("input[name='keyword']").val()){
                 alert("검색어 입력하세요");
                 return false;
     
              } */
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
                 
        

