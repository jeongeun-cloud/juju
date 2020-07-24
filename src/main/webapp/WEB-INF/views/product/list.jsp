<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<style>

   .product_container{
   width:1300px;
   height:100%;
   margin: 0 auto;
   }


   .pull-right > ul li{
   list-stlye-type:none;
   display:inline;
   }
   
   .panel-body{
   position:relative;
   width:100%;
   height:100%;
  
   }
   .list_Sort{
        position: absolute;
        right: 20px;
        top:40px;
       
    } 
    .rad_wrap{
        display: inline-block;     
    }
      
    .midCateg {
    text-align: center;
    text-size: 
    
    }
    .midCateg >  ul > li {
    list-style:none;
    display:inline;
    margin-right: 20px;
    font-weight:600;
    font-size:15px;
    
    }
    .midcateg_li> a{
    color: darkgray;
    font-size:20px;
    }
    .midcateg_li> a:hover{
    color:red;
    text-decoration:none;
    }
      
    
 /* pro_ul_li  */

        a{
            text-decoration: none;
        }
        li{
            list-style: none;
        }
        .pro_module{
            width: 270px;
            height: 500px;
            border: solid;
        }
        .pro_img_wrap{
            width: 100%;
            height: 300px;
            background-color: tomato;
            position: relative;
            overflow: hidden;
        }
        .pro_module .txt_wrap{
            position: relative;
            margin-top: 16px;
         /*    background-color: greenyellow; */
            width: 100%;
            height: 170px;
        }
        .txt_wrap .pro_flag_wrap{
            margin-left: 1px;
        }
        .pro_flag_wrap .flag{
            border: 1px solid darkgray;
            background-color: darkgray;
            display: inline-block;
            min-width: 55px;
            height: 25px;
            margin: 0 0 0 -1px;
            font-size: 12px;
            line-height: 22px;
            text-align: center;
            font-weight: 800;
            color: black;
        }
        .tit_info .info_itemName{
            display: block;
            color: black;
            font-weight: bold;
            font-size: 20px;
            word-break: break-all;
            padding: 8px 0 0;
        }
        .tit_info .info_idNo{
            display: block;
            color: black;
            font-size: 15px;
            word-break: break-all;
            margin: 5px 0 0;
        }
        .price_info{
            padding-top: 8px;
            font-size: 0;
        }
        .price_info .sale{
            display: inline-block;
            margin-right: 5px;
            vertical-align: middle;
           
            
        }
        .price_info .sale .price{
            display: inline-block;
            vertical-align: top;
            font-size: 21px;
            line-height: 27px;
            font-weight: 800;
            color: black;
        }
        .price_info .normPrice{
            display: inline-block;
            padding-left: 6px;
            color: black;
            font-size: 13px;
            line-height: 21px;
            text-decoration: line-through;
            vertical-align: middle;
        }
        .pro_module .cart_btn{
            position: static;
            margin-top: 5px;
        }
        .pro_list .pro_list_ul .pro_list_li{
            float: left;
            margin: 80px 0 0 25px;
            min-height: 600px;
        }  
        #so_Content{
        margin: 90px -42px 92px 70px;      
        width:270px;
        height:500px;
        border: solid;
        float:left;
        }   
        #so_img{
        width:100%;
        height:300px;
        position:relative;
        overflow:hidden;
        background-color:pink;
    } 
    #so_flag{
    margin-top:16px;
    margin-left:1px;
    width:55px;
    height:25px;
    font-size:12px;
    line-height:22px;
    font-weight:900;
    background-color:darkgray;
    text-align:center;
    
    
    }
    #so_itemName{
    display:block;
    font-weight:bold;
    font-size:20px;
    word-break: break-all;
    margin-top: 8px;
    }
     #so_idNo{
     display:block;
     font-size:15px;
     word-break:break-all;
     margin-top:5px;
     } 
     #so_price{
     display:inline-block;
     font-size:21px;
     line-height:27px;
     font-weight:800;
     margin-top:8px;
     
     }
     #so_norPrice{
     display:inline-block;
     padding-left:6px;
     font-size:13px;
     line-height:21px;
     text-decoration:line-through;
     vertical-align:middle;
     margin-top:8px;
     }
     #so_cart{
     position: static;
     margin-top:5px;
     }
     .mainCateg{
     margin-left:70px;}
       
     
     
     
     

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
       
       
       #dltBtn {
       
       width: 10px;
       heigth: 10px;
       
       }
       
       #dltBtnImg{
       
       width: 10px;
       height: 10px;
       
       }
    
       /* 장바구니 css 끝 */  

     
     
     
     
     
     
     
     
     
      
