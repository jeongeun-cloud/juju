<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문완료</title>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>


   #containerOFAll {
      width:80%;
      height:100%;
      margin: 0 auto;
      color: #303030;
   }



   
       #containerOFAll  ul {
            list-style:none;
            font-weight: bold;
            color: lightgray;
        }


        #orderProcess {
            
            position: relative;
            width: 1300px;
            height: 100px;
            
        }

        #ordProcess {

            position:absolute;
            bottom:0px;
            right:8%;

        }


        #currentProcess {
            color: #303030;
        }
        
        
      #completeMsg {
         color: #303030;
         font-weight: bold;
         margin: 15px;
      }
      
      #subMsg {
         color: grey;
         font-weight: bold;
         margin: 15px;
      }
      
      
      .subTitle {
      
         font-size: 10px;
         
      }
      
      #completeContent {
         margin: auto;
         
      }
      
      .contentDiv {
         
         margin: 50px;
      
      }
      
      
      .button1,
      .button2,
      .button3,
      .button4 {
       background-color: #637365; 
        border: none;
        color: white;
        padding: 16px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
      
      }
      
      .button1:hover,
      .button2:hover,
      .button3:hover,
      .button4:hover {
        background-color: white; 
        color: #637365; 
        border: 2px solid #637365;
      }
      
      .button1:focus,
      .button2:focus,
      .button3:focus,
      .button4:focus {
        outline: none; 
      }
      
      
      
      
      /* 
      .btn-primary {
         color: white;
         background-color: #637365;
         border-color: #637365;
         
         
      }
       */
      
      
      
      
      
      
      /* button:active{
         background-color: pink; 
         color:#637365;
      }
      
      button:visited{
         background-color: white; 
         color:#637365;
      }
       */
      
      .btns {
       text-align: center;
      
      }
      
      table {
      
      width: 100%;
      /* border-right: none;
      border-left: none; */
      
      }
      
      
      th {
      
      height: 40px;
      background-color: rgb(238,238,238);
      text-align: right !important;
      padding-right: 10px !important;
      
      /* border: solid 2px;
      border-color: lightgrey; */
      }
      
      td, th {
      border: solid 2px;
      border-color: lightgrey;
      padding-left: 10px !important;
      
      /* border-left: 0;
      border-right: 0; */
      } 
      
      
        #basketItemImg {
    
    	width: 80px;
    	margin-top: 10px;
    	margin-bottom: 10px;
    
    }
    
      
      
    #emptyDiv {
    
    height: 100px;
    
    }
     
     
    #contentDiv2 th,
    #contentDiv2 td {
    	border: none;
    }
       


</style>

</head>
<body>


