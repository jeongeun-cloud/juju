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
            margin:0 auto;
           
        }
        .manage_wrap{
                 
            position: relative;
           display: inline-block;
           padding-top: 30px;
        
        }
        
	.side{
	     width: 280px;	     
	     float: left;   
	     margin-right:20px;  
	     margin-top:25px;
	}
        .manage_main{
            float:  right;
            width: 980px;
            background-color: white;
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
	        border-bottom: 2px solid #ddd;
	    }
	    
	    th {
	        background-color: #8FA691;
	        color: white;
	        text-align: left;
	        height: 30px;
	        text-align:center;
	    }
		.manage_main h3{
		font-weight:500;
		font-size:24px;
		}
		.manage_main p{
			color: #b9b9b9;
		}
    </style>
</head>
<body>
<%@include file="../includes/header.jsp" %>
    <div class="manage_content">
        <div class="manage_wrap">
            <div class="side">
 				<%@include file="../includes/ishop_sidebar.jsp" %>
            </div>
            <!-- side -->

            <div class="manage_main">
                <div class="title">
                   <h3>영업 관리</h3>
                   <p>우리 가게의 영업을 확인하세요.</p>
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