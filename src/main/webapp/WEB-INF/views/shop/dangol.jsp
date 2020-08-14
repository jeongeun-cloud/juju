<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.regi_content{
	            width: 1300px;
	            height: 1000px;
	            margin:0 auto;
	           
	        }
	table {
		border-collapse: collapse;
		width: 90%;
		margin-left: 50px;
	}
    th, td {
        padding: 8px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: #8FA691;
        color: white;
        text-align: left;
        height: 40px;
        text-align:center;
    }
    
    tr:hover {
        background-color: #f5f5f5;
    }
      .regi_wrap .title {
     margin-left: 50px;
     }
     .regi_wrap h3{
     font-weight:500;
     font-size:24px;
     margin-bottom:10px;
     }
     .regi_wrap p{
         color: #b9b9b9;
         margin-top:0;
         
     }
</style>
</head>
<%@include file="./idCheck.jsp" %>
<%@include file="../includes/header.jsp" %>
<body>
	<div class="regi_content">
		<div class="regi_wrap">
	<div class="title">
	<h3><c:out value="${shopName}" /></h3>
	<p>총 단골 수 : <c:out value="${totalDangol }"/></p>
	</div>
		<table>
                        <thead>
                            <tr>
                            	<th>번호</th>
                                <th>회원 ID</th>
                                <th>회원 Email</th>
                                
                                
                                
                                
                                
                            </tr>
                        
                        </thead>
                        
                        <c:forEach  items="${dangolList }" var="dangol">
                        
                        <tr>
                            <td><c:out value="${dangol.rn} "/></td>
                            <td><c:out value="${dangol.memidNo}" /></td>
                            <td><c:out value="${dangol.emailAccount}" /></td> 
                            
                        </tr>
                        </c:forEach>
                    
                    </table>
		</div>
	</div>
</body>
</html>