</style>


</head>

<body>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/menuBar.jsp" %>




<!-- <div class="row"> -->
<!--    <div class="col-lg-12"> -->
      <div class="product_container">
         <div class="panel-heading">
         

            <h1 style="color:orange"><c:out value="${path}"/></h1>
         
            <input type="hidden" id="cs" class="cs" value="<c:out value="${cs}"/>"> 


         </div>
         
         
      <!--대분류 , 중분류 나눠지는 곳 -->
       <div class="top_title_Choice">
          <form id="categForm" role="form" action="/product/list" method="GET"  >
          
                   <select class="mainCateg" id="test" >
                     <option value="">대분류 선택</option>
                  </select>
                  <!--  <select class="midCateg" >
                     <option value="">중분류 선택</option>
                  </select> -->
                
                  <input type="hidden"  id="classCode" name="classCode">          
       </form>
             <div class="midCateg">
                <c:choose>
                <c:when test="${cs == 'Sea' || cs =='SeaS01' || cs=='SeaS02' || cs=='SeaS03' || cs=='SeaS04'|| cs=='SeaS05' || cs=='SeaS06'}">
                   <ul>
                      <li class="midcateg_li"><a href="/product/list?classCode=Sea">전체보기</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=SeaS01">생선류</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=SeaS02">갑각류</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=SeaS03">해조류</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=SeaS04">건어물</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=SeaS05">조개류</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=SeaS06">수산가공품</a></li>
                   </ul>
                </c:when>
                
                <c:when test="${cs == 'Meat' ||cs == 'MeatM01'||cs == 'MeatM02' ||cs == 'MeatM03' ||cs == 'MeatM04' ||cs == 'MeatM05'}">
                   <ul>
                      <li class="midcateg_li"><a href="/product/list?classCode=Meat">전체보기</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=MeatM01">소고기</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=MeatM02">돼지고기</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=MeatM03">닭고기</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=MeatM04">기타정육</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=MeatM05">가공육</a></li>
                   </ul>
                </c:when>
                <c:when test="${cs == 'Veggie' || cs=='VeggieV01'|| cs=='VeggieV02' || cs=='VeggieV03' ||cs=='VeggieV04'}">
                   <ul>
                      <li class="midcateg_li"><a href="/product/list?classCode=Veggie">전체보기</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=VeggieV01">각종나물</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=VeggieV02">뿌리채소</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=VeggieV03">열매채소</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=VeggieV04">잎채소</a></li>
                   </ul>
                </c:when>
                <c:when test="${cs == 'Fruit' || cs=='FruitF01' || cs=='FruitF02' || cs=='FruitF03'|| cs=='FruitF04'}">
                   <ul>
                      <li class="midcateg_li"><a href="/product/list?classCode=Fruit">전체보기</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=FruitF01">국내산 과일</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=FruitF02">수입산 과일</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=FruitF03">냉동 과일</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=FruitF04">건과일</a></li>
                   </ul>
                </c:when>
                <c:when test="${cs == 'Retort'|| cs=='RetortR01'||cs=='RetortR02'||cs=='RetortR03'||cs=='RetortR04'||cs=='RetortR05'||cs=='RetortR06'||cs=='RetortR07'}">
                   <ul>
                      <li class="midcateg_li"><a href="/product/list?classCode=Retort">전체보기</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=RetortR01">젓갈류</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=RetortR02">양념류</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=RetortR03">반찬류</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=RetortR04">간식류</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=RetortR05">건강 식품</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=RetortR06">혼밥족반찬세트</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=RetortR07">견과류</a></li>
                   </ul>
                </c:when>
                <c:when test="${cs == 'Grain' || cs=='GrainG01' || cs=='GrainG02'|| cs=='GrainG03' }">
                   <ul>
                      <li class="midcateg_li"><a href="/product/list?classCode=Grain">전체보기</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=GrainG01">쌀</a></li>
                      <li class="midcateg_li"><a href="/product/list?classCode=GrainG02">잡곡류</a></li>
                      <li class="midcateg_li" ><a href="/product/list?classCode=GrainG03">건식</a></li>
                   </ul>
                </c:when>
                
                </c:choose>
             </div>
       </div>   
         <!-- /.panel-heading -->
     
      <div class="panel-body"> 
      <!-- listSort 정렬  -->
      <form id="listsortForm" action="/product/list" method="GET">
             <div class="list_Sort">
           <div class="rad_wrap">
               <input type="radio" id="sort01" name="sort" value="new" onclick="changeSort(this.value)" 
              >
               <label for="sort01">
                   <span class="txt">신메뉴순</span>
               </label>   
           </div>      
           <div class="rad_wrap">
               <input type="radio" id="sort02" name="sort" value="best" onclick="changeSort(this.value)"  >
               <label for="sort02">
                   <span class="txt">best</span>
               </label>
           </div>
           <div class="rad_wrap">
               <input type="radio" id="sort03" name="sort" value="highPrice" onclick="changeSort(this.value)"   >
               <label for="sort03">
                   <span class="txt">높은가격순</span>
               </label>
           </div>
           <div class="rad_wrap">
               <input type="radio" id="sort04" name="sort" value="lowPrice" onclick="changeSort(this.value)"   >
               <label for="sort04">
                   <span class="txt">낮은가격순</span>
               </label>
           </div>
          </div>   
       </form> 
      <!--end list sort 기준 리스트  -->
      
       <!--상품 목록 div  -->
             <div>
            
            <div class="whole_list">
          
                  <c:forEach items="${list}" var="board">
                     
                     <section id="pro_container"> 
                     
                         <div class="pro_list">
                             <ul class="pro_list_ul">
                                 <li class="pro_list_li">
                                     <div class="pro_module">
                                           <!--판매중  -->
                                          <c:if test="${board.saleStat=='판매중'}">
                                            <div class="pro_img_wrap">
                                        
                                               <a href="/product/item?itemCode=<c:out value='${board.itemCode}'/>" class="conts">
                                                   <img src="/resources/images/default.png" alt="메인 이미지">
                                               </a>
                                
                                                  </div>    
                                                   </c:if>
                                                   
                                            <!-- 품절일때  -->
                                            <c:if test="${board.saleStat=='품절'}">
                                            <div class="pro_img_wrap">
                                        
                                               <a href="/product/item?itemCode=<c:out value='${board.itemCode}'/>" class="conts" style="opacity:0.2;">
                                                   <img src="/resources/images/default.png" alt="메인 이미지">
                                               </a>
                                                  <div class="soldout">
                                                         <p>품절</p>
                                                         </div>
                                                  </div>    
                                                   </c:if>
                                                   
                                                   <!--판매 중지일때  -->
                                                   <c:if test="${board.saleStat=='판매중지'}">
                                            <div class="pro_img_wrap">
                                        
                                               <a href="/product/item?itemCode=<c:out value='${board.itemCode}'/>" class="conts" style="opacity:0.2;">
                                                   <img src="/resources/images/default.png" alt="메인 이미지">
                                               </a>
                                                  <div class="soldout">
                                                         <p>판매 중지</p>
                                                         </div>
                                                  </div>    
                                                   </c:if>
                                              
                                    
                                     <!-- END img_wrap -->
                                     <div class="txt_wrap">
                                         <a href="/product/item?itemCode=<c:out value='${board.itemCode}'/>" class="conts">
                                             <div class="pro_flag_wrap">
                                                 <span class="flag">NEW</span>
                                             </div>
                                             <!-- END pro_flag_wrap -->
                                             <div class=tit_info>
                                                 <span class="info_itemName"> <c:out value="${board.itemName}" /> </span>
                                                 <span class="info_idNo"><c:out value="${board.idNo}" /></span>
                                             </div>
                                             <!-- END tit_info -->
                                             <div class="price_info">
                                                     <p class="sale">
                                                         <span class="price"><c:out value="${board.price}" />
                                                             <span class="won">원</span>
                                                         </span>
                                                     </p>
                                                     <p class="normPrice">
                                                       <c:out value="${board.normPrice}" />
                                                       <span class="won">원</span>
                                                     </p>
                                             </div>
                                              </a>
                                         <div class="cart_btn">
                                             <button type="button" class="add_to_cart" value="${board.itemCode}" onclick="addToBasketEvent(this.value)">add to cart</button>
                                         </div>
                                     </div>
                                     <!-- END txt_wrap -->
                                     
                                     </div>
                                     <!-- END pro_moduel  -->
                                 </li>     
                             </ul>    
                         </div>
                         <!--END pro_list  -->
                     </section>     
                      
                  </c:forEach>
         </div>

           
        </div>     
        <!--END 상품 목록 div 끝  --> 
 <%--            <!--페이징 처리  -->
            <div class ='pull-right'>
               <ul class="pagination">
               
               <c:if test="${pageMaker.prev}">
                  <li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">Previous</a>
                  </li>
                  </c:if>
                  
                  <c:forEach var="num" begin="${pageMaker.startPage}" 
                  end="${pageMaker.endPage}">
                  <li class="paginate_button" ${pageMaker.cri.pageNum == num? "active":""}>
                  <a href="${num}">${num}</a></li>
                  </c:forEach>
                  
                  <c:if test="${pageMaker.next}">
                     <li class="paginate_button next"><a href="${pageMaker.endPage+1 }">Next</a></li>
                  </c:if>
               
               </ul></div>         
               
            <!--페이징 처리 끝  -->
            
            
            <form id='actionForm' action="/product/list" method='get'>
             <input type='hidden' name='classCode' value='<c:out value="${cs}"/>'>
            
         </form>
         </div> --%>
         
         <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
   </div>
   <!-- /.col-lg-12 -->