<jsp:include page="../includes/header.jsp" flush="false"/>
<jsp:include page="../includes/menuBar.jsp" flush="false"/>


   <div id="containerOFAll">




    <div id="orderProcess">
            <!-- 01 장바구니 > 02 주문서 작성/결제 > 03 주문완료 -->
            <div id="ordProcess">
                <ul>
                    <li style="color: lightgrey; float:left;">01 장바구니</li> 
                    <li style="color: lightgrey; float:left;">&nbsp;>&nbsp;</li>
                    <li style="color: lightgrey; float:left;">02 주문서 작성/결제</li> 
                    <li style="color: lightgrey; float:left;">&nbsp;>&nbsp;</li>
                    <li style="float:left;"  id = "currentProcess">03 주문완료</li>
                </ul>
            </div>
        </div>
    


        <!-- 라인 -->
        <hr style="border:solid 1px lightgrey;">



   <div id="completeMsg">
   <h1><strong>주문이 완료되었습니다. 이용해주셔서 감사합니다.</strong></h1>
   </div>

   <div id="subMsg">
   <h4>주문 내역은  [마이페이지 > 주문내역/배송조회] 에서 다시 확인할 수 있습니다.</h4>
   </div>

   
   
   <div id="completeContent">
   
   
   
   
   
   <div class="contentDiv" id="contentDiv2">
   <div class="subTitle">
   <h4><strong>| 주문번호: </strong> ${order.orderCode}</h4>
   </div>

   <form action="orderResult" method="post">
      <!--    <form name="form_order"> -->
      <table class="list_view">
         <tbody align=center>
            <tr>
            <tr align=center class="fixed" style="background-color:#8FA691; color: white; height: 40px;">

               <!-- itemImg1 from t_item -->
               <td class="fixed">아이템Img</td>
               <!-- itemName from t_item -->
               <td class="fixed">주문상품명</td>
               <!-- normPrice from t_item -->
               <td class="fixed">상품금액</td>
               <!-- itemNum from t_basket -->
               <td class="fixed">수량</td>
               <!-- disAmount from t_order_info -->
               <td class="fixed">할인금액</td>
               <!-- price from t_item -->
               <td class="fixed">주문금액</td>
            </tr>

            <!-- 리스트니까 여러 목록이어서 c:forEach로 c:out을 감싸주었음  -->
            <!-- OrderController의 list -> jsp에서 DB 호출시 ${list} -->
            <!-- totalPrice를 구하기 위해 c:set 사용하여 forEach로 반복문 돌려주었음  -->

            <c:forEach var="item" items="${itemList}">
               <tr cellpadding="40" align=center  style="border-bottom: 2px solid #F0F2F0 ;">
                  <td class="tableLine"><img id="basketItemImg" src="/resources/upload/<c:out value="${item.sellerId}"/>/<c:out value="${item.itemImg1}"/>"></td>
                  <td class="tableLine"><c:out value="${item.itemName}"></c:out></td>
                  <td class="tableLine"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.normPrice}" /></td>
                  <td class="tableLine"><c:out value="${item.itemNum}"></c:out></td>
                  <td class="tableLine"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.disAmount}" /></td>
                  <td class="tableLine"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.totalPrice}" /></td>
               </tr>
               
            </c:forEach>

         </tbody>
      </table>
   </form>
   
    <div style="width:100%; height: 100px; text-align:right; font-size:16px; color: #404040; padding-right:15px; ">
      	<div style="width:300px; float:right;">
      			<div style="height:50px; line-height:50px;">
      				<p style="float:left; margin:0; font-size:14px; ">배송비</p>
      				<p style="float:right; margin:0; font-size:14px; "><fmt:formatNumber type="number" maxFractionDigits="3" value="2500" />원</p>
      			</div>
      			<div style="height:50px;  line-height:50px;">
      				<p style="float:left; margin:0; font-weight:bold;">최종 결제금액</p>
      				<p style="float:right; margin:0; font-weight:bold;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${(order.totalPay+2500)*1}" />원</p>
      			</div>
      	</div>
      </div>
   
   
   
   </div>
   
   
   


   <div class="contentDiv">
   <div class="subTitle">
   <h4><strong>| 주문자 정보</strong></h4>
   </div>
   
   
    <!--비회원 주문 상태일 때 주문자 정보 표 -->
   <c:if test="${empty sessionMember}">
   <table border="1" cellpadding="0" cellspacing="0">
      <colgroup>
         <col width="150" />
         <col width="400" />
      </colgroup>

      <tr>
         <th>이름</th>
         <td>${delivery.receiver}</td>
      </tr>
      <tr>
         <th>연락처</th>
         <td>${delivery.receivContact}</td>
      </tr>
      
   </table>
   </c:if>
    <!--비회원 주문 상태일 때 주문자 정보 표 -->
   
   
   
   <!--로그인 상태일 때 주문자 정보 표 -->
   <c:if test="${!empty sessionMember}">
   <table border="1" cellpadding="0" cellspacing="0">
      <colgroup>
         <col width="150" />
         <col width="400" />
      </colgroup>

      <tr>
         <th>이름</th>
         <td>${orderMember.memName}</td>
      </tr>
      <tr>
         <th>연락처</th>
         <td>${orderMember.contact}</td>
      </tr>
      
   </table>
   </c:if>
   <!--로그인 상태일 때 주문자 정보 표 -->

   
   
   </div>
   
   
   
   <div class="contentDiv">
   
   

   <div class="subTitle">
   <h4><strong>| 배송 정보</strong></h4>
   </div>
   
   <table border="1" cellpadding="0" cellspacing="0">
      <colgroup>
         <col width="150" />
         <col width="400" />
      </colgroup>

      <tr>
         <th>이름</th>
         <td>${delivery.receiver}</td>
      </tr>
      <tr>
         <th>주소</th>
         <td>${delivery.receivAddr}</td>
         
      </tr>
      <tr>
         <th>연락처</th>
         <td>${delivery.receivContact}</td>
      </tr>
      <tr>
         <th>요청사항</th>
         <td>${delivery.reqNote}</td>
      </tr>
   </table>
   </div>
   



   <div class="contentDiv">
   


   <div class="subTitle">
   <h4><strong>| 결제 정보</strong></h4>
   </div>
   
   <table border="1" cellpadding="0" cellspacing="0">
      <colgroup>
         <col width="150" />
         <col width="400" />
      </colgroup>

      <tr>
         <th>결제 방법</th>
         <td>Kakao Pay</td>
      </tr>
      <tr>
         <th>결제금액</th>
         <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${order.totalPay+2500}" /></td>
      </tr>

   </table>
   
   </div>
 


<!-- 회원 주문일때만 로그아웃 만들기 -->
<c:if test="${!empty sessionMember}">
     <div class="btns">
            <button type="submit" class="button1" onclick="location.href='/mypage/myPerchaseList'">주문내역/배송조회 확인</button>
            <button type="submit" class="button2" onclick="location.href='/bob'">쇼핑 계속하기</button>
            <button type="submit" class="button3" onclick="location.href='/'">메인으로 가기</button>
            
            
	            <c:choose>
		            <c:when test="${sessionMember.memCode eq 'KAKAO'}">
		            	<button type="submit" class="button4" onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=01b574850137dfee5c295348e0be136f&logout_redirect_uri=http://localhost/member/kakaoLogout'">로그아웃</button>
		            </c:when>
	            	<c:when test="${sessionMember.memCode eq 'NAVER'}">
		            	<button type="submit" class="button4" onclick="location.href='/member/naverLogout'">로그아웃</button>
	            	</c:when>
	            	<c:when test="${sessionMember.memCode eq 'GOOGLE'}">
		            	<button type="submit" class="button4" onclick="googleLogout()">로그아웃</button>
			        </c:when>
			        <c:otherwise>
		            	<button type="submit" class="button4" onclick="location.href='/member/logout'">로그아웃</button>
			        </c:otherwise>
	            </c:choose>
            
    </div>
</c:if>

<!-- 비회원 주문일때 로그아웃 없애기 -->
<c:if test="${empty sessionMember}">
     <div class="btns">
            <button type="submit" class="button1" onclick="location.href='/mypage/myPerchaseList'">주문내역/배송조회 확인</button>
            <button type="submit" class="button2" onclick="location.href='/bob'">쇼핑 계속하기</button>
            <button type="submit" class="button3" onclick="location.href='/'">메인으로 가기</button>
    </div>
</c:if>



   </div>
   
   
   



   </div>
   <!-- end of containerOFAll -->



	<!-- 여백용 div -->
	<div id="emptyDiv">
	
	
	</div>




<script>

function googleLogout() {
	
	signOut();
	
	location.href="/"
	
}


</script>

   <%@include file="../includes/footer.jsp" %>


</body>
</html>