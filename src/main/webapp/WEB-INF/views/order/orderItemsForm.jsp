<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file = "../includes/header.jsp" %>
<%@ include file = "../includes/menuBar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>주문서 작성 및 결제</title>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<!-- css 임포트 적용 안되는데 원인을 모르겠음. 일단 주석 처리해놓을게요(css 파일 최신 버전 아님) -->
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/orderItemsForm.css"> -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
   crossorigin="anonymous"></script>
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



   <style>


    #tableBody{
    
    
    }
    


    #containerOFAll {
        width:80%;
        height:100%;
        margin: 0 auto;

        color: #303030;
        text-align:center;
    }



    h5 {
        color:grey;
    }
    
    input {
    
         border-style:solid;
        border-width:1px;
        border-color:lightgrey;
    
    }
    
    
    
    
    
    td {
    
    padding: 10px;
    padding-right: 50px;
    
    }
    
    
 



    #submitBtn {
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
    font-weight: bold;
    }

    #submitBtn:hover {
    background-color: white; 
    color: #637365; 
    border: 2px solid #637365;
    }

    #submitBtn {
    background-color: #637365;
    color: white;
    
    }
    .submitBtn:focus { 
        outline: none; 
    }


    

   

    #containerOFAll ul {
        list-style:none;
        font-weight: bold;
        color: lightgray;
    }

   /*  li {
        float: left;
    } */

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

   
 

    #basketTableContainer{
        margin:auto;
        padding: 30px;
    }


    .list_view {
        
        width:100%;
        margin: 0 auto;
    }

    #tableTitle {
        background-color: lightgray;
        height: 50px;
    }

    #tableBody {
        height: 120px;
    }




    #customerInfo {
    
    width: 45%;
    text-align: left;
    margin-top: 30px;
    margin-bottom: 60px;
    float: left;
    
    }
    
    #nonMemPwd {
    
    width: 45%;
    text-align: left;
    margin-top: 30px;
    margin-bottom: 60px;
    float: right;
    
    }
    
    #cAndP {
    width: 100%;
    height: 400px;
    }
    
    
    
    #deliveryInfo {
    
    width: 100%;
    text-align: left;
    margin-top: 30px;
    margin-bottom: 60px;
    
    }
    
    
    #paymentDiv {
    
    width: 100%;
    height: 300px;
    text-align: left;
    margin-top: 30px;
    margin-bottom: 60px;
    
    }






/* 원본 css 시작 */
            
    #layer {
        z-index: 2;
        position: absolute;
        top: 0px;
        left: 0px;
        width: 100%;
        /* background-color:rgba(0,0,0,0.8); */
    }

    #popup_order_detail {
        z-index: 3;
        position: fixed;
        text-align: center;
        left: 10%;
        top: 0%;
        width: 60%;
        height: 100%;
        border: 2px solid;
    }

    #close {
        z-index: 4;
        float: right;
    }
    
    
   
    #basketItemImg {
    
       width: 80px;
    
    }
    
    
    #emptyDiv {
    
    height: 100px;
    
    }
    
    
    

/* 원본 css 끝 */
    

</style>



</head>
<body>

