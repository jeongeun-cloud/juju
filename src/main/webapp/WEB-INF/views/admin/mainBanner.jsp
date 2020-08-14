<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
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
   		.gallery {
	    	float:left;
	    	padding-bottom : 30px;
	    	padding-right : 33px;
	    	text-align : center;
	    }
	    #activeImg {
	    	width : 1200px;
	    	text-align : center;
	    	margin : 0 auto;
	    	padding-left : 100px;
	    }
	    #activeImg img{
			width:500px;
   			height:300px;
			margin-bottom : 10px;
		}
		#banner_la {
			font-size:17px;
			cursor : auto;
			margin : 20px 0;
		}
		#resultDiv {
			margin:20px 0;
		}
		
		#resultDiv img {
			width:500px;
   			height:300px;
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
	                <h2 class="text-1 fl">메인 배너</h2>
	            </div>
	            <div class="formBody row form" style="text-align:center;">
	                <div class="column">
		                <p style="font-size:17px;">메인 슬라이더 이미지는 최대 4개까지 가능합니다.</p><br>
		                <p style='opacity:0.75;'>이미지 규격 : </p>
		                <div class="uploadDiv">
		                	<input type="file" name="uploadFile" multiple>
		                </div>
		                <div class="uploadResult">
		                	<ul>
		                	
		                	</ul>
		                </div>
		                
		                <input type="hidden" id="idNo" value='<c:out value="${sessionMember.idNo}"/>' >
		                <label id="banner_la">현재 등록된 메인배너 이미지</label>
		                <div id="activeImg">
		                	<input type="hidden" id="imgLen" value='<c:out value="${fn:length(main)}"/>'>
		                	<c:forEach items="${main }" var="main">
		                		<div class="gallery">
					           		<img class="banner" alt="" src='/resources/banner/<c:out value="${main.imgPath}"/>/<c:out value="${main.uuid}"/>_<c:out value="${main.imgName}"/>' ><br>
					           		<button id='removeBtn' class="btnSave bg-1 text-fff text-bold" data-oper='<c:out value="${main.imgNo}"/>'>삭제</button><br><br>
					           	</div>
				           	</c:forEach>
		                </div>
	                </div>
	            </div>
		        
            </div>
            <!-- END CONTAINER  -->
        </div>
    </div>

    <script src="../resources/js/admin.js"></script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		
    		var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|PNG|JPG)$");
    		var maxSize = 5242880;
    		
    		function checkExtension(fileName, fileSize) {
    			if(fileSize >= maxSize) {
    				alert("파일 사이즈 초과입니다.");
    				return false;
    			}
    			
    			if(!regex.test(fileName)) {
    				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
    				return false;
    			}
    			if($("#imgLen").val() >= 4) {
    				alert("4개 이상의 메인 이미지를 등록할 수 없습니다. 먼저 삭제 한 후 시도해주세요.");
    				return false;
    			}
    			return true;
    		}
    		
    		var cloneObj = $(".uploadDiv").clone();
    		
    		$("input[type='file']").change(function(e) {
    			var formData = new FormData();
    			var inputFile = $("input[name='uploadFile']");
    			var files = inputFile[0].files;
    			var idNo = $("#idNo").val();
    			
    			console.log(files);
    			
    			for(var i=0; i<files.length; i++) {
    				if(!checkExtension(files[i].name, files[i].size)) {
    					return false;
    				}
    				formData.append("uploadFile", files[i]);
    				formData.append("idNo", idNo);
    			}
    			
    			$.ajax({
    				url : '/admin/mainBanner',
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
    		}); 
    		
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
    		
    		$(".uploadResult").on("click", "button", function(e) {
    			var targetFile = $(this).data("file");
    			var type = $(this).data("type");
    			var imgNo = $(this).data("no");
    			
    			var targetLi = $(this).closest("li");
    			
    			$.ajax({
    				url : '/admin/deleteFile',
    				data : {fileName : targetFile, type : type, bannerType : 'main', imgNo : imgNo},
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
    	});
	</script>
</body>
</html>