<!-- </div>  -->
<!-- /.row -->
<!-- </div> -->








<!-- 장바구니 사이드메뉴바 body 시작 -->
<div class="basketContainer">
    <nav class="basketNavBar" id="basketNav">

        <button type="button" onclick="basketClicked(this)" class="basket-toggle-collapse" > 
            <span class="basket-toggle-icon"> </span>
            <img src="/resources/images/basket.png"/>
        </button>   

        <br>장바구니

        <ul class="basketList" id="basketList">
        
        
        <!-- 장바구니 리스트 영역 시작 -->
         
          
        <!-- 장바구니 리스트 영역 끝 -->
        
        
        
        </ul>


    </nav>
</div>
<!-- 장바구니 사이드메뉴바 body 끝 -->








<script src="https://code.jquery.com/jquery-3.5.1.min.js" 
integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" 
crossorigin="anonymous"></script>
<script>


//컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var mainArr = new Array();
var mainObj = new Object();

// 대분류 셀렉 박스에 삽입할 데이터 준비
for(var i=0; i< jsonData.length; i++) {
  if(jsonData[i].lv == "1") {
     mainObj = new Object();
     mainObj.mainCateg = jsonData[i].mainCateg;
     mainObj.item = jsonData[i].item;
     
     mainArr.push(mainObj);
  }
}