<jsp:include page="payAPItest.jsp" flush="false"/>



    <div id="containerOFAll">
        
        <div id="orderProcess">
            <!-- 01 장바구니 > 02 주문서 작성/결제 > 03 주문완료 -->
            <div id="ordProcess">
                <ul>
                    <li style="color: lightgrey; float:left;">01 장바구니</li> 
                    <li style="color: lightgrey; float:left;">&nbsp;>&nbsp;</li>
                    <li style="float:left;" id = "currentProcess">02 주문서 작성/결제</li> 
                    <li style="color: lightgrey; float:left;">&nbsp;>&nbsp;</li>
                    <li style="color: lightgrey; float:left;">03 주문완료</li>
                </ul>
            </div>
        </div>
    


        <!-- 라인 -->
        <hr style="border:solid 1px lightgray;">





    <div id="basketTableContainer">
        

   <form action="orderResult" id="orderResult" method="post">      
      <!--    <form name="form_order"> -->
      <table class="list_view">
         <tbody id="tableBody" align=center>
            <tr>
            <tr align=center class="fixed" style="background-color:#8FA691; color: white; height: 30px;">

               <!-- itemImg1 from t_item -->
               <td class="fixed">아이템img</td>
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


            <c:set var="totalPay" value="${0}" />
            <c:set var="totalSum" value="${0}" />
            <c:set var="totalDiscount" value="${0}" />

           
            <c:forEach var="basketL" items="${list}">
            
            

               <c:set var="totalPay"
                  value="${totalPay + (basketL.price * basketL.itemNum)}" />
               <c:set var="totalSum"
                  value="${totalSum + (basketL.normPrice * basketL.itemNum)}" />
               <tr cellpadding=40 align=center>
                  <c:set var="totalDiscount"
                     value="${totalDiscount + ((basketL.normPrice - basketL.price) * basketL.itemNum)}" />
               <tr cellpadding=40 align=center style="border-bottom: 2px solid #F0F2F0 ;">
               
                  <td><img id="basketItemImg" src="/resources/upload/<c:out value="${basketL.sellerId}"/>/<c:out value="${basketL.itemImg1}"/>"></td>
                  <td><c:out value="${basketL.itemName}"></c:out></td>
                  <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${basketL.normPrice}" /></td>
                  <td><c:out value="${basketL.itemNum}"></c:out></td>
                  <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${basketL.normPrice - basketL.price}" /></td>
                  <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${basketL.price * basketL.itemNum}" /></td>
               </tr>
               
               
               
            <!-- 가져다 쓰기 위한 hidden input 태그들  -->
            <input type="hidden" id="itemName" value="${basketL.itemName}">
            <input type="hidden" id="itemSpc" value="<c:out value='${fn:length(list)}'></c:out>">
               
               
            </c:forEach>

         </tbody>
      </table>

      <input type="hidden" value="${memberInfo.idNo}" name="idNo" id="idNo">

<!--
      <table width=40%>
         <tbody>
            <td class="fixed join" style="text-align: left; width:200px;">배송비</td>
            <td class="fixed join"  style="text-align: left; width:200px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="2500" />원</td>
         </tbody>
      </table>
      <table width=50% >
         <tbody>
            <td class="fixed join" style="text-align: left; width:200px;">최종 결제금액</td>
            <td class="fixed join"  style="text-align:left; width:200px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPay+2500}" />원</td>
         </tbody>
      </table>
