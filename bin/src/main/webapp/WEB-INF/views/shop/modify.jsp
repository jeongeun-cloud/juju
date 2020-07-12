<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<h2>상품 수정</h2>
	<form role="form" action="/shop/modify" method="POST">
		<!-- 추가 -->
		<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
		<input type="hidden" name='amount' value='<c:out value="${cri.amount }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>' >
        <input type='hidden' name='type' value='<c:out value="${cri.type }"/>' >
		
		<div class="container">
			<label for="category">상품 정보 수정</label><br>
		</div>
		<input type="hidden" name="itemCode" value='<c:out value="${item.itemCode }"/>'>
		<input type="text" name="itemName" style="width: 350px;" value='<c:out value="${item.itemName }"/>'>
		<div class="container">
			<label for="itemContent">상품 상세정보</label><br>
			<textarea name="itemContent" style="height: 200px; width: 350px"><c:out value="${item.itemContent }" /></textarea>
		</div>
		
		<div class="container">
			<label for="price">판매가격</label> 
			<input type="text" name="price" value='<c:out value="${item.price }"/>'> <br> 
			<label for="normPrice">정상가격</label> 
			<input type="text" name="normPrice" value='<c:out value="${item.normPrice }"/>'>
		</div>
		<div class="container">
			<label for="stock">재고</label> 
			<input type="text" name="stock" value='<c:out value="${item.stock }"/>'><br>
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
			<label>상품 특성</label> 
			<input type="hidden" id="chkValue" value='<c:out value="${item.itemChr}"/>'>
			<input type="checkbox" name="itemChr" value="신상품">신상품 
			<input type="checkbox" name="itemChr" value="best">Best 
			<input type="checkbox" name="itemChr" value="할인">할인
		</div>
        <div class="container">
            <input type='file' id="itemImg1" />
        </div>
        <div class="container">
            <input type='file' id="itemImg2" />
        </div>
        <div class="container">
            <input type='file' id="itemImg3" />
        </div>
        <div class="container">
            <input type='file' id="itemImg4" />
        </div>
        <div class="container">
            <input type='file' id="imgDetail" />
        </div>

		<button type="submit" data-oper='modify'>Modify</button>
		<button type="submit" data-oper='remove'>Remove</button>
		<button type="submit" data-oper='list'>List</button>
	</form>
	
	<script type="text/javascript">
		$(document).ready(function(){
			// 각 페이지로 form submit
			var formObj = $("form");
			
			$('button').on("click", function(e) {
				e.preventDefault();
				
				var operation = $(this).data("oper");
				
				console.log(operation);
				
				if(operation === 'remove') {
					formObj.attr("action", "/shop/remove");
				}else if(operation === 'list') {
					formObj.attr("action", "/shop/list").attr("method", "get");
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					var keyTag = $("input[name='keyword']").clone();
					var typeTag = $("input[name='type']").clone();
					
					formObj.empty();
					formObj.append(pageNumTag);
					formObj.append(amountTag);
					formObj.append(keyTag);
					formObj.append(typeTag);
				}
				formObj.submit();
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