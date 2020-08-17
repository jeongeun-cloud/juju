<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>


<style>


        
        
         /* 장바구니 css 시작 */      
        .basketContainer {
            position: fixed;
            top: 0px;
            font-size: 15px;   
            z-index: 999;
        }

        #basketNav {
            right: -23%;
        }

        .basketNavBar {
            position : fixed;
            width: 23%;
            height : 100%;
            /* 메뉴바 전체 배경색 */
            /* background-color: rgb(0,158,219); */
            background-color : #F2F2F2;
            
            color: white;

            border-style:solid;
            border-color: lightgray;

            text-align: center;
            align-items: center;
            transition : 0.800s ease;
            z-index: 1;
        }

        .basket-toggle-collapse {
            float: left;
            margin-left: -3.685em;
            margin-top: 17em;
            content: "";
            outline: inherit;
            border: 0px;
            background: transparent;
        }

        .basket-toggle-icon,
        .basket-toggle-icon::before,
        .basket-toggle-icon::after{
            content:"";
            position: fixed;
            background-color: transparent;
            border-radius: 2em;
            border: 0px solid transparent ; 
           
        }

        
       .basketList {
           margin-left: 0px;
           width:100%;
           height: 65%;
           background-color: white;
           color: grey;
           text-align: left;
           border: 3px;
           font-size: 1em;
           
           /* 여기서 스크롤 생김(양 초과했을 때) */
           overflow: auto;
           
           padding-left: 0px;
       }
       
       
       .basketItemImg {
          
          width: 60px;
          height: 77.1px;
          float: left;
          
          border : 3px;
          margin-top: 25px;
          margin-left : 10px;
       
       }
       
       .basketItemDescribe {
       
      /*  text-align: left;
       border: 3px; */
       
       }
       
       
       #basketImg {
       
       width: 100px;
       height: 100px;
       float: left;
       margin: 3px;
       margin-bottom:0px;
       
       
       }
       
       #basketContent {
       
       width: 160px;
       height: 100px;
       float: left;
       margin: 3px;
       margin-bottom:0px;
       display: table;
       
       
       }
       
       #basketContent h5 {
       vertical-align: middle;
       display: table-cell;
       padding-top: 15px;
       line-height: 20px;
       }
       
       
       #basketUnit {
       width: 100%;
       height: 110px;
       }
       
       
       #dltBtn {
       
       width: 30px;
       border: none;
       background-color: transparent;
       float: right;
       
       margin-top: 45px;
       
       margin-left: 30px;
       
       
       }
       
       #dltBtnImg{
       
       width: 20px;
       height: 20px;
       
       }
       
       
       #goBasketBtn {
       	width: 100%;
       	height: 60px;
       	border: none;
       	
		font-size: 15px;     
		line-height: 60px;  	
       	background-color: #637365;

	
       
       }
       
       #basketTitle {
       background-color: #637365;
       	height: 60px;
       line-height: 60px;
       }
       
       #basketCountBox {
       color: #404040;
       font-weight: bold;
       line-height: 20px;
       text-align: left;
       height: 20%;
       background-color: #F2F2F2;
       }
       
       #basketCountInnerBox{
       
       width: 90%;
       height: 80%;
       padding-top: 20px;
       padding-left: 20px;
       
       }
       
       #goBasketBtnBox {
       width: 23%;
       height: 50px;
       position: fixed;
       bottom: 10px;
       content-align: center;
       }
       
       
       .basketCntPdiv {
       
       
       }
       
       #hrDiv{
       
       width: 100%;
       height: 1px;
       background-color: rgb(217,217,217);
       margin-bottom: 20px;
       }
       
       #emptyBasketImgDiv {
       	width: 50%;
       	margin-top: 40%;
       	margin-left: 25%;
       }
       
       #emptyBasketImg {
       	width: 100%;
       }
    
       /* 장바구니 css 끝 */  

     


</style>

</head>
<body>




