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
        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
               
               
               
        
      
         /* 장바구니 css 시작 */      
        .basketContainer {
            position: fixed;
            top: 0px;
            
            z-index: 999;
            
            /* 반응 없음 */
            /* overflow: scroll; */
            /* overflow: auto; */
        }

        #basketNav {
            right: -20%;
        }

        .basketNavBar {
            position : fixed;
            width: 20%;
            height : 100%;
            /* 메뉴바 전체 배경색 */
            background-color: rgb(0,158,219);
            
            color: white;

            border-style:solid;
            border-color: lightgray;

            text-align: center;
            align-items: center;
            transition : 0.800s ease;
            z-index: 1;
            
            /* 반응 없음 */
            /* overflow: auto; */
            
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
           margin-top: 50px;
           width:100%;
           height: 60%;
           background-color: white;
           color: grey;
           text-align: left;
           border: 3px;
           font-size: 1em;
           
           /* 여기서 스크롤 생김(양 초과했을 때) */
           overflow: auto;
       }
       
       
       .basketItemImg {
          
          width: 100px;
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
       
       width: 120px;
       height: 100px;
       float: left;
       margin: 3px;
       
       
       
       }
       
       #basketContent {
       
       width: 120px;
       height: 100px;
       float: left;
       margin: 3px;
       
       
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

        <br>장바구니

        <ul class="basketList" id="basketList">
        
           
           
        
        
        </ul>


    </nav>
</div>
<!-- 장바구니 사이드메뉴바 body 끝 -->





<script>
 

window.onload = function() {

   //alert("페이지 시작할 때 뜨는 알람");

   /* alert("페이지 시작할 때 뜨는 알람"); */

   
   console.log("getBasketList 실행");
   getBasketList()
   
   .then(function(response){
      console.log("getBasketList 결과는?");
       console.log(response);  
      draw(response);
      
   })
   
}

 
 
/* 장바구니 리스트 ajax 로 불러오기 시작 */
function getBasketList() {
   
   return $.ajax({
      url: "/product/cart",
      type: "GET",
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
   
   for(var i=0; i<jsonData.length; i++) {
      
      
      
   
      $basketList.append("<div id='basketImg'><img src=\""+jsonData[i].itemImg1+"\" style= \"width:100px; border: 3px; float:left; margin-left: 10px; margin-top:10px; margin-bottom:30px; \" /></div>");
      
      $basketList.append("<div id='basketContent'><h5>"+jsonData[i].itemName+"<br>"+jsonData[i].price+"원<br>"+jsonData[i].itemNum+"개<br>"+jsonData[i].baskId+"<br></h5></div>");
      
      /* 
      $basketList.append("<img src=\""+jsonData[i].itemImg1+"\" style= \"width:100px; border: 3px; float:left; margin-left: 10px; margin-top:10px; margin-bottom:30px; \" />");
      
      $basketList.append("<h5>");
      
      $basketList.append(jsonData[i].itemName+"<br>");
      $basketList.append(jsonData[i].price+"원<br>");
      $basketList.append(jsonData[i].itemNum+"개<br>");
      $basketList.append(jsonData[i].baskId+"<br>");
      
      $basketList.append("</h5>");   
      $basketList.append("<br>");
      
       */

   }
   
   $("#basketList").append("<div id='endOfCart'>end of cart</div>");
   $("#endOfCart").css("background-color","white");
   $("#endOfCart").css("color","white");
   $("#endOfCart").css("display","block");
   $("#endOfCart").css("width","240px");
   $("#endOfCart").css("height","50px");
   $("#endOfCart").css("float","left");

   
   $("#basketList").css("text-align","left");
   $("#basketList").css("font-size","13px");
   $("#basketList").css("font-weight","bold");
   
   
   
   /* 
   $("#aaa").css("width","120px");
   $("#aaa").css("height","100px");
   $("#aaa").css("display","block");
   $("#aaa").css("margin","3px");
   $("#aaa").css("padding","3px");
   $("#aaa").css("border","3px");
   
   $("#bbb").css("width","120px");
   $("#bbb").css("height","100px");
   $("#bbb").css("float","left");
   $("#bbb").css("margin","3px");
    */
}
//html 구조 안에다가 장바구니 내용 넣기 function 끝

 
 



 

/* 장바구니 누르면 펼쳐졌다 닫혔다 하는 기능 시작 */

function basketClicked(e) {
       e.classList.toggle("show");
       var elem = document.getElementById("basketNav"),
       Style = window.getComputedStyle(elem),
       right = Style.getPropertyValue("right");

       /* 장바구니가 열려있으면 */
       if(right === "0px") {
           /* 장바구니를 닫고 */
           elem.style.right = "-20%";

        /* 그게 아니면 */
       }else {
           /* 장바구니를 펼쳐라 */
           elem.style.right = "0%";
       }
   }
/* 장바구니 누르면 펼쳐졌다 닫혔다 하는 기능 끝 */

    
    
</script>
</body>
</html>