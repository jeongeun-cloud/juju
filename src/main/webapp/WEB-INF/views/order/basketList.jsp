<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Basket List</title>

    <style>
    
    #tableBody{
    
     border-bottom: 2px solid #F0F2F0 ;
    
    }
    


        #containerOFAll {
            width:80%;
            height:100%;
            margin:0 auto;

            color: #303030;
            text-align:center;
        }



        h5 {
            color:grey;
        }




        .button {
        background-color: #8FA691; 
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

        .button:hover {
        background-color: white; 
        color: #8FA691; 
        border: 2px solid #8FA691;
        }

        .button {
        background-color: #8FA691;
        color: white;
            
        }
        .button:focus { 
            outline: none; 
        }


        #orderBtns {

        width: 70%;
        margin: auto;
        padding:30px;


        }


       

        #containerOFAll ul {
            list-style:none;
            font-weight: bold;
            color: lightgray;
        }

        /* li {
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

       


       


        #countBox{

            position:relative;

            border:4px solid;
            border-color:#F0F2F0;
            
            width : 1000px;
            height : 200px;

            margin: auto;
            margin-top: 100px;
            
        }


        .countBoxDiv {

            float:left;

            width: 140px;
            height: 200px;
        }


        #mathSymbol {
            font-size:40px;
            color:lightgray;
        }


        #basketTableContainer{
            width:1100px;
            margin:auto;
            padding: 30px;
        }


        #basketTable {
            
            width:1100px;
            margin: auto;
            
        }

        #tableTitle {
            background-color: #8FA691;
            color: white;
            height: 50px;
            margin: auto;
            
        }

        #tableHead {
            /* margin-bottom: 5px; */
        } 


        #tableBody {
            height: 120px;
            
            
        }

        #thumbnailImg {
            width: 80px;
            margin: 5px;
        }


        #dltBtn {
           
            width: 80px;
            height: 30px;
            margin-left:800px;
            background-color: #8FA691;
            color: white;
            border:none;
            border-radius:10%;
            
            float:right;
        }
        
        #dltBtn:hover {
        background-color: white; 
        color: #8FA691; 
        border: 2px solid #8FA691;
        }



      #chkAllBox {
         
         margin-top: 58px;
         width: 200px;
         float: left;
         margin-left: -80px;
         color: writh;
         
      
      }
      
      #dltBtnDiv {
         margin-top: 50px;
         width: 200px;
         
         float:right;
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

                    <li style="float:left;"  id = "currentProcess">01 장바구니</li> 
                    <li style="color: lightgrey; float:left;">&nbsp;>&nbsp;</li>
                    <li style="color: lightgrey; float:left;">02 주문서 작성/결제</li> 
                    <li style="color: lightgrey; float:left;">&nbsp;>&nbsp;</li>
                    <li style="color: lightgrey; float:left;">03 주문완료</li>
    
                </ul>


            </div>
            
            
        
        </div>
    
        <!-- 라인 -->
        <hr style="border:solid 1px lightgray;">

        <div id="basketTableContainer" >
            <!-- 장바구니 내역 -->
            
            
            <div id="basketList">

            <table id="basketTable" style="margin:-30px" >
            <thead id="tableHead">
                <tr>
                
                    <th colspan="6" id="tableTitle" style="text-align: center">장바구니 내역</th>
                </tr>
            </thead>
            <tbody  id="tableBody">
            

                
                <!-- ajax 로 장바구니 리스트 그리는 영역 -->
                


            </tbody>

            </table>
            
            </div>
            
            <div  id='chkAllBox'>
            <!-- 전체 체크하는 박스 -->
            <input type='checkbox' id="chkAll" checked="checked" onclick="allchkEvt(this)"> 전체 선택
            </div>


         <div id="dltBtnDiv">
            <!-- 선택 삭제 버튼 -->
            <button id="dltBtn" onclick="chosenDlt()">선택 삭제</button>
         </div>   
            
            
            
        </div>

        
        <div id="countBox">
            <!-- 계산 부분 -->

            
            

            <div class="countBoxDiv">

                <br>
                <br>

                <h5>총 금액</h5>
                                
                <h3 id="tPrice">0</h3>
            </div>

            <div class="countBoxDiv" id="mathSymbol">
            <br>
                <h2>-</h2>
            </div>

            <div class="countBoxDiv">
                
                <br>
                <br>

                <h5 >할인금액</h5>
                                
                <h3 id="dcPrice">0</h3>
            </div>

            <div class="countBoxDiv" id="mathSymbol">
            <br>
                <h2>+</h2>
            </div>

            <div class="countBoxDiv">
                
                <br>
                <br>

                <h5>배송비</h5>
                                
                <h3 id="deliPrice">2,500</h3>
            </div>

            <div class="countBoxDiv" id="mathSymbol">
            <br>
                <h2>=</h2>
            </div>

            <div class="countBoxDiv">
                
                <br>
                <br>
                
                <h5>총 결제금액</h5>
                                
                <h3 id=realTotalPrice>0</h3>
            </div>


        </div>

        <div id="orderBtns">

            <button class="button chooseNorder" onclick="orderSelected()">선택 상품 주문</button>
            <button class="button allOrder" onclick="orderAll()">전체 상품 주문</button>

        </div>


      <form id="actionForm" action="/order/orderItemsForm" method="post">
      
         <input type="hidden" name="checkRow" id="checkRow" value="" >
         <input type="hidden" name="idNo" id="idNo" value="${sessionMember.idNo}" >
      
      </form>

    </div>
    
    
    
    

    
    