-->
      
      <div style="width:100%; height: 100px; text-align:right; font-size:16px; color: #404040; padding-right:15px; ">
      	<div style="width:300px; float:right;">
      			<div style="height:50px; line-height:50px;">
      				<p style="float:left; margin:0; font-size:14px; ">배송비</p>
      				<p style="float:right; margin:0; font-size:14px; "><fmt:formatNumber type="number" maxFractionDigits="3" value="2500" />원</p>
      			</div>
      			<div style="height:50px;  line-height:50px;">
      				<p style="float:left; margin:0; font-weight:bold;">최종 결제금액</p>
      				<p style="float:right; margin:0; font-weight:bold;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPay+2500}" />원</p>
      			</div>
      	</div>
      </div>
      
      
      
      
      <!-- 가져다 쓰기 위한 hidden input 태그들  -->
      <input type="hidden" name="totalPay" id="totalPay" value="${totalPay}"> 
      <input type="hidden" name="totalSum" id="totalSum" value="${totalSum}"> 
      <input type="hidden" name="totalDiscount" id="totalDiscount" value="${totalDiscount}">
      
    
    </div> 
    <!-- end of div basketTableContainer -->




   <div id="cAndP">

      <div id="customerInfo">
         

         <h3 style="font-weight: bold;">주문자 정보</h3>
         
         <!-- 라인 -->
        <hr style="border:solid 1px lightgray;">
         
         <table style="margin-left:30px;">
            <tbody>
               <tr class="dot_line">
                  <td>이&nbsp;&nbsp;&nbsp;름</td>
                  <td><input type="text" class="memberInfo" id="memName" name="memName"
                     value="${memberInfo.memName}" size="40"  /></td>
               </tr>

               <tr class="dot_line">
                  <td class="fixed_join">연락처</td>
                  <td><input type="text" class="memberInfo" id="contact" name="contact"
                     value="${memberInfo.contact}" size="40"  />
               </tr>

               <tr class="dot_line">
                  <td>이메일</td>
                  <td><input type="text" id="email" value="${memberInfo.emailAccount}"
                     size="40"  /></td>
               </tr>
            </tbody>
         </table>
         <input type="hidden" class="memberInfo" id="memAddr" value="${memberInfo.memAddr }">
         <input type="hidden" class="memberZipCode" id="memZipCode" value="${memberInfo.postCode }">
         
         
          <!-- 라인 -->
        <hr style="border:solid 0.5px rgb(238,238,238);">
         
      </div><!-- end of customerInfo div -->
   


   <!-- 비회원 상태일때만 보이는 div 시작 -->
   <c:if test="${empty sessionMember}">
       <div id="nonMemPwd">
            
   
            <h3 style="font-weight: bold;">주문 비밀번호</h3>
            
            <!-- 라인 -->
           <hr style="border:solid 1px lightgray;">
            
            <table style="margin-left:30px;">
               <tbody>
                  <tr class="dot_line">
                     <td>비밀번호</td>
                     <td><input type="password" class="nonMemPwdInput" id="pwd" name="nonMemPw"  value="" size="40" placeholder="6~12자 영문+숫자" /></td>
                  </tr>
                  <tr class="dot_line">
                     <td>비밀번호 재입력</td>
                     <td><input type="password" class="nonMemPwdInput" id="pwdChk" name="nonMemPw"  value="" size="40" placeholder="6~12자 영문+숫자"  /></td>
                  </tr>
   
               </tbody>
            </table>
             <!-- 라인 -->
           <hr style="border:solid 0.5px rgb(238,238,238);">
            
         </div><!-- end of nonMemPwd div -->
      </c:if>
   <!-- 비회원 상태일때만 보이는 div 끝 -->
      
      
   </div>
   



   <!-- 비회원 상태일때만 보이는 div 시작 -->
   <c:if test="${empty sessionMember}">
      <input type="hidden" id="isMember" value="N">
   </c:if>
   <!-- 비회원 상태일때만 보이는 div 끝 -->

   <!-- 로그인 상태일때만 보이는 div 시작 -->
   <c:if test="${!empty sessionMember}">
      <input type="hidden" id="isMember" value="Y">
   </c:if>
   <!-- 로그인 상태일때만 보이는 div 끝 -->




   <div id="deliveryInfo">
   


      
      
      <h3 style="font-weight: bold;">배송지 정보</h3>
      
      <!-- 로그인 상태일때만 보이는 div 시작 -->
      <c:if test="${!empty sessionMember}">
         <div style="margin-left: 80%; width: 50%;">
            <input type="checkbox" id="sameAsMem"> 회원정보와 동일&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="checkbox" id="recentDelivery"> 최근배송지
         </div>
      </c:if>
      <!-- 로그인 상태일때만 보이는 div 끝 -->
      
      
      
         <input type="hidden" class="recentDeliveryInfo" id="recentReceiver" value = "${recentDelivery.receiver}">
         <input type="hidden" class="recentDeliveryInfo" id="recentReceivContact" value = "${recentDelivery.receivContact}">
         <input type="hidden" class="recentDeliveryInfo" id="recentReceivAddr" value="${recentDelivery.receivAddr}">
         <input type="hidden" class="recentDeliveryInfo" id="recentReceivZipcode" value="${recentDelivery.postCode}">
      
       <!-- 라인 -->
        <hr style="border:solid 1px lightgray;">
      
      <div class="detail_table">

         <table>
            <tbody>

               <tr class="dot_line">
                  <td class="fixed_join">수령인</td>
                  <td><input id="receiver" name="receiver" type="text" size="40" value="" />
               </tr>




               <tr class="dot_line">
                  <td class="fixed_join">연락처</td>
                  <td><input id="receivContact" name="receivContact" type = "text" size = "40" value="" /></td>

               </tr>

               <tr class="dot_line">
                  <td class="fixed_join">주&nbsp;&nbsp;&nbsp;소</td>
                  
                  <td>
                  
                  
                  <div style="padding-bottom: 10px; display:block;">
                      우 편 번 호 : <input type="text" id="zipcode" name="zipcode" size="5" value="" readonly="readonly"> 
                  <a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
                  
                  </div>
                  
                        도로명 주소: <input type="text" id="roadAddress" name="roadAddress" size="50" value="" /><br> <br> 
                        나머지 주소: <input type="text" id="receivAddr" name="receivAddr" size="50" value="" />
                        <input type="hidden" id="jibunAddress" name="jibunAddress" size="50" value="" /><br> <br> 
                     </td>
               </tr>
               <tr class="dot_line">
                  <td class="fixed_join">배송 메시지</td>
                  <td><input id="reqNote" name="reqNote" type="text" size="50"
                     placeholder="택배 기사님께 전달할 메시지를 남겨주세요." /></td>
               </tr>
               </tboby>
         </table>
     <!-- 라인 -->
        <hr style="border:solid 0.5px rgb(238,238,238);">
      </div>
   </div>




         <button type="submit" id="submitBtn" >카카오페이로 결제하기</button>
   </form>

   <input type='hidden' id='selectedBasketList' value='<c:out value="${list}" />' >
   <input type='hidden' id='controllerIdNo' value='<c:out value="${controllerIdNo}" />' >
   
   
    </div>
    <!-- end of containerOFAll -->



   <!-- 여백용 div -->
   <div id="emptyDiv">
   
   
   </div>




