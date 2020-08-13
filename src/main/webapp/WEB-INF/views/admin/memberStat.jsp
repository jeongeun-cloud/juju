<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.css">
    <link rel="stylesheet"  href="../resources/css/admin.css">
   	<link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.js"></script>
</head>
<style>
	body {
		background : white;
	}
	p {
		font-size:17px;
	}
	#MemStat, #WithdrawSta {
		padding-top : 30px;
	}
</style>
<body>
    <%@include file="./idCheck.jsp" %>
    <div class="container">
        <%@include file="./adminSideBar.jsp" %>
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
                
                <!-- CONTAINER  -->
                <div class="mainContent">  

		        	<!-- DETAIL FORM -->
		        	<form id="searchDayform" role="form" action="/admin/memberStat" method="GET" >
		            <div class="formHeader row">
		                <h2 class="text-1 fl"><c:out value="${year}"/> / <c:out value="${month}"/> 회원 현황</h2>
		            </div>
		            
		            <div class="formBody row">
		            	<!-- <div class="column s-6"> -->
			                <p style="float:right;">
				                <i class="fa fa-user" aria-hidden="true"></i> 일반회원 : <c:out value="${customerNum}"/>명 +
		                        <i class="fa fa-user-o" aria-hidden="true"></i> 상인회원 : <c:out value="${sellerNum}"/>명 =
	              		    	총 <c:out value="${totalNum}"/> 명
	              		    </p>
	              		         
              		     	<div class="stat">
              		     		<div style="margin-bottom:20px;">
			              		   <select class="year" id="year">
			              		   		<option value="">년</option>
									    <option value="2019">2019</option>
									    <option value="2020">2020</option>
			              		   
			              		   </select>
									    
									<select class="month" id="month" >
									    <option value="">월</option>
									    <option value="01">01</option>
									    <option value="02">02</option>
									    <option value="03">03</option>
									    <option value="04">04</option>
									    <option value="05">05</option>
									    <option value="06">06</option>
									    <option value="07">07</option>
									    <option value="08">08</option>
									    <option value="09">09</option>
									    <option value="10">10</option>
										<option value="11">11</option>
									    <option value="12">12</option>
									</select>
              		  	
		              		     	<input type="hidden" name="searchDay" id="searchDay">
			              		 	<input type="submit" name="submit" id="submit" class="btnSave bg-1 text-fff text-bold">
		              		 	</div>
		              		 	<!-- <p>(년도 와 월 을 함께 선택해주세요)</p><br> -->
		              		  
		              		  	<%-- <h2 class="text-1 fl" style="color:#637365;">[Day:<c:out value="${year}"/>/<c:out value="${month}"/>]</h2> --%>
		              		  	<!-- <br><br> -->
		              		  	
		              		  	<div id="MemStat_cont">
		              		  		<h2 class="text-1 fl" style="color:#637365;">회원가입 수</h2>
		              		  		<div id="MemStat"></div>
		              			</div>
		              			<br><br>
		              		  
		              		  	<div id= "WithdrawSta_cont">
		              		  		<h2 class="text-1 fl" style="color:#637365;">탈퇴회원 수</h2>
		              		  		<div id="WithdrawSta"></div> 
		              		  	</div>
	              		      
	              			</div>
	              			<!-- end stat -->
		            	</div>
	              	</form>
		        </div>
            </div>
        </div>
        <!-- END CONTAINER  -->
        

	<script src="../resources/js/admin.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
	 $(document).on("change","select.month", function(){
		var searchDay=$(".year option:selected").val()+''+$(".month option:selected").val();
		$("#searchDay").val(searchDay);
		$("#searchDayform").submit();
		
		
		
	});
    
   $("#submit").on("click",function(e){
	   if(!$('.year> option:selected').val()){
			alert("년도를 선택해주세요");
			$('.year').focus();
		}
	   if(!$('.month> option:selected').val()){
			alert("월을 선택해주세요");
			$('month').focus();
			return false;
		}
	   
	   
   })
    
    //회원가입
    google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.setOnLoadCallback(drawBackgroundColor);

    function drawBackgroundColor() {
          var data = new google.visualization.DataTable();
          data.addColumn('number', 'X');
          data.addColumn('number', '회원 수');

          data.addRows([
           ${MemStat}
          ]);

          var options = {
            hAxis: {
              title: 'day'
            },
            vAxis: {
              title: 'member'
            },
            backgroundColor: '#f1ede6'
          };

          var chart = new google.visualization.LineChart(document.getElementById('MemStat'));
          chart.draw(data, options);
        }
    //탈퇴회원 
    google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.setOnLoadCallback(drawBackgroundColor2);
    
    function drawBackgroundColor2() {
        var data = new google.visualization.DataTable();
        data.addColumn('number', 'X');
        data.addColumn('number', '탈퇴 회원 수');

        data.addRows([
         ${WithdrawSta}
        ]);

        var options = {
          hAxis: {
            title: 'day'
          },
          vAxis: {
            title: 'member'
          },
          backgroundColor: '#f1f8e8'
        };

        var chart = new google.visualization.LineChart(document.getElementById('WithdrawSta'));
        chart.draw(data, options);
      }
    </script>
</body>
</html>