// 셀렉 박스에 데이터 삽입
var mainSelect = $("select.mainCateg");

for(var i=0; i < mainArr.length; i++) {
  mainSelect.append("<option value='" + mainArr[i].mainCateg + "' id='"+mainArr[i].mainCateg+"'>" + mainArr[i].item + "</option>");
/*   $("#classCode").val(mainArr[i].mainCateg); */
}

$("#test").on('change', function(){
   var test = $("option:selected").val();
   $("#classCode").val(test)
   /*    alert(test); */
    $("#categForm").submit();

});
   

$(document).on("change", "select.mainCateg", function() {
  
  var midArr = new Array();
  var midObj = new Object();
  
  for(var i=0; i<jsonData.length; i++) {
     if(jsonData[i].lv == "2") {
        midObj = new Object();
        midObj.mainCateg = jsonData[i].mainCateg;
        midObj.midCateg = jsonData[i].midCateg;
        midObj.item = jsonData[i].item;
        
        midArr.push(midObj);
     }
  }
  
/*첫번째 select 에 의해서 두번째 콤보박스 바뀌기  */
  
  var midSelect = $("select.midCateg");


   midSelect.children().remove();

   $("option:selected", this).each(function(){
    
      var selectVal = $(this).val();  
      var midSelectTest = $(".midCategTest")
      
     midSelect.append("<option value=''>중분류 선택</option>");
    
     for(var i = 0; i < midArr.length; i++) {
        if(selectVal == midArr[i].midCateg) {
         /*  midSelect.append("<option value='" + midArr[i].mainCateg + "'>" + midArr[i].item + "</option>");  */
         
         /* 중분류  */
         midSelectTest.append("<li value='"+ midArr[i].mainCateg +"'><a href='#'>" +midArr[i].item+ "</a></li>");
        
        }
     }
     

    
   });

});

