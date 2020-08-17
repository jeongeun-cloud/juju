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
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<meta name="description" content="">
<meta name="author" content="">

<style>
	.txt_wrap a:hover{
		color:black;
		text-decoration : none;
	 }
	.panel-heading h3{
	 color:gray;
	 text-align:center;
	
	}
	.panel-heading{
	margin-top:50px;
	}
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

    .midCateg {
    text-align: center;
    margin-bottom:80px;
    
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
        }
    .midcateg_li> a:hover{
    color:#637365;
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
            height: 430px;
            
        }
        .pro_img_wrap{
            width: 100%;
            height: 300px;
            background-color: black;
            position: relative;
            overflow: hidden;
        }
        .pro_img_wrap img{
        display:block;
        width:100%;
        height:100%;
        position: absolute;
        top:0;
        bottom:0;
        left:0;
        right:0;
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
            height:25px;
        }
        .pro_flag_wrap .flag{
            border: 1px solid #8fa691;
            background-color: #8fa691;
            display: inline-block;
            min-width: 55px;
            height: 25px;
            margin: 0 0 0 -1px;
            font-size: 12px;
            line-height: 22px;
            text-align: center;
            font-weight: 800;
            color: white;
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
        .add_to_cart{
        border:none;
        background-color:white;
        right:0;
        top: 40px;
        display:inline;
        position:absolute;
        }
        .add_to_cart:focus{
        outline:none;
        }
 
 	    /* sort radio button */
 	    .rad_wrap{
        display: inline-block; 
        border-right: 1px solid #d6d9d6;   
        height:15px; 
   		 }
      
 	    input[type="radio"] {
	    position: relativ;
	    display: none;
	   
	    }
	    input[type="radio"] + label {
	    min-width: 45px;
	    height: 25px;
	    margin:0 15px 0 15px;	   	    
	    position: relative;
	    text-align: center;
	    }
	
	    /*hover, checked, focus*/
	
	    input[type="radio"]#sort01:hover + label,
	    input[type="radio"]#sort02:hover + label,
	    input[type="radio"]#sort03:hover + label,
	    input[type="radio"]#sort04:hover + label{
	    cursor: pointer;
	    }
	    input[type="radio"]#sort01:checked + label::before,
	    input[type="radio"]#sort02:checked + label::before,
	    input[type="radio"]#sort03:checked + label::before,
	    input[type="radio"]#sort04:checked + label::before{
	    cursor: pointer;  
	    color: black;
	    content:url("/resources/images/check.png");
	    display: inline-block; 
	
	    }
	    .rad_wrap input + label{
	        font-weight: 500;
	        font-size:17px;
	        color:gray;
	    }
	    .rad_wrap input:checked + label{
	        font-weight: 900;
	        color:black;
	    }
	   
      /*sort 한 부분  */
     #so_Content{
     margin: 90px -42px 92px 63px;      
     width:270px;
     height:430px;
    
     float:left;
     position:relative;
     }   
     .so_img{
     width:100%;
     height:300px;
     position:relative;
     overflow:hidden;
     background-color:black;
    } 
     .so_img img{
     display:block;
     width:100%;
     height:100%;
     position: absolute;
     top:0;
     bottom:0;
     left:0;
     right:0;
     }
    .so_flag{
    margin-top:16px;
    margin-left:1px;
    width:55px;
    height:25px;
    font-size:12px;
    line-height:22px;
    font-weight:900;
    background-color:#8fa691;
    text-align:center;
    color:white;
    
    }
    #so_itemName{
    display:block;
    font-weight:bold;
    font-size:20px;
    word-break: break-all;
    margin-top: 8px;
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
     text-decoration: line-through;
     vertical-align:middle;
     margin-top:8px;
     }
     #so_cart{
     position: static;
     margin-top:-20px;
     display:inline-block;
     position:absolute;
     right:0;
     }
     .mainCateg{
     margin-left:70px;
     height:30px;
     border-bottom: 2px solid #f0f2f0;
     border-top:none;
     border-right:none;
     border-left:none;
     }
     .mainCateg:focus{
     outline:none;
     }
     .select {
	  width: 100%;
	  position: absolute;
	  top: 0;
	  padding: 10px 0;
	  opacity: 0;
	  background: none transparent;
	  border:none;
	}
     /*품절 된 상황  */

       .soldout{
           text-align:center;
           width:100%;
           bottom: 50px; 
           font-size: 3.5em;
           font-weight: bold; 
           position: absolute; 
           color: white;
          
        
       }
       #soldout{
           text-align:center;
           width:100%;
           bottom: 50px; 
           font-size: 3.5em;
           font-weight: bold; 
           position: absolute; 
           color: white;
           top:0;
           left:0;
        
       }
       .so_add_cart{
       background-color:white;
       border:none;

       }
       .so_add_cart:focus{
       outline:none;
       }

     
      
</style>


</head>

<body>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/menuBar.jsp" %>


<%@include file="../includes/basketSlide.jsp" %>



