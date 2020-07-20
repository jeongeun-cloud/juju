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



<<<<<<< HEAD
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
    
    
   
    
    

/* 원본 css 끝 */
    
=======
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
        
        
       
        
        

/* 원본 css 끝 */
        
>>>>>>> branch 'develop' of https://github.com/jeongeun-cloud/juju.git

</style>



</head>
<body>




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

            <c:forEach var="order" items="${orderList}">

               <c:set var="totalPay"
                  value="${totalPay + (order.price * order.itemNum)}" />
               <c:set var="totalSum"
                  value="${totalSum + (order.normPrice * order.itemNum)}" />
               <tr cellpadding=40 align=center>
                  <c:set var="totalDiscount"
                     value="${totalDiscount + ((order.normPrice - order.price) * order.itemNum)}" />
               <tr cellpadding=40 align=center>
                  <td><c:out value="${order.itemImg1}"></c:out></td>
                  <td><c:out value="${order.itemName}"></c:out></td>
                  <td><c:out value="${order.normPrice}"></c:out></td>
                  <td><c:out value="${order.itemNum}"></c:out></td>
                  <td><c:out value="${order.normPrice - order.price}"></c:out></td>
                  <td><c:out value="${order.price * order.itemNum}"></c:out></td>
               </tr>
            </c:forEach>
<<<<<<< HEAD
=======


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
>>>>>>> branch 'develop' of https://github.com/jeongeun-cloud/juju.git


<<<<<<< HEAD
         </tbody>
      </table>

      <input type="hidden" value="${memberInfo.idNo}" name="idNo">
=======
>>>>>>> branch 'develop' of https://github.com/jeongeun-cloud/juju.git


<<<<<<< HEAD
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
=======
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
>>>>>>> branch 'develop' of https://github.com/jeongeun-cloud/juju.git


<<<<<<< HEAD
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






     <div id="paymentDiv">


      <div class="clear"></div>
      <h3 style="font-weight: bold;">결제금액 확인 및 결제방법 선택</h3>
      
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
=======




	  <div id="paymentDiv">


      <div class="clear"></div>
      <h3 style="font-weight: bold;">결제금액 확인 및 결제방법 선택</h3>
      
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
>>>>>>> branch 'develop' of https://github.com/jeongeun-cloud/juju.git




         <button type="submit" id="submitBtn">결제하기</button>
   </form>


   







    </div>
    <!-- end of containerOFAll -->

<script src="../../../resources/jquery/orderItemsForm.js"></script>
</body>

</html>