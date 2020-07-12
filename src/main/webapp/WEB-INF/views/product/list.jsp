<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<style>

   .row{
   min-width:6300px;
   }
   .pull-right > ul li{
   list-stlye-type:none;
   display:inline;
   }
   
   .panel-body{
   position:relative;
   width:1100px;
   height:6100px;
   margin: 50px
   }
   .list_sort{
        position: absolute;
        right: 0;
        bottom: 0;
    } 
    .rad_wrap{
        display: inline-block;
    }
      
    .midCateg >  ul > li {
    list-style:none;
    display:inline;
    margin-right: 20px;
    font-weight:600;
    font-size:15px;
    
    }
    .midcateg_li> a{
    color: black;
    }
    .midcateg_li> a:hover{
    color:red;
    text-decoration:none;
    }
      
     
      
</style>


</head>

<body>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/menuBar.jsp" %>


<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">
         <h1 style="color:orange"><c:out value="${cs}"/></h1>
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
                <c:when test="${cs == 'Veggie' || cs=='VeggieV01'|| cs=='VeggieV03' ||cs=='VeggieV04'}">
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
                      <li class="midcateg_li"><a href="/product/list?classCode=Retort03">반찬류</a></li>
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
                      <li class="midcateg_li" ><a href="/product/list?classCode=GrainG03w">건식</a></li>
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
       
       <form id="frm">
          classCode: <input type="text" name="clasCode" id="classCode">
          sort: <input type="text" name="sort" id="sort">
       
       </form>
   
          <!--end list sort 기준 리스트  -->
             <div>
            <table class="pro_table" border=1>
               <thead>
                  <tr>
                     <th>상품번호</th>
                     <th>상품이름</th> 
                     <th>상품설명</th>
                     <th>할인가격</th>
                     <th>가격</th>
                     <th>이미지</th>
                     <th>상품 분류 코드</th>
                     <th>상점 번호</th>
                     <th>cart</th>
                     
                  </tr>
               </thead>
               
        
               <c:forEach items="${list}" var="board">
                  <tr>
                     <td><c:out value="${board.itemCode}" /></td>
                     <td><c:out value="${board.itemName}" /></td>
                     <td><c:out value="${board.itemContent}"/></td>
                     <td><c:out value="${board.price}" /></td>
                     <td><c:out value="${board.normPrice}" /></td>   
                  <%--    <td><img src="${board.itemImg1}" onerror="this.src='/resources/images/default.png'" width="200px" height="130px"/></td>  --%>
                     <td><img src="/resources/images/default.png" alt="기본" width="100px" height="100px"/></td> 
                     <td><c:out value="${board.classCode}" /></td>
                     <td><c:out value="${board.idNo}" /></td>
                     <td><button>add to cart</button></td>
                     
                     

                  </tr>
            
      <%--              <div class="aa" style="width: 300px; height: 300px; background-color:pink; border-style:solid;">
                   상품번호 :      <c:out value="${board.itemCode}" /> <br>
                   상품 이름:    <c:out value="${board.itemName}" />   <br>
                   상품 설명 :    <c:out value="${board.itemContent}"/><br>
                   할인가격:   <c:out value="${board.price}" /><br>
                   가격:      <c:out value="${board.normPrice}" /><br>
                   상품분류코드:   <c:out value="${board.classCode}" /><br>
                   가게번호:   <c:out value="${board.IDno}" />
                   
                   </div> --%>
               </c:forEach>
            </table>
         </div>      
            <!--페이징 처리  -->
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
            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
            <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>          
   
         </form>
         </div>
         <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
   </div>
   <!-- /.col-lg-12 -->

</div> 
<!-- /.row -->

</body>



<script type="text/javascript">

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

   
   /* List sort radiobutton onclick  */
   
   /* value 로 들어오는 것은 sort값  */
   function changeSort(value){
      
      var classCode = $(".cs").val();
      
      console.log(classCode);
      
      var allData = {"classCode": classCode, "sort": value};

      console.log(JSON.stringify(allData));
       
       
      listSort(allData)
      
/*       .then(function(response){
    	  console.log("listSort 결과는?")
    	  console.log(response);
    	  
      }) */
      
   
         
      
      }



   function listSort(allData) {
      
      console.log("listSort 실행");
      
      $.ajax({
         url:"/product/test",
         type: "GET",
         data: allData,
         dataType: "TEXT",
         error: function(request, error){console.log("통신 실패ㅜ"+"code:"+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+error)},
         success: function(){
        	 alert("통신 성공!!")
        	 console.log();
        	 }
      
      });
   }
   
   
   
   
   
</script>
  
  

</body>

</html>
       