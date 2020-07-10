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
    <h2>상품 등록</h2>
    <form role="form" action="/shop/register" method="POST" enctype="multipart/form-data">
        <div class="container"> 
            <label for="">상품 정보 입력</label><br>
            
            <select class="mainCateg" id="mainCateg">
            	<option value="">대분류 선택</option>
            </select>
            <select class="midCateg" id="midCateg">
            	<option value="">중분류 선택</option>
            </select>
        </div>
        <!-- 분류코드 저장하기 위한 hidden값 -->
        <input type="hidden" name="classCode" id="classCode" >
        
        <input type="text" name="itemName" id="itemName" placeholder="상품명을 입력하세요." style="width: 350px;">
        <div class="container">
            <label for="itemContent">상품 상세정보</label><br>
            <textarea name="itemContent" id="itemContent" style="height: 200px; width:350px"></textarea>
        </div>
        <div class="container">
        	<small style="opacity:0.75;">가격은 1,000원 ~ 1,000,000원 까지만 허용합니다.</small><br>
            <label for="price">판매가격</label>
            <input type="text" name="price" id="price"><br>
            <label for="normPrice">정상가격</label>
            <input type="text" name="normPrice" id="normPrice">
        </div>
        <div class="container">
            <label for="stock">재고</label>
            <input type="text" name="stock" id="stock"><br>
        </div>
        
        <div class="container">
            <label for="status"><b>표시상태 설정</b></label><br>
            <label for="">진열상태</label>
            <input type="radio" name="dispStat" value="진열함" checked="checked">진열함
            <input type="radio" name="dispStat" value="진열안함">진열안함<br>
            <label for="">판매상태</label>
            <input type="radio" name="saleStat" value="판매중" checked="checked">판매중
            <input type="radio" name="saleStat" value="판매중지">판매중지
            <input type="radio" name="saleStat" value="품절">품절
        </div>
        <div class="container">
            <label>상품 특성 <small style="opacity:0.75;">(특성을 선택하지 않으면 기본으로 설정 됩니다.)</small></label><br>
            <input type="checkbox" name="itemChr" value="신상품">신상품
            <input type="checkbox" name="itemChr" value="best">Best
            <input type="checkbox" name="itemChr" value="할인">할인
            <!-- 아무것도 선택하지 않으면 '기본'으로 값이 됨 -->
            <input type="hidden" name="itemChr" id="itemChrText"> 
        </div>
        
        <!-- 파일 업로드 시작 -->
        <div class="container">
        	<label>메인 이미지</label>
            <input type='file' id="itemImg1" name="uploadFile" />
            <div class="select_img1"><img src="" /></div>
        </div>
        <div class="container">
        	<label>서브 이미지</label>
            <input type='file' id="itemImg2" name="uploadFile" />
            <div class="select_img2"><img src="" /></div>
        </div>
        <div class="container">
        	<label>서브 이미지</label>
            <input type='file' id="itemImg3" name="uploadFile" />
            <div class="select_img3"><img src="" /></div>
        </div>
        <div class="container">
        	<label>서브 이미지</label>
            <input type='file' id="itemImg4" name="uploadFile" />
            <div class="select_img4"><img src="" /></div>
        </div>
        <div class="container">
        	<label>상품 상세 설명 이미지</label>
            <input type='file' id="itemImg5" name="uploadFile" />
            <div class="select_img5"><img src="" /></div>
        </div>
        
        <!-- <button type="button" onclick="submitAction();">Submit Button</button> -->
        <!-- <button type="submit">Submit Button</button> -->
        <button id="uploadBtn">Submit Button</button>
        <button type="reset">Reset Button</button>
    </form>
    
 	<script
	  src="https://code.jquery.com/jquery-3.5.1.js"
	  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	  crossorigin="anonymous"></script>
    <script type="text/javascript">
			
		var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif)$");
    	var maxSize = 5242880;
    	
    	function checkExtension(fileType, fileSize) {
    		if(fileSize >= maxSize) {
    			alert("파일 사이즈 초과");
    			return false;
    		}
    		
    		if(!regex.test(fileType)) {
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
			}else if($('#price').val()=='' || $('#price').val() < 1000 || $('#price').val() > 1000000)	{
				alert('유효하지 않은 판매가 입니다.');
				$('#price').focus();
				return false;
			}else if($('#normPrice').val()=='' || $('#normPrice').val() < 1000 || $('#normPrice').val() > 1000000){
				alert('유효하지 않은 정상가 입니다.');
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
			var inputFiles = inputFile[0].files;
			
			for(var i=0; i<inputFiles.length; i++) {
				if(!checkExtension(inputFiles[i].name, inputFiles[i].size)) {
					return false;
				}
				formData.append("uploadFile", inputFiles[i]);
			}
			
			
			$("form").submit();
			/* 
			$.ajax({
				url : '/shop/register',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				//dataType:'json',
				success : function(result) {
					console.log(result);
					
				}
			}); */ // $.ajax
		});
    	
		
		$(document).ready(function(){
	    	// 컨트롤러에서 데이터 받기
	    	var jsonData = JSON.parse('${category}');
			// console.log(jsonData);
			
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
						midObj.classCode = jsonData[i].classCode;
						midObj.item = jsonData[i].item;
						
						midArr.push(midObj);
					}
				}
				
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
					
					/* $("#classCode").val(midArr[i].classCode); */
				 });
	
			});
			
			// 모든 카테고리를 셀렉하면 classCode에 값 주기
			$(document).on("change", "select.midCateg", function() {
		 		var classCode = $(".mainCateg option:selected").val() +''+ $(".midCateg option:selected").val();
				$("#classCode").val(classCode);
			});
			
			// 체크박스 다중 값 저장 후 form submit
			// 이게 없어도 저절로 , 찍혀서 들어가는 이유가 뭐지..?
			/* function submitAction() {
				var checkRow = "";
				$("input[name='chrArr']:checked").each (function (){
					checkRow = checkRow + $(this).val()+"," ;
				});
			  	checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
			 
			  	if(checkRow == ''){
			    	alert("상품특성을 선택하세요.");
			    	return false;
			  	}
			  	//console.log("### checkRow => " + checkRow);
			  	$("#itemChr").val(checkRow);
			  	//location.href="/shop/remove?itemCode="+checkRow;
			  	$("form").submit();
			} */
		});
	

    </script>
</body>
</html>