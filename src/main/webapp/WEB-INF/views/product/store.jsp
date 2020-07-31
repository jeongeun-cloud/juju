<%@ page language="java" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8"%>
   
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.store_content{
	    width: 1300px;
	    height: 100%;
	    margin:0 auto;
	}
	
	.store_wrap{
	   position: relative;
	   padding-top: 30px;
	}
	
	.store_pro{
	    width: 1000px;
	    margin: 0 auto;
	}
	#backImg {
        width: 1000px;
        height: 200px;
    }
    #backImg img {
    	width: 1000px;
        height: 200px;
        overflow : hidden;
    }
    #thumbnail {
        width:200px;
        height:200px;
        border-radius:100px;
        position: absolute;
        left: 545px;
        top : 80px;
    }
    #thumbnail img {
    	width:200px;
        height:200px;
        border-radius:100px;
        overflow : hidden;
    }
    #itemContainer {
        width: 1000px;
        margin-top: 50px;
    }
    .item {
        width: 270px;
        height: 370px;
        background-color: teal;
        float: left;
        margin: 30px 30px;
    }
    .item img {
        width: 270px;
        height: 300px;
        overflow: hidden;
    }

    .itemContent {
        height: 70px;
        background-color: violet;
    }
    #shop {
        height: 30px;
        border: solid;
        border-width: thin;
        width: 270px;
        margin-top: 100px;
        margin-left: 358px;
        text-align : center;
    }
    
    li{
        list-style: none;
        float: left;
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
 	
</style>
</head>
<body>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/menuBar.jsp" %>
<%@include file="../includes/basketSlide.jsp" %>

<div class="store_content">
	<div class="store_wrap">
        <div class="store_pro">
        	<div id="backImg">
		    	<img src='/resources/seller/<c:out value="${seller.businessCode}"/>/<c:out value="${seller.backImg}"/>' onError="">
		        <div id="thumbnail">
		        	<img src='/resources/seller/<c:out value="${seller.businessCode}"/>/<c:out value="${seller.thumbImg}"/>' onError="">
		        </div>
		    </div>
		    <div id="shop">
		    	<p><c:out value="${seller.shopName}"/></p>
		    </div>
		
		    <div id="itemContainer">
		    	<c:forEach items="${list }" var="list">
			    	<div class="item">
			    		<a href="/product/item?itemCode=<c:out value='${list.itemCode}'/>" >
			            	<img src="/resources/upload/<c:out value="${list.idNo}"/>/<c:out value="${list.itemImg1}"/>" />
				            <div class="itemContent">
						    	<p><c:out value="${list.itemName}"/></p>
						    	<p><c:out value="${list.price}"/></p>
				            </div>
			            </a>
			        </div>
		        </c:forEach>
		    </div>
		    
		    <!-- 페이징 -->
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
                        
            <form id='actionForm' action="/product/store" method='get'>
                <input type='hidden' name='pageNum' id="pageNum" value='${pageMaker.cri.pageNum}'>
                <input type='hidden' name='amount' id="amount" value='${pageMaker.cri.amount}'>
                <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>' >
                <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>' >
            </form>
		    
        </div>
	</div>
</div>

<script>
	$(document).ready(function(){
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
		   e.preventDefault();
		   
		   actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		   actionForm.submit();
		});
	}
</script>
</body>
</html>