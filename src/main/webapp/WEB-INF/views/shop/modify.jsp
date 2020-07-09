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
	<a href='/shop/register'>상품 등록</a>
    <a href='/shop/list'>상품 리스트</a>
	<h2>상품 수정</h2>
	<form role="form" action="/shop/modify" method="POST" enctype="multipart/form-data">
		<!-- 추가 -->
		<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
		<input type="hidden" name='amount' value='<c:out value="${cri.amount }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>' >
        <input type='hidden' name='type' value='<c:out value="${cri.type }"/>' >
		
		<div class="container">
			<label for="category">상품 정보 수정</label><br>
		</div>
		<input type="hidden" name="itemCode" value='<c:out value="${item.itemCode }"/>'>
		<div class="container">
	        <label for="itemName">상품 이름</label><br>
			<input type="text" name="itemName" id="itemName" style="width: 350px;" value='<c:out value="${item.itemName }"/>'>
       	</div>
		<div class="container">
           <label for="category">카테고리 분류</label><br>
	       <input type="text" name="getCategory" style="width: 350px;" value='<c:out value="${getCategory }"/>' readonly="readonly">
       </div>
		<div class="container">
			<label for="itemContent">상품 상세정보</label><br>
			<textarea name="itemContent" id="itemContent" style="height: 200px; width: 350px"><c:out value="${item.itemContent }" /></textarea>
		</div>
		<div class="container">
			<label for="price">판매가격</label> 
			<input type="text" name="price" id="price" value='<c:out value="${item.price }"/>'> <br> 
			<label for="normPrice">정상가격</label> 
			<input type="text" name="normPrice" id="normPrice" value='<c:out value="${item.normPrice }"/>'>
		</div>
		<div class="container">
			<label for="stock">재고</label> 
			<input type="text" name="stock" id="stock" value='<c:out value="${item.stock }"/>'><br>
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
			<label>상품 특성<small style="opacity:0.75;">(특성을 선택하지 않으면 기본으로 설정 됩니다.)</small></label><br> 
			<input type="hidden" id="chkValue" value='<c:out value="${item.itemChr}"/>'>
			<input type="checkbox" name="itemChr" value="신상품">신상품 
			<input type="checkbox" name="itemChr" value="best">Best 
			<input type="checkbox" name="itemChr" value="할인">할인
			<!-- 아무것도 선택하지 않으면 '기본'으로 값이 됨 -->
            <input type="hidden" name="itemChr" id="itemChrText" >
		</div>
        
        <div class="container">
        	<label>메인 이미지</label>
        	<input type='file' id="itemImg1" name="uploadFile" />
            <div class="select_img1"><img src='/resources/upload/idNo/<c:out value="${item.itemImg1}"/>' /></div>
        </div>
        <div class="container">
        	<label>서브 이미지</label>
        	<input type='file' id="itemImg2" name="uploadFile" />
            <div class="select_img2"><img src='/resources/upload/idNo/<c:out value="${item.itemImg2}"/>' /></div>
        </div>
        <div class="container">
        	<label>서브 이미지</label>
        	<input type='file' id="itemImg3" name="uploadFile" />
            <div class="select_img3"><img src='/resources/upload/idNo/<c:out value="${item.itemImg3}"/>' /></div>
        </div>
        <div class="container">
        	<label>서브 이미지</label>
        	<input type='file' id="itemImg4" name="uploadFile" />
            <div class="select_img4"><img src='/resources/upload/idNo/<c:out value="${item.itemImg4}"/>' /></div>
        </div>
        <div class="container">
        	<label>상품 상세 설명 이미지</label>
        	<input type='file' id="itemImg5" name="uploadFile" />
            <div class="select_img5"><img src='/resources/upload/idNo/<c:out value="${item.imgDetail}"/>' /></div>
        </div>

		<button id="uploadBtn">Modify</button>
		<button type="button" class="btn" data-oper='remove'>Remove</button>
		<button type="button" class="btn" data-oper='list'>List</button>
	</form>
	
	<script
	  src="https://code.jquery.com/jquery-3.5.1.js"
	  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	  crossorigin="anonymous"></script>
	<script type="text/javascript">
		
		var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif)$");
    	var maxSize = 5242880;
    	
    	function checkExtension(fileName, fileSize) {
    		
    		if(fileSize >= maxSize) {
    			alert("파일 사이즈 초과");
    			return false;
    		}
    		
    		if(!regex.test(fileName)) {
    			alert("이미지만 업로드 가능합니다!");
    			return false;
    		}
    		return true;
    	}
    	    	
    	// 사진 보이기
    	for(let i=1; i<=5; i++) {
			$("#itemImg"+i).change(function(){
				if(this.files && this.files[0]) {
					var reader = new FileReader;
				    
					reader.onload = function(data) {
				    	$(".select_img"+i+" img").attr("src", data.target.result).width(500);        
				    }
				    reader.readAsDataURL(this.files[0]);
				}
			});
    	}
    	
		// 등록
		$("#uploadBtn").on("click", function(e) {
			
			if(!$('#mainCateg > option:selected').val()) {
			    alert("대분류가 선택되지 않았습니다.");
			    $('#mainCateg').focus();
			    return false;
			}else if(!$('#midCateg > option:selected').val()) {
			    alert("중분류가 선택되지 않았습니다.");
			    $('#midCateg').focus();
			    return false;
			}else if($('#itemName').val()=='') {
				alert('상품명이 입력되지 않았습니다.');
				$('#itemName').focus();
				return false;
			}else if($('#itemContent').val()==''){
				alert('상품 상세 정보가 입력되지 않았습니다.');
				$('#itemContent').focus();
				return false;
			}else if($('#price').val()=='')	{
				alert('판매가가 입력되지 않았습니다.');
				$('#price').focus();
				return false;
			}else if($('#normPrice').val()==''){
				alert('정상가가 입력되지 않았습니다.');
				$('#normPrice').focus();
				return false;
			}else if($('#stock').val()==''){
				alert('재고가 입력되지 않았습니다.');
				$('#stock').focus();
				return false;
			}else if($("#itemImg1").val() == "") {
				alert("메인 이미지가 첨부되어 있지 않습니다.");
				return false;
			}else if($("#itemImg2").val()=="" || $("#itemImg3").val() == "" || $("#itemImg4")=="") {
				alert("서브 이미지는 모두 첨부 되어야 합니다.");
				return false;
			}else if($("#itemImgDetail").val() == "") {
				alert("상품 상세 이미지가 첨부되어 있지 않습니다.");
				return false;
			}else if($("input[type=checkbox][name=itemChr] : checked" == false)) {
				$("#itemChrText").val('기본');
			}
			
			/* 이미지 체크 */
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			console.log(files);
			
			for(var i=0; i<files.length; i++) {
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$("form").submit();	// ajax로 수정해야 할지?
		});
		
		
		$(document).ready(function(){
			var formObj = $("form");
			
			// 각 버튼(지우기, 리스트로 돌아가기)
			$('.btn').on("click", function(e) {
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