<script>

var chkBoxes = document.getElementsByName("chkBox");

var allChkBox = document.getElementById("chkAll");

// 총금액
var totalPrice = 0;

// 할인 금액
var dPrice = 0;


/*  브라우저가 열리자마자 하는 basket DB 관련 작업 시작 */
$(document).ready(
         
       // 1. 장바구니 DB에 있는 물건 리스트를 불러온다 
          getBasketList()
         
         .then(function(response){ 
            
           console.log("getBasketList 결과는?");
            console.log(response);  
            // 2. 새로 그린다 
           draw(response);
            
           // 3. 가격 계산
           priceInit();
           
            }) 
            
      
);
/* 브라우저가 열리자마자 하는 basket DB 관련 작업 끝 */








// 체크박스 구현하기  시작

// onload 될 때 
// 1. 체크박스, 전체선택 체크박스  default 를 checked 로 설정해서 몽땅 체크되어 있게한다 
// 2. 가격 default 는 모두 더한 계산 값으로 입력한다 


// 체크박스 하나가 클릭되었을 때 
// 1. 체크 안 되어 있으면 체크하고 + 계산한다, 그리고 모든 체크박스가 체크되어있는지 검사해서 모두 체크되어있으면 전체선택을 체크하게 한다(계산없이) 
// 2. 체크 되어있으면 체크를 해제하고 - 계산한다 , 그리고 전체선택 체크박스를 해제한다 


// 전체선택 체크박스가 클릭되었을 때 
// 1. 체크박스를 다 검사한다. (chkBoxes 배열로 받아온다)
// 2. 전체선택 체크박스가 체크되어 있지 않으면 체크로 바꾸고 개개인 체크박스가 false 일때만  이거 실행-- [체크 안 되어 있으면 체크하고 + 계산한다]
// 3. 전체선택 체크박스가 체크되어 있으면 체크를 해제하고 개개인 체크박스가 true 일때만 이거 실행 -- [체크 되어 있으면 체크를 해제하고 - 계산한다]






