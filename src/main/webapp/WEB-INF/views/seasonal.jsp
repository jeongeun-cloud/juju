<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<!--     <link href="/resources/seasonal.css" rel="stylesheet"> -->
    <style>
    	/* 배너 */
    	#activeImg {
    		margin-bottom : 100px;
    	}
		.txt1 {
			margin : 0 0 20px;
			font-size : 30px;
			line-height : 1.2;
			font-weight : 700;
			color : white;
			position : absolute;
		}
		/* 배너 끝 */
		
		.seasonal_pro{
            width: 100%;
        }
		
		/* 첫번 째 칼럼 */
		#column {
			height : 1100px;
		}
		.columnImg {
			width : 40%;
			height : 500px;
			background-color : yellow;
			float : left;
			margin-bottom : 100px;
		}
		.columnText {
			width : 60%;
			height : 500px;
			float : left;
			margin-bottom : 100px;
			background-color : pink;
		}
		/* 첫번 째 칼럼 끝 */
		
		/* 두번 째 그리드 */
		#wrapper {
	        width: 100%;
	        margin-left: 15px;
	    }
	    .grid {
	        width:50%;
	        margin-bottom : 80px;
	        float: left;
	    }
	    .big {
	        margin-bottom : 10px;
	        overflow:hidden;
	        width : 96%;
	    }
	    .mini {
	    	margin-bottom : 10px;
	        overflow:hidden;
	        width : 47%;
	        float : left;
	    }
	    .big img, .mini img {
	        width : 100%;
	        transform: scale(1);
			-webkit-transform: scale(1);
			-moz-transform: scale(1);
			-ms-transform: scale(1);
			-o-transform: scale(1);
			transition: all 0.3s ease-in-out;
	    }
	    .big img:hover, .mini img:hover {
		  transform: scale(1.05);
		  -webkit-transform: scale(1.05);
		  -moz-transform: scale(1.05);
		  -ms-transform: scale(1.05);
		  -o-transform: scale(1.05);
		}
		/* 두번 째 그리드 끝 */
		
		/* 버튼 디자인 */
		#regBtn{
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
	
	    #regBtn:hover{
		    background-color: white; 
		    color: #ffc30b; 
		    border: 2px solid #ffc30b;
		    outline: none; 
	    }
    	/* 버튼 디자인 끝 */
    	
    	/* 다담기 상품 시작 */
		.itemText {
			margin-left : 20px;
			font-size : 15px;
			font-weight : bold;
		}
		#season_item img {
			width : 300px;
			height : 180px;
		}
		#season_item {
			float : left;
			margin : 0 10px;
		}
		
		.add_to_cart {
			border: none;
			background-color: transparent;
		
		}
		
		
		/* 다담기 상품 끝 */
    </style>