/*text로 classCode 받아오기  */
/*1) 대분류+중분류  */
$(document).on("change", "select.midCateg", function() {
       var classCode = $(".mainCateg option:selected").val() +''+ $(".midCateg option:selected").val();
      $("#classCode").val(classCode);
   });

/*2) 대분류만   */
$(document).on("change", "select.mainCateg", function(){
   var classCode=$(".mainCateg option:selected").val();
   $("#classCode").val(classCode);
});

/* 페이지 클릭 */
   var actionForm = $("#actionForm");

   $(".paginate_button a").on("click", function(e){
      e.preventDefault();
   console.log('click');
   actionForm.find("input[name='pageNum']").val($(this).attr("href"));
   actionForm.submit();
   });
   
   $('.dropdown-menu > a').on('click', function(){
      $('#navbarDropdown').text($(this).text());
   })

   
   /* List sort radiobutton onclick (value 로 들어오는 것은 sort값  )  */
   
   function changeSort(value){
      
      var classCode = $(".cs").val();
      
      console.log(classCode);
      
      var allData = {"classCode": classCode, "sort": value};
       
      listSort(allData).then(function(response){

       console.log(response);
       console.log("데이터 그리기 시작한다");
       draw(response);
         
      }) 
      .catch(function(error){
         console.log(error);

      });
    
   }


   function listSort(allData) {
      
      console.log("listSort 실행");
      
      return $.ajax({
         url:"/product/test/"+allData.classCode+"/"+allData.sort,
         type: "GET",
         contentType: "application/json"
      });
   }
   

   function draw(response){
      
   var $whole_list = $(".whole_list");

      console.log(response);
      
      console.log("데이터 개수"+response.length);
      
      $whole_list.empty();
      console.log("테이블 초기화 성공");
      
      
            
   for(var i=0; i<response.length; i++){
         console.log("table그리기 시작한다!!!!");
         

   
      
      $whole_list.append("<div id='so_Content'>"+"<div id='so_img'>"+response[i].itemImg1+"</div>"+
            "<div id='so_flag'>"+response[i].itemChr+"</div>"+
            "<div id='so_itemName'>"+response[i].itemName+"</div>"+
            "<div id='so_idNo'>"+response[i].idNo+"</div>"+
            "<div id='so_price'>"+response[i].price+"원</div>"+
            "<div id='so_norPrice'>"+response[i].normPrice+"원</div>"+
            "<div id='so_cart'>"+"<button class='so_add_cart'>add to cart</button>"+"</div></div>");
         
      }
   }
      


   
   
   



   // 브라우저 열리자마자 장바구니 리스트 가져오기 시작
   $(document).ready(
            
             getBasketList()
            
            .then(function(response){ 
               
              console.log("getBasketList 결과는?");
               console.log(response);  
               console.log("draw 실행");
               draw(response); // 가져온 결과를 화면에 다시 그리기 
               
               }) 
         
   )
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
       
      
      var $num = $("#input-view");
      
      var data = {
            itemNum : 1,
            idNo : "cus000001",
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
   function draw(jsonData) { // JSONdata 에 xml 형태의 JSON이 들어온다 왜? 
      
      var $basketList = $("#basketList");
      
      $basketList.empty();
      
      console.log("결과 : " + jsonData)
      
      for(var i=0; i<jsonData.length; i++) {
         
         $basketList.append("<div id='basketImg'><img src=\""+jsonData[i].itemImg1+"\" style= \"width:100px; border: 3px; float:left; margin-left: 10px; margin-top:10px; margin-bottom:30px; \" /></div>");
         
         $basketList.append("<div id='basketContent'><h5>"+jsonData[i].itemName+"<br>"+jsonData[i].price+"원<br>"+jsonData[i].itemNum+"개<br>"+jsonData[i].baskId+"<br></h5></div><br>");

         
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
      
   }
   //html 구조 안에다가 장바구니 내용 넣기 function 끝

    



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
          setTimeout(function(){elem.style.right = "-20%";},1000);
          /* basket 가 열렸다 닫혔다 하는 부분 끝 */
         

   }
   /* 장바구니 슬라이드 열렸다 닫히는 기능 끝 */


   
   
   
   
   


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
       