// 가격 계산하는 function 시작 
function priceInit() {
   
   var chkBoxes = document.getElementsByName("chkBox");
   
      //가격 default 는 모두 더한 계산 값으로 입력한다 
      for(var i=0; i<chkBoxes.length; i++) {
    	  
    	  
    	  if(chkBoxes[i].checked == true) {
    		  
	           var price = chkBoxes[i].value.split(",")[0] * 1;
	           var dc = chkBoxes[i].value.split(",")[1] * 1;
	           
	           totalPrice += price;
	           dPrice += dc;
    		  
    	  }


       }
      
      setTotalPrice(totalPrice);
      setdPrice(dPrice);
   
}
// 가격 계산하는 function 끝 




// 체크박스 개개인 클릭 이벤트 function 시작
// 체크박스 하나가 클릭되었을 때 
function onechkEvt(e) {
   
   // 1. 체크 되면
      if(e.checked == true ) {
         // +계산한다
         plus(e);
         
      //  모든 체크박스가 체크되어있는지 검사해서 모두 체크되어있으면 전체선택을 체크하게 한다(계산없이) 
         if(isAllCheck()) {
            allChkBox.checked = "checked";
         }
         
   // 2. 체크 해제되면
      } else {
         
         // -계산한다
         minus(e);
         
         // 전체선택 체크박스를 해제한다 
         allChkBox.checked = false;
         
      }
   
}
// 체크박스 개개인 클릭 이벤트 function 끝 



//   + 계산하는 function 시작 
function plus(e) {
   
   var pArr = e.value.split(",");
   
    // String 을 int 로 바꾸기 
    var price = pArr[0]*1;
    totalPrice *= 1;
    
    var dc = pArr[1]*1;
    dPrice *= 1;

    totalPrice += price;
    dPrice += dc;
    
    setTotalPrice(totalPrice);
    setdPrice(dPrice);
   
}
//   + 계산하는 function 끝 




// 체크를 해제하고 - 계산하는 function 시작
function minus(e) {
   
	var pArr = e.value.split(",");
	   
    // String 을 int 로 바꾸기 
    var price = pArr[0]*1;
    totalPrice *= 1;
    
    var dc = pArr[1]*1;
    dPrice *= 1;

    totalPrice -= price;
    dPrice -= dc;
    
    setTotalPrice(totalPrice);
    setdPrice(dPrice);
   
   
}
// 체크를 해제하고 - 계산하는 function 끝 



// 모두 체크되어 있는지 검사하는 function 시작
function isAllCheck() {
   
   var result = true;
   
   for(var i=0; i<chkBoxes.length; i++) {

      if(chkBoxes[i].checked == false) {
         
         result = false;
         
      }

    }
   
   return result;
}
//모두 체크되어 있는지 검사하는 function 끝 




// 가격 설정하는 function 시작 
function setTotalPrice(totalPrice) {
   
   //totalPrice*1
   document.getElementById("tPrice").innerHTML = addCommas(totalPrice*1);
   
   //totalPrice*1 + 2500
   document.getElementById("realTotalPrice").innerHTML = addCommas(totalPrice*1 -dPrice + 2500);
   
   
}
// 가격 설정하는 function 끝 


// 가격 설정하는 function 시작 
function setdPrice(dPrice) {
   
   //totalPrice*1
   document.getElementById("dcPrice").innerHTML = addCommas(dPrice*1);
   
   
}
// 가격 설정하는 function 끝 



// 전체선택 체크박스 클릭 이벤트 function 시작 
// 전체선택 체크박스가 클릭되었을 때 
function allchkEvt(e) {
   
   // 전체선택 체크박스가 해제되면 
   if(e.checked == false) {
      
      for(var i=0; i<chkBoxes.length; i++) {
         // 개개인 체크박스가 true 일때만
         if(chkBoxes[i].checked == true) {
            // 체크를 해제하고 - 계산한다
            chkBoxes[i].checked = false;
            minus(chkBoxes[i]);
         }

       }
      
   // 전체선택 체크박스가 체크되면
   }else {
      
      for(var i=0; i<chkBoxes.length; i++) {
               
               // 개개인 체크박스가 false 일때만
               if(chkBoxes[i].checked == false) {
                  // 체크하고 + 계산한다
                  chkBoxes[i].checked = true;
                  plus(chkBoxes[i]);
               }
      
             }
   }
   
}
// 전체선택 체크박스 클릭 이벤트 function 끝 