<!-- 장바구니 사이드메뉴바 body 시작 -->
<div class="basketContainer">
    <nav class="basketNavBar" id="basketNav">

        <button type="button" onclick="basketClicked(this)" class="basket-toggle-collapse" > 
            <span class="basket-toggle-icon"> </span>
            <img src="/resources/images/basket.png"/>
        </button>   


		<div id="basketTitle">
        	장바구니
		</div>

        <ul class="basketList" id="basketList">
        <!-- 장바구니 리스트 영역 시작 -->
         
          
        <!-- 장바구니 리스트 영역 끝 -->
        </ul>
        
        
        
        <div id="basketCountBox">
        
        	<div id="basketCountInnerBox">
        	
        	
        	<div class="basketCntPdiv">
        	<p style="display: inline-block;">총 주문금액</p>
        	<p id="basketOrderTotal" style="display: inline-block; float: right;">0원</p>
        	</div>
        	<div>
        	<p style="display: inline-block;">배송비</p>
        	<p id="basketDeli" style="display: inline-block; float: right;">0원</p>
        	</div>
        	
        	<div id="hrDiv">
        	</div>
        	
        	<div>
        	<p style="display: inline-block;">결제금액</p>
        	<p id="basketTotal" style="display: inline-block; float: right;">0원</p>
        	</div>
        
        	</div>
        </div>
        
        <div id="goBasketBtnBox">
        <button id="goBasketBtn" onclick="location.href='/order/basketList'">장바구니 가기</button>
        </div>


    </nav>
</div>
<!-- 장바구니 사이드메뉴바 body 끝 -->



<!-- 세션에 저장된 id 불러오기용 div 시작 -->
<div>

<input type="hidden" id="hiddenId" value="${sessionMember.idNo}">

</div>
<!-- 세션에 저장된 id 불러오기용 div 끝-->


<script>




