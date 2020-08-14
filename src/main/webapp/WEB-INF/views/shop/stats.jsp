<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
        .manage_content{
            width: 1300px;
            height: 100%;
            margin:0 auto;
            border: solid;
        }
        .manage_wrap{
                 
           position: relative;
           display: inline-block;
           padding-top: 30px;
           background-color: cornsilk;
        }
        
        .side{
          
            width: 200px;
            height: 200px;
            background-color: white;
            float: left;
            margin-right: 90px;
            border:solid;
            
        }
        .manage_main{
            float:  right;
            width: 1000px;
           
            background-color: white;
        } 
        .manage_side_tit{
            padding-top: 12px;
            padding-bottom:12px ;
            text-align: center;
            width: 100%;
            background-color: #ffc30b;
            font-size: 20px;
            font-weight: 900;
            

        }
        .manage_main .manage_tit{
            font-size: 30px;
            margin-bottom:50px;

        }
         .today_pro_sta{
            border:solid green;
            width: 500px;
            padding-left:50px;
            padding-bottom:50px;
            
        }
        .whole_pro_sta{
     	    border:solid orange;
          
        }
        /*  */
        table{
		 border:solid black;
		 }
          th, td {
            padding: 8px;
            text-align: left;
            height:30px;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: black;
            color: white;
            text-align: left;
            height: 30px;
            text-align:center;
        }
    </style>
</head>
<body>
<%@include file="../includes/thinHeader.jsp" %>
    <div class="manage_content">
        <div class="manage_wrap">
            <div class="side">
                <div class="1nb_list">
                    <div class="manage_side_tit">
                        주문관리
                    </div>
                    <div class="manage_side_menu">
                        <ul class="manage_menu">
                           
                            <li> <a href='/shop/sales'>-영업 관리</a></li>
                            <li><a href='/shop/stats'>-통계 관리</a></li>
                            <li> <a href='#'>-전체 주문 조회</a></li>

                        </ul>
                    </div>
                </div>
                <!-- 1nb_list -->
            </div>
            <!-- side -->

            <div class="manage_main">
            
                <div class="manage_tit">
                    <p><b>[통계 관리]</b></p>
                </div>
                <div class="today_pro_sta">
                    <div class="sta_tit">
                       <h3> |오늘 상품 판매량 순위 TOP5</h3>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>순위</th>
                                <th>상품코드</th>
                                <th>상품이름</th>
                                <th>주문 수 </th>
                                
                                
                                
                            </tr>
                        
                        </thead>
                        
                        <c:forEach  items="${TodayProSta }" var="stats">
                        
                        <tr>
                            <td><c:out value="${stats.rank} "/></td>
                            <td><c:out value="${stats.itemCode}" /></td>
                            <td><c:out value="${stats.itemName}" /></td> 
                            <td><c:out value="${stats.orderCnt}" /></td> 
                        </tr>
                        </c:forEach>
                    
                    </table>
                </div>  
                <!-- today_pro_sta -->
                <div class="whole_pro_sta">
                    <div class="sta_tit">
                       <h3> |전체 상품 판매량 통계</h3>
                    </div>
                    <div id="donutchart" style="width: 900px; height: 500px;"></div>
                
                </div>
               <!--end today_pro_sta  -->
                
            <div>
            
            	 <div id="chart_div1" style="width: 800px; height: 500px;"></div>
            	 
            	 
            	 <div id="chart_div2" style="width: 800px; height: 500px;"></div>
            	 
            	 
            	  <div id="chart_div3" style="width: 800px; height: 500px;"></div>
       
                
            </div>
            <!--manage_main  -->

        </div>
    </div>
    </div>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
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
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
     /*끝  원 차트 */
      
    /* 일 막대 차트  */  
     google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart2);

      function drawChart2() {
        var data2 = google.visualization.arrayToDataTable([
        	 ['DAY', '총 주문 금액'],
        	 ${dd}
	        
        ]);

        var options = {
          chart: {
            title: '일별 통계',
            subtitle: '3일간 통계',
          },
          bars: 'vertical',
          vAxis: {format: 'decimal'},
          height: 400,
          colors: ['fba01d']
        };

        var chart = new google.charts.Bar(document.getElementById('chart_div1'));

        chart.draw(data2, google.charts.Bar.convertOptions(options));

      } 
      /* 끝 일 막대 차트  */ 
      /* 달 막대 차트  */  
      google.charts.load('current', {'packages':['bar']});
       google.charts.setOnLoadCallback(drawChart3);

       function drawChart3() {
         var data3 = google.visualization.arrayToDataTable([
         	 ['MONTH', '총 주문 금액'],
         	 ${mm}
 	        
         ]);

         var options = {
           chart: {
             title: '달별 통계',
             subtitle: '3달간 통계',
           },
           bars: 'vertical',
           vAxis: {format: 'decimal'},
           height: 400,
           colors: ['#7dd0b6']
         };

         var chart = new google.charts.Bar(document.getElementById('chart_div2'));

         chart.draw(data3, google.charts.Bar.convertOptions(options));
   
       } 
       /* 끝 달 막대 차트  */  
        google.charts.load('current', {'packages':['bar']});
       google.charts.setOnLoadCallback(drawChart4);

       function drawChart4() {
         var data4 = google.visualization.arrayToDataTable([
         	 ['YEAR', '총 주문 금액'],
         	 ${yy}
 	        
         ]);

         var options = {
           chart: {
             title: '년별 통계',
             subtitle: '3년간 통계',
           },
           bars: 'vertical',
           vAxis: {format: 'decimal'},
           height: 400,
           colors: ['#ff6961']
         };

         var chart = new google.charts.Bar(document.getElementById('chart_div3'));

         chart.draw(data4, google.charts.Bar.convertOptions(options));
   
       } 
       
      
      
    </script>
</body>
</html>