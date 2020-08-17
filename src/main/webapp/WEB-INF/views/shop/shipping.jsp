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
        width: 1200px
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
                <!-- END NAV -->
                
                
                <div class="mainContent">
 		         <div class="title">
                   <h3>배송준비중</h3>
                   <p>배송을 해주세요.</p>
                </div>
                
                
      <div class="q_btn">                           
      		<input class="quick_btn" type="button" value="전체주문보기" onClick="location.href='/shop/searchorder'">
   			 <input class="quick_btn" type="button" value="배송준비중보기" onClick="location.href='/shop/shipping'">
   			 <input class="quick_btn" type="button" value="환불요청보기" onClick="location.href='/shop/refund'">
      </div>  
		           <form id='searchForm' action="/shop/shipping" method = 'get'>  
				         
				         <div class="ss">
						    <label class="ss_label">주문일</label>
				            <input id ='date1' name='date1' type='date'>~<input id ='date2'  name='date2' type='date'>
						 </div>	
						
				         	    <label class="ss_label">검색어</label> 
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
							    <button class='s_btn' id="searchBtn"> 검색 </button> 
		             			<button class="s_btn" type ='reset'> 초기화 </button>  
		                  </div>
		          </form>
		          
           		 <br> 


        <div>

		           <input type="button" class='stat_btn' id="shippingBtn" value='배송처리'>
		            
		              <table tit aria-setsize="500px" id ="hazy">
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
			                  <td><input data-shipping='<c:out value="${list.orderCode}"/>' type='hidden'><fmt:formatDate  pattern="yyyy/MM/dd" value="${list.orderDate }" /></td>
		         			  <td><input type ='text' id ='orderCode' value='<c:out value="${list.orderCode}"/>'></td>
			               	  <td><input data-shipping='<c:out value="${list.orderCode}"/>' id ="shippingCode" type='text' value='<c:out value="${list.shippingCode}"/>'></td>     
			                  <td><input data-shipping='<c:out value="${list.orderCode}"/>' type='hidden'><c:out value="${list.orderStat }" /></td>
			                  <td><c:out value="${list.itemName }" /></td>   
			                  <td><c:out value="${list.itemNum }" /></td>  
			                  <td><c:out value="${list.price }" /></td>  
			                  <td><c:out value="${list.totalPrice}"/></td>
			                  <td><input data-shipping='<c:out value="${list.orderCode}"/>' type='hidden'><c:out value="${list.receiver }" /></td>  
			                  <td><input data-shipping='<c:out value="${list.orderCode}"/>' type='hidden'><c:out value="${list.receivContact }" /></td>  
			                  <td><input data-shipping='<c:out value="${list.orderCode}"/>' type='hidden'><c:out value="${list.receivAddr }" /></td>
			                  <td style='visibility:hidden;'><c:out value="${list.baskId }" /></td>
			                  <td style='visibility:hidden;'><c:out value="${list.itemCode }" /></td>   
			                                   
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
             
             
             <!--송장처리 form -->
	          <form id ='shippingForm'  action="/shop/shipping" method="post">
			          <input  type='hidden' id = 'orderval' type ='text' name = 'orderCode' value=''>
			          <input  type='hidden' id = 'shippingval'type ='text' name = 'shippingCode'value=''>		   
			          <input  type='hidden' id = 'baskval'type ='text' name = 'baskId'value=''>
			          <input  type='hidden' id = 'itemCodeal'type ='text' name = 'itemCode'value=''>
			          <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
			          <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
			       	  <input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
			          <input  type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
	          </form>
             
            <!-- 페이징시작 -->
              
		   
         
         <form id='actionForm' action="/shop/shipping" method='get'>
            <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
            <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
       		<input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
            <input  type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
            <input  type='hidden' name='date1' value = '<c:out value="${pageMaker.cri.date1}"/>'>
		    <input  type='hidden' name='date2' value = '<c:out value="${pageMaker.cri.date2}"/>'>

          </form>
        <!-- paging form end--> 
           
	   	</div>
	</div>  

    
