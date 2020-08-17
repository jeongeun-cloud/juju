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
	
	table {
		border-collapse: collapse;
		width: 90%;
		margin-left: 50px;
	}
    th, td {
        padding: 8px;
        text-align: center;
        height: 40px;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: #8FA691;
        color: white;
        text-align: left;
        text-align:center;
    }
    
    tr:hover {
        background-color: #f5f5f5;
    }
      .mainContent .title {
     margin-left: 50px;
     }
     .mainContent h3{
     font-weight:500;
     font-size:24px;
     margin-bottom:10px;
     }
     .mainContent p{
         color: #b9b9b9;
         margin-top:0;
         
     }
</style>
</head>
<%@include file="./idCheck.jsp" %>
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
</div>	
   <script src="../resources/js/admin.js"></script>
</body>
</html>