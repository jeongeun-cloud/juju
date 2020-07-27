<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shop manage sales</title>
<style>
		 table{
		 border:solid black;
		 }
         tr,th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            border:solid;
            
        }
</style>
</head>
<body>

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
			<td><c:out value="${todayOrderTotal}" />원</td>
		    <td><c:out value="${prevOrderTotal}" />원</td> 
			
		
		</tr>
		
	
	</table>


</body>
</html>