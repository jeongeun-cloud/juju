<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원 현황보기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
<%-- <%@include file="../includes/header.jsp" %> --%>
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
   	.memStat_content{
       width: 1300px;
       height: 1000px;
       margin:0 auto;
       border: solid;
   	}
   	.memStat_wrap{
      position: relative;
      display: inline-block;
      padding-top: 30px;
      background-color: cornsilk;
   	}
   
   	.side{
       width: 200px;
       height: 500px;
       background-color: white;
       float: left;
       margin-right: 90px;
       border:solid;
       
   	}
   	.memStat_main{
       float:  right;
       width: 1000px;
       height: 1000px;
       background-color: white;
   	} 
   	.memStat_side_tit{
       padding-top: 12px;
       padding-bottom:12px ;
       text-align: center;
       width: 100%;
       background-color: #ffc30b;
       font-size: 20px;
       font-weight: 900;
   	}
   	
   .memStat_main .memStat_tit{
       font-size: 30px;
       margin-bottom:20px;

   }
</style>

</head>
<body>
    <%@include file="./idCheck.jsp" %>
    <%@include file="../includes/header.jsp" %>
    <div class="memStat_content">
        <div class="memStat_wrap">
            <!-- side 시작 -->
            <div class="side">
                <div class="1nb_list">
                <div class="memStat_side_tit">관리자 페이지</div>
                    <div class="memStat_side_menu">
                        <ul class="memStat_menu">
                            <p><a href='/admin/index'><b>JUJU 현황</b></a></p>
                            <p><b>배너관리</b></p>
                                <li><a href='/admin/mainBanner'><i class="fa fa-check" ></i> 메인 배너</a></li>
                                <li><a href='/admin/advertise'><i class="fa fa-check" ></i> 중간 광고</a></li>
                                <li><a href='/admin/seasonalMagazine'><i class="fa fa-check" ></i> 제철 페이지</a></li>
                                <li><a href='/admin/eventBanner'><i class="fa fa-check" ></i> 이벤트</a></li>
                            <br>
                            <p><b>회원관리</b></p>
                                <li><a href='/admin/memberManage'><i class="fa fa-check" ></i> 회원 리스트</a></li>
                                <li><a href='/admin/memberStat'><i class="fa fa-check" ></i> 회원 현황</a></li>
                                <li><a href='/admin/authority'><i class="fa fa-check" ></i> 상인 승인</a></li>
                                <li><a href='/admin/withdraw'><i class="fa fa-check" ></i> 탈퇴 사유</a></li>
                                 <li><a href='/admin/QnaList'><i class="fa fa-check" ></i> 1:1 문의</a></li>
                        </ul>
                    </div>
                </div>
                <!-- 1nb_list -->
                </div>
            <!-- side 끝-->
                <div class="memStat_main">
                    <div class="memStat_tit">
                        <p><b><i class="fa fa-list-alt"></i>회원 현황</b></p>
                    </div>
                    
                        [일반회원수 : <c:out value="${customerNum}"/>명]+
                        [상인회원수 : <c:out value="${sellerNum}"/>명]=
              		          총 인원:	<c:out value="${totalNum}"/>
              		     
              		     <form id="searchDayform" role="form" action="/admin/memberStat" method="GET" >
              		     <div class="stat">
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
	              		 <input type="submit" name="submit" id="submit">
	              		 <p>(년도 와 월 을 함께 선택해주세요)</p><br>
	              		  
	              		  <h2>[Day:<c:out value="${year}"/>/<c:out value="${month}"/>] 회원 현황</h2>
	              		  
	              		  <div id="MemStat_cont">
	              		  <p>[회원가입 수]</p>
	              		  <div id="MemStat"></div>
	              		  </div>
	              		  
	              		  <div id= "WithdrawSta_cont">
	              		  <p>[탈퇴회원 수]</p>
	              		  <div id="WithdrawSta"></div> 
	              		  </div>
	              		      
	              		 </div>  
	              		 </form>
	              		  
                </div>
                 <!-- memStat_main  -->
         </div>
           <!-- memStat_wrap -->
    </div>
	 <!-- memStat_content -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
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