<!-- 작동 잘 안되는 것 같아서 일단 주석처리 해버렸음 (채련) -->
<!-- <script src="../../../resources/jquery/orderItemsForm.js"></script> -->



<script>


var basketIDArr = [];

var orderCode = "";


var totalPay = document.getElementById("totalPay");
var totalSum = document.getElementById("totalSum");
var totalDiscount = document.getElementById("totalDiscount");
var idNo = document.getElementById("idNo");
var isMember = document.getElementById("isMember");
var controllerIdNo = document.getElementById("controllerIdNo");


   
   var sameAsMem = $("#sameAsMem");
   var recentDelivery = $("#recentDelivery");
   var orderResult = $("#orderResult");

   var memName = $("#memName");
   var contact = $("#contact");
   var email = $("#email");
   var memAddr = $("#memAddr");
   var memZipCode = $("#memZipCode");
   
   var addrs = [];
   addrs = memAddr.val().split("/");
   
   var receiver = $("#receiver");
   var receivContact = $("#receivContact");
   var zipcode = $("#zipcode");
   var roadAddress = $("#roadAddress");
   var receivAddr = $("#receivAddr");
   var reqNote = $("#reqNote");
   
   
   var recentReceiver = $("#recentReceiver");
   var recentReceivContact = $("#recentReceivContact");
   var recentReceivAddr = $("#recentReceivAddr");
   var recentReceivZipcode = $("#recentReceivZipcode");
   
   var raddrs = [];
   raddrs = recentReceivAddr.val().split("/");

   var pwd = $("#pwd");
   var pwdChk = $("#pwdChk");

   


function paymentComplete() {
   
   
   
   // 만약 비회원이면 t_member, m_customer 에 먼저 회원정보 넣어준다 + 첫주문이어야함 (안그럼 pk중복됨) - 첫주문 자동으로 걸러짐. 재주문이면 idNo.value 가 g 로 시작
   if(idNo.value.substring(0,1)=="") {
      guestInsert();
      
   }else if(idNo.value.substring(0,1)=="u"){
     socialMemUpdate(); 
   }
   
   
   var selectedBasketList = document.getElementById("selectedBasketList");
   
   selectedBasketList = selectedBasketList.value;
   
   console.log("selectedBasketList : " + selectedBasketList);
   // [BasketVO(baskId=baskId218, itemNum=1, idNo=c0002, itemCode=abcd0013, itemName=빠삐용 시금치, itemImg1=babbi.jpg, price=1300, normPrice=1500), BasketVO(baskId=baskId219, itemNum=1, idNo=c0002, itemCode=abcd0013, itemName=빠삐용 시금치, itemImg1=babbi.jpg, price=1300, normPrice=1500)]
   // 이런 문자열로 들어온다
   
   var baskIdArr = [];
   
   var bArr = selectedBasketList.split("baskId=");
   
   for(var i=1; i<bArr.length; i++) {
      
      // 이제 i는 1일때부터 첫 문장은 다 baskId 임 
      console.log(bArr[i]);
      cArr = bArr[i].split(",");
      baskIdArr.push(cArr[0]);
   }
   
   // 이제 baskIdArr 에는 ["baskId217", "baskId218", "baskId219"] 이렇게 배열로 담김! 
   console.log(baskIdArr);
   
   // t_order 테이블에 주문내용 insert 한다 
   orderTableInsert()
   
   // t_order 테이블에 insert 성공했으면 
   .then(function(){
      
      for(var i=0; i<baskIdArr.length; i++) {
         
         console.log(baskIdArr[i]);
         
         // t_order_info, t_order_history 테이블에 baskId 별로 insert 한다 
         orderInfoTableInsert(baskIdArr[i]);
         // t_delivery 테이블 insert (배송코드 null 인 상태로)
         deliveryTableInsert(baskIdArr[i]);
      }
      
   // t_order_info, t_order_history, t_delivery 테이블에 insert 성공했으면    
   }).then(function(){
      
      // t_payment 테이블에 insert 
      paymentTableInsert();
      
   }).then(function(){
      
      setTimeout(function(){
         
         for(var i=0; i<baskIdArr.length; i++) {
            
            // 주문한 제품은 t_basket 테이블에서 delete 
            deletefromBasket(baskIdArr[i]);
         }
         
      }, 2000);
      
      
   }).then(function(){
      
      setTimeout(function(){
   
      // orderResult 페이지로 넘어가기 
      location.href = "/order/orderResult" + "?orderCode=" + orderCode;
      
      }, 3000);
   })
   
   
}