//체크박스 구현하기  끝






/* 장바구니 리스트 ajax 로 불러오기 시작 */
function getBasketList() {
   
   var id = document.getElementById("idNo").value;
   
   return $.ajax({
      url: "/product/basket",
      type: "GET",
      data: {"id":id},
      dataType: "JSON",
      error : function(){console.log("통신실패")},
      success : function(){console.log("통신성공")}
      
      });
   
}
/* 장바구니 리스트 ajax 로 불러오기 끝 */

 
 

// html 구조 안에다가 장바구니 내용 넣기 function 시작
function draw(jsonData) { 
   
   var $tableBody = $("#tableBody");
   var $countBox = $("#countBox");
   
   $tableBody.empty();
   
   console.log("그리기 전 결과 확인: " + jsonData);
   
   for(var i=0; i<jsonData.length-1 ; i++) {
	   
	   var pArr = [];
	   
	   pArr.push(jsonData[i].normPrice*jsonData[i].itemNum);
	   pArr.push(jsonData[i].disAmount*jsonData[i].itemNum);
	   
	   
      
      $tableBody.append("<tr id='tableBody'><td><input type='checkbox' name='chkBox' id=\""+jsonData[i].baskId+"\"  checked='checked' value=\""+pArr+"\" onclick='onechkEvt(this)'></td><td><img id='thumbnailImg' src='/resources/upload/"+jsonData[i].sellerId+"/"+jsonData[i].itemImg1+"'></td><td>"+jsonData[i].itemName+"<br>단가 "+addCommas(jsonData[i].normPrice)+"원<br>"+jsonData[i].itemNum+"개</td><td>"+addCommas(jsonData[i].normPrice*jsonData[i].itemNum)+"원</td><td>"+addCommas(jsonData[i].disAmount*jsonData[i].itemNum)+"원 할인</td><td>"+addCommas(jsonData[i].price*jsonData[i].itemNum)+"원</td></tr>");

   }
   
         // json 마지막에 비회원 id 담음
      $countBox.append("<div><input type='hidden' id='guestId' value=\""+jsonData[jsonData.length-1].idNo+"\"></div>");
   
}
//html 구조 안에다가 장바구니 내용 넣기 function 끝

 





// html 구조 안에다가 장바구니 내용 넣기 function 시작(체크 안되어 있는 채로 그리기-선택삭제용)
function unchkdraw(jsonData) { 
   
   var $tableBody = $("#tableBody");
   var $countBox = $("#countBox");
   
   $tableBody.empty();
   
   console.log("그리기 전 결과 확인: " + jsonData);
   
   for(var i=0; i<jsonData.length-1 ; i++) {
	   
	var pArr = [];
	   
	   pArr.push(jsonData[i].normPrice*jsonData[i].itemNum);
	   pArr.push(jsonData[i].disAmount*jsonData[i].itemNum);
      
	   $tableBody.append("<tr id='tableBody'><td><input type='checkbox' name='chkBox' id=\""+jsonData[i].baskId+"\"  value=\""+pArr+"\" onclick='onechkEvt(this)'></td><td><img id='thumbnailImg' src='/resources/upload/"+jsonData[i].sellerId+"/"+jsonData[i].itemImg1+"'></td><td>"+jsonData[i].itemName+"<br>"+addCommas(jsonData[i].normPrice)+"원</td><td>"+addCommas(jsonData[i].disAmount*jsonData[i].itemNum)+"원 할인</td><td>"+jsonData[i].itemNum+"개</td><td>"+addCommas(jsonData[i].price*jsonData[i].itemNum)+"원</td></tr>");
	      
   }
   
         // json 마지막에 비회원 id 담음
      $countBox.append("<div><input type='hidden' id='guestId' value=\""+jsonData[jsonData.length-1].idNo+"\"></div>");
   
}
//html 구조 안에다가 장바구니 내용 넣기 function 끝(체크 안되어 있는 채로 그리기-선택삭제용)

 









