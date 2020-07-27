<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
    <title>Admin Page</title>
<%-- <%@include file="../includes/header.jsp" %> --%>
<style>
	#activeImg img{
		height : 170px;
		width : 700px;
		padding-bottom : 30px;
	}
</style>
<body>
    <div class="banner_content">
        <div class="banner_wrap">
            <div class="side">
                <div class="1nb_list">
                    <div class="banner_side_tit">
                        	배너관리
                    </div>
                    <div class="banner_side_menu">
                        <ul class="banner_menu">
                            <li><a href='#'><i class="fa fa-check" ></i>메인 배너</a></li>
                            <li><a href='#'><i class="fa fa-check" ></i>제철 상품</a></li>
                            <li><a href='#'><i class="fa fa-check" ></i>이벤트</a></li>
                        </ul>
                    </div>
                </div>

            </div>

            <div class="banner_main">
                <div class="banner_tit">
                    <p><b><i class="fa fa-list-alt"></i>배너 관리</b></p>
                </div>
                <p style='opacity:0.75;'>이미지 규격 : 1000*220</p>
                <div class="uploadDiv">
                	<input type="file" name="uploadFile" multiple>
                	<button id="uploadBtn">등록하기</button>
                </div>
                <div class="uploadResult">
                	<ul>
                	
                	</ul>
                </div>
                
               	<label>현재 등록된 이벤트 이미지</label><br>
                <div id="activeImg">
                	<c:forEach items="${event }" var="event">
		           		<img class="banner" alt="" src='/resources/banner/<c:out value="${event.imgPath}"/>/<c:out value="${event.uuid}"/>_<c:out value="${event.imgName}"/>' >
		           		<button>삭제</button>
		           	</c:forEach>
                </div>
             </div>
            <!-- banner_main  -->
        </div>
        <!-- banner_wrap -->
    </div>
    <!-- banner_content -->

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
    			return true;
    		}
    		
    		var cloneObj = $(".uploadDiv").clone();
    		
    		$("#uploadBtn").on("click", function(e) {
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
    			
    			$.ajax({
    				url : '/admin/eventBanner',
    				processData : false,
    				contentType : false,
    				data : formData,
    				type : 'POST',
    				dataType : 'json',
    				success : function(result) {
    					console.log(result);
    					
    					showUploadedFile(result);
    					
    					$(".uploadDiv").html(cloneObj.html());
    				}
    			}); // $.ajax
    		}); // uploadBtn click event
    		
    		var uploadResult = $(".uploadResult ul");
    		function showUploadedFile(uploadResultArr) {
    			var str = "";
    			
    			$(uploadResultArr).each(function(i, obj) {
	    			var fileCallPath = encodeURIComponent(obj.imgPath + "/" + obj.uuid + "_" + obj.imgName);
    				str += "<li><img src='/admin/display?imgName=" + fileCallPath + "'></li>";
    			});
    			
    			
    			uploadResult.append(str);
    		}
    	});
	</script>
</body>
</html>