function socialMemUpdate() {
   
   var socialData = {
      memName : memName.val(),
      contact : contact.val(),
      emailAccount : email.val(),
      idNo : idNo.value   
   }
   
   
    return $.ajax({
         url: "/order/socialMemUpdate",
         type: "POST",
         data: JSON.stringify(socialData),
         contentType: "application/json",
         error : function(){console.log("socialMemUpdate 통신실패")},
          success : function(){console.log("socialMemUpdate 통신성공")}
      }); 
   
   
}





function guestInsert() {
   
   var guestData = {
         memName : memName.val(),
         contact : contact.val(),
         emailAccount : email.val(),
         idNo : controllerIdNo.value,
         memCode : "GUEST"
   }
   
   return $.ajax({
      url: "/order/gusetInsert",
      type: "POST",
      data: JSON.stringify(guestData),
      contentType: "application/json",
      error : function(){console.log("guestInsert 통신실패")},
       success : function(){console.log("guestInsert 통신성공")}
   }); 
   
}



   
// t_delivery 테이블에 insert 하는 function 시작
function deliveryTableInsert(baskId) {
   
   var deliveryData = {
            receiver: receiver.val(),
            receivAddr: roadAddress.val() + "/" + receivAddr.val(),
            receivContact: contact.val(),
            reqNote: reqNote.val(),
            postCode: zipcode.val(),
            orderCode: orderCode,
            baskId: baskId,
            
   }
   
   return $.ajax({
      url: "/order/deliveryTableInsert",
      type: "POST",
      data: JSON.stringify(deliveryData),
      contentType: "application/json",
      error : function(){console.log("deliveryTableInsert 통신실패")},
       success : function(){console.log("deliveryTableInsert 통신성공")}
   }); 
   
   
   
   
}
// t_delivery 테이블에 insert 하는 function 끝 




// t_payment 테이블에 insert 하는 function 시작
function paymentTableInsert() {
   
   var paymentData = {
      orderCode : orderCode,
      jujuName : "주주마켓",
      jujuContact : "02-222-2222",
      jujuAddr : "종로 비트캠프 A2",
      jujuCeo : "주정은",
      subTotal : totalPay.value,
      tax : totalPay.value*10/11, 
      vat : totalPay.value/11,
      totalPay : totalPay.value,
      card : totalPay.value,
      
      // 테스트 결제라서 일단 데이터 박아두겠음 
      cardCompany: "(주)카카오페이",
      cardNum : "1111-1111-1111-1111",
      approvalNum : "12345678",
      monthlyPay: "일시불"
         
   }
   
   
   return $.ajax({
      url: "/order/paymentTableInsert",
      type: "POST",
      data: JSON.stringify(paymentData),
      contentType: "application/json",
      error : function(){console.log("paymentTableInsert 통신실패")},
       success : function(){console.log("paymentTableInsert 통신성공")}
   }); 
   
   
   
}
// t_payment 테이블에 insert 하는 function 끝 


