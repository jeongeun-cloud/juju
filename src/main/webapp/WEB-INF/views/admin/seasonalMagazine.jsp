<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.css">
    <link rel="stylesheet"  href="../resources/css/admin.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.js"></script>
   	
   	<style>
		.move:hover {
			color : #8FA691;
		}
		textarea {
			resize : none;
			width : 450px !important;
			height : 200px;
			min-height : 0 !important;
		}
		.col {
			display:inline-block;
			margin : 20px 0;
		}
		.season_la {
			font-size : 17px;
			cursor : auto;
		}
		#pagination {
			margin-top : 5px;
			margin-bottom : 20px;
		}
		
		.gallery {
	    	float:left;
	    	padding-bottom : 30px;
	    	padding-right : 33px;
	    	text-align : center;
	    }
	    #activeImg {
	    	margin-top : 20px;
	    	width : 1000px;
	    	text-align : center;
	    	margin : 0 auto;
	    }
	    #activeImg img{
			height : 200px;
			width : 300px;
			margin-bottom : 10px;
		}
		
	    #modifyColumnBtn, #addColumnBtn {
	    	margin-bottom : 20px;
	    }
	    
	    #resultDiv {
			margin:20px 0;
		}
		#resultDiv img {
			height : 300px;
			width : 450px;
		}
	</style>
