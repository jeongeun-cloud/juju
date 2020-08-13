<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js"></script>
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
			float : left;
			margin-bottom : 100px;
		}
		.columnImg img {
			width : 100%;
			height : 500px;
		}
		.columnText {
			width : 60%;
			height : 500px;
			float : left;
			margin-bottom : 100px;
		}
		.columnText pre {
			width:100%;
			height : 500px;
			resize : none;
			border : none;
			padding : 30px;
			font-size : 25px;
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
    	
    	/* 레시피 시작 */
    	@import url(https://fonts.googleapis.com/css?family=Work+Sans:400,900,800,500,700,600);

		/* *, *::after, *::before {
			box-sizing: border-box;
		}
		
		html, body {
			font-size: 6px;
			background: #fbfbfb;
			padding: 40px 20px;
			font-family: 'Work Sans', sans-serif;
			-webkit-font-smoothing: antialiased;
			-moz-osx-font-smoothing: grayscale;
		}
		
		@media (min-width: 860px) {
			html, body {
				font-size: 8px;
				padding: 30px 50px;
			}
		}
		
		@media (min-width: 1200px) {
			html, body {
				font-size: 10px;
			}
		} */
		
		.slider-wrapper {
			position: relative;
			width:100%;
			/* max-width: 90rem; */
			min-width: 480px;
			background: #fff;
			margin: 0 auto;
			overflow: hidden;
			box-shadow: 0 0 35px 20px #DDE5EE;
		}
		
		.slider-wrapper .slider {
			position: relative;
			height: 65rem;
			padding: 5rem 0;
		}
		
		.slider-wrapper .slider::after {
			content: "";
			display: table;
			clear: both;
		}
		
		.slider-wrapper .slider .slide-wrapper {
			position: relative;
			display: block;
			width: 100%;
			height: 100%;
		}
		
		.slider-wrapper .slide-navigation__squares, .slider-wrapper .slide-navigation__txt {
			width: 10%;
			position: relative;
			float: left;
			overflow: hidden;
		}
		
		.slider-wrapper .slide-navigation__squares::after, .slider-wrapper .slide-navigation__txt::after {
			content: "";
			display: table;
			clear: both;
		}
		
		.slider-wrapper .slide-navigation__txt {
			display: block;
			height: 100%;
		}
		
		.slider-wrapper .slide-navigation__txt::after {
			content: "";
			display: table;
			clear: both;
		}
		
		.slider-wrapper .slide-navigation__txt ul {
			margin: 0;
			list-style: none;
			padding: 0;
			position: absolute;
			display: table-cell;
			width: 30rem;
			transform: rotate(90deg);
			transform-origin: 0;
			margin-left: calc(50% - 0.14rem);
		}
		
		.slider-wrapper .slide-navigation__txt ul::after {
			content: "";
			display: table;
			clear: both;
		}
		
		.slider-wrapper .slide-navigation__txt li {
			text-transform: uppercase;
			letter-spacing: 0.2rem;
			margin: 0 1.2rem;
			position: relative;
			float: left;
			font-size: 1.2rem;
			font-weight: 600;
			color: #A1A5B8;
		}
		
		.slider-wrapper .slide-navigation__txt li span {
			cursor: pointer;
			transition: all 0.5s ease;
			display: block;
		}
		
		.slider-wrapper .slide-navigation__txt li span.active {
			transform: scale(1.1, 1.1);
			color: #E34D67;
		}
		
		.slider-wrapper .slide-navigation__squares {
			display: block;
			height: 100%;
		}
		
		.slider-wrapper .slide-navigation__squares .squares-wrapper {
			position: absolute;
			margin-left: calc(50% - 0.4rem);
			bottom: 5rem;
			height: 4.6rem;
			overflow: hidden;
		}
		
		.slider-wrapper .slide-navigation__squares .squares-slider {
			position: relative;
			display: block;
			margin-top: -2.5rem;
			transform: translateY(-2.5rem);
		}
		
		.slider-wrapper .slide-navigation__squares .square {
			width: 0.6rem;
			height: 0.6rem;
			display: block;
			margin: 1.3rem 0;
			background: #A1A5B8;
		}
		
		.slider-wrapper .slide-navigation__squares .square.red {
			background: #E34D67;
		}
		
		.slider-wrapper .slides-container {
			position: relative;
			width: 80%;
			float: left;
			height: 100%;
		}
		
		.slider-wrapper .slide {
			position: absolute;
			display: block;
			width: 100%;
			height: 100%;
			opacity: 0;
			visibility: hidden;
			overflow: hidden;
			z-index: 1;
		}
		
		.slider-wrapper .slide img {
			max-width: 100%;
			display: block;
			height: 100%;
			object-fit: cover;
		}
		
		.slider-wrapper .slide .slide-content {
			position: absolute;
			width: 100%;
			height: 100%;
			top: 0;
			left: 0;
			padding: 5rem 5.8rem;
			overflow: hidden;
		}
		
		/* .slider-wrapper .slide .slide-content h1 {
			text-transform: uppercase;
			color: white;
			font-weight: 900;
			font-size: 10rem;
			text-align: center;
			margin: 0;
			opacity: 0.6;
			position: relative;
		} */
		
		.slider-wrapper .slide .slide-content h2 {
			color: #E34D67;
			font-size: 4.8rem;
			max-width: 80%;
			margin: 0;
			/* margin-top: -6rem; */
			left : 50%;
			font-weight: 900;
			line-height: 1;
			position: relative;
		}
		
		.slider-wrapper .slide .slide-txt {
			position: relative;
			display: block;
			left : 50%;
			width: 90%;
			margin-top: 6rem;
		}
		
		.slider-wrapper .slide .slide-txt::after {
			content: "";
			display: table;
			clear: both;
		}
		
		.slider-wrapper .slide .slide-txt p {
			margin: 0;
			max-width: 55%;
			color: #666666;
			font-size: 1.2rem;
			line-height: 1.4;
			float: left;
		}
		
		/* .slider-wrapper .slide .slide-txt button {
			display: block;
			float: right;
			width: 18rem;
			text-align: center;
			background: transparent;
			background-color: transparent;
			border: 0.28rem solid #E34D67;
			text-transform: uppercase;
			padding: 0.8rem 0.5rem;
			font-size: 1.5rem;
			color: #E34D67;
			font-weight: 600;
			letter-spacing: 0.2rem;
			outline: none;
			overflow: hidden;
		} */
    	/* 레시피 끝 */
    	
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
	<!-- 맨 위 배너 -->
	<div id="activeImg">
  		<div class="txt1">
  			<p>최고의 품질, 가격, 신선도</p>
  			<p>최고의 품질, 가격, 신선도</p>
  			<p>최고의 품질, 가격, 신선도</p>
  			<p>최고의 품질, 가격, 신선도</p>
  			<p>최고의 품질, 가격, 신선도</p>
  		</div>
  		<img style="width:100%;" class="banner" src="/resources/images/seasonal_bg2.jpg">
    </div>
    
	<div class="seasonal_pro">
		<c:forEach items="${column }" var="column">
		<div id="column">
			<div class="columnImg" data-aos="fade-right" data-aos-duration="1500">
				<img alt="" src='/resources/banner/column/<c:out value="${column.img1}"/>' >
			</div>
			<div class="columnText" data-aos="fade-down" data-aos-duration="1500">
				<pre id="column1" readonly disabled><c:out value="${column.column1}"/></pre>
			</div>
			<div class="columnText" data-aos="fade-up" data-aos-duration="1500">
				<pre id="column2" readonly disabled><c:out value="${column.column2}"/></pre>
			</div>
			<div class="columnImg" data-aos="fade-left" data-aos-duration="1500">
				<img alt="" src='/resources/banner/column/<c:out value="${column.img2}"/>' >
			</div>
		</div>
		</c:forEach> 
		
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
	
	<!-- 레시피 -->
	<div class="seasonal_pro">
		<div class="slider-wrapper">
		  <div class="slider">
		    <div class="slide-navigation__squares">
		      <div class="squares-wrapper">
		        <div class="squares-slider">
		           <span class="square"></span>
		           <span class="square"></span>
		           <span class="square red"></span>
		           <span class="square "></span>
		           <span class="square"></span>
		          </div>
		      </div>
		      
		    </div>
		    <div class="slides-container">
		      <div class="slide-wrapper">
		        <div class="slide" data-order="1">
		          <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/42764/photo-1428908728789-d2de25dbd4e2.jpeg" alt="" />
		          <div class="slide-content">
		            <!-- <h1>Discover</h1> -->
		            <h2>재료 손질</h2>
		            <div class="slide-txt">
		              <p>The Nordic Countries varied landscapes offer wonderful scenery for any journey, no matter by land or sea.  How you choose to travel will depend on where you go.</p>
		              <!-- <button>Show regions</button> -->
		            </div>
		          </div>
		         </div>
		        <div class="slide" data-order="2">
		          <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/42764/todo-banner.jpg" alt="" />
		          <div class="slide-content">
		            <!-- <h1>To do</h1> -->
		            <h2>Close encounters with nature</h2>
		            <div class="slide-txt">
		              <p>There's never a bad time to visit the Nordic countries! When you should visit will depend on which types of activities or natural phenomena interest you most.</p>
		              <!-- <button>Activities</button> -->
		            </div>
		          </div>
		         </div>
		        <div class="slide" data-order="3">
		          <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/42764/plan-banner_copy.jpg" alt="" />
		          <div class="slide-content">
		            <!-- <h1>Plan</h1> -->
		            <h2>Top attractions in the nordics</h2>
		            <div class="slide-txt">
		              <p>June, July and August is the best time to travel, this is when you can expect the warmest weather, longest daylight hours and best availability of outdoor activities.</p>
		              <!-- <button>Reservations</button> -->
		            </div>
		          </div>
		         </div>
		      </div>
		    </div>
		    <div class="slide-navigation__txt">
		      <ul>
		        <li><span data-order="1">Discover</span></li>
		        <li><span data-order="2">To do</span></li>
		        <li><span data-order="3">Plan</span></li>
		      </ul>
		    </div>
		  </div>
		</div>
		<!-- <img alt="" src='/resources/images/season_reci.PNG' > -->
	</div>
	
	<!-- 다담기 상품 -->
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
			// 줄바꿈 처리
			//$("#column1").html($("#column1")[0].value.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
			//$("#column2").html($("#column2")[0].value.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
    	    
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

			// 레시피 시작
	        var initialSlide = $('.slides-container [data-order="1"]');
	        var initalSelected = $('.slide-navigation__txt [data-order="1"]');
	        var mq_medium = window.matchMedia( '(min-width: 860px)' );
	        var mq_big = window.matchMedia( '(min-width: 1200px)' );


	        function activate_slide(order){
	            
	          var unactiveSlide = $('.slide.active');
	          var activeSlide = $('.slides-container [data-order="'+order+'"]');
	          
	          if( !(activeSlide.hasClass('active')) ){
	              slide_in(activeSlide);
	              slide_out(unactiveSlide);
	          }
	        }

	        function slide_in(slide) {
	          
	          var _this = slide;
	          
	          animation_in(slide);
	          _this.addClass('active');
	          TweenMax.to(_this, 1, {autoAlpha:1}, '-=1');
	          
	        }

	        function slide_out(slide){
	          
	          var _this = slide;
	          
	          _this.css( 'z-index', '2' );
	          _this.removeClass('active');
	          TweenMax.to(_this, 1, {autoAlpha:0, onComplete: removeZ});
	          
	          function removeZ(){
	            _this.css( 'z-index', '1' );
	          }  
	          
	          animation_out(slide);
	        }

	        function animation_in(slide){
	          
	          var title = slide.find('h1');
	          var subtitle = $(slide).find('h2');
	          var text = $(slide).find('p');
	          var button = $(slide).find('button');
	          var image = $(slide).find('img');
	          
	          TweenMax.fromTo(title, 0.6,{autoAlpha:0, x:100}, {autoAlpha:0.6, x:0, ease: Power2.easeOut});
	          TweenMax.fromTo(subtitle, 0.5,{autoAlpha:0, x:-200}, {autoAlpha:1, x:0, ease: Power2.easeOut},'-0.1');
	          TweenMax.fromTo(text, 0.8,{autoAlpha:0, x:50}, {autoAlpha:1, x:0, ease: Power2.easeOut});
	          TweenMax.fromTo(button, 0.5,{autoAlpha:0 }, {autoAlpha:1});
	          TweenMax.to(image, 0, {autoAlpha:1,scale:1});
	        }

	        function animation_out(slide){
	          
	          var title = slide.find('h1');
	          var subtitle = $(slide).find('h2');
	          var text = $(slide).find('p');
	          var button = $(slide).find('button');
	          var image = $(slide).find('img');
	          
	          TweenMax.to(title, 0.6, {autoAlpha:0, x:0});
	          TweenMax.to(subtitle, 0.5, {autoAlpha:0, x:200});
	          TweenMax.to(text, 0.5,{autoAlpha:0});
	          TweenMax.to(button, 0.5,{autoAlpha:0});
	          TweenMax.to(image, 1, {scale:1.1});
	          
	        }

	        $('.slide-navigation__txt span').on('click', function(){
	          
	          var _this = $(this);
	          var order = _this.data('order');
	          var spans = $('.slide-navigation__txt span');
	          var current = $('.active').data('order');
	          
	          spans.removeClass('active');
	          _this.addClass('active');
	          activate_slide(order); 
	          stagger_squares(order, current);
	        });

	        function stagger_squares(order, current) {
	          var mq = 0.7;
	          var moveY;
	          var squares = $('.slide-navigation__squares .square');
	          var staggerTime = -0.12;
	          
	          if( order < current ) {
	            staggerTime = staggerTime * -1; 
	          }
	          
	          if( mq_medium.matches) { mq = 1 }
	          if( mq_big.matches) { mq = 1.3 }
	          
	          moveY = (order-1) * (15 * mq );
	          TweenMax.staggerTo(squares, 0.1, {y: moveY}, staggerTime);
	          
	        }

	        $(document).ready(function() {
	          
	          initialSlide.addClass('active');
	          initalSelected.addClass('active');
	          TweenMax.to(initialSlide, 0.5, {autoAlpha:1});
	          
	        });	// 레시피 끝

		});
	
		// 다담기 기능
		function allToBasket() {
			var recipeItems = document.getElementsByClassName("add_to_cart");
			
			for(var i=0; i<recipeItems.length; i++) {
				
				recipeItems[i].click();
			}
			
			
		}
	
	
	</script>
	
<%@include file="./includes/footer.jsp" %>	

</body>
</html>