<!-- <div class="row"> -->
<!--    <div class="col-lg-12"> -->
      <div class="product_container">
         <div class="panel-heading">
         

            <h3><i class="fa fa-quote-left " aria-hidden="true"></i>  <c:out value="${path}"/>  <i class="fa fa-quote-right " aria-hidden="true"></i></h3>
         
            <input type="hidden" id="cs" class="cs" value="<c:out value="${cs}"/>"> 


         </div>
         
         
      <!--대분류 , 중분류 나눠지는 곳 -->
       <div class="top_title_Choice">
          <form id="categForm" role="form" action="/product/list" method="GET"  >
          	<div class="select-box">
                   <select class="mainCateg" id="test" >
                     <option value="">Choose</option>
                  </select>
			</div>
                
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
               <input type="radio" id="sort01" name="sort" value="new" onclick="changeSort(this.value)" >
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
           <div class="rad_wrap" style="border-right:none;">
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

                                                   <img class="active" src="/resources/upload/<c:out value="${board.idNo}"/>/<c:out value="${board.itemImg1}"/>">
                                               </a>
                                
                                                  </div>    
                                                   </c:if>
                                                   
                                            <!-- 품절일때  -->
                                            <c:if test="${board.saleStat=='품절'}">
                                            <div class="pro_img_wrap">
                                        
                                                <a href="/product/item?itemCode=<c:out value='${board.itemCode}'/>" class="conts" style="opacity:0.2;">

                                                    <img class="active" src="/resources/upload/<c:out value="${board.idNo}"/>/<c:out value="${board.itemImg1}"/>">
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
	
	                                                    <img class="active" src="/resources/upload/<c:out value="${board.idNo}"/>/<c:out value="${board.itemImg1}"/>">
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
                                          
                                            <c:if test="${board.itemChr!='default'}">
                                                 <span class="flag"> <c:out value="${board.itemChr}" /></span>                                                                                
                                             </c:if>
                                             
                                           </div>
                                             <!-- END pro_flag_wrap -->
                                             <div class=tit_info>
                                                 <span class="info_itemName"> <c:out value="${board.itemName}" /> </span>
                                                 
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
                                               <c:if test="${board.saleStat=='품절'||board.saleStat=='판매중지'}">
							                       <button type="button" class="add_to_cart" value="${board.itemCode}" onclick="alert('죄송합니다. 구매 불가한 상품입니다.')"><img src="/resources/images/addcart.png"></button>
							                    </c:if>
							                    <c:if test="${board.saleStat!='품절'&& board.saleStat!='판매중지'}">
							            	 <button type="button" class="add_to_cart" value="${board.itemCode}" onclick="addToBasketEvent(this.value)"><img src="/resources/images/addcart.png"></button> 
							            	 </c:if>
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
     
         
         <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
   </div>
   <!-- /.col-lg-12 -->

<!-- </div>  -->
<!-- /.row -->
<!-- </div> -->

</body>


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

       //console.log(response);
       console.log("데이터 그리기 시작한다");
       listdraw(response);
         
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
   

   function listdraw(response){
      
   var $whole_list = $(".whole_list");
  

      console.log(response);
      
      console.log("데이터 개수"+response.length);
      
      $whole_list.empty();
     
      console.log("테이블 초기화 성공");
      

      
   for(var i=0; i<response.length; i++){
         console.log("table그리기 시작한다!!!!");
         
         console.log(response[i]);
      
        

   $whole_list.append("<div id='so_Content'>"+"<a href='item?itemCode="+response[i].itemCode+"'/>"+
		   "<div id='so_img"+i+"' class='so_img'> <img src=\"/resources/upload/"+response[i].idNo+"/"+response[i].itemImg1+"\"/></a></div>"+
            "<div id='so_flag"+i+"' class='so_flag'>"+response[i].itemChr+"</div>"+
            "<div id='so_itemName'>"+response[i].itemName+"</div>"+            
            "<div id='so_price'>"+response[i].price+"원</div>"+
            "<div id='so_norPrice'>"+response[i].normPrice+"원</div>"+
            "<div id='so_cart'>"+"<button class='so_add_cart' value=\""+response[i].itemCode+"\" onclick='addToBasketEvent(this.value)'><img src=\"/resources/images/addcart.png\"></button>"+"</div></div>"); 
      
 
		//품절일때 
		if(response[i].saleStat=='품절'){
			
			 
	     	 // $("#so_img"+i).css("background-color", "black");
	     	 // $("#so_img"+i).css("opacity", "0.2"); 
	         
	     	  
	     	  $("#so_img"+i).append("<div id='soldout'><img src=\"/resources/images/ss.png\"></div>"); 
	     	 
	     	  
	       }
		//판매중지 일때 
		if(response[i].saleStat=='판매중지'){
			
	     	 // $("#so_img"+i).css("background-color", "black");
	     	 // $("#so_img"+i).css("opacity", "0.2");
	         
	     	  $("#so_img"+i).append("<div id='soldout'><img src=\"/resources/images/tt.png\"></div>"); 
	     	 
	     	  
	       }
		
		//아이템이 기본설정일때 
		if(response[i].itemChr=='default'){
			$("#so_flag"+i).css("background-color","white");
			$("#so_flag"+i).css("color","white");
			
		}
		
      
     
      }
   
         
   }
      

  
   
   
   
</script>
  
   <%@include file="../includes/footer.jsp" %>  

</body>

</html>
       