// t_order_info, t_order_history 테이블에 insert 하는 function 시작
function orderInfoTableInsert(baskId) {
   
   console.log("orderInfoTableInsert에서 baskId 잘 받아지냐 " + baskId);
   
   var orderInfoData = {
      baskId : baskId,
      orderCode : orderCode
   }
   
   return $.ajax({
      url: "/order/orderInfoInsert",
      type: "POST",
      data: JSON.stringify(orderInfoData),
      contentType: "application/json",
      error : function(){console.log("orderInfoTableInsert 통신실패")},
       success : function(){console.log("orderInfoTableInsert 통신성공")}
   }); 
   
}
// t_order_info, t_order_history 테이블에 insert 하는 function 끝 




// t_order 테이블에 insert 하는 function 시작
function orderTableInsert() {
   
   // orderCode 만들기 작업 (현재 날짜, 시간 timestamp 찍기)
   
   var date = new Date();
   
   var year = new String(date.getFullYear());
   var month = new String(date.getMonth()+1); //1월이 0으로 되어서 1 더해줌
   var day = new String(date.getDate());
   var hour = new String(date.getHours());
   var minute = new String(date.getMinutes());
   var second = new String(date.getSeconds());
   
   // 년도 두 자리수로 자르기 
   year = year.substring(2);
   
   // 월이 한자리수일 경우 두 자리수로 만들어 주기
   if(month.length == 1) {
      month = "0" + month;
   }
   
   // 날짜가 한자리수일 경우 두 자리수로 만들어 주기
   if(day.length == 1) {
      day = "0" + day;
   }
   
   // 시간이 한자리수일 경우 두 자리수로 만들어 주기
   if(hour.length == 1) {
      hour = "0" + hour;
   }

   // 분이 한자리수일 경우 두 자리수로 만들어 주기
   if(minute.length == 1) {
      minute = "0" + minute;
   }

   // 초가 한자리수일 경우 두 자리수로 만들어 주기
   if(second.length == 1) {
      second = "0" + second;
   }
   
   
   orderCode = year + "" + month + "" + day + "" + hour + "" + minute + "" + second;
   
   console.log("orderCode: "+orderCode);
   console.log("isMember.value: "+isMember.value);
   
   
   // 비회원이라서 idNo가 "" 일 경우 컨트롤러에서 받은 아이디로 세팅해준다
   if(idNo.value=="") {
      idNo.value = controllerIdNo.value;
   }
   
   var nonMemPwd = "";
   
   if(pwd.val()==undefined) {
      nonMemPwd = "";
   }else {
      nonMemPwd = pwd.val();
   }
   
   
   var orderData = {
      orderCode: orderCode,
      totalPay: totalPay.value,
      totalSum: totalSum.value,
      totalDiscount: totalDiscount.value,
      receivAddr: roadAddress.val() + "/" + receivAddr.val(),
      deliCharge : 2500,
      isMember: isMember.value,
      idNo : idNo.value,
      nonMemPwd : nonMemPwd
   };
   
   
   return $.ajax({
      url: "/order/orderInsert",
      type: "POST",
      data: JSON.stringify(orderData),
      contentType: "application/json",
      error : function(){console.log("orderTableInsert 통신실패")},
       success : function(){console.log("orderTableInsert 통신성공")}
      
   });
   
   
}
//t_order 테이블에 insert 하는 function 끝




/* 장바구니 에서 ajax 로 지우기 funciton 시작 */
function deletefromBasket(baskId) {
   
   return $.ajax({
      url: "/product/remove",
      type: "delete",
      data: baskId,
      error : function(){console.log("통신실패")},
      success : function(){console.log("통신성공")}
      
      });
   
}
/* 장바구니 에서 ajax 로 지우기 funciton 끝 */




/* 장바구니 ajax 로 불러오기 시작 (하나씩)*/
function getOneBasket(baskId) {
   
   return $.ajax({
      url: "/order/getSelectedBasket",
       type: "GET",
       data: { "baskId":baskId},
       dataType: "text",
       error : function(){console.log("통신실패")},
       success : function(){console.log("통신성공")}
      
   });
   
   
}
/* 장바구니 ajax 로 불러오기 끝 (하나씩)*/



//3자리 단위마다 콤마 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
   




