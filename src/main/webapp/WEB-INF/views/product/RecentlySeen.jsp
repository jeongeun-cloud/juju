<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
        #recentBoxContainer {
            width: 100px;
            top:40%;
            background-color: white;
            position: sticky;
            border:1px solid lightgrey;
        	text-align: center;
        	z-index: 10;
        }
        
        #recentBox {
            width: 100px;
            height: 350px;
        	position: relative;
        	text-align: center;
        }
        
        #recentMoveBox {
            width: 100px;
            height: 300px;
        	position: absolute;
        	top: 0%;
        	text-align: center;
        }
        
        .recentMove{
        	font-size: 20px;
        	cursor: pointer;
        	text-decoration: none;
        	outline: none;
        }
        
        #prev #next{
          margin: 10px 0px;
          text-align: center;
          color: #8FA691;
          font-weight: bold;
        }
        #recentImgBoxContainer{
        	margin: 10px 0px;
        	position: absolute;
        	top: 50px;
        }
        
        
        
        .recentImgBox img {
        	margin-top: 10px;
        	width: 90%;
        }
        
        .recentImgBox {
        	display: none;
        }
        
        #recentlyBoxRoad {
        	height: 2500px;
        	float: right;
        	position: absolute;
        	margin-left: 90%;
        	margin-top: 200px;
        }
        
        
    </style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>


<div id="recentlyBoxRoad">
     <!-- 최근 본 상품 박스 -->
	 <div id="recentBoxContainer">
	 	<div id="recentBox">
	 	<div id="recentMoveBox">
	 	<h4>최근본상품</h4>
	 	<a class="recentMove" id="prev">∧</a>
		<div id="recentImgBoxContainer">
	 	<c:set var="num" value="0">
	 	</c:set>
	 	<c:forEach items="${recentlySeen}" var="recentItem">
	 	<div class="recentImgBox" id="recent${num}">
	 	<c:set var="num" value="${num+1}"/>
	 		<a href="/product/item?itemCode=${recentItem.itemCode}">
	 			<img src="/resources/upload/<c:out value="${recentItem.idNo}"/>/<c:out value="${recentItem.itemImg1}"/>">
	 		</a>
	 	</div>
		</c:forEach>
	 	<a class="recentMove" id="next">∨</a>
		</div>
		</div>
		</div>
    </div>

</div>
    
    
    
<script>
    $(document).ready(function(){
    	var recentImgBox = $(".recentImgBox");
    	var moveBtn = $(".recentMove");
    	var minSize = 1;
    	var maxSize = recentImgBox.length-1;
    	var currentSize = recentImgBox.length-1;
    	
    	console.log("현재 사이즈: " + currentSize);
    	
    	$(recentImgBox[currentSize]).css("display", "block");
    	$(recentImgBox[currentSize-1]).css("display", "block");
    	
    	$(moveBtn[0]).click(function(e){
    		e.preventDefault();
    		prev();
    	});
    	
    	$(moveBtn[1]).click(function(e){
    		e.preventDefault();
    		next();
    	});
    	
    	
    	function prev() {
    		if(currentSize==minSize) return false;
    		recentImgBox.css("display", "none");
    		currentSize -= 1;
    		console.log("현재 사이즈: " + currentSize);
        	$(recentImgBox[currentSize]).css("display", "block");
        	$(recentImgBox[currentSize-1]).css("display", "block");
    	}
    	
    	function next() {
    		if(currentSize==maxSize) return false;
    		recentImgBox.css("display", "none");
    		currentSize += 1;
    		console.log("현재 사이즈: " + currentSize);
        	$(recentImgBox[currentSize]).css("display", "block");
        	$(recentImgBox[currentSize-1]).css("display", "block");
    	}
    });
</script>
    
</body>



</html>