<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
<title>get QNA list</title>
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
        background-color: #ffc30b;
        color: white;
        text-align: left;
        height: 40px;
        text-align:center;
    }
    
    tr:hover {
        background-color: #f5f5f5;
    }
    
    .qnaList_table{
        margin-bottom: 20px;
    }
    
    .check {
        height: 30px;
        left: 30%;
    }
   	.qnaList_content{
       width: 1300px;
       height: 1000px;
       margin:0 auto;
       border: solid;
   	}
   	.qnaList_wrap{
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
   	.qnaList_main{
       float:  right;
       width: 1000px;
       height: 1000px;
       background-color: white;
   	} 
   	.qnaList_side_tit{
       padding-top: 12px;
       padding-bottom:12px ;
       text-align: center;
       width: 100%;
       background-color: #ffc30b;
       font-size: 20px;
       font-weight: 900;
   	}
   	
   .qnaList_main .qnaList_tit{
       font-size: 30px;
       margin-bottom:20px;
   }
   .page_num {
    	display: inline-block;
    	padding-left:70%;
    }
    
    .page_num a{
     	color: black;
    	float: left;
    	padding: 8px 16px;
    	text-decoration: none;
    }
    .pagination a:hover:not(.active) {
	    background-color: #f6dd90;
	    border-radius: 50%;
    }
   
        
</style>
</head>
<body>

 <%@include file="./idCheck.jsp" %>
 <%@include file="../includes/header.jsp" %>
<div class="qnaList_content">
        <div class="qnaList_wrap">
        
            <!-- side 시작 -->
            <div class="side">
            <div class="1nb_list">
                <div class="qnaList_side_tit">관리자 페이지</div>
                <div class="qnaList_side_menu">
                    <ul class="qnaList_menu">
                            <p><a href='/admin/index'><b>JUJU 현황</b></a></p>
                            <p><b>배너관리</b></p>
                                <li><a href='/admin/mainBanner'><i class="fa fa-check" ></i> 메인 배너</a></li>
                                <li><a href='/admin/advertise'><i class="fa fa-check" ></i> 중간 광고</a></li>
                                <li><a href='/admin/seasonalMagazine'><i class="fa fa-check" ></i> 제철 페이지</a></li>
                                <li><a href='/admin/eventBanner'><i class="fa fa-check" ></i> 이벤트</a></li>
                            <br>
                            <p><b>회원관리</b></p>
                            
                                <li><a href='/admin/memberStat'><i class="fa fa-check" ></i> 회원 현황</a></li>
                                <li><a href='#'><i class="fa fa-check" ></i> 상인 승인</a></li>
                                <li><a href='/admin/withdraw'><i class="fa fa-check" ></i> 탈퇴 사유</a></li>
                                <li><a href='/admin/QnaList'><i class="fa fa-check" ></i> 1:1 문의</a></li>
                        </ul>
                </div>
                </div>
                <!-- 1nb_list -->
            </div>
            <!-- side 끝-->
                     
                <div class="qnaList_main">
                    <div class="qnaList_tit">
                        <p><b><i class="fa fa-list-alt"></i>QNA List</b></p>
                    </div>   
					<div class="qnaList_table">
                            <table aria-setsize="500px">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>회원id</th>
                                    <th>회원 email</th>
                                    <th>작성 날짜</th>
                                
                                </tr>
                            </thead>
                            
                            <c:forEach items="${qna}" var="q">
                                <tr>
                                	<td><c:out value="${q.no}" /></td>
                                    <td><c:out value="${q.title}" /></td>
                                    <td><c:out value="${q.idNo}" /></td>
                                    <td><c:out value="${q.emailAccount}" /></td>
                                    <td><c:out value="${q.regDate}" /></td>
                                    
                                    
                                </tr>
                            </c:forEach>
                            </table>
                           
                        </div> 
                        <!-- qnaList_table 끝 -->
             </div>
             <!--qnaList_main  -->
       </div>
       <!--qnaList_wrap  -->
</div>
<!--qnaList_content  -->
</body>
</html>