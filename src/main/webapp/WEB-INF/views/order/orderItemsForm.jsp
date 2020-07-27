<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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





    #containerOFAll {
        width:1300px;
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
    padding-right: 60px;
    
    }
    
    
 



    #submitBtn {
    background-color: #ffc30b; 
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
    color: #ffc30b; 
    border: 2px solid #ffc30b;
    }

    #submitBtn {
    background-color: #ffc30b;
    color: white;
    
    }
    .submitBtn:focus { 
        outline: none; 
    }


    

   

    ul {
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
        right:0px;

    }


    #currentProcess {
        color: #303030;
    }

   
 

    #basketTableContainer{
        width:1100px;
        margin:auto;
        padding: 30px;
    }


    .list_view {
        
        width:1100px;
    }

    #tableTitle {
        background-color: lightgray;
        height: 50px;
    }

    #tableBody {
        height: 120px;
    }

    #thumbnailImg {
        width: 200px;
    }



    #customerInfo {
    
    width: 45%;
    text-align: left;
    margin-top: 30px;
    margin-bottom: 60px;
    
    
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
    
    	width: 200px;
    
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
                    <li style="color: lightgrey; float:left;">  >  </li>
                    <li style="float:left;" id = "currentProcess">02 주문서 작성/결제</li> 
                    <li style="color: lightgrey; float:left;">  >  </li>
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
         <tbody align=center>
            <tr>
            <tr align=center class="fixed">

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
               <tr cellpadding=40 align=center>
               
                  <td><img id="basketItemImg" src="<c:out value="${basketL.itemImg1}"/>"></td>
                  <td><c:out value="${basketL.itemName}"></c:out></td>
                  <td><c:out value="${basketL.normPrice}"></c:out></td>
                  <td><c:out value="${basketL.itemNum}"></c:out></td>
                  <td><c:out value="${basketL.normPrice - basketL.price}"></c:out></td>
                  <td><c:out value="${basketL.price * basketL.itemNum}"></c:out></td>
               </tr>
            </c:forEach>

         </tbody>
      </table>

      <input type="hidden" value="${memberInfo.idNo}" name="idNo">


      <div class="clear"></div>
      <br> <br>
      
      <!-- 라인 -->
        <hr style="border:solid 1px lightgray; margin-left:-12.5%; width:125%;">

      <div class="clear"></div>
      <br>
      
      
      <table width=80% class="list_view">
         <tbody>
            <td class="fixed join">최종 결제금액</td>
            <td class="fixed join">${totalPay}</td>

         </tbody>
      </table>
      <input type="hidden" name="totalPay" value="${totalPay}"> 
      <input type="hidden" name="totalSum" value="${totalSum}"> 
      <input type="hidden" name="totalDiscount" value="${totalDiscount}">


    </div> 
    <!-- end of div basketTableContainer -->




      <div id="customerInfo">
         

         <h3 style="font-weight: bold;">주문자 정보</h3>
         
         <!-- 라인 -->
        <hr style="border:solid 1px lightgray;">
         
         <table style="margin-left:30px;">
            <tbody>
               <tr class="dot_line">
                  <td>이&nbsp;&nbsp;&nbsp;름</td>
                  <td><input type="text" class="memberInfo" id="memName" name="memName"
                     value="${memberInfo.memName}" size="40" readonly="readonly" /></td>
               </tr>

               <tr class="dot_line">
                  <td class="fixed_join">연락처</td>
                  <td><input type="text" class="memberInfo" id="contact" name="contact"
                     value="${memberInfo.contact}" size="40" readonly="readonly" />
               </tr>

               <tr class="dot_line">
                  <td>이메일</td>
                  <td><input type="text" value="${memberInfo.emailAccount}"
                     size="40"  readonly="readonly" /></td>
               </tr>
            </tbody>
         </table>
         <input type="hidden" class="memberInfo" id="memAddr" value="${memberInfo.memAddr }">
         
         
          <!-- 라인 -->
        <hr style="border:solid 0.5px rgb(238,238,238);">
         
      </div>




   <div id="deliveryInfo">
   


      
      
      <h3 style="font-weight: bold;">배송지 정보</h3>
      
      
      <div style="margin-left: 80%; width: 50%;">
      <input type="checkbox" id="sameAsMem"> 회원정보와 동일&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="checkbox" id="recentDelivery"> 최근배송지
      
      </div>
      
      
      
         <input type="hidden" class="recentDeliveryInfo" id="recentReceiver" value = "${recentDelivery.receiver}">
         <input type="hidden" class="recentDeliveryInfo" id="recentReceivContact" value = "${recentDelivery.receivContact}">
         <input type="hidden" class="recentDeliveryInfo" id="recentReceivAddr" value="${recentDelivery.receivAddr}">
      
      
      
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
                  <input type="text" id="zipcode" name="zipcode" size="5" value="" readonly="readonly"> 
                  <a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
                  
                  </div>
                  
                        지번 주소: <input type="text" id="jibunAddress" name="jibunAddress"
                           size="50" value="" /><br> <br> 도로명 주소: <input
                           type="text" id="roadAddress" name="roadAddress" size="50"
                           value="" /><br> <br> 나머지 주소: <input type="text"
                           id="receivAddr" name="receivAddr" size="50" value="" />
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




