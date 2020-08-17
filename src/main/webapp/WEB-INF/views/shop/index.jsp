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
	
	font-size:15px;
	margin-left:5px;
	}
	.aaa{
	
	font-size:30px;
	margin-left:5px;
	font-weight:800;
	}
	.mainContent{
	
	}
	/* 빠르게 보기  */
	.quick{
	display:inline-block;
	height:150px;
	width:650px;
	}
    .quick_box{
  	    background-color:white;    	
    	width:250px;
    	height:120px;
    	display:inline-block;
    	padding:10px;
    	margin:10px 20px 0 30px;
    	border-radius:10px;
    	box-shadow: 4px 8px 16px 4px rgba(0,0,0,0.2);
    }
    .quick_wrap{
       width:250px;  
       position:relative;            
        
    }
    .quick_l{
    	height:25px;
    	display:inline-block;    	
    	position:absolute;
    	right:20px;
    	margin-top:20px;
    	color:black;
    }
    .quick_a{
    	height:50px;
    	width:80px;
    	display:inline-block;    	
    	margin-top:50px;
    	margin-left:100px;
    	color:black;
    }
    .admi_board{
        display: inline-block;
        position: relative;
        width: 100%;
        /* border: solid blue; */
        height: 450px;
        
    }
    .quick_b{
        width:600px;
        margin: 100px 20px 20px 20px;
        float:left;
    }
    .admi_notice{
       
        width: 600px;
        height:400px;
    }
    .admi_faq{
       
        width: 600px;
        height:400px;
    }
    .board_tit {    
        width: 100%;
        font-size: 20px;
        
    }
    .board_btn{
         width:100%;
        margin-left:510px;
        margin-bottom: 10px;
    }
    .gg{
     width:1300px;
   	 height: 330px;
   	 display:inline;
   	 position:relative
   	
    }
    .s_graph{
    width: 600px;
    float:left;
    }
    #dual_x_div{
    margin: 30px 0 0 50px;
    }
    /*테이블  */
    	table {
		border-collapse: collapse;
		width: 95%;
		margin-left:18px;
		
	}
    th, td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: #637365;
        color: white;
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
    .more{
    background-color:#637365;
    border: 1px solid #637365;
    color: white;
    }
    /* 막대그래프 */
    .bar{
    margin: 40px 0 0 30px;
    }
    .bar-graph-container {
	  border-left: 2px solid gray;
	  border-bottom: 2px solid gray; 
	  width: 80%;
	  overflow: hidden;
	
	}
	
	.bar-graph-container p {
	  padding: 20px;
	  color: #fff;
	  font-weight:900;
	}
	
	@-webkit-keyframes slide-left {
	   0% {
	     -webkit-transform: translateX(-200%);
	  }
	  70% {
	    -webkit-transform: translateX(2%);
	  }
	  100% {
	    -webkit-transform: translateX(0);
	  }
	}
	
	@keyframes slide-left {
	  0% {
	    -webkit-transform: translateX(-200%);
	  }
	  
	  70% {
	    -webkit-transform: translateX(2%);
	  }
	  
	  100% {
	    -webkit-transform: translateX(0);
	  }
	}
	
	.bar-container {
	 	background-color: #f0f2f0;   
		margin-bottom:10px;
	}
	
	.html {
	  width: 85%;
	  background-color: #637365;
	  animation: slide-left 0.9s ease-in-out 1s both;
	  -webkit-animation: slide-left 0.9s ease-in-out 1s both;
	  animation-delay: 0.1s;
	  -webkit-animation-delay: 0.1s;
	}
	
	.css {
	  width: 80%;
	  background-color: #637365;
	  animation: slide-left 1s ease-in-out 1s both;
	 -webkit-animation: slide-left 1s ease-in-out 1s both;
	   animation-delay: 0.2s;
	  -webkit-animation-delay: 0.2s;
	}
	
	.js {
	  width: 60%;
	  background-color: #637365;
	  animation: slide-left 1s ease-in-out 1s both;
	  -webkit-animation: slide-left 1s ease-in-out 1s both;
	   animation-delay: 0.3s;
	  -webkit-animation-delay: 0.3s;
	}
	
	.php {
	  width: 40%;
	  background-color: #637365;
	  animation: slide-left 1s ease-in-out 1s both;
	  -webkit-animation: slide-left 1s ease-in-out 1s both;
	   animation-delay: 0.2s;
	  -webkit-animation-delay: 0.2s;
	}
	
	.drupal {
	  width: 62%;
	  background-color: #637365;
	  animation: slide-left 1s ease-in-out 1s both;
	  -webkit-animation: slide-left 1s ease-in-out 1s both;
	   animation-delay: 0.1s;
	  -webkit-animation-delay: 0.1s;
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
           <div class="quick">
				<div class="quick_box">
		            <div class="quick_wrap">
					     <i class="fa fa-check-circle fa-5x" aria-hidden="true"></i>
					     <div class="quick_l"><label class="aa" >상품 등록 수</label></div>
					     <div class="quick_a"><label class="aaa"> <c:out value="${itemTotal.total }" /> 건</label></div>
		       		</div>
		       	</div>
		       	<div class="quick_box">	
		            <div class="quick_wrap">
		                 <i class="fa fa-cart-plus fa-5x" aria-hidden="true"></i>
		                 <div class="quick_l"><label class="aa" >주문 수</label></div>
		                 <div class="quick_a"> <label class="aaa"><fmt:formatNumber type="number" maxFractionDigits="3" value="${todayOrderCnt}" /> 건</label></div>
		            </div>
		       </div> 
		    </div>    
	
				         	<!--막대 그래프  -->	    
				 <div class="bar">
			   
			    <h2>|실시간 판매 순위</h2><br><br>
			    <div class="bar-graph-container">
			      <div class="bar-container">
			       <div class="html">
			         <p>문어</p>
			        </div>
			      </div>
			      
			     <div class="bar-container">
			       <div class="css">
			         <p>오징어</p>
			        </div>
			      </div>
			      
			      <div class="bar-container">
			        <div class="drupal">
			          <p>소라</p>
			         </div>
			       </div>
			      
			
			      <div class="bar-container">
			       <div class="js">
			         <p>고등어</p>
			        </div>
			      </div>
			       
			      <div class="bar-container">
			       <div class="php">
			         <p>조개</p>
			        </div>
			      </div>
			      
			    </div>  
			          
			    </div>
			   
			  
			  </div>
			  <!--막대 그래프  -->
		    
		    	<div class="gg">
		    		<div class="s_graph">
		    		
				    	<h2 style="margin:100px 0 0 50px;">|어제 오늘 판매량 비교</h2>
			      		     <div id="dual_x_div" style="width: 300px; height: 200px;"></div>
			      		     
			      	</div>
			      	<div class="s_graph">	     
			      		<h2 style="margin:100px 0 0 50px;">|총 판매율</h2>
			      		      <div id="donutchart" style="width: 700px; height: 450px;"></div>
			      	</div>	      
	      		</div>        		
	      		    
		
  	

 
        <div class="admi_board">
            <div class="quick_b">
                <div class="admi_notice">
                    <div class="board_tit">
                        <p style="margin-left:15px;">|주주마켓 공지사항</p>
                    </div>
                    <div class="board_notice_content">
                         <div class="board_btn">
                            <input type="button" class="more" value="더 보기" onClick="location.href='/community/notice/list'">
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
                        <p style="margin-left:15px;">|주주마켓 FAQ</p>
                    </div>
                    <div class="board_faq_content">
                        <div class="board_btn">
                            <input type="button" class="more" value="더 보기" onClick="location.href='/community/BoardFAQ/list'">
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
        width: 500,
        chart: {
          title: '.',
          
         
        },
        bars: 'horizontal', // Required for Material Bar Charts.
        backgroundColor: '#f7f7f7',
        colors:['#8fa691']
      };
    var chart = new google.charts.Bar(document.getElementById('dual_x_div'));
    chart.draw(data, options);
  }
	  
    /* 원 차트 */
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['상품이름', '주문 수 '],
        ${WholeSta}
      
      ]);
      var options = {
        title: '상위 top10 상품',
        pieHole: 0.4,
        backgroundColor: '#f7f7f7',
        colors: [ '#f47b6c','#83b1c9','#c9ba9b', '#a2b59f','#ffd0a6','#d5cb8e','#83b1c9','#cacfe3', '#ffcec7', '#bdc2bb']

      };
      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
      chart.draw(data, options);
    }
   /*끝  원 차트 */
    
    </script>
    
</html>