//주소 다음카카오 API에서 받아오기
function execDaumPostcode() {
   new daum.Postcode({
      oncomplete : function(data) {

         var fullRoadAddr = data.roadAddress;
         var extraRoadAddr = '';

         if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraRoadAddr += data.bname;
         }
         if (data.buildingName !== '' && data.apartment === 'Y') {
            extraRoadAddr += (extraRoadAddr !== '' ? ', '
                  + data.buildingName : data.buildingName);
         }
         if (extraRoadAddr !== '') {
            extraRoadAddr = ' (' + extraRoadAddr + ')';
         }
         if (fullRoadAddr !== '') {
            fullRoadAddr += extraRoadAddr;
         }

         document.getElementById('zipcode').value = data.zonecode;
   
         document.getElementById('roadAddress').value = fullRoadAddr;
         document.getElementById('jibunAddress').value = data.jibunAddress;

      }
   }).open()

};

window.onload = function() {
   init();
};

function init() {
   
   //회원정보에 저장된 배송지정보 check
   sameAsMem.change(function() {       
      
      if (sameAsMem.is(":checked")) {
         receiver.val(memName.val());
         receivContact.val(contact.val());
         roadAddress.val(addrs[0]); // 도로명 주소
         receivAddr.val(addrs[1]); // 상세 주소
         zipcode.val(memZipCode.val());
         recentDelivery.prop("checked", false);
      } else {
         receiver.val("");
         receivContact.val("");
         roadAddress.val(""); // 도로명 주소
         receivAddr.val(""); // 상세 주소 
         zipcode.val("");
      }

   });
   //최근배송지정보 check
   recentDelivery.change(function(){
      
      
      if (recentDelivery.is(":checked")) {
         
         if(recentReceiver.val()=="") {
            alert("최근 주문 내역이 없습니다.");
            recentDelivery.prop('checked',false);
            return;
         }
         
         
         receiver.val(recentReceiver.val());
         receivContact.val(recentReceivContact.val());
         roadAddress.val(raddrs[0]); // 도로명 주소
         receivAddr.val(raddrs[1]); // 상세 주소
         zipcode.val(recentReceivZipcode.val());
         sameAsMem.prop("checked", false);
      } else {
         receiver.val("");
         receivContact.val("");
         roadAddress.val(""); // 도로명 주소
         receivAddr.val(""); // 상세 주소
         zipcode.val("");
      }
      
      
   });
   

   //결제하기 버튼. 모든 유효성 check를 통과해야 넘어감 
   var submitBtn = $("#submitBtn");

   submitBtn.click(function(e) {
      e.preventDefault();

      if (!(ordererCheck())) {
         return false;
      }else if (!(ordererContactCheck())) {
         return false;
      }else if (!(ordererEmailCheck())) {
         return false;
      }else if (!(receiverCheck())) {
         return false;
      } else if (!(receivContactCheck())) {
         return false;
      } else if (!(receivAddrCheck())) {
         return false;
      } else if (!(reqNoteCheck())) {
         return false;
     
        // 비회원 주문일때만 진행
      } else if (idNo.value=="") {
         if(!(pwdCheck())){
              return false;
           }else if(!(pwdChk.val()===pwd.val())){
              alert("비밀번호가 일치하지 않습니다.");
              pwdChk.focus();
              return false;
           }else {
           // 유효성 테스트 다 통과했으면 결제 서비스 시작
               paymentSystem();
           }
      } else {
         // 유효성 테스트 다 통과했으면 결제 서비스 시작
         paymentSystem();
         
      }

   });
   
   
   
   
   // [주문자 정보 - 이름] 유효성 check
   function ordererCheck(){
      var pattern_num = /[0-9]/; // 숫자
      var pattern_eng = /[a-zA-Z]/; // 영어
      var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
      var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글

      if (memName.val().trim() == "" || memName.val() == null) {
         alert("[주문자 이름]을 입력하시오.")
         memName.focus();
         return false;
      } else if (memName.val().length > 10) {
         alert("[주문자 이름]10자까지만 입력할 수 있습니다. ")
         memName.focus();
         return false;
      } else if ((pattern_num.test(memName.val()))
            || (pattern_spc.test(memName.val()))) {
         alert("[주문자 이름]숫자나 특수문자를 입력할 수 없습니다.")
         memName.focus();
         return false;
      } else {
         return true;
      }
   };
   
   
   // [주문자 정보 - 연락처] 유효성 check
   function ordererContactCheck(){
      //휴대폰번호 정규식
      var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

      if (contact.val().trim() == "" || contact.val() == null) {
         alert("[주문자 연락처]를 입력하시오.")
         contact.focus();
         return false;
      } else if (contact.val().length > 13) {
         alert("[주문자 연락처]13자까지만 입력할 수 있습니다.")
         contact.focus();
         return false;
         // 수령인 연락처 입력값 유효성 check
      } else if (!regExp.test(contact.val())) {
         alert("[주문자 연락처]숫자,- 만 입력할 수 있습니다.");
         contact.focus();
         return false
      } else {
         return true;
      }
   };
   
   // [주문자 정보 - 이메일] 유효성 check
   function ordererEmailCheck(){
      let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      
      if (email.val().trim() == "" || email.val() == null) {
         alert("이메일 주소를 입력해주세요.");
         email.focus();
         return false;
      } else if (email.val().length > 30) {
         alert("30자까지만 입력할 수 있습니다.")
         email.focus();
         return false;
      } else if (!regExp.test(email.val())) {
         alert("이메일을 양식에 맞게 다시 입력하세요.");
         email.focus();
         return false
      } else {
         return true;
      }
   };
   
   
   
   
   // [주문 비밀번호] 입력값 유효성 check
   function pwdCheck() {
      
      let regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
      
      if (pwd.val().trim() == "" || pwd.val() == null) {
         alert("비밀번호를 입력해주세요.");
         pwd.focus();
         return false;
      } else if (pwd.val().length > 30) {
         alert("30자까지만 입력할 수 있습니다.")
         pwd.focus();
         return false;
      } else if (!regExp.test(pwd.val())) {
         alert("패스워드는 6~12자 사이의 문자+숫자 조합으로 입력해주세요.");
         pwd.focus();
         return false
      } else {
         return true;
      }
      
      
   };
   
   
   
   
   
   
   
   

   // [배송지 정보 - 수령인](receiver) 입력값 유효성 check
   function receiverCheck() {

      var pattern_num = /[0-9]/; // 숫자
      var pattern_eng = /[a-zA-Z]/; // 영어
      var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
      var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글

      if (receiver.val().trim() == "" || receiver.val() == null) {
         alert("[수령인]을 입력하시오.")
         receiver.focus();
         return false;
      } else if (receiver.val().length > 10) {
         alert("[수령인]10자까지만 입력할 수 있습니다. ")
         receiver.focus();
         return false;
      } else if ((pattern_num.test(receiver.val()))
            || (pattern_spc.test(receiver.val()))) {
         alert("[수령인]숫자나 특수문자를 입력할 수 없습니다.")
         receiver.focus();
         return false;
      } else {
         return true;
      }
   };

   // [배송지 정보 -연락처](receivContact)유효성 check
   function receivContactCheck() {
      //휴대폰번호 정규식
      var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

      if (receivContact.val().trim() == "" || receivContact.val() == null) {
         alert("[수령인 연락처]를 입력하시오.")
         receivContact.focus();
         return false;
      } else if (receivContact.val().length > 13) {
         alert("[수령인 연락처]13자까지만 입력할 수 있습니다.")
         receivContact.focus();
         return false;
         // 수령인 연락처 입력값 유효성 check
      } else if (!regExp.test(receivContact.val())) {
         alert("[수령인 연락처]숫자,- 만 입력할 수 있습니다.");
         receivContact.focus();
         return false
      } else {
         return true;
      }
   };

   
   //[배송지 정보 - 주소](receivAddr)유효성check
   function receivAddrCheck() {
      if (zipcode.val().trim() == "" || zipcode.val() == null) {
         alert("[우편번호]를 입력해주세요.");
         zipcode.focus();
         return false;
      } else if (receivAddr.val().trim() == "" || receivAddr.val() == null) {
         alert("[나머지주소]를 입력해주세요.");
         receivAddr.focus();
         return false;
      } else if (roadAddress.val().trim() == "" || roadAddress.val() == null) {
         alert("[도로명주소]를 입력해주세요.");
         roadAddress.focus();
         return false;
      } else if (receivAddr.val().length > 40) {
         alert("[배송지]40자까지만 입력할 수 있습니다.");
         receivAddr.focus();
         return false;
      } else {
         return true;
      }
   };
   
   //[배송지 정보 - 배송메시지] 유효성 check
   function reqNoteCheck() {

       if (reqNote.val().length > 30) {
         alert("[배송메시지]30자까지만 입력할 수 있습니다.");
         reqNote.focus();
         return false;
      } else {
         return true;
      }

   };
   
   

}













</script>


   <%@include file="../includes/footer.jsp" %>


</body>

</html>