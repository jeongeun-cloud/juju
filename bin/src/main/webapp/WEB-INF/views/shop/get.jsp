<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<a href='/shop/register'>상품 등록</a>
    <a href='/shop/list'>상품 리스트</a>
    <h2>상품 정보</h2>
       <form id="actionForm" method="POST">
           <input type="hidden" name="itemCode" value='<c:out value="${item.itemCode }"/>'>
           <div class="container">
	           <label for="itemName">상품 이름</label><br>
		       <input type="text" name="itemName" style="width: 350px;" value='<c:out value="${item.itemName }"/>' readonly="readonly">
	       </div>
           <div class="container">
	           <label for="category">카테고리 분류</label><br>
		       <input type="text" name="getCategory" style="width: 350px;" value='<c:out value="${getCategory }"/>' readonly="readonly">
	       </div>
	       <div class="container">
	           <label for="itemContent">상품 상세정보</label><br>
	           <textarea name="itemContent" style="height: 200px; width:350px" readonly="readonly"><c:out value="${item.itemContent }"/></textarea>
	       </div>
	       <div class="container">
	           <label for="price">판매가격</label>
	           <input type="text" name="price" value='<c:out value="${item.price }"/>' readonly="readonly"> <br>
	           <label for="normPrice">정상가격</label>
	           <input type="text" name="normPrice" value='<c:out value="${item.normPrice }"/>' readonly="readonly">
	       </div>
	       <div class="container">
	           <label for="stock">재고</label>
	           <input type="text" name="stock" value='<c:out value="${item.stock }"/>' readonly="readonly"><br>
	       </div>
	       
	       <div class="container">
	           <label for="status"><b>표시상태 설정</b></label><br>
	           <label for="">진열상태</label>
	           <input type="hidden" id="disValue" value='<c:out value="${item.dispStat}"/>'>
	           <input type="radio" name="dispStat" value="진열함">진열함
	           <input type="radio" name="dispStat" value="진열안함">진열안함<br>
	           <label for="">판매상태</label>
	           <input type="hidden" id="saleValue" value='<c:out value="${item.saleStat}"/>'>
	           <input type="radio" name="saleStat" value="판매중">판매중
	           <input type="radio" name="saleStat" value="판매중지">판매중지
	           <input type="radio" name="saleStat" value="품절">품절
	       </div>
	       <div class="container">
	           <label>상품 특성<small style="opacity:0.75;">(특성이 선택되어 있지 않으면 기본입니다.)</small></label><br>
	           <input type="hidden" id="chkValue" value='<c:out value="${item.itemChr}"/>'>
	           <input type="checkbox" name="itemChr" value="신상품">신상품
	           <input type="checkbox" name="itemChr" value="best">Best
	           <input type="checkbox" name="itemChr" value="할인">할인
	       </div>

           <div class="container">
	        	<label>메인 이미지</label>
	            <div class="select_img1"><img class="thumbnail" src='/resources/upload/idNo/<c:out value="${item.itemImg1}"/>' /></div>
	        </div>
	        <div class="container">
	        	<label>서브 이미지</label>
	            <div class="select_img2"><img class="thumbnail" src='/resources/upload/idNo/<c:out value="${item.itemImg2}"/>' /></div>
	        </div>
	        <div class="container">
	        	<label>서브 이미지</label>
	            <div class="select_img3"><img class="thumbnail" src='/resources/upload/idNo/<c:out value="${item.itemImg3}"/>' /></div>
	        </div>
	        <div class="container">
	        	<label>서브 이미지</label>
	            <div class="select_img4"><img class="thumbnail" src='/resources/upload/idNo/<c:out value="${item.itemImg4}"/>' /></div>
	        </div>
	        <div class="container">
	        	<label>상품 상세 설명 이미지</label>
	            <div class="select_img5"><img class="thumbnail" src='/resources/upload/idNo/<c:out value="${item.imgDetail}"/>' /></div>
	        </div>
	        
	        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>

			<button type="submit" data-oper='remove'>Remove</button>
			<button type="submit" data-oper='list'>List</button>
       </form>

       <form id='operForm' action="/shop/modify" method="get">
			<input type='hidden' id='itemCode' name='itemCode' value='<c:out value="${item.itemCode}"/>'>
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
            <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>' >
            <input type='hidden' name='type' value='<c:out value="${cri.type }"/>' >
		</form>
       
   <script type="text/javascript">
   
	   $(document).ready(function(){
		   var actionForm = $("#actionForm");
			
			$('button').on("click", function(e) {
				e.preventDefault();
				
				var operation = $(this).data("oper");
				
				console.log(operation);
				
				if(operation === 'remove') {
					actionForm.attr("action", "/shop/remove");
					
				}else if(operation === 'list') {
					actionForm.attr("action", "/shop/list").attr("method", "get");
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					
					actionForm.empty();
					actionForm.append(pageNumTag);
					actionForm.append(amountTag);
				}
				actionForm.submit();
			});
			
			
		   var operForm = $("#operForm");
		   
		 	$("button[data-oper='list']").on("click", function(e) {
		 		operForm.find("#itemCode").remove();
		 		operForm.attr("action", "/shop/list");
		 		operForm.submit();
		 	});
		 	
		 	/* 라디오 값 불러와서 체크해주기 */
			var disChk = $("#disValue").val();
			var disRadio = $("input[type=radio][name=dispStat]");
			for(i=0; i<disRadio.length; i++) {
			 	if(disChk == disRadio[i].value) {
			 		disRadio[i].checked = true;
			 	}
		 	}
			
			var saleChk = $("#saleValue").val();
			var saleRadio = $("input[type=radio][name=saleStat]");
			for(i=0; i<saleRadio.length; i++) {
			 	if(saleChk == saleRadio[i].value) {
			 		saleRadio[i].checked = true;
			 	}
		 	}
		 	
			// 체크박스 다중값 불러와서 체크해주기
		 	var chk = $("#chkValue").val();
		 	chk  = chk.split(",");
		 	var itemChr = $("input[type=checkbox][name=itemChr]");
		 	
		 	for(i=0; i<itemChr.length; i++) {
		 		for(j=0; j<chk.length; j++) {
				 	if(chk[j] == itemChr[i].value) {
				 		itemChr[i].checked = true;
				 	}
		 		}
		 	}
	   });
   </script>
</body>
</html>