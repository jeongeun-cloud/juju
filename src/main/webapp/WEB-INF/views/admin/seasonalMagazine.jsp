<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	li{
       list-style: none;
       
   	}
   	body{
       color: #303030;
   	}
   	a{
       text-decoration: none;
       color: #303030;
       font-size: 17px;
   	}
   	table {
		border-collapse: collapse;
		width: 90%;
		margin-left: 50px;
	}
    th, td {
        padding: 8px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: #ffc30b;
        color: white;
        text-align: left;
        height: 40px;
        text-align:center;
    }
    
    tr:hover {
        background-color: #f5f5f5;
    }
    
    textarea {
    	width:900px;
    	height : 300px;
    	resize : none;
    }
    
    .seasonal_table{
        margin-bottom: 20px;
    }
    
    .check {
        height: 30px;
        left: 30%;
    }
   	.banner_content{
       width: 1300px;
       height: 3000px;
       margin:0 auto;
       border: solid;
   	}
   	.banner_wrap{
      position: relative;
      display: inline-block;
      padding-top: 30px;
      background-color: cornsilk;
   	}
   
   	.side{
       width: 200px;
       height: 500px;
       background-color: white;
       float: left;
       margin-right: 90px;
       border:solid;
       
   	}
   	.banner_main{
       float:  right;
       width: 1000px;
       height: 1000px;
       background-color: white;
   	} 
   	.banner_side_tit{
       padding-top: 12px;
       padding-bottom:12px ;
       text-align: center;
       width: 100%;
       background-color: #ffc30b;
       font-size: 20px;
       font-weight: 900;
   	}
   	
   .banner_main .banner_tit{
       font-size: 30px;
       margin-bottom:20px;
   }
   
   #regBtn, #deleBtn, #addColumnBtn, #modifyColumnBtn{
        float:right;
        margin-right: 30px;
        margin-top : 5px;
        background-color: #ffc30b; 
        border: none;
        color: white;
        padding: 8px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 15px;
        transition-duration: 0.4s;
        cursor: pointer;
        font-weight: 900;
    }
    #regBtn:hover, #deleBtn:hover, #addColumnBtn:hover, #modifyColumnBtn:hover{
	    background-color: white; 
	    color: #ffc30b; 
	    border: 2px solid #ffc30b;
	    outline: none; 
    }
    
    .gallery {
    	float:left;
    	padding-bottom : 30px;
    	padding-right : 33px;
    	text-align : center;
    }
    
    .select_img1, .select_img2 {
    	margin : 10px;
    }
    
/*     .select_img1 img, .select_img2 img {
    	width : 300px;
    	height: 200px;
    	margin : 10px;
    } */
   
	#activeImg img{
		height : 200px;
		width : 300px;
		margin-bottom : 10px;
	}
	
	.page_num {
    	display: inline-block;
    	padding-left:70%;
    }
    
    .page_num a{
     	color: black;
    	float: left;
    	padding: 8px 16px;
    	text-decoration: none;
    }
    .pagination a:hover:not(.active) {
	    background-color: #f6dd90;
	    border-radius: 50%;
    }
    .regi_la{
        font-size: 20px;
        font-weight: 900;
    }
    .serch {
        margin-left: 50px;
        margin-bottom: 10px;
    }
    .default_btn{
	    background-color: #ffc30b;
	    border: solid #ffc30b;
	    border-radius:10px;
	    color:white;
    }