<script src="../resources/js/admin.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	
	$.fn.rowspan = function(colIdx, isStats) {
		  return this.each(function(){
		    var that;
		    $('tr', this).each(function(row) {
		      $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {

		        if ($(this).html() == $(that).html()
		                && (!isStats
		                        || isStats && $(this).prev().html() == $(that).prev().html()
		                )
		        ) {
		          rowspan = $(that).attr("rowspan") || 1;
		          rowspan = Number(rowspan)+1;

		          $(that).attr("rowspan",rowspan);

		          // do your action for the colspan cell here
		          $(this).hide();

		          //$(this).remove();
		          // do your action for the old cell here

		        } else {
		          that = this;
		        }

		        // set the that if not already set
		        that = (that == null) ? this : that;
		      });
		    });
		  });
		};

		$.fn.colspan = function(rowIdx) {
		  return this.each(function(){

		    var that;
		    $('tr', this).filter(":eq("+rowIdx+")").each(function(row) {
		      $(this).find('th').filter(':visible').each(function(col) {
		        if ($(this).html() == $(that).html()) {
		          colspan = $(that).attr("colSpan") || 1;
		          colspan = Number(colspan)+1;

		          $(that).attr("colSpan",colspan);
		          $(this).hide(); // .remove();
		        } else {
		          that = this;
		        }

		        // set the that if not already set
		        that = (that == null) ? this : that;

		      });
		    });
		  });
		}
		
		$("#hazy").rowspan(0);
		$("#hazy").rowspan(1); //주문날짜
		$("#hazy").rowspan(2); //주문번혼  . 얘의 양옆애 애들
		$("#hazy").rowspan(3); //송장번호
		$("#hazy").rowspan(4);
	//  $("#hazy").rowspan(5); 주문상태
		//$("#hazy").rowspan(6); 
//		$("#hazy").rowspan(7); 판매가
//		$("#hazy").rowspan(8); 결제금액
		$("#hazy").rowspan(9);
		$("#hazy").rowspan(10);
		$("#hazy").rowspan(11);
	 	$("#hazy").rowspan(12);

		$("table tbody tr:visible").each(function(row) {
		  $('#hazy').colspan(row);
		});





		    //페이징처리
		    $(".paginate_button a").on("click", function(e) {
		   
		  	 e.preventDefault();
		 	  var actionForm = $("#actionForm");
		       
		       
		      var ac =  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		       console.log(ac);
		       actionForm.submit();

		    });
		

		    //검색부분!!!!
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
		            e.preventDefault();
		            
		            
		            
		            searchForm.submit();  
		  	  
		    });

	
 	$("#shippingBtn").on("click", function(e) {

 
	 
		    var checkRow = "";
		    var shipRow = "";
		    var statRow = "";
		    var stemCodeRow = "";
		    
		    
		    
		    
		    
		    $("input[name='chk']:checked").each (function (){
		    	
		    	
		    	
		       checkRow = checkRow + $(this).val()+"," ;
	           shipRow = shipRow + $(this).closest('tr')[0].children[3].childNodes[0].value + ",";
	           statRow = statRow + $(this).closest('tr')[0].children[12].childNodes[0].nodeValue + ",";
	           stemCodeRow = stemCodeRow + $(this).closest('tr')[0].children[13].childNodes[0].nodeValue+ ",";

	           
		       
		    });
		      checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
		      shipRow = shipRow.substring(0,shipRow.lastIndexOf(",")); //맨끝 콤마 지우기

			  var orderForm =  $("#shippingForm").find("#orderval").val(checkRow); 
		      var shippingForm =  $("#shippingForm").find("#shippingval").val(shipRow);
			  var baskval =  $("#shippingForm").find("#baskval").val(statRow);
			  var itemCodeal =  $("#shippingForm").find("#itemCodeal").val(stemCodeRow);

	
		      $("#shippingForm").submit();

	});
 	
 	    //전체 체크처리	
 		$("#checkAll").click(function(){

 		      if( $("#checkAll").is(':checked') ){
 		        $("input[name=chk]").prop("checked", true);
 		      }else{
 		        $("input[name=chk]").prop("checked", false);
 		      }
 		});


});

</script>

</body>
</html>