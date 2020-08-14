<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shop manage sales</title>
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
            height: 1000px;
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
            height: 1000px;
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
        /*  */
        table{
		 border:solid black;
		 }
         th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid black;
        }
        
        th {
            background-color: black;
            color: white;
            text-align: left;
            height: 40px;
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
                    <p><b>[영업관리]</b></p>
                </div>
                <table>
		<thead>
			<tr>
				<th>구분</th>
				<th>오늘</th>
				<th>지난 달</th>
				
				
			</tr>
		
		</thead>
		
		
		<tr>
			<td>총 주문금액</td>
			<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${todayOrderTotal}" />원</td>
		    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${prevOrderTotal}" />원</td> 
		</tr>
		<tr>    
		    <td>총 주문 건</td>
		    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${todayOrderCnt}" />건</td>
		    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${prevOrderCnt}" />건</td> 
					
		</tr>
		<tr>    
		    <td>총 환불 주문금액</td>
		    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${todayRefundTotal}" />원</td>
		    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${prevRefundTotal}" />원</td> 
					
		</tr>
		<tr>    
		    <td>총 환불 주문 건</td>
		    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${todayRefundCnt}" />건</td>
		    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${prevRefundCnt}" />건</td> 
					
		</tr>
		
	
	</table>
            </div>

        </div>
    </div>

</body>
</html>