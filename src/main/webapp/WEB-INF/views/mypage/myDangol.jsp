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
	
	.regi_menu a{
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
    /* 사이드 메뉴 */
	.side{
	     width: 200px;
	     height: 500px;
	     background-color: white;
	     float: left;
	     margin-right: 90px;
	     border:solid #ffc30b ;
	}
	
	 .regi_side_tit{
	      padding-top: 12px;
	      padding-bottom:12px ;
	      text-align: center;
	      width: 100%;
	      background-color: #ffc30b;
	      font-size: 20px;
	      font-weight: 900;
	}
	
	.regi_menu {
		margin-top:20px;
	}

	/* 사이드 메뉴 끝 */
	.regi_main{
	   float:  right;
	   width: 1000px;
	   height: 1000px;
	   background-color: white;
	} 
	
	.regi_main .regi_tit{
	   font-size: 30px;
	   margin-bottom:50px;
	   text-align: center;
	}
	
	.regi_content{
	   width: 1300px;
	   height: 1000px;
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
      <div class="1nb_list">
         <div class="regi_side_tit">마이페이지</div>
           <div class="regi_side_menu">
               <ul class="regi_menu">
                    <p><b>쇼핑 이용 정보</b></p>
                    <li><a href='/mypage/myPerchaseList'><i class="fa fa-check" ></i>주문내역</a></li>
                    <li><a href='/order/basketList'><i class="fa fa-check" ></i>장바구니</a></li>
                    <br>
                    <c:if test="${!empty sessionMember}">
                    <p><b>게시판 이용 내역</b></p>
                    <li> <a href='/mypage/myQna/list'><i class="fa fa-check" ></i>1:1문의</a></li>
                    <li><a href='/mypage/myReview'><i class="fa fa-check" ></i>나의 상품평</a></li>
                    <li><a href='/mypage/myPrdReply'><i class="fa fa-check" ></i>나의 상품 문의</a></li>
                    
                    
                    
                   		 <c:choose>
                           <c:when test="${sessionMember.memCode eq 'CUSTOMER'}">
                              <li><a href="/mypage/customerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                           <c:when test="${sessionMember.memCode eq 'SELLER'}">
                              <li><a href="/mypage/sellerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                           <c:when test="${sessionMember.memCode eq 'JUNIOR'}">
                              <li><a href="/mypage/sellerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                        </c:choose>
                        <c:choose>
  						<c:when test="${(sessionMember.memCode eq 'CUSTOMER'
                           				|| sessionMember.memCode eq 'JUNIOR'                           			
                           				|| sessionMember.memCode eq 'SELLER')                           			
                           				}">
                    <li><a href='/mypage/modifyPwd'><i class="fa fa-check" ></i>비밀번호 변경</a></li>
                    <li><a href='/mypage/memberDelete'><i class="fa fa-check" ></i>회원 탈퇴</a></li>
                    <br>
                    <p><b>단골 상점 </b></p>
                    <li> <a href='/mypage/myDangol'><i class="fa fa-check" ></i>상점 바로가기</a></li>
                        </c:when>
                        </c:choose>
                    </c:if>
                </ul>
           </div>
     </div>
     <!-- 1nb_list -->
  </div>
<!-- side 끝-->
<!-- regi_main 시작 -->      
	<div class="regi_main">
	<h2>나의 단골 상점</h2>
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