<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
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
	.admin_content{
       width: 1300px;
       height: 1000px;
       margin:0 auto;
       border: solid;
   	}
   	.admin_wrap{
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
   	.admin_side_tit{
       padding-top: 12px;
       padding-bottom:12px ;
       text-align: center;
       width: 100%;
       background-color: #ffc30b;
       font-size: 20px;
       font-weight: 900;
   	}
   	
   .admin_main .admin_tit{
       font-size: 30px;
       margin-bottom:20px;
   }
</style>
</head>
<body>

	<div class="admin_content">
        <div class="admin_wrap">
        	<!-- side 시작 -->
		   	<div class="side">
		      <div class="1nb_list">
		         <div class="admin_side_tit">관리자 페이지</div>
		           <div class="admin_side_menu">
		               <ul class="admin_menu">
		                    <p><a href='/admin/index'><b>JUJU 현황</b></a></p>
		                    <p><b>배너관리</b></p>
			                    <li><a href='/admin/mainBanner'><i class="fa fa-check" ></i> 메인 배너</a></li>
	                            <li><a href='/admin/advertise'><i class="fa fa-check" ></i> 중간 광고</a></li>
	                            <li><a href='/admin/seasonalMagazine'><i class="fa fa-check" ></i> 제철 페이지</a></li>
	                            <li><a href='/admin/eventBanner'><i class="fa fa-check" ></i> 이벤트</a></li>
		                    <br>
		                    <p><b>회원관리</b></p>
			                    <li><a href='#'><i class="fa fa-check" ></i> 회원수</a></li>
			                    <li><a href='#'><i class="fa fa-check" ></i> 회원 현황</a></li>
			                    <li><a href='#'><i class="fa fa-check" ></i> 상인 승인</a></li>
			                    <li><a href='#'><i class="fa fa-check" ></i> 탈퇴 사유</a></li>
		                </ul>
		           </div>
		     	</div>
		     	<!-- 1nb_list -->
		  	</div>
			<!-- side 끝-->
 
		</div>
	</div>

</body>
</html>
