<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/menuBar.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>
<style>

	body {
	   font-family: Arial, Helvetica, sans-serif;
	   color: #303030;
	}
	
	li {
	   list-style: none;
	}
	


	table {
		border-collapse: collapse;
		width: 90%;
		margin-left: 50px;
        margin-top: 30px;
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
    /* 사이드 메뉴 */
	.side{
	     width: 300px;	     
	     float: left;
	     margin-right: 120px;
	     
	}

	

	/* 사이드 메뉴 끝 */
	.regi_main{
	   float:  right;
	   width: 800px;	   
	   background-color: white;
       
	} 
	.regi_content{
	   width: 1300px;
	   margin:0 auto;
      
	}
	        
	.regi_wrap{
	   position: relative;
	   display: inline-block;
	   padding-top: 30px;
	}
</style>
</head>
<body>
<div class="regi_content">
 	<div class="regi_wrap">


<!-- side 시작 -->
	<div class="side">
<%@include file="../includes/mypage_sidebar.jsp" %>
   </div>
<!-- side 끝-->
<!-- regi_main 시작 -->      
	<div class="regi_main">
	
		<table tit aria-setsize="500px">
                        <thead>
                            <tr>
                            	<th>번호</th>
                                <th>단골 가게 </th>
                                <th>상점 </th>
                            </tr>
                        
                        </thead>
                        
                        <c:forEach  items="${myDangol }" var="dangol">
                        
                        <tr>
                            <td><c:out value="${dangol.rn} "/></td> 
                            <td><c:out value="${dangol.shopName}" /></td>
                            <td><a href="/product/store?idNo=<c:out value='${dangol.shopidNo }'/>" class="conts">상점 바로가기 </a></td>
                             
                        </tr>
                        </c:forEach>
                    
              </table>
                    
         </div>
         <!--regi_main  -->           	
         </div>
         <!--regi_wrap  -->
 </div>
 <!--regi_content  -->
</body>
</html>