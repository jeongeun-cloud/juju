<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
	<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.css">
	<link rel="stylesheet"  href="../resources/css/admin.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.js"></script>
    <title>shop index</title>
    <style>
	.aa{
	
	font-size:20px;
	margin-left:5px;
	}
	.aaa{
	
	font-size:30px;
	margin-left:5px;
	font-weight:800;
	}

    .quick_wrap{
        margin-top:20px;
        
    }

    .admi_board{
        display: inline-block;
        position: relative;
        width: 100%;
        /* border: solid blue; */
        height: 450px;

        
    }
    .quick_b{
        float: left;
        margin: 10px 20px 20px 20px;
    }
    .admi_notice{
        border:2px solid #ddd ; 
        width: 600px;
        height:400px;
    }
    .admi_faq{
        border:2px solid #ddd ; 
        width: 600px;
        height:400px;
    }
    .board_tit {    
        width: 100%;
        font-size: 20px;
        
    }
    .board_btn{
         width:100%;
        margin-left:530px;
        margin-bottom: 10px;
    }
    /*테이블  */
    	table {
		border-collapse: collapse;
		width: 95%;
		margin-left:18px;
		
	}
    th, td {
        padding: 5px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: #ffc30b;
        color: black;
        text-align: left;
        height: 30px;
        text-align:center;
    }
    
    tr:hover {
        background-color: #f5f5f5;
    }
    
    .index_table{
        margin-top: 20px;
    }
    
    </style>
    
  


</head>
<%@include file="./idCheck.jsp" %>
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
           

            <div class="quick_wrap">
			     <i class="fa fa-check-circle fa-3x" aria-hidden="true"></i><label class="aa" >상품 등록 수:</label><label class="aaa"> <c:out value="${itemTotal.total }" /></label>
       
                                    
                 <i class="fa fa-cart-plus fa-3x" aria-hidden="true"></i><label class="aa" >주문 수:</label> <label class="aaa"><fmt:formatNumber type="number" maxFractionDigits="3" value="${todayOrderCnt}" />건</label>

              
            </div>
      		     <div id="dual_x_div" style="width: 80px; height: 180px;"></div>
</div>
  

        <div class="admi_board">
            <div class="quick_b">
                <div class="admi_notice">
                    <div class="board_tit">
                        <p><b>-주주마켓 공지사항</b></p>
                    </div>
                    <div class="board_notice_content">
                         <div class="board_btn">
                            <input type="button" value="더 보기" onClick="location.href='/community/notice/list'">
                        </div>
                      	  <div class="index_table">
		                      <table tit aria-setsize="500px">
					            <thead>
					               <tr>
					                  <th>번호</th>
					                  <th>글 제목</th>
					                  <th>등록일</th>
					               </tr>
					            </thead>
					                 
					             
					            <c:forEach items="${noticelist}" var="notice">
					               <tr>
					                  <td><c:out value="${notice.postingNo }" /></td>
					
					                  <td><a class ='move' href='<c:out value="${notice.postingNo}"/>'>
					                  <c:out value="${notice.title }" /></a></td>
					         
					                  <td><fmt:formatDate pattern="yyyy/MM/dd" value="${notice.regDate }" /></td>
					
					               </tr>
					
					            </c:forEach>
					
					         </table>
			         	</div>
                    </div>

                </div>
            </div>    

           <div class="quick_b">
                <div class="admi_faq">
                    <div class="board_tit">
                        <p><b>-주주마켓 FAQ</b></p>
                    </div>
                    <div class="board_faq_content">
                        <div class="board_btn">
                            <input type="button" value="더 보기" onClick="location.href='/community/BoardFAQ/list'">
                        </div>
                        <div class="index_table">
		                         <table tit aria-setsize="500px">
		                        
		                        <thead>                     
		                       
		                            <tr>
		                                <th>번호</th>
		                                <th>글 제목</th>		                             
		                                <th>등록일</th>
		
		                            </tr>
		                        </thead>
		
		                            <c:forEach items="${faqlist}" var="faq">
		                                <tr>
		                                
		                                    <td><c:out value="${faq.postingNo }" /></td>
		                                    
		                                    <td><a class ='move2' href='<c:out value="${faq.postingNo}"/>'>
		                                    <c:out value="${faq.title }" /></a></td>		                                
		                                    <td><fmt:formatDate pattern="yyyy/MM/dd" value="${faq.regDate }" /></td>
		
		                                </tr>
		                            </c:forEach>
		                        </table>
                        
                        </div>
                     
                    </div>

                </div>
            </div>
            
        </div>
         <form id='faqForm' action="/community/BoardFAQ/list" method='get'></form>
        <form id='noticeForm' action="/community/notice/list" method='get'></form>
    </div>
    
</body>
	<script src="../resources/js/admin.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
    
    var noticeForm = $("#noticeForm");
    $(".move").on("click",function(e){
        

        e.preventDefault();
        noticeForm.append("<input type='hidden' name='postingNo' value = '" + $(this).attr("href") + "'>");
        noticeForm.attr("action", "/community/notice/get");
        noticeForm.submit();

     });
    var faqForm = $("#faqForm");
    $(".move2").on("click",function(e){
        

        e.preventDefault();
        faqForm.append("<input type='hidden' name='postingNo' value = '" + $(this).attr("href") + "'>");
        faqForm.attr("action", "/community/BoardFAQ/get");
        faqForm.submit();
        
     });
    
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawStuff);

    function drawStuff() {
      var data = new google.visualization.arrayToDataTable([
        ['DAY', '판매량'],
       	${tt}
    
      ]);

      var options = {
        width: 400,
        chart: {
          title: '오늘/어제 판매량',
         
        },
        bars: 'horizontal', // Required for Material Bar Charts.
        
      };

    var chart = new google.charts.Bar(document.getElementById('dual_x_div'));
    chart.draw(data, options);
  }
    
    
    </script>
    
</html>