</head>
<body>
<%@include file="includes/header.jsp" %>
<%@include file="includes/menuBar.jsp" %> 
<%@include file="./includes/basketSlide.jsp" %>
	<div id="activeImg">
  		<div class="txt1">
  			<p>최고의 품질, 가격, 신선도</p>
  			<p>최고의 품질, 가격, 신선도</p>
  			<p>최고의 품질, 가격, 신선도</p>
  			<p>최고의 품질, 가격, 신선도</p>
  			<p>최고의 품질, 가격, 신선도</p>
  		</div>
  		<img class="banner" src="/resources/images/seasonal_bg2.jpg">
    </div>
    
	<div class="seasonal_pro">
		<div id="column">
			<div class="columnImg" data-aos="fade-right" data-aos-duration="1500">
				크기 조절중 (사진)
			</div>
			<div class="columnText" data-aos="fade-down" data-aos-duration="1500">
				크기 조절중 (텍스트)
			</div>
			<div class="columnText" data-aos="fade-up" data-aos-duration="1500">
				크기 조절중 (텍스트)
			</div>
			<div class="columnImg" data-aos="fade-left" data-aos-duration="1500">
				크기 조절중 (사진)
			</div>
		</div>
		
		<div id="wrapper">
	        <div class="grid">
	            <div class="big">
	                <img id="gallery0" alt="" src="">
	            </div>
	            <div class="mini">
	                <img id="gallery1" alt="" src="">
	            </div>
	            <div class="mini" style="margin-left:18px;">
	                <img id="gallery2" alt="" src="">
	            </div>
	        </div>
	        <div class="grid">
	            <div class="mini">
	                <img id="gallery3" alt="" src="">
	            </div>
	            <div class="mini" style="margin-left:18px;">
	                <img id="gallery4" alt="" src="">
	            </div>
	            <div class="big">
	                <img id="gallery5" alt="" src="">
	            </div>
	        </div>
    	</div>
	</div>
	
	<div class="seasonal_pro">
		<img alt="" src='/resources/images/season_reci.PNG' >
	</div>
	
	<div class="seasonal_pro" style="margin-top:30px;">
		<c:forEach items="${seasonItem }" var="seasonItem">
			<div id="season_item">
		 		<img alt="" src='/resources/upload/<c:out value="${seasonItem.idNo}"/>/<c:out value="${seasonItem.itemImg1}"/>' >
		  		<div class="itemText">
		  			<p><c:out value="${seasonItem.itemName}"/></p>
		  			<p><fmt:formatNumber type="number" maxFractionDigits="3" value="${seasonItem.price}" />원</p>
					<button class="add_to_cart" value="${seasonItem.itemCode}" onclick="addToBasketEvent(this.value)"></button>
		  		</div>
			</div>
			
	 	</c:forEach>
		<button id="regBtn" onclick="allToBasket()">다담기</button>
	</div>
	  	<%-- <c:forEach items="${seasonal }" var="seasonal"> --%>
	 		<%-- <img class="banner" alt="" src='/resources/banner/<c:out value="${seasonal.imgPath}"/>/<c:out value="${seasonal.uuid}"/>_<c:out value="${seasonal.imgName}"/>' > --%>
	 	<%-- </c:forEach> --%>
	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.6/highlight.min.js"></script>
	
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init({
			easing: 'ease-out-back',
			duration: 1000
		});
	</script>
	
	<script>
		hljs.initHighlightingOnLoad();
	
		$('.hero__scroll').on('click', function(e) {
			$('html, body').animate({
				scrollTop: $(window).height()
			}, 1200);
		});
	</script>
	
	<script>
	
		$(document).ready(function() {
			var seasonal = new Array();
	        
	        <c:forEach items = "${seasonal}" var="seasonal">
	        	var json = new Object();
	        	json.uuid = "${seasonal.uuid}";
	        	json.imgPath = "${seasonal.imgPath}";
	        	json.imgName = "${seasonal.imgName}";
	        	seasonal.push(json);
	        </c:forEach>
	        
	        for(var i=0; i<seasonal.length; i++) {
		        var str = '/resources/banner/';
	        	str += seasonal[i].imgPath + "/" + seasonal[i].uuid + "_" + seasonal[i].imgName;
	        	$("#gallery"+i).attr("src", str);
	        }
	        /* if(advertise.length == 1) {
		        var url1 = str + advertise[0].imgPath + "/" + advertise[0].uuid + "_" + advertise[0].imgName;
		        $("#ad_img_1").attr("src", url1);
	        }else {
		        var url1 = str + advertise[0].imgPath + "/" + advertise[0].uuid + "_" + advertise[0].imgName;
		        var url2 = str + advertise[1].imgPath + "/" + advertise[1].uuid + "_" + advertise[1].imgName;
		        $("#ad_img_1").attr("src", url1);
		        $("#ad_img_2").attr("src", url2);
	        } */
		});
	
		// 다담기 기능
		function allToBasket() {
			var recipeItems = document.getElementsByClassName("add_to_cart");
			
			for(var i=0; i<recipeItems.length; i++) {
				
				recipeItems[i].click();
			}
			
			
		}
	
	
	</script>

</body>
</html>