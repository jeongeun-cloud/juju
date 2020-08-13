<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

</head>

<body>
	<%-- <%@include file="./idCheck.jsp" %> --%>
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
				  <form action="" method="GET" name="listForm" class="form">
		            <div class="formHeader row">
		                <h2 class="text-1 fl">상인 승인</h2><br><br>
		                <div class="fr">
		                  <input type="button" id="authorityBtn" value='승인처리' class="btnSave bg-1 text-fff text-bold fr"></button>
		                </div>
		            </div>
		            <div class="table">
		                <div class="row bg-1">

		                    <div class="cell cell-50 text-center text-fff"><input type="checkbox" name="checkAll" id="checkAll"></div>
		                    <div class="cell cell-100p text-center text-fff">상인계정</div>
		                    <div class="cell cell-200 text-center text-fff">이름</div>
		                    <div class="cell cell-200 text-center text-fff">연락처</div>
		                    <div class="cell cell-200 text-center text-fff">승인여부</div>
		                    <div class="cell cell-200 text-center text-fff">상호명</div>
		                    <div class="cell cell-200 text-center text-fff">권한</div>
		                </div>
		            <!--   BEGIN LOOP -->
		                <ul>
		                	<c:forEach items="${list}" var="list">
				               <li class="row cellRow">
				               	  <div class="cell cell-50 text-center"><input type="checkbox" id="checkbox" name="chk" value='<c:out value="${list.idNo }" />'></div>
				                  <div class="cell cell-100p text-center"><c:out value="${list.emailAccount }" /></div>
				                  <div class="cell cell-200 text-center"><c:out value="${list.memName }" /></div>
				                  <div class="cell cell-200 text-center"><c:out value="${list.contact1 }" /></div>
				                  <div class="cell cell-200 text-center"><a style="text-decoration : underline;" href='/admin/authorityget?emailaccount=<c:out value= "${list.emailAccount}"/>'>대기중</a></div>
				                  <div class="cell cell-200 text-center"><c:out value="${list.shopName }" /></div>
				                  <div class="cell cell-200 text-center"><c:out value="${list.memCode }" /></div>
				               </li>
				            </c:forEach>
				            
		                </ul>
			            <!--   END LOOP -->
			        </div>
		        </form>
	    	</div>
	    	<!-- END CONTAINER  -->
        </div>
    </div>
		         
  	<form id ='authorityForm'  action="/admin/authority" method="post">
		<input type='hidden' id = 'idNoval' type ='text' name = 'idNo' value=''>
    </form>
				

	<script src="../resources/js/admin.js"></script>
	<script type='text/javascript'>
	$(document).ready(function(){
	 
		//전체 체크처리	
		$("#checkAll").click(function(){
	
      		if( $("#checkAll").is(':checked') ){
				$("input[name=chk]").prop("checked", true);
			}else{
			    $("input[name=chk]").prop("checked", false);
			}
		});
	    
       //체크된것
		$("#authorityBtn").on("click", function(e) {
			var checkRow ="";
		    var idNorow = "";
	    $("input[name='chk']:checked").each (function (){
	    	  
	    	  checkRow = checkRow + $(this).val()+",";	    	
	    });
		  
	   	idNorow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
	   	
	   	if(idNorow===""){
               alert("승인하실 아이디를 체크해주세요");
               return false;
        } 
		var idNorow =  $("#authorityForm").find("#idNoval").val(idNorow);
     		alert("승인 성공");
		   	$("#authorityForm").submit();
 		});
		
	});
	</script>

         
</body>
</html>