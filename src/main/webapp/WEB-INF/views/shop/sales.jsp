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
<link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.css">
<link rel="stylesheet"  href="../resources/css/admin.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.js"></script>
<style>
	    .mainContent{
	    margin-top:50px;
	    margin-left:100px;
	    }
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
		width: 90%;
        margin-top: 30px;
		}
	    th, td {
	        padding: 10px;
	        text-align: center;	                    
            height: 40px;
	        border-bottom: 1px solid #ddd;
	    }
	    
	    th {
	        background-color: #8FA691;
	        color: white;
	        height: 40px;
	        text-align:center;
	    }
		.mainContent h3{
		font-weight:500;
		font-size:24px;
		}
		.mainContent p{
			color: #b9b9b9;
		}
    </style>
</head>
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
                   <h3>영업 관리</h3>
                   <p>나의상점의 영업을 확인하세요.</p>
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

    <script src="../resources/js/admin.js"></script>
</body>
</html>