// 선택 삭제 function 시작
function chosenDlt() {
   
   for(var i=0; i<chkBoxes.length; i++) {
      // 선택된 체크박스만
      if(chkBoxes[i].checked == true) {
         // DB에서 지운다 
         deletefromBasket(chkBoxes[i].id);
         
         // DB에서 안 지워지고 getBasketList() 가 시작되는 거 방지
         setTimeout(function(){
        	 
	         getBasketList()
	         
	         .then(function(response){
	               
	               console.log("getBasketList 결과는?")
	               console.log(response);
	               // 체크 안되어 있는 채로 그리고 
	               unchkdraw(response);
	               
	               // 가격은 0으로 세팅
	               totalPrice = 0;
	               dPrice = 0;
	               
	               setdPrice(dPrice);
	               setTotalPrice(totalPrice);
	            })
        	 
         }, 100);
         
         
      }

    } 
   
}
// 선택 삭제 function 끝 



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






// 선택 상품 주문 onclick 이벤트 시작 
function orderSelected() {
   
   var idNo = document.getElementById("idNo").value;
   
   if(idNo=="") {
	   alert("비회원 주문으로 진행합니다");
   }
   
   
   guestChk();
   
   var checkRow = [];
   
   for(var i=0; i<chkBoxes.length; i++) {
      // 개개인 체크박스가 true 일때만 배열에 담는다 
      if(chkBoxes[i].checked == true) {
         
         checkRow.push(chkBoxes[i].id);
         
      }

    }
   
   //alert("배열 잘 나오냐"+checkRow.toString());
   
   // 선택한 상품이 없으면 선택해 달라는 alert 발생 
   if(checkRow.length == 0){
        alert("주문할 상품을 선택해주세요.");
        return false;
     }
   
   // POST 방식으로 선택된 baskId 를 넘긴다 
   var chkRow = document.getElementById("checkRow");
   chkRow.value = checkRow;

   //if(비회원이면){
      // 로그인페이지로 이동하는데 이동할 url, idNo, chkRow 데리고 간다   
   //}
   
   var actionForm = $("#actionForm");
   actionForm.submit();

}
// 선택 상품 주문 onclick 이벤트 끝







// 전체 상품 주문 onclick 이벤트 시작 
function orderAll() {
	
	var idNo = document.getElementById("idNo").value;
	
	 if(idNo=="") {
		   alert("비회원 주문으로 진행합니다");
	   }
   
   guestChk();
   
   var checkRow = [];
   
   // 모든 상품을 배열에 담는다 
   for(var i=0; i<chkBoxes.length; i++) {
      checkRow.push(chkBoxes[i].id);
    }
   
   // 장바구니에 상품이 없을때
   if(checkRow.length==0) {
      alert("장바구니가 비었습니다.");
       return false;
   }
   
   
   // POST 방식으로 선택된 baskId 를 넘긴다 
   var chkRow = document.getElementById("checkRow");

   chkRow.value = checkRow;
   var actionForm = $("#actionForm");
   actionForm.submit();

}
// 전체 상품 주문 onclick 이벤트 끝 



// idNo 비었으면 guest id 로 만들어주는 function 시작(비회원 주문용)
function guestChk() {
   
   var idNo = document.getElementById("idNo").value;
   var guestId = document.getElementById("guestId").value;
   
   if(idNo==null || idNo==""){
      document.getElementById("idNo").value = guestId;
   }
      
}
// idNo 비었으면 guest id 로 만들어주는 function 끝(비회원 주문용)




//3자리 단위마다 콤마 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
   






</script>    
    
    
    
    
    
   <%@include file="../includes/footer.jsp" %>

</body>
</html>