<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<style>
	.sort{
	margin-left: 600px;
	margin-bottom:30px;
	}
	.row{
	min-width:6300px;
	}
	ul li{
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
	     
      
     
      
</style>

</head>

<body>
<div class="row">
	<div class="col-lg-12" >
		<h1 class="page-header">Header</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			<h1 style="color:orange">$$$$$$$$$$$$$JUJU PRODUCT_ LIST >.0$$$$$$$$$$$$$</h1>
			</div>
			
		<!--대분류 , 중분류 나눠지는 곳 -->
		 <div class="top_title_Choice">
		 	<form action="/product/list" method="GET"  >
		 	
		             <select class="mainCateg" >
		               <option value="">대분류 선택</option>
		            </select>
		            <select class="midCateg" >
		               <option value="">중분류 선택</option>
		            </select>
		 <input type="submit" id="classCode" name="classCode" >
		 				
		 </form>
		            
		 </div>	
			<!-- /.panel-heading -->
		<div class="panel-body">
		
		<!-- listSort 정렬  -->
		<form id="listsortForm" action="/product/list" method="GET">
			    <div class="list_Sort">
	        <div class="rad_wrap">
	            <input type="radio" id="sort01" name="sort" value="22" onclick="changeOrder(this.value)" 
	           >
	            <label for="sort01">
	                <span class="txt">신메뉴순</span>
	            </label>	
	        </div>		
	        <div class="rad_wrap">
	            <input type="radio" id="sort02" name="sort" value="23" onclick="changeOrder(this.value)"  >
	            <label for="sort02">
	                <span class="txt">best</span>
	            </label>
	        </div>
	        <div class="rad_wrap">
	            <input type="radio" id="sort03" name="sort" value="24" onclick="changeOrder(this.value)"   >
	            <label for="sort03">
	                <span class="txt">높은가격순</span>
	            </label>
	        </div>
	        <div class="rad_wrap">
	            <input type="radio" id="sort04" name="sort" value="25" onclick="changeOrder(this.value)"   >
	            <label for="sort04">
	                <span class="txt">낮은가격순</span>
	            </label>
	        </div>
	        <input type="submit">
	 		</div>	
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
							
						</tr>
					</thead>
					

					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.itemCode}" /></td>
							<td><c:out value="${board.itemName}" /></td>
							<td><c:out value="${board.itemContent}"/></td>
							<td><c:out value="${board.price}" /></td>
							<td><c:out value="${board.normPrice}" /></td>	
						<%-- 	<td><img src="${board.itemImg1}" onerror="this.src='/resources/images/default.png'" width="200px" height="130px"/></td>  --%>
							<td><img src="/resources/images/default.png" alt="기본" width="100px" height="100px"/></td> 
							<td><c:out value="${board.classCode}" /></td>
							<td><c:out value="${board.idNo}" /></td>
							
							

						</tr>
				
		<%-- 				 <div class="aa" style="width: 300px; height: 300px; background-color:pink; border-style:solid;">
						 상품번호 : 	  <c:out value="${board.itemCode}" /> <br>
						 상품 이름:	 <c:out value="${board.itemName}" />	<br>
						 상품 설명 :    <c:out value="${board.itemContent}"/><br>
						 할인가격:	<c:out value="${board.price}" /><br>
						 가격:		<c:out value="${board.normPrice}" /><br>
						 상품분류코드:	<c:out value="${board.classCode}" /><br>
						 가게번호:	<c:out value="${board.IDno}" />
						 
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
			    <input type='hidden' name='classCode' value='<c:out value="${code_save}"/>'>
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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

// 컨트롤러에서 데이터 받기
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
  mainSelect.append("<option value='" + mainArr[i].mainCateg + "'>" + mainArr[i].item + "</option>");
}


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
     midSelect.append("<option value=''>중분류 선택</option>");
    
     for(var i = 0; i < midArr.length; i++) {
        if(selectVal == midArr[i].midCateg) {
         midSelect.append("<option value='" + midArr[i].mainCateg + "'>" + midArr[i].item + "</option>");
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

/* list sort  */


/* 	$(function(){
		$("input[name='sort']").click(function(){
			$(this).prop("checked",true);
			$("form").submit();
		})
		alert(order);
		
	} */
	
	
</script>
  

</body>

</html>
       
