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

    <title>shop index</title>
    <style>
     .admi_container{
        width: 1300px;
        height: 100%;
        margin: 0 auto;
        /* border: solid; */
    }
    .admi_manager{
        display: inline-block;
        position: relative;
        width: 100%;
        /* border: solid; */
        margin-bottom: 80px;
        
    }
 
    .quick_wrap{
        margin-top:20px;
        
    }
    .quick_m{
        float: left;
        margin: 10px 20px 20px 10px;
    }
    .quick_find{
        
        border: 2px solid #ddd ;
        width: 380px;
        height: 350px;
    } 
    .quick_tit{
        text-align: center;
        font-size: 17px;
        background-color:#ffc30b ;
    }
    .today_sta{
        
        border:2px solid #ddd ;
        width: 430px;
        height: 350px;
    }
    .today_do{
        
        border:2px solid #ddd ; 
        width: 380px;
        height:350px;

    }
    .quick_btn{
        height: 100px;
        width: 100px;
        border-radius: 50%;
        margin-right: 20px;
        margin-left: 50px;
        margin-top: 20px;
        background-color:#f6dd90;
        color:white;
        font-weight:900;
        border:#ffc30b;
        
    }
    .today_box{
        float: left;
        width: 120px;
        height: 80px;
        border:solid;
        margin: 10px 5px 10px 10px;
        text-align: center;
    }
    .today_tit{
        width: 100%;
        height: 25px;
        text-align: center;
        padding-top: 10px;
        padding-bottom: 5px;      
        background-color: #f6dd90;
    }
    .today_total{
        height: 100px;
        
    }
    .rate{
        height: 50px;
        border:solid red;
        margin: 30px 0 10px 0;
    }
    .today_do_li{
        margin: 50px 10px 0 50px ;
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
<%@include file="../includes/thinHeader.jsp" %>
    <div class="admi_container" style="border:solid;">
        <div class="admi_tit">
            <h1>주주마켓 SHOP:'<c:out value="${shopName}"/>'님 반갑습니다.</h1>
        </div>
        
        <div class="admi_manager">
           

            <div class="quick_wrap">
                <div class="quick_m">
                    <div class="quick_find">
                        <div class="quick_tit">
                            <p><b>빠르게 찾기</b></p>
                        </div>
                       
                        <input class="quick_btn" type="button" value="상품등록" onClick="location.href='/shop/list'">
                        <input class="quick_btn" type="button" value="주문조회" onClick="location.href='/shop/searchorder'">
                        <input class="quick_btn" type="button" value="통계관리" onClick="location.href='/shop/stats'">
                        <input class="quick_btn" type="button" value="단골관리" onClick="location.href='/shop/dangol'">

                    </div>
                </div>

                <div class="quick_m">    
                    <div class="today_sta">
                        <div class="quick_tit">
                            <p><b>Today 현황[오늘 날짜]</b></p>
                        </div>

                        <div class="today_total">
                            <div class="today_box">
                                <div class="pro_regi_sta">
                                    <div class="today_tit">
                                        상품 등록 수 
                                    </div>
                                    <div>
                                        <c:out value="${itemTotal.total }" />
                                    </div>
                                </div>
                            </div>   
                            <!-- today_box -->
                            
                            <div class="today_box">
                                <div class="pro_pay_sta">
                                    <div class="today_tit">
                                        결제 건 수  
                                    </div>
                                    <div>
                                        00건
                                    </div>
                                </div>
                            </div>   
                            <!-- today_box -->

                            <div class="today_box">
                                <div class="pro_order_sta">
                                    <div class="today_tit">
                                        주문 수 
                                    </div>
                                    <div>
                                       <fmt:formatNumber type="number" maxFractionDigits="3" value="${todayOrderCnt}" />건
                                    </div>
                                </div>
                            </div>   
                            <!-- today_box -->
                        </div>
                        <!-- today_total -->
                        <div>
                <div id="dual_x_div" style="width: 80px; height: 180px;"></div>
                        </div>

                    </div>
                </div>   

                <div class="quick_m">    
                    <div class="today_do">
                        <div class="quick_tit">
                            <p><b>오늘의 할 일</b></p>
                        </div>

                        <div class="today_do_li">
                            <div class="today_box">
                                <div class="pro_regi_sta">
                                    <div class="today_tit">
                                        배송 미처리 
                                    </div>
                                    <div>
                                        00건
                                    </div>
                                </div>
                            </div>   

                            <div class="today_box">
                                <div class="pro_regi_sta">
                                    <div class="today_tit">
                                        교환/환불 신청 
                                    </div>
                                    <div>
                                        00건
                                    </div>
                                </div>
                            </div>   

                            <div class="today_box">
                                <div class="pro_regi_sta">
                                    <div class="today_tit">
                                       1:1 문의 
                                    </div>
                                    <div>
                                        00건
                                    </div>
                                </div>
                            </div>   

                            <div class="today_box">
                                <div class="pro_regi_sta">
                                    <div class="today_tit">
                                        상품 문의 
                                    </div>
                                    <div>
                                        00건
                                    </div>
                                </div>
                            </div> 
                        </div>  
                        <!-- today_do_li -->
                        
                    </div>
                    <!-- today_do -->
                </div>   
                <!-- quick_m -->

            </div>
            <!-- quick_wrap -->

        </div>
        <!-- admi_manager -->

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
    <!-- admi_container -->
</body>
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