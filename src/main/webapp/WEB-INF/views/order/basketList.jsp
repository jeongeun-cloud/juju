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




        .button {
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

        .button:hover {
        background-color: white; 
        color: #ffc30b; 
        border: 2px solid #ffc30b;
        }

        .button {
        background-color: #ffc30b;
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


       

        ul {
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
            right:0px;

        }


        #currentProcess {
            color: #303030;
        }

       


       


        #countBox{

            position:relative;

            border:3px solid;
            border-color:lightgray;
            
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
            background-color: #303030;
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
            width: 200px;
            margin: 5px;
        }


        #dltBtn {
           
            width: 80px;
            height: 30px;
            margin-left:800px;
            background-color: #303030;
            color: white;
            border:none;
            border-radius:10%;
            
            float:left;
        }

        
        
        
        #thumbnailImg {
        
        	width: 80px;
        
        }



		#chkAllBox {
			
			margin-top: 58px;
			width: 200px;
			float: left;
			margin-left: -80px;
		
		}
		
		#dltBtnDiv {
			margin-top: 50px;
			width: 200px;
			
			float:left;
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
                    <li style="color: lightgrey; float:left;">  >  </li>
                    <li style="color: lightgrey; float:left;">02 주문서 작성/결제</li> 
                    <li style="color: lightgrey; float:left;">  >  </li>
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
                
                    <th colspan="5" id="tableTitle" style="text-align: center">장바구니 내역</th>
                </tr>
            </thead>
            <tbody  id="tableBody">
            

                
                <!-- ajax 로 장바구니 리스트 그리는 영역 -->
                


            </tbody>

            </table>
            
            </div>
            
            <div  id='chkAllBox'>
            <!-- 전체 체크하는 박스 -->
            <input type='checkbox' id="chkAll" checked="checked" onclick="checkAll()"> 전체 선택
            </div>


			<div id="dltBtnDiv">
            <!-- 선택 삭제 버튼 -->
            <button id="dltBtn">선택 삭제</button>
			</div>	
            
            
            
        </div>

        
        <div id="countBox">
            <!-- 계산 부분 -->

            
            

            <div class="countBoxDiv">

                <br>
                <br>

                <h5>총 주문금액</h5>
                                
                <h3 id="tPrice">0</h3>
            </div>

            <div class="countBoxDiv" id="mathSymbol">
            <br>
                <h2>-</h2>
            </div>

            <div class="countBoxDiv">
                
                <br>
                <br>

                <h5 id="dcPrice">할인금액</h5>
                                
                <h3>0</h3>
            </div>

            <div class="countBoxDiv" id="mathSymbol">
            <br>
                <h2>+</h2>
            </div>

            <div class="countBoxDiv">
                
                <br>
                <br>

                <h5>배송비</h5>
                                
                <h3 id="deliPrice">2500</h3>
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

            <button class="button chooseNorder">선택 상품 주문</button>
            <button class="button allOrder">전체 상품 주문</button>

        </div>



    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
<script>



var chkBoxes = document.getElementsByName("chkBox");

var totalPrice = 0;



/*  브라우저가 열리자마자 하는 basket DB 관련 작업 시작 */
$(document).ready(
         
		 // 1. 장바구니 DB에 있는 물건 리스트를 불러온다 
          getBasketList()
         
         .then(function(response){ 
            
           console.log("getBasketList 결과는?");
            console.log(response);  
         	// 2. 새로 그린다 
        	draw(response);
            }) 
            
      
);
/* 브라우저가 열리자마자 하는 basket DB 관련 작업 끝 */




/* 브라우저가 열리자마자 count box 에 체크된 것만 계산하기 시작하는 function 시작 */
window.onload = function() {
	
	//alert("window onload 와 j쿼리 같이 쓸 수 있다 가능함! ");
	
	for(var i=0; i<chkBoxes.length; i++) {


        var price = chkBoxes[i].value * 1;
        totalPrice += price;

    }

    
    document.getElementById("tPrice").innerHTML = totalPrice;
	
	
}
/* 브라우저가 열리자마자 count box 에 체크된 것만 계산하기 시작하는 function 끝 */






// 체크박스 누를 때마다 발생하는 이벤트 function 시작
function chkEvent(e) {


    //alert(e.checked)

    price = e.value;

    // String 을 int 로 바꾸기 
    price *= 1;
    totalPrice *= 1;

    // 체크박스가 체크되어 있으면 
    if(e.checked == true) {

        // 총합계에 금액을 합친다 
        totalPrice += price;

        // 총합계를 나타낸다. 
        document.getElementById("tPrice").innerHTML = totalPrice;

    
    // 체크박스가 체크되어 있지 않으면 
    } else {

        // 총합계에서 금액을 뺀다 
        totalPrice -= price;

        // 총합계를 나타낸다. 
        document.getElementById("tPrice").innerHTML = totalPrice;

    }

}
// 체크박스 누를 때마다 발생하는 이벤트 function 끝








/* 전체선택 체크박스 구현 function 시작 */
function checkAll() {
	
	// 전체선택이 체크되어있으면
	if($("#chkAll").prop("checked")){
		
		for(var i=0; i<chkBoxes.length; i++) {
			// 모든 체크박스를 다 선택 
			chkBoxes[i].checked="checked";
			
			chkEvent(chkBoxes[i]);
		};
		
		// 전체선택이 체크되어 있지 않으면
	}else {
		for(var i=0; i<chkBoxes.length; i++) {
			// 모든 체크박스를 다 해제 
			chkBoxes[i].checked="";
			
			
			chkEvent(chkBoxes[i]);
		};
	}
}
/* 전체선택 체크박스 구현 function 끝 */






/* 장바구니 리스트 ajax 로 불러오기 시작 */
function getBasketList() {
   
   return $.ajax({
      url: "/product/basket",
      type: "GET",
      dataType: "JSON",
      error : function(){console.log("통신실패")},
      success : function(){console.log("통신성공")}
      
      });
   
}
/* 장바구니 리스트 ajax 로 불러오기 끝 */

 
 

// html 구조 안에다가 장바구니 내용 넣기 function 시작
function draw(jsonData) { 
   
	var $tableBody = $("#tableBody");
	
	$tableBody.empty();
	
	console.log("그리기 전 결과 확인: " + jsonData);
	
	for(var i=0; i<jsonData.length; i++) {
		
		$tableBody.append("<tr id='tableBody'><td><input type='checkbox' name='chkBox' id='chkBox' checked='checked' value=\""+jsonData[i].price*jsonData[i].itemNum+"\" onclick='chkEvent(this)'></td><td><img id='thumbnailImg' src=\""+jsonData[i].itemImg1+"\"></td><td>"+jsonData[i].itemName+"<br>"+jsonData[i].price+"원</td><td>"+jsonData[i].itemNum+"개</td><td>"+jsonData[i].price*jsonData[i].itemNum+"원</td></tr>");
		
	}
	
   
}
//html 구조 안에다가 장바구니 내용 넣기 function 끝

 







</script>    
    
    
    
    
    


</body>
</html>