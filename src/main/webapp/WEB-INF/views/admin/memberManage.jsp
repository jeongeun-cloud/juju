<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		        
		        <!-- 검색 -->
                <div class="search_bar" style="margin-bottom:5px;">
                    <form id="searchForm" class="formSearch fl" action="/admin/memberManage" method="get">
                        <div class="search">
                            <!-- <label class="search_la">검색</label> -->
                            <select name='type'>
                                <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" /> ></option>
                                <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>회원 이름</option>
                                <option value="A" <c:out value="${pageMaker.cri.type eq 'A'? 'selected':'' }" />>회원 계정</option>
                            </select>
                            
                            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                            <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                            <input class="inputSearch" placeholder="Search" type="text" name="keyword" value="${pageMaker.cri.keyword }">
                            <button class="btnSearch"><i class="fa fa-search"></i></button>
                        </div>
                    </form>
                </div><br><br>
		
				<!-- DETAIL FORM -->
	            <div class="formHeader row">
	                <h2 class="text-1 fl">회원 리스트</h2><br><br>
	                <label class="mem_la" style="font-size:17px; cursor:auto;"><i class="fa fa-lightbulb-o"></i> 총 회원수 : <c:out value="${pageMaker.total }"/>명</label>  
	                <div class="fr">
	                  <button  id="regBtn" class="btnSave bg-1 text-fff text-bold fr">블랙 리스트로 등록</button>
	                </div>
	            </div>
	            <div class="table form">
	                <div class="row bg-1">
	                    <div class="cell cell-50 text-center text-fff"><input type="checkbox" name="chkAll" id="chkAll"></div>
	                    <div class="cell cell-100 text-center text-fff">회원이름</div>
	                    <div class="cell cell-100p text-fff">회원계정</div>
	                    <div class="cell cell-100 text-fff">회원유형</div>
	                    <div class="cell cell-100 text-center text-fff">가입일자</div>
	                </div>
	                
	            	<!--   BEGIN LOOP -->
	                <ul>
	                	<c:forEach items="${allMember }" var="allMember">
			               <li class="row cellRow">
			               	  <div class="cell cell-50 text-center"><input type="checkbox" id="idNo" name="chk" value='<c:out value="${allMember.idNo }" />'></div>
			                  <div class="cell cell-100 text-center"><c:out value="${allMember.memName }" /></div>
			                  <div class="cell cell-100p"><c:out value="${allMember.emailAccount }" /></div>
			                  <div class="cell cell-100">
			                  	<c:choose>
									<c:when test="${allMember.memCode eq 'ADMIN'}">관리자</c:when>
									<c:when test="${allMember.memCode eq 'SELLER'}">상인</c:when>
									<c:when test="${allMember.memCode eq 'CUSTOMER'}">일반고객</c:when>
									<c:otherwise>소셜고객</c:otherwise>
							  	</c:choose>
			                  </div>
			                  <div class="cell cell-100 text-center"><fmt:formatDate pattern="yyyy/MM/dd" value="${allMember.condiUpdateDate }" /></div>
			               </li>
			            </c:forEach>
			            
	                </ul>
	            <!--   END LOOP -->
	            </div>
		        
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
                <!-- end pagination -->
                
                <form id='actionForm' action="/admin/memberManage" method='get'>
                    <input type='hidden' name='pageNum' id="pageNum" value='${pageMaker.cri.pageNum}'>
                    <input type='hidden' name='amount' id="amount" value='${pageMaker.cri.amount}'>
                    <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>' >
                    <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>' >
                </form>  
	                
	    	</div>
	    	<!-- END CONTAINER  -->
	    </div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
	<script src="../resources/js/admin.js"></script>
    <script type="text/javascript">
		$(document).ready(function () {
			
			// 페이지 이동 
    	    var actionForm = $("#actionForm");
    	    $(".paginate_button a").on("click", function(e) {
    	    	e.preventDefault();
    	    	
    	        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    	        actionForm.submit();
    	    });
    	    
    	 	// 전체 선택
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
    	 	
    	 	// 블랙리스트 등록
            $("#regBtn").on("click", function(){
         
	        	var checkRow = "";
	         	$("input[name='chk']:checked").each (function (){
	            	checkRow = checkRow + $(this).val()+"," ;
	         	});
	           	checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
	       
	           	if(checkRow == ''){
	             	alert("블랙 리스트로 등록할 회원을 선택해주세요.");
	             	return false;
	           	}
	           	console.log("선택한 회원 id => " + checkRow);
	           	var result = confirm("블랙리스트로 등록 하시겠습니까?");
	           	if (result) {
		            $.ajax({
	    				url : '/admin/regBlack',
	    				data : {idNo : checkRow},
	    				dataType : 'text',
	    				type : 'POST',
	    				success : function(result) {
	    					alert('정상적으로 등록 되었습니다.');
	    					location.reload();
	    				}
	    			});	// $.ajax
	           	}else {
	           		return false;
	           	}
    		});
    	 	
			var blackList = new Array();
	        
	        <c:forEach items = "${blackList}" var="blackList">
	        	blackList.push("${blackList.idNo}");
	        </c:forEach>
	        

	        $('.cellRow').each(function() {
	        	
	        	for(var i=0; i<blackList.length; i++) {
			        var black = blackList[i];
			        
			        if(black == this.children[0].children[0].value) {
			        	this.style.background = "#ffd4d4";
			        }
		        }
	        });
    	    
		});
	
    </script>
</body>
</html>