<%-- 

     <div id="paymentDiv">


      <div class="clear"></div>
      <h3 style="font-weight: bold;">결제방법 선택</h3>
      
      <!-- 라인 -->
        <hr style="border:solid 1px lightgray;">
      
      
      <div class="detail_table">
         <table>

         </table>
      </div>
      <div class="clear"></div>
      
      
      <!-- 라인 -->
        <hr style="border:solid 0.5px rgb(238,238,238);">
      <center></center>
         <br> <br>
     
     
     </div>

 --%>


         <button type="submit" id="submitBtn" >카카오페이로 결제하기</button>
   </form>

   <input type='hidden' id='selectedBasketList' value='<c:out value="${list}" />' >
   
    </div>
    <!-- end of containerOFAll -->



	<!-- 여백용 div -->
	<div id="emptyDiv">
	
	
	</div>



<!-- 작동 잘 안되는 것 같아서 일단 주석처리 해버렸음 (채련) -->
<!-- <script src="../../../resources/jquery/orderItemsForm.js"></script> -->



<script>


var basketIDArr = [];

/* 그냥 baskId 잘 받아져 오는지 크롬 콘솔에서 확인하는 테스트용 onload 임(지워도 됨) 시작 */
window.onload = function() {
	/* 
	var selectedBasketList = document.getElementById("selectedBasketList").value;
	
	// 왜 selectedBasketList.length 가 22 지  = 왜냐면 문자가 하나하나 들어오기 때문인듯 : [baskId105, baskId107] 이런 식으로 
	
	
	console.log(selectedBasketList);
	
	var end = selectedBasketList.length; 
	
	console.log(end);
	
	// 맨 앞이랑 맨 뒤에 있는 [ ] 이거 제거해주기 
	selectedBasketList = selectedBasketList.substring(1,selectedBasketList.length-1);
	
	// 이제 baskId105, baskId107 이렇게 나온다 
	console.log(selectedBasketList);
	
	basketIDArr = selectedBasketList.split(", ");
	
	for(var i=0; i<basketIDArr.length; i++) {
		
		console.log("잘나오나"+basketIDArr[i]); // 분리되서 잘 나온다 
		
		
	}
	 */
	
	
}
/* 그냥 baskId 잘 받아져 오는지 크롬 콘솔에서 확인하는 테스트용 onload 임(지워도 됨) 끝 */





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

	var sameAsMem = $("#sameAsMem");
	var recentDelivery = $("#recentDelivery");
	var orderResult = $("#orderResult");

	var memName = $("#memName");
	var contact = $("#contact");
	var memAddr = $("#memAddr");
	
	var receiver = $("#receiver");
	var receivContact = $("#receivContact");
	var receivAddr = $("#receivAddr");
	var reqNote = $("#reqNote");
	
	var recentReceiver = $("#recentReceiver");
	var recentReceivContact = $("#recentReceivContact");
	var recentReceivAddr = $("#recentReceivAddr");

	//회원정보에 저장된 배송지정보 check
	sameAsMem.change(function() {       
		
		console.log("작동되나 이거");
		
		if (sameAsMem.is(":checked")) {
			receiver.val(memName.val());
			receivContact.val(contact.val());
			receivAddr.val(memAddr.val());
			recentDelivery.prop("checked", false);
		} else {
			receiver.val("");
			receivContact.val("");
			receivAddr.val("");
		}

	});
	//최근배송지정보 check
	recentDelivery.change(function(){
		
		if (recentDelivery.is(":checked")) {
			receiver.val(recentReceiver.val());
			receivContact.val(recentReceivContact.val());
			receivAddr.val(recentReceivAddr.val());
			sameAsMem.prop("checked", false);
		} else {
			receiver.val("");
			receivContact.val("");
			receivAddr.val("");
		}
		
		
	});
	

	//결제하기 버튼. [수령인], [수령인-연락처], [배송지], [배송메시지] 유효성 check를 통과해야 넘어감 
	var submitBtn = $("#submitBtn");

	submitBtn.click(function(e) {
		e.preventDefault();

		if (!(receiverCheck())) {
			return false;
		} else if (!(receivContactCheck())) {
			return false;
		} else if (!(receivAddrCheck())) {
			return false;
		} else if (!(reqNoteCheck())) {
			return false;
		} else {
			// 유효성 테스트 다 통과했으면 결제 서비스 시작
			paymentSystem();
			
		}

	});
	
	

	// [수령인](receiver) 입력값 유효성 check
	function receiverCheck() {

		var pattern_num = /[0-9]/; // 숫자
		var pattern_eng = /[a-zA-Z]/; // 영어
		var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글

		if (receiver.val().trim() == "" || receiver.val() == null) {
			alert("[수령인]값을 입력하시오.")
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

	// [수령인-연락처](receivContact)유효성 check
	function receivContactCheck() {
		//휴대폰번호 정규식
		var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

		if (receivContact.val().trim() == "" || receivContact.val() == null) {
			alert("[배송지-연락처]값을 입력하시오.")
			receivContact.focus();
			return false;
		} else if (receivContact.val().length > 13) {
			alert("[배송지-연락처]13자까지만 입력할 수 있습니다.")
			receivContact.focus();
			return false;
			// 수령인 연락처 입력값 유효성 check
		} else if (!regExp.test(receivContact.val())) {
			alert("[배송지-연락처]숫자,- 만 입력할 수 있습니다.");
			receivContact.focus();
			return false
		} else {
			return true;
		}
	};

	
	//[배송지](receivAddr)유효성check
	function receivAddrCheck() {

		if (receivAddr.val().trim() == "" || receivAddr.val() == null) {
			alert("[배송지]값을 입력해주세요.");
			receivAddr.focus();
			return false;
		} else if (receivAddr.val().length > 40) {
			alert("[배송지]40자까지만 입력할 수 있습니다.");
			receivAddr.focus();
			return false;
		} else {
			return true;
		}
	};
	
	//[배송메시지] 유효성 check
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





</body>

</html>