var id = document.getElementById("hiddenId").value;



   // 브라우저 열리자마자 장바구니 리스트 가져오기 시작
   $(document).ready(
         
             getBasketList()
            
            .then(function(response){ 
               
              console.log("getBasketList 결과는?");
               console.log(response);  
               console.log("draw 실행");
               draw(response); // 가져온 결과를 화면에 다시 그리기 
               
               }) 
         
   );
   // 브라우저 열리자마자 장바구니 리스트 가져오기 끝
         
         

   // 장바구니 한도
   var basketMax = 30;


   
   


   // 장바구니 담기 onclick 이벤트 시작
   function addToBasketEvent(itemCode) {
      
         
      // 1. 장바구니에 담긴 물건 리스트를 불러온다 
      getBasketList()
      .then(function(response){
         
         //1-1. 장바구니에 담긴 물건이 max 초과이면 
         if(response.length>basketMax){
            //1-1-1. 담을 수 없음을 알림 
            alert("장바구니에 담을 수 있는 상품은 "+basketMax+"개 이하입니다.");
            
         //1-2. 장바구니에 담긴 물건이 max 넘지 않으면    
         }else{
            //1-2-1. 장바구니에 담는 일련의 과정 실행 
            insert2Basket(itemCode);
         }
      
   })

   }
   //장바구니 담기 onclick 이벤트 끝


   
   

   // 장바구니에 담는 일련의 과정 function 시작
    function insert2Basket(itemCode) {
      
      var id = document.getElementById("hiddenId").value;
      
      var $num = $("#input-view");
      
      var data = {
            itemNum : $("#input-view").val(),
            idNo : id,
            itemCode : itemCode
      };
      
      insertData(data) // 해당 페이지 상품을 db 에 넣기 
      
      .then(function(response){
         
        console.log("insertData 결과는?");
         console.log(response)
         console.log("getBasketList 실행");
         return getBasketList();}) // 장바구니 리스트를 DB에서 ajax 로 가져오기 
      
      .then(function(response){ 
         
        console.log("getBasketList 결과는?");
         console.log(response);  
         console.log("draw 실행");
         draw(response); // 가져온 결과를 화면에 다시 그리기 
         
         }) 
      
      .then(function(){
         moveBasket(); }) // 장바구니 슬라이드 자동으로 열고 닫게 하기 
      
   }
   //장바구니에 담는 일련의 과정 function 끝
    
    
    
    
    
    
   //해당 페이지 상품을 db 에 넣기  function 시작
   function insertData(data) {
      
      console.log("insertData 실행");

      return $.ajax({
         url: "/product/basket",
         type: "POST",
         data: JSON.stringify(data),
         contentType: "application/json"
      });
   }
   //해당 페이지 상품을 db 에 넣기  function 끝
    
    
    

   /* 장바구니 리스트 ajax 로 불러오기 시작 */
   function getBasketList() {
      
       var id = document.getElementById("hiddenId").value;
       
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
   function draw(jsonData) { // JSONdata 에 xml 형태의 JSON이 들어온다 왜? 
      
      var $basketList = $("#basketList");
      
      $basketList.empty();
      
      console.log("결과 : " + jsonData)
      
      if(jsonData.length==1) {
    	  $basketList.append("<div id='emptyBasketImgDiv'><img id='emptyBasketImg' src='/resources/images/emptyBasketNew.png'></div>");
      }
      
      
      for(var i=0; i<jsonData.length-1; i++) {

         $basketList.append("<div id='basketUnit'><div id='basketImg'><img src='/resources/upload/"+jsonData[i].sellerId+"/"+jsonData[i].itemImg1+"' style= \"width:60px; height:77.1px; border: 3px; float:left; margin-left: 20px; margin-top:20px; margin-bottom:0px; \" /></div><div id='basketContent'><h5><b>"+jsonData[i].itemName+"</b><br>"+addCommas(jsonData[i].price)+"원 / "+jsonData[i].itemNum+"개<br></h5><button id='dltBtn' value=\""+jsonData[i].baskId+"\" onclick='dltEvent(this.value)'><img id='dltBtnImg' src='/resources/images/deleteBasketBtn.png'></button></div></div>");
         
	
      }
      
      $("#basketList").append("<div id='endOfBasket'>end of basket</div>");
      $("#endOfBasket").css("background-color","white");
      $("#endOfBasket").css("color","white");
      $("#endOfBasket").css("display","block");
      $("#endOfBasket").css("width","240px");
      $("#endOfBasket").css("height","50px");
      $("#endOfBasket").css("float","left");
      
      $("#basketList").css("text-align","left");
      $("#basketList").css("font-size","13px");
      $("#basketList").css("font-weight","bold");
      
      
      // 장바구니 리스트를 다 그리고 나면 장바구니 금액 합계를 세팅한다. 
      getBasketTotal(jsonData[0].idNo)
      	.then(function(response){
      		console.log(response)
	      	setBasketTotal(response);
      	});
      
      
   }
   //html 구조 안에다가 장바구니 내용 넣기 function 끝

   
   
   
   function setBasketTotal(basketTotal){
	   document.getElementById("basketOrderTotal").innerHTML = addCommas(basketTotal) + "원";
	   document.getElementById("basketDeli").innerHTML = addCommas(2500) + "원";
	   document.getElementById("basketTotal").innerHTML = addCommas(basketTotal*1 + 2500) + "원";
   }
   
    

   // 장바구니 총금액 계산하는 function 시작
   function getBasketTotal(id) {
       
	      return $.ajax({
	         url: "/basket/getBasketTotal",
	         type: "GET",
	         data: {"id":id},
	         dataType: "text",
	         error : function(){console.log("getBasketTotal 통신실패")},
	         success : function(){console.log("getBasketTotal 통신성공")}
	         });
	      
   }
   // 장바구니 총금액 계산하는 function 끝
   
   


   /* 장바구니 슬라이드 열렸다 닫히는 기능 시작 */
   function moveBasket() {
    
         /* basket 가 열렸다 닫혔다 하는 부분 시작 */
          var elem = document.getElementById("basketNav"),
          Style = window.getComputedStyle(elem),
          right = Style.getPropertyValue("right");
         
           /* 장바구니 슬라이드 스크롤 맨 아래로 내리기*/
          location.href="#endOfBasket";

           /* 장바구니를 펼쳤다가 */
          elem.style.right = "0%";
           
           /* 1초 후에 장바구니를 닫아라 */
          setTimeout(function(){elem.style.right = "-23%";},1000);
          /* basket 가 열렸다 닫혔다 하는 부분 끝 */
         
   }
   /* 장바구니 슬라이드 열렸다 닫히는 기능 끝 */


   
   
   
// 장바구니 삭제 function 시작
function dltEvent(baskId) {
   
         // DB에서 지운다 
         deletefromBasket(baskId);
         
         getBasketList()
         
         .then(function(response){
               
               console.log("getBasketList 결과는?")
               console.log(response);
               draw(response);
               
            })

   
}
// 장바구니 삭제 function 끝 
   
   
   
   

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

   


/* 장바구니 누르면 펼쳐졌다 닫혔다 하는 기능 시작 */

   function basketClicked(e) {
          e.classList.toggle("show");
          var elem = document.getElementById("basketNav"),
          Style = window.getComputedStyle(elem),
          right = Style.getPropertyValue("right");

          /* 장바구니가 열려있으면 */
          if(right === "0px") {
              /* 장바구니를 닫고 */
              elem.style.right = "-23%";

           /* 그게 아니면 */
          }else {
              /* 장바구니를 펼쳐라 */
              elem.style.right = "0%";
          }
      }
   /* 장바구니 누르면 펼쳐졌다 닫혔다 하는 기능 끝 */


   
    //3자리 단위마다 콤마 생성
    function addCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
   
   
   
   
   
   

</script>












</body>
</html>