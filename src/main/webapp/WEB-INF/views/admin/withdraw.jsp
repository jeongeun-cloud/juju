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
<title>withdraw member</title>
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
    
    .withdraw_table{
        margin-bottom: 20px;
    }
    
    .check {
        height: 30px;
        left: 30%;
    }
   	.withdraw_content{
       width: 1300px;
       height: 1000px;
       margin:0 auto;
       border: solid;
   	}
   	.withdraw_wrap{
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
   	.withdraw_main{
       float:  right;
       width: 1000px;
       height: 1000px;
       background-color: white;
   	} 
   	.withdraw_side_tit{
       padding-top: 12px;
       padding-bottom:12px ;
       text-align: center;
       width: 100%;
       background-color: #ffc30b;
       font-size: 20px;
       font-weight: 900;
   	}
   	
   .withdraw_main .withdraw_tit{
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
    <div class="withdraw_content">
        <div class="withdraw_wrap">
        
            <!-- side 시작 -->
            <div class="side">
            <div class="1nb_list">
                <div class="withdraw_side_tit">관리자 페이지</div>
                <div class="withdraw_side_menu">
                    <ul class="withdraw_menu">
                            <p><a href='/admin/index'><b>JUJU 현황</b></a></p>
                            <p><b>배너관리</b></p>
                                <li><a href='/admin/mainBanner'><i class="fa fa-check" ></i> 메인 배너</a></li>
                                <li><a href='/admin/advertise'><i class="fa fa-check" ></i> 중간 광고</a></li>
                                <li><a href='/admin/seasonalMagazine'><i class="fa fa-check" ></i> 제철 페이지</a></li>
                                <li><a href='/admin/eventBanner'><i class="fa fa-check" ></i> 이벤트</a></li>
                            <br>
                            <p><b>회원관리</b></p>
                            	<li><a href='/admin/memberManage'><i class="fa fa-check" ></i> 회원 관리</a></li>
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
                     
                <div class="withdraw_main">
                    <div class="withdraw_tit">
                        <p><b><i class="fa fa-list-alt"></i>탈퇴 회원 list</b></p>
                    </div>   
                     	
                        <div class="withdraw_table">
                            <table aria-setsize="500px">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>회원 id</th>
                                    <th>탈퇴 이유</th>
                                    <th>탈퇴 날짜</th>
                                
                                </tr>
                            </thead>
                            
                            <c:forEach items="${withdraw }" var="w">
                                <tr>
                                	<td><c:out value="${w.rn}" /></td>
                                    <td><c:out value="${w.withdrawIdNo}" /></td>
                                    <td><c:out value="${w.withdrawReason}" /></td>
                                    <td><c:out value="${w.withdrawDay}" /></td>
                                    
                                    
                                </tr>
                            </c:forEach>
                            </table>
                             <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                            <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                        </div> 
                        <!--withdraw_table  -->
                        <div class='page_num'>
                            <ul class="pagination">
                                <c:if test="${pageMaker.prev}">
                                    <li class="paginate_button previous">
                                        <a href="${pageMaker.startPage -1}">&laquo;</a>
                                    </li>
                                </c:if>
        
                                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                    <li class='paginate_button ${pageMaker.cri.pageNum == num ? " active" : "" } '>
                                        <a href="${num}">${num}</a>
                                    </li>
                                </c:forEach>
        
                                <c:if test="${pageMaker.next}">
                                    <li class="paginate_button next">
                                        <a href="${pageMaker.endPage +1 }">&raquo;</a>
                                    </li>
                                </c:if>
                            </ul> 
                        </div>

                        <form id='actionForm' action="/admin/withdraw" method='get'>
                            <input type='hidden' name='pageNum' id="pageNum" value='${pageMaker.cri.pageNum}'>
                            <input type='hidden' name='amount' id="amount" value='${pageMaker.cri.amount}'>
                        
                        </form>
                        
                </div>    
                <!-- withdraw_main -->
        </div> 
        <!--banner_wrap  -->
    </div>  
    <!--banner_content  -->
    <script type="text/javascript">
    	$(document).ready(function() {
        
            // 페이지 이동 
            var actionForm = $("#actionForm");
    	    $(".paginate_button a").on("click", function(e) {
    	    	e.preventDefault();
    	         
    	        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    	        actionForm.submit();
    	    });


        });
    </script>    
</body>
</html>