</head>
<body>
<%@include file="./idCheck.jsp" %>
	<div class="container">
        <%@include file="./adminSideBar.jsp" %>
            <div class="mainArea">
            
                <!-- BEGIN NAV -->
                <nav class="navTop row">
                    <div class="menuIcon fl"><span class="fa fa-bars"></span></div>
                    <div class="account fr">
                        <div class="name has-submenu"><c:out value="${sessionMember.idNo}"/><span class="fa fa-angle-down"></span></div>
                        <ul class="accountLinks submenu">
                            <li><a href="/">View website</a></li>
                            <li><a href="/member/logout">Log out<span class="fa fa-sign-out fr"></span></a></li>
                        </ul>
                    </div>
                </nav>
                <!-- END NAV -->
                
                <!-- CONTAINER  -->
                <div class="mainContent">  
                
                

		        <!-- DETAIL FORM -->
	            <div class="formHeader row">
	                <h2 class="text-1 fl">제철 매거진 등록</h2><br><br>
	                <label class="season_la"><i class="fa fa-list-alt"></i> 상품 고르기</label> 
	                
	                <!-- 검색 -->
	                <div class="search_bar">
	                    <form id="searchForm" class="formSearch fl" action="/admin/seasonalMagazine" method="get">
	                        <div class="search">
	                            <select name='type'>
			                        <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" /> ></option>
			                        <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>상품명</option>
			                        <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }" />>상품설명</option>
			                        <option value="NC" <c:out value="${pageMaker.cri.type eq 'NC'? 'selected':'' }" />>상품명 or 상품설명</option>
			                    </select>
			                    
			                    <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	                            <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	                            <input class="inputSearch" placeholder="Search" type="text" name="keyword" value="${pageMaker.cri.keyword }">
	                            <button class="btnSearch"><i class="fa fa-search"></i></button>
	                        </div>
	                    </form>
	                </div>
	                
	                <div class="fr">
	                  <button id="regBtn" class="btnSave bg-1 text-fff text-bold fr">다담기 상품으로 등록</button>
	                </div>
	            </div>
	            <div class="table form">
	                <div class="row bg-1">
	                    <div class="cell cell-50 text-center text-fff"><input type="checkbox" name="chkAll" id="chkAll"></div>
	                    <div class="cell cell-100p text-center text-fff">상품명</div>
	                    <div class="cell cell-100 text-fff text-right">판매가격</div>
	                    <div class="cell cell-100 text-fff text-right">정상가격</div>
	                    <div class="cell cell-200 text-center text-fff">상점명</div>
	                </div>
	                
	            	<!--   BEGIN LOOP -->
	            	<input type="hidden" id="itemLen" value='<c:out value="${fn:length(list)}"/>'>
	                <ul>
	                	<c:forEach items="${list }" var="list">
			               <li class="row cellRow">
			               	  <div class="cell cell-50 text-center"><input type="checkbox" name="chk" value='<c:out value="${list.itemCode }" />'></div>
			                  <div class="cell cell-100p text-center">
			                  	<a class='move' href='/product/item?itemCode=<c:out value="${list.itemCode }" />' >
                                       <c:out value="${list.itemName }" /> 
                                   </a>
			                  </div>
			                  <div class="cell cell-100 text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}" />원</div>
			                  <div class="cell cell-100 text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.normPrice}" />원</div>
			                  <div class="cell cell-200 text-center"><c:out value="${list.shopName }" /></div>
			               </li>
			            </c:forEach>
			            
	                </ul>
	            	<!--   END LOOP -->
	            	
			        <!-- begin pagination -->
			        <div id="pagination" class='page_num'>
	                    <ul class="pagination list-inline text-right">
	                        <c:if test="${pageMaker.prev}">
	                            <li class="paginate_button previous">
	                                <a href="${pageMaker.startPage -1}">&laquo;</a>
	                            </li>
	                        </c:if>
	
	                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                            <li class='paginate_button ${pageMaker.cri.pageNum == num ? " is-active" : "" } '>
	                                <a href="${num}">${num}</a>
	                            </li>
	                        </c:forEach>
	
	                        <c:if test="${pageMaker.next}">
	                            <li class="paginate_button next">
	                                <a href="${pageMaker.endPage +1 }">&raquo;</a>
	                            </li>
	                        </c:if>
	                    </ul> 
	                </div>
	            </div>
	            
                 <form id='actionForm' action="/admin/seasonalMagazine" method='get'>
                    <input type='hidden' name='pageNum' id="pageNum" value='${pageMaker.cri.pageNum}'>
                    <input type='hidden' name='amount' id="amount" value='${pageMaker.cri.amount}'>
                    <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>' >
                    <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>' >
                </form>
                <!-- end pagination -->
		        
		        
		        <!-- DETAIL FORM -->
				<form action="" method="GET" name="listForm" class="form">
		            <div class="formHeader row">
		                <label class="season_la"><i class="fa fa-list-alt"></i> 다담기로 등록된 상품</label>  
		                <div class="fr">
		                  <button id="deleBtn" class="btnSave bg-1 text-fff text-bold fr">다담기 상품에서 제거</button>
		                </div>
		            </div>
		            <div class="table">
		                <div class="row bg-1">
		                    <div class="cell cell-50 text-center text-fff"><input type="checkbox" name="chkAllSeason" id="chkAllSeason"></div>
		                    <div class="cell cell-100p text-center text-fff">상품명</div>
		                    <div class="cell cell-100 text-fff text-right">판매가격</div>
		                    <div class="cell cell-100 text-fff text-right">정상가격</div>
		                    <div class="cell cell-200 text-center text-fff">상점명</div>
		                </div>
		                
		            	<!--   BEGIN LOOP -->
		            	<input type="hidden" id="resultLen" value='<c:out value="${fn:length(seasonItemResult)}"/>'>
		                <ul>
		                	<c:forEach items="${seasonItemResult }" var="seasonItemResult">
				               <li class="row cellRow">
				               	  <div class="cell cell-50 text-center"><input type="checkbox" name="chkSeason" value='<c:out value="${seasonItemResult.itemCode }" />'></div>
				                  <div class="cell cell-100p text-center">
				                  	<a class='move' href='/product/item?itemCode=<c:out value="${seasonItemResult.itemCode }" />' >
                                        <c:out value="${seasonItemResult.itemName }" /> 
                                    </a>
				                  </div>
				                  <div class="cell cell-100 text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${seasonItemResult.price}" />원</div>
				                  <div class="cell cell-100 text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${seasonItemResult.normPrice}" />원</div>
				                  <div class="cell cell-200 text-center"><c:out value="${seasonItemResult.shopName }" /></div>
				               </li>
				            </c:forEach>
				            
		                </ul>
		            <!--   END LOOP -->
		            </div>
		        </form>
		        
		        <!-- DETAIL FORM -->
				<form class="form" id="addColumn" style="text-align:center;" action="/admin/addColumn" method="POST" enctype="multipart/form-data">
		            <div class="formHeader row">
		                <label class="season_la" style="float:left;"><i class="fa fa-list-alt"></i> 제철 이미지 컬럼쓰기</label>  
		            </div>
					
					<input type="hidden" id="columnLen" value='<c:out value="${fn:length(column)}"/>'>
	                <input type="hidden" name="idNo" id="idNo" value='<c:out value="${sessionMember.idNo}"/>' >
               		<label class="season_la" style="margin-top:20px;">첫 번째 컬럼 내용쓰기</label>
	                <div id="colDiv">
	               		<div class="col">
		                	<div style="display:inline; float:left;" class="select_img1">
		                    	<img src="" /><br>
			                    <input type="file" id="img1" name="addImg"><br>
		                	</div>
		                	<div style="display:inline;">
			                    <textarea id="column1" name="column1"></textarea><br><br>
		                	</div>
	                	</div>
	                </div>
                	<label class="season_la">두 번째 컬럼 내용쓰기</label>
	                <div id="colDiv">
	               		<div class="col">
		                	<div style="display:inline; float:left;" class="select_img2">
		                    	<img src="" /><br>
			                    <input type="file" id="img2" name="addImg"><br>
		                	</div>
		                	<div style="display:inline;">
			                    <textarea id="column2" name="column2"></textarea><br><br>
		                	</div>
	                	</div>
               	 	</div>
                	<input type="hidden" name="type" id="type" value="">
	                <button id="addColumnBtn" class="btnSave bg-1 text-fff text-bold" style="float:none;">등록하기</button>
	                <button id="modifyColumnBtn" class="btnSave bg-1 text-fff text-bold" style="float:none; display:none;">수정하기</button>
		        </form>
		        
		        
		        <div class="formHeader row">
	                <label class="season_la"><i class="fa fa-list-alt"></i> 제철 이미지 갤러리</label>  
	            </div>
	            <div class="formBody row form">
	                <div class="column" style="text-align:center;">
		                <p style="font-size:17px;">제철 갤러리 이미지는 최대 6개까지 가능합니다.</p><br>
		                <p style='opacity:0.75;'>이미지 규격 : 500 * 330</p>
		                <div class="uploadDiv">
		                	<input type="file" name="uploadFile" multiple>
		                </div>
		                <div class="uploadResult">
		                	<ul>
		                	
		                	</ul>
		                </div>
			                
		                <input type="hidden" id="idNo" value='<c:out value="${sessionMember.idNo}"/>' >
	                	<p style="font-size:17px; margin-top:20px;">현재 등록된 제철 이미지 갤러리</p><br>
		                <div id="activeImg">
		                	<input type="hidden" id="imgLen" value='<c:out value="${fn:length(seasonal)}"/>'>
		                	<c:forEach items="${seasonal }" var="seasonal">
		                		<div class="gallery">
					           		<img class="banner" alt="" src='/resources/banner/<c:out value="${seasonal.imgPath}"/>/<c:out value="${seasonal.uuid}"/>_<c:out value="${seasonal.imgName}"/>' ><br>
					           		<button id='removeBtn' class="btnSave bg-1 text-fff text-bold" data-oper='<c:out value="${seasonal.imgNo}"/>'>삭제</button><br><br>
					           	</div>
				           	</c:forEach>
		                </div>
			        </div>
                </div>
         	</div>
       	</div>
        <!-- END CONTAINER  -->
	</div>


	<script src="../resources/js/admin.js"></script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		
    		var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|PNG|JPG)$");
    		var maxSize = 5242880;
    		
    		// 파일 타입 체크
    		function checkExtension(fileName, fileSize) {
    			if(fileSize >= maxSize) {
    				alert("파일 사이즈 초과입니다.");
    				return false;
    			}
    			
    			if(!regex.test(fileName)) {
    				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
    				return false;
    			}
    			return true;
    		}
    		
    		// 이미지 체크
    	    for(let i=1; i<=2; i++) {
    	    	$("#img"+i).change(function(){   
    	        	var imgFile = $('#img'+i).val();
    	            var fileSize = document.getElementById("img"+i).files[0].size;
    	            
    	            if(!checkExtension(imgFile, fileSize)) {
    	            	$('#img'+i).val("");
    	               	return false;
    	            }
    	            
    	            // 사진 보이기
    	            if(this.files && this.files[0]) {
     	            	var reader = new FileReader;
     	               	reader.onload = function(data) {
     	               		$(".select_img"+i+" img").attr("src", data.target.result).width(300).height(200);
     	                }
     	                reader.readAsDataURL(this.files[0]);
     	            }
    	    	});
    	    }
    		
    	    // 제철 칼럼 등록
    		$("#addColumnBtn").on("click", function(e) {
    			// 유효성 체크 안함
    			$("#type").val("register");
    	        $("#addColumn").submit();
    	    });
    	    
    	    var colLen = $("#columnLen").val();
    	    if(colLen != 0) {
	    	    // 제철 칼럼 버튼 보이기
    	    	$("#addColumnBtn").css("display","none");
    	    	$("#modifyColumnBtn").css("display","");
    	    	
	    	    // 제철 칼럼 내용 가져오기
	    	    var src = "/resources/banner/column/";
	    	    var src1 = src + "${column[0].img1 }";
	    	    var src2 = src + "${column[0].img2 }";
	    	    
	    	    $("#column1").html("${column[0].column1 }".replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
	    	    $("#column2").html("${column[0].column2 }".replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
	    	   	$(".select_img1 img").attr("src", src1).width(300).height(200);
	    	   	$(".select_img2 img").attr("src", src2).width(300).height(200);
    	    }
    	    
    		
    	    // 제철 칼럼 수정
    		$("#modifyColumnBtn").on("click", function(e) {
    			// 유효성 체크 안함
    			$("#type").val("modify");
    	        $("#addColumn").submit();
    	    });
    	    
    	    // 제철 칼럼에 대한 alert
    	    var result = '<c:out value="${result}"/>';
    	    if(result.length > 0) {
    	    	alert("칼럼이 제대로 등록되었습니다.");
    	    }
    		
    		var cloneObj = $(".uploadDiv").clone();
    		
    		// 파일 선택하고 업로드
    		$("input[name='uploadFile']").change(function(e) {
    			var formData = new FormData();
    			var inputFile = $("input[name='uploadFile']");
    			var files = inputFile[0].files;
    			var idNo = $("#idNo").val();
    			
    			console.log(files);
    			
    			for(var i=0; i<files.length; i++) {
    				if(!checkExtension(files[i].name, files[i].size)) {
    					return false;
    				}
    				if($("#imgLen").val() >= 6) {
        				alert("6개 이상의 제철 갤러리 이미지를 등록할 수 없습니다. 먼저 삭제 한 후 시도해주세요.");
        				return false;
        			}
    				formData.append("uploadFile", files[i]);
    				formData.append("idNo", idNo);
    			}
    			
    			$.ajax({
    				url : '/admin/seasonalMagazine',
    				processData : false,
    				contentType : false,
    				data : formData,
    				type : 'POST',
    				dataType : 'json',
    				success : function(result) {
    					console.log(result);
    					alert("정상적으로 등록되었습니다.");
    					showUploadedFile(result);
    					
    					//$(".uploadDiv").html(cloneObj.html());
    				}
    			}); // $.ajax
    		}); // uploadBtn click event
    		
    		// 업로드 한 파일 보이게하기
    		function showUploadedFile(uploadResultArr) {
    			if(!uploadResultArr || uploadResultArr.length == 0) {return; }
    			
    			var str = "";
	    		var uploadUL = $(".uploadResult ul");
    			
    			$(uploadResultArr).each(function(i, obj) {
	    			var fileCallPath = encodeURIComponent(obj.imgPath + "/" + obj.uuid + "_" + obj.imgName);
	    			str += "<li><div id='resultDiv'>";
	    			str += "<span style='font-size:20px; margin-right:10px;'>" + obj.imgName + "</span>";
	    			str += "<button type='button' data-no='"+ obj.imgNo +"' data-file=\'" + fileCallPath + "\' data-type='image' class='btnSave bg-1 text-fff text-bold'><i class='fa fa-times'></i></button><br>";
    				str += "<img src='/admin/display?imgName=" + fileCallPath + "'>";
    				str += "</div></li>";
    			});
    			
    			
    			uploadUL.append(str);
    		}
    		
    		// 업로드한 파일 바로 삭제
    		$(".uploadResult").on("click", "button", function(e) {
    			var targetFile = $(this).data("file");
    			var type = $(this).data("type");
    			var imgNo = $(this).data("no");
    			
    			var targetLi = $(this).closest("li");
    			
    			$.ajax({
    				url : '/admin/deleteFile',
    				data : {fileName : targetFile, type : type, bannerType : 'seasonal', imgNo : imgNo},
    				dataType : 'text',
    				type : 'POST',
    				success : function(result) {
    					if(result == 'deleted') {
    						alert("정상적으로 삭제되었습니다.");
    						location.reload();
    					}else {
    						alert("오류가 생겼습니다. 잠시 후 다시 시도해주세요.");
    					}
    					targetLi.remove();
    				}
    			});	// $.ajax
    		}); // uploadResult on click
    		
    		// 메인에 등록된 파일 삭제
    		$("#activeImg").on("click","button[id='removeBtn']", function(e){
    	        var target = e.target;
    	        var dataFormat = $(target).closest("button");
    	        var imgNo = dataFormat.data("oper");
    	        
    	        var result = confirm("정말로 삭제하시겠습니까? 삭제하면 메인 화면에도 반영됩니다.");
    	        if (result) {
	    	        $.ajax({
	    				url : '/admin/remove',
	    				data : {imgNo : imgNo},
	    				dataType : 'text',
	    				type : 'POST',
	    				success : function(result) {
	    					if(result == 'deleted') {
	    						alert("정상적으로 삭제되었습니다.");
	    						location.reload();
	    					}else {
	    						alert("오류가 생겼습니다. 잠시 후 다시 시도해주세요.");
	    					}
	    				}
	    			});	// $.ajax
    	        }else {
    	        	return false;
    	        }
    		});
    		
    		// 상품 고르기 전체 선택
            $("#chkAll").click(function(){
                 //클릭되었으면
                 if($("#chkAll").prop("checked")){
                     //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                     $("input[name=chk]").prop("checked",true);
                     //클릭이 안되있으면
                 }else{
                     //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                     $("input[name=chk]").prop("checked",false);
                 }
             });
    		
    		// 선택된 애 다담기 상품으로 등록
    		$("#regBtn").on("click", function(){
    			if($("#resultLen").val() >= 10) {
    				alert("다담기 상품은 10개까지 등록 가능합니다.");
    				return false;
    			}
         
	        	var checkRow = "";
	         	$("input[name='chk']:checked").each (function (){
	            	checkRow = checkRow + $(this).val()+"," ;
	         	});
	           	checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
	       
	           	if(checkRow == ''){
	             	alert("등록할 상품을 선택하세요.");
	             	return false;
	           	}
	           	console.log("선택한 아이템 코드 => " + checkRow);
           
	            	$.ajax({
    				url : '/admin/regSeason',
    				data : {itemCode : checkRow},
    				dataType : 'text',
    				type : 'POST',
    				success : function(result) {
    					alert('정상적으로 등록 되었습니다.');
    					location.reload();
    				}
    			});	// $.ajax
    		});
    		
    		// 이미 등록된 상품 전체 선택
            $("#chkAllSeason").click(function(){
                 //클릭되었으면
                 if($("#chkAllSeason").prop("checked")){
                     //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                     $("input[name=chkSeason]").prop("checked",true);
                     //클릭이 안되있으면
                 }else{
                     //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                     $("input[name=chkSeason]").prop("checked",false);
                 }
             });
    		
    		// 선택된 애 다담기 삭제 처리
    		$("#deleBtn").on("click", function(){
         
	        	var checkRow = "";
	         	$("input[name='chkSeason']:checked").each (function (){
	            	checkRow = checkRow + $(this).val()+"," ;
	         	});
	           	checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
	       
	           	if(checkRow == ''){
	             	alert("제거할 상품을 선택하세요.");
	             	return false;
	           	}
	           	console.log("선택한 아이템 코드 => " + checkRow);
           
	            	$.ajax({
    				url : '/admin/deleSeason',
    				data : {itemCode : checkRow},
    				dataType : 'text',
    				type : 'POST',
    				success : function(result) {
    					alert('정상적으로 제거 되었습니다.');
    					location.reload();
    				}
    			});	// $.ajax
    		});
    		
    		// 페이지 이동 
    	    var actionForm = $("#actionForm");
    	    $(".paginate_button a").on("click", function(e) {
    	    	e.preventDefault();
    	         
    	        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    	        actionForm.submit();
    	    });
    		
    		// search
   	      	var searchForm = $("#searchForm");
   	        	$("#searchForm button").on("click", function(e) {
   	           		if(!searchForm.find("option:selected").val()) {
   	              		alert("검색 종류를 선택하세요");
   	               		return false;
   	            	}
   	         
   	            	if(!searchForm.find("input[name='keyword']").val()) {
   	               		alert("키워드를 입력하세요");
   	               		return false;
   	            	}
   	         
   	            	searchForm.find("input[name='pageNum']").val("1");
   	            	e.preventDefault();
   	            
   	            	searchForm.submit();
   	         });
    	});
	</script>
</body>
</html>