</style>
<body>
<%@include file="./idCheck.jsp" %>
<%@include file="../includes/header.jsp" %>
    <div class="banner_content">
        <div class="banner_wrap">
        
            <!-- side 시작 -->
		   	<div class="side">
		      <div class="1nb_list">
		         <div class="banner_side_tit">관리자 페이지</div>
		           <div class="banner_side_menu">
		               <ul class="banner_menu">
		                    <p><a href='/admin/index'><b>JUJU 현황</b></a></p>
		                    <p><b>배너관리</b></p>
			                    <li><a href='/admin/mainBanner'><i class="fa fa-check" ></i> 메인 배너</a></li>
	                            <li><a href='/admin/advertise'><i class="fa fa-check" ></i> 중간 광고</a></li>
	                            <li><a href='/admin/seasonalMagazine'><i class="fa fa-check" ></i> 제철 페이지</a></li>
	                            <li><a href='/admin/eventBanner'><i class="fa fa-check" ></i> 이벤트</a></li>
		                    <br>
		                    <p><b>회원관리</b></p>
			                   	<li><a href='/admin/memberManage'><i class="fa fa-check" ></i> 회원 리스트</a></li>
			                    <li><a href='/admin/memberStat'><i class="fa fa-check" ></i> 회원 현황</a></li>
			                    <li><a href='#'><i class="fa fa-check" ></i> 상인 승인</a></li>
			                    <li><a href='/admin/withdraw'><i class="fa fa-check" ></i> 탈퇴 사유</a></li>
			                     <li><a href='/admin/QnaList'><i class="fa fa-check" ></i> 1:1 문의</a></li>
		                </ul>
		           </div>
		     	</div>
		     	<!-- 1nb_list -->
		  	</div>
			<!-- side 끝-->

            <div class="banner_main">
            <div class="banner_tit">
            	<button id="regBtn">다담기 상품으로 등록</button>
            	<p><b><i class="fa fa-list-alt"></i> 상품 고르기</b></p>
            </div>
            
            <div class="search_bar">
	            <form id="searchForm" action="/admin/seasonalMagazine" method="get">
	                <div class="serch">
	                    <label class="regi_la">상품검색</label>
	                    <select name='type'>
	                        <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" /> >----</option>
	                        <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>상품명</option>
	                        <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }" />>상품설명</option>
	                        <option value="NC" <c:out value="${pageMaker.cri.type eq 'NC'? 'selected':'' }" />>상품명 or 상품설명</option>
	                    </select>
	                    
	                    <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
	                    <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	                    <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	                    <button class="default_btn">검색</button>
	                </div>
	            </form>
	        </div>
	        
		        <!-- 등록전 상품 갯수 -->
                <input type="hidden" id="itemLen" value='<c:out value="${fn:length(list)}"/>'><br>
            
                <div class="seosonal_table">
                    <table tit aria-setsize="500px">
                        <thead>
                            <tr>
                                <th><input type="checkbox" name="chkAll" id="chkAll"></th>
                                <th>상품명</th>
                                <th>판매 가격</th>
                                <th>정상 가격</th>
                                <th>상점 명</th>
                            </tr>
                        </thead>
                        
                        <c:forEach items="${list }" var="list">
                            <tr>
                                <td><input type="checkbox" name="chk" value='<c:out value="${list.itemCode }" />'></td>
                                <td>
                                    <a class='move' href='/product/item?itemCode=<c:out value="${list.itemName }" />' >
                                        <c:out value="${list.itemName }" /> 
                                    </a>
                                </td>
                                <td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}" />원</td>
                                <td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.normPrice}" />원</td>
                                <td><c:out value="${list.shopName }" /></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

                 <div class='page_num'>
                    <ul class="pagination">
                        <c:if test="${pageMaker.prev}">
                            <li class="paginate_button previous">
                                <a href="${pageMaker.startPage -1}">&laquo;</a>
                            </li>
                        </c:if>

                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            <li class='paginate_button ${pageMaker.cri.pageNum == num ? " active" : "" } '>
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
                <!-- end pagination -->
                    
                 <form id='actionForm' action="/admin/seasonalMagazine" method='get'>
                    <input type='hidden' name='pageNum' id="pageNum" value='${pageMaker.cri.pageNum}'>
                    <input type='hidden' name='amount' id="amount" value='${pageMaker.cri.amount}'>
                    <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>' >
                    <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>' >
                </form>
                
                
                <div class="banner_tit">
	            	<button id="deleBtn">다담기 상품에서 제거</button>
	            	<p><b><i class="fa fa-list-alt"></i> 다담기로 등록된 상품</b></p>
            	</div>
            	
                <!-- 등록 된 상품 개수 -->
                <input type="hidden" id="resultLen" value='<c:out value="${fn:length(seasonItemResult)}"/>'>
                <div class="seosonal_table">
                    <table tit aria-setsize="500px">
                        <thead>
                            <tr>
                                <th><input type="checkbox" name="chkAllSeason" id="chkAllSeason"></th>
                                <th>상품명</th>
                                <th>판매 가격</th>
                                <th>정상 가격</th>
                                <th>상점 명</th>
                            </tr>
                        </thead>
                        
                        <c:forEach items="${seasonItemResult }" var="seasonItemResult">
                            <tr>
                                <td><input type="checkbox" name="chkSeason" value='<c:out value="${seasonItemResult.itemCode }" />'></td>
                                <td>
                                    <a class='move' href='/product/item?itemCode=<c:out value="${seasonItemResult.itemName }" />'>
                                        <c:out value="${seasonItemResult.itemName }" />
                                    </a>
                                </td>
                                <td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${seasonItemResult.price}" />원</td>
                                <td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${seasonItemResult.normPrice}" />원</td>
                                <td><c:out value="${seasonItemResult.shopName }" /></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                
                <div class="banner_tit" style='margin-top:50px;'>
                    <p><b><i class="fa fa-list-alt"></i> 제철 이미지 컬럼쓰기</b></p>
                </div>
                
                <input type="hidden" id="columnLen" value='<c:out value="${fn:length(column)}"/>'>
                <form id="addColumn" action="/admin/addColumn" method="POST" enctype="multipart/form-data">
	                <input type="hidden" name="idNo" id="idNo" value='<c:out value="${sessionMember.idNo}"/>' >
		                <div id="colDiv" style="text-align:center;">
		               		<p>첫 번째 컬럼 내용쓰기</p>
		                    <input type="file" id="img1" name="addImg"><br>
		                    <div class="select_img1">
		                    	<img src="" />
		                    </div>
		                    <textarea id="column1" name="column1"></textarea><br>
		               		<p>두 번째 컬럼 내용쓰기</p>
		                    <input type="file" id="img2" name="addImg"><br>
		                    <div class="select_img2">
		                    	<img src="" />
		                    </div>
		                    <textarea id="column2" name="column2"></textarea>
		                    <input type="hidden" name="type" id="type" value="">
		                	<button id="addColumnBtn" style="float:none;">등록하기</button>
		                	<button id="modifyColumnBtn" style="float:none; display:none;">수정하기</button>
		                </div>
	            </form>
                
                <div class="banner_tit" style='margin-top:50px;'>
                    <p><b><i class="fa fa-list-alt"></i> 제철 이미지 갤러리</b></p>
                </div>
                <p>제철 갤러리 이미지는 최대 6개까지 가능합니다.</p><br>
                <p style='opacity:0.75;'>이미지 권장 규격 : 500 * 330</p>
                <div class="uploadDiv">
                	<input type="file" name="uploadFile" multiple>
                	<!-- <button id="uploadBtn">등록하기</button> -->
                </div>
                <div class="uploadResult">
                	<ul>
                	
                	</ul>
                </div>

                <input type="hidden" id="idNo" value='<c:out value="${sessionMember.idNo}"/>' >
               	<label>현재 등록된 제철 이미지 갤러리</label><br>
                <div id="activeImg">
                	<input type="hidden" id="imgLen" value='<c:out value="${fn:length(seasonal)}"/>'>
                	<c:forEach items="${seasonal }" var="seasonal">
                		<div class="gallery">
			           		<img class="banner" alt="" src='/resources/banner/<c:out value="${seasonal.imgPath}"/>/<c:out value="${seasonal.uuid}"/>_<c:out value="${seasonal.imgName}"/>' ><br>
			           		<button id='removeBtn' data-oper='<c:out value="${seasonal.imgNo}"/>'>삭제</button>
			           	</div>
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
	    			str += "<li><div>";
	    			str += "<span>" + obj.imgName + "</span>";
	    			str += "<button type='button' data-no='"+ obj.imgNo +"' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
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