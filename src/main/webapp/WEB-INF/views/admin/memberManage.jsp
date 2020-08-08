<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
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
   	.memStat_content{
       width: 1300px;
       height: 1000px;
       margin:0 auto;
       border: solid;
   	}
   	.memStat_wrap{
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
   	.memStat_main{
       float:  right;
       width: 1000px;
       height: 1000px;
       background-color: white;
   	} 
   	.memStat_side_tit{
       padding-top: 12px;
       padding-bottom:12px ;
       text-align: center;
       width: 100%;
       background-color: #ffc30b;
       font-size: 20px;
       font-weight: 900;
   	}
   	
   .memStat_main .memStat_tit{
       font-size: 30px;
       margin-bottom:20px;

   }
   
    /*테이블  */
    	table {
		border-collapse: collapse;
		width: 95%;
		margin-left:18px;
		
	}
    th, td {
        padding: 5px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: #ffc30b;
        color: black;
        text-align: left;
        height: 30px;
        text-align:center;
    }
    
    tr:hover {
        background-color: #f5f5f5;
    }
    
    .index_table{
        margin-top: 20px;
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
    .mem_la {
	    font-size: 20px;
	    font-weight: 900;
    }
</style>

</head>
<body>
 <%--    <%@include file="./idCheck.jsp" %> --%>
    <%@include file="../includes/header.jsp" %>
    <div class="memStat_content">
        <div class="memStat_wrap">
            <!-- side 시작 -->
            <div class="side">
                <div class="1nb_list">
                <div class="memStat_side_tit">관리자 페이지</div>
                    <div class="memStat_side_menu">
                        <ul class="memStat_menu">
                            <p><a href='/admin/index'><b>JUJU 현황</b></a></p>
                            <p><b>배너관리</b></p>
                                <li><a href='/admin/mainBanner'><i class="fa fa-check" ></i> 메인 배너</a></li>
                                <li><a href='/admin/advertise'><i class="fa fa-check" ></i> 중간 광고</a></li>
                                <li><a href='/admin/seasonalMagazine'><i class="fa fa-check" ></i> 제철 페이지</a></li>
                                <li><a href='/admin/eventBanner'><i class="fa fa-check" ></i> 이벤트</a></li>
                            <br>
                            <p><b>회원관리</b></p>
                                <li><a href='/admin/memberManage'><i class="fa fa-check" ></i> 회원 리스트</a></li>
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
                <div class="memStat_main">
                    <div class="memStat_tit">
                        <p><b><i class="fa fa-list-alt"></i> 회원 리스트</b></p>
                    </div>
                    <label class="mem_la"><i class="fa fa-lightbulb-o"></i> 총 회원수 : <c:out value="${pageMaker.total }"/>명</label>  
                    <div class="index_table">
                    	<table tit aria-setsize="500px">
				            <thead>
				               <tr>
				                  <th>회원 이름</th>
				                  <th>회원 계정</th>
				                  <th>회원 유형</th>
				                  <th>가입 일자</th>
				               </tr>
				            </thead>
				            <c:forEach items="${allMember }" var="allMember">
				               <tr>
				                  <td><c:out value="${allMember.memName }" /></td>
				                  <td><c:out value="${allMember.emailAccount }" /></td>
				                  <td>
				                  	<c:choose>
										<c:when test="${allMember.memCode eq 'ADMIN'}">관리자</c:when>
										<c:when test="${allMember.memCode eq 'SELLER'}">상인</c:when>
										<c:when test="${allMember.memCode eq 'CUSTOMER'}">일반고객</c:when>
										<c:otherwise>소셜고객</c:otherwise>
								  	</c:choose>
				                  </td>
				                  <td><fmt:formatDate pattern="yyyy/MM/dd" value="${allMember.condiUpdateDate }" /></td>
				               </tr>
				            </c:forEach>
				         </table>
		         	</div>
		         	
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
	                <!-- end pagination -->
                    
	                 <form id='actionForm' action="/admin/memberManage" method='get'>
	                    <input type='hidden' name='pageNum' id="pageNum" value='${pageMaker.cri.pageNum}'>
	                    <input type='hidden' name='amount' id="amount" value='${pageMaker.cri.amount}'>
	                    <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>' >
	                    <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>' >
	                </form>  
	              		  
                </div>
                 <!-- memStat_main  -->
         </div>
           <!-- memStat_wrap -->
    </div>
	 <!-- memStat_content -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
    <script type="text/javascript">
		$(document).ready(function () {
			
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