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
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
    <link href="/resources/css/seasonal.css" rel="stylesheet">

    <style>
    	#activeImg {
    		margin-bottom : 100px;
    	}
		
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
	        height:700px;
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
	        position : relative;
	    }
	    .mini {
	    	margin-bottom : 10px;
	        overflow:hidden;
	        width : 47%;
	        float : left;
	        position : relative;
	    }
	    .big img, .mini img {
	        width : 100%;
	        vertical-align:middle;
	        transform: scale(1);
			-webkit-transform: scale(1);
			-moz-transform: scale(1);
			-ms-transform: scale(1);
			-o-transform: scale(1);
			transition: all 0.3s ease-in-out;
	    }
	    /* .big img:hover, .mini img:hover {
		  transform: scale(1.05);
		  -webkit-transform: scale(1.05);
		  -moz-transform: scale(1.05);
		  -ms-transform: scale(1.05);
		  -o-transform: scale(1.05);
		} */
		.text_box {
			width:100%;
			height:100%;
			padding-top :50%;
			position : absolute;
			text-align : center;
			top : 50%;
			left : 50%;
			transform : translate( -50%, -50% );
		}
		.text_box p {
			color : white;
			font-size : 36px;
			font-weight : 600;
		}
		.text_box span {
			color : white;
			font-size : 20px;
		}
		.text_box:hover {
			background-color : rgba( 0, 0, 0, 0.5 );
		}

		.shortcut_btn {
			background : url('/resources/images/btn_shortcut.png')center bottom no-repeat;
			height:30px;
			margin-top : 5px;
		}
		/* 두번 째 그리드 끝 */
		
		/* 버튼 디자인 */
		#regBtn{
	        float:right;
	        margin-right: 30px;
	        margin-top : 5px;
	        background-color: #8FA691; 
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
		    color: #8FA691; 
		    border: 2px solid #8FA691;
		    outline: none; 
	    }
    	/* 버튼 디자인 끝 */
    	
    	/* 레시피 시작 */
    	@import url(https://fonts.googleapis.com/css?family=Work+Sans:400,900,800,500,700,600);

		.slider-wrapper {
			position: relative;
			width:100%;
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
			color: #637365;
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
			background: #637365;
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
		
		.slider-wrapper .slide .slide-content h2 {
			color: #637365;
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
			font-size: 17px;
			line-height: 1.4;
			float: left;
		}

		li{
            list-style: none;
        }
   		.new_pro_li{
   			height:300px;
   			margin-top : 100px;
   		}
    
        .pro_module{
            width: 186px;
        }

        .pro_img_wrap{
            width: 100%;
            height: 206px;
            position: relative;
            overflow: hidden;
            background-color:black;
        }

        .pro_img_wrap img{
            display:block;
            width:100%;
            height:100%;
            position: absolute;
            top:0;
            bottom:0;
            left:0;
            right:0;
        }
        
        .pro_module .txt_wrap{
            position: relative;
            margin-top: 16px;
            width: 100%;
            height: 140px;
        }
        .txt_wrap {
            margin-left: 1px;
            height:25px;
        }
        .tit_info .info_itemName{
            display: block;
            color: black;
            font-weight: bold;
            font-size: 16px;
            word-break: break-all;
        }
        .price_info{
            font-size: 0;
            
        }
        .price_info .sale{
            display: inline-block;
            margin-right: 5px;
            vertical-align: middle;
        }
        .price_info .sale .price{
            display: inline-block;
            vertical-align: top;
            font-size: 15px;
            font-weight: 800;
            color: black;
        }
        .price_info .normPrice{
            display: inline-block;
            padding-left: 6px;
            color: black;
            font-size: 13px;
            text-decoration: line-through;
            vertical-align: middle;
        }
        .pro_module{
            position: static;
            margin-top: 5px;
        }
        .pro_list .pro_list_ul .pro_list_li{
            float: left;
            margin-right : 60px;
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
  		<img style="width:100%;" class="banner" src="/resources/images/seasonal_bg2.png">
    </div>
    
	<div class="seasonal_pro">
		<div class="container" style="margin-bottom:150px;">
		    <div class="info">
		      <h1>Food Magazine</h1>
		    </div>
		    <c:forEach items="${column }" var="column">
		    	<!-- Normal Demo-->
			    <div class="column">
			      <div class="demo-title">Normal</div>
			      <!-- Post-->
			      <div class="post-module">
			        <!-- Thumbnail-->
			        <div class="thumbnail" style="padding:0;">
			          <img src='/resources/banner/column/<c:out value="${column.img1}"/>' />
			        </div>
			        <!-- Post Content-->
			        <div class="post-content">
			          <h1 class="title">[홍경희 교수의 '건강한 영양학'] 당뇨병 환자도 고기를 먹는 것이 좋을까요?</h1>
			          <p class="description"><c:out value="${column.column1}"/></p>
			          <div class="post-meta"><span class="comments"><a href="#">자세한 내용 보러가기</a></span></div>
			        </div>
			      </div>
			    </div>
			    
			    <div class="column">
			      <div class="demo-title">Normal</div>
			      <!-- Post-->
			      <div class="post-module">
			        <!-- Thumbnail-->
			        <div class="thumbnail" style="padding:0;">
			          <img src='/resources/banner/column/<c:out value="${column.img2}"/>' />
			        </div>
			        <!-- Post Content-->
			        <div class="post-content">
			          <h1 class="title">태안 마도선에 실린 개성인이 즐긴 젓갈 - 새우젓에서 그이장(게장), 전복젓갈, 홍합젓갈까지</h1>
			          <p class="description"><c:out value="${column.column2}"/></p>
			          <div class="post-meta"><span class="comments"><a href="#">자세한 내용 보러가기</a></span></div>
			        </div>
			      </div>
			    </div>
		    </c:forEach>
		</div>
		
		<div id="wrapper">
	        <div class="grid">
	            <div class="big">
	                <img id="gallery0" alt="" src="">
	                <a href="/product/list?classCode=Veggie">
		                <div class="text_box">
		                	<p>채소 & 야채</p>
		                	<span>산지에서 바로 올라온 신선함</span>
		                	<div class="shortcut_btn"></div>
		                </div>
	                </a>
	            </div>
	            <div class="mini">
	                <img id="gallery1" alt="" src="">
	                <a href="/product/list?classCode=Sea">
		                <div class="text_box">
		                	<p>자연산 해산물</p>
		                	<span>생생한 해산물 소식!</span>
		                	<div class="shortcut_btn"></div>
		                </div>
		            </a>
	            </div>
	            <div class="mini" style="margin-left:18px;">
	                <img id="gallery2" alt="" src="">
	                <a href="/product/list?classCode=Meat">
		                <div class="text_box">
		                	<p>선홍빛 육류</p>
		                	<span>육즙이 가득, 단백질이 풍부!</span>
		                	<div class="shortcut_btn"></div>
		                </div>
		            </a>
	            </div>
	        </div>
	        <div class="grid">
	            <div class="mini">
	                <img id="gallery3" alt="" src="">
	                <a href="/product/list?classCode=Grain">
		                <div class="text_box">
		                	<p>양곡, 잡곡, 쌀</p>
		                	<span>든든한 우리 양곡</span>
		                	<div class="shortcut_btn"></div>
		                </div>
		            </a>
	            </div>
	            <div class="mini" style="margin-left:18px;">
	                <img id="gallery4" alt="" src="">
	                <a href="/product/list?classCode=FruitF02">
		                <div class="text_box">
		                	<p>수입산 과일</p>
		                	<span>상콤 키위, 자몽, 바나나, 라임</span>
		                	<div class="shortcut_btn"></div>
		                </div>
		            </a>
	            </div>
	            <div class="big">
	                <img id="gallery5" alt="" src="">
	                <a href="/product/list?classCode=FruitF01">
		                <div class="text_box">
		                	<p>국내산 과일</p>
		                	<span>지금이 한창, 제철과일을 만나보세요</span>
		                	<div class="shortcut_btn"></div>
		                </div>
		            </a>
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
		          <img src="/resources/images/reci1.png" alt="" />
		          <div class="slide-content">
		            <!-- <h1>Discover</h1> -->
		            <h2>재료 준비</h2>
		            <div class="slide-txt">
		              <p><b>재료 : 닭 1kg, 감자 2개, 양파 큰거, 당근, 대파, 버섯</b></p><br><br>
		              <p><b>양념 : 간장, 고춧가루, 설탕, 다진마늘</b></p><br><br><br>
		              <p>1. 손질 된 닭이 푹 잠길만큼 우유에 30분 담가 둔 후 여러번 헹궈낸다.</p><br><br>
		              <p>2. 닭이 잠길만큼의 물을 부어 설탕 3큰술을 함께 넣고 끓여준다.</p><br><br>
		              <p>3. 닭이 끓는 동안 야채를 손질한다.</p><br><br>
		              <p>4. 감자는 큼지막하게 썰고, 양파, 당근, 버섯은 먹기좋게, 대파는 어슷썰어 준비해주세요.</p><br>
		              <!-- <button>Show regions</button> -->
		            </div>
		          </div>
		         </div>
		        <div class="slide" data-order="2">
		          <img src="/resources/images/reci2.PNG" alt="" />
		          <div class="slide-content">
		            <!-- <h1>To do</h1> -->
		            <h2>조리</h2>
		            <div class="slide-txt">
		              <p>5. 오래 익혀야 하는 감자를 제일 먼저 넣어주고, 다진마늘 2큰술도 넣어주세요.</p><br><br><br>
		              <p>6. 양파와 당근도 넣어줍니다.</p><br><br>
		              <p>7. 국물이 끓어오르면 진간장 1국자 반을 과감하게 넣어주세요.</p><br><br>
		              <p>8. 칼칼하게 매운맛을 내기 위해 고춧가루도 1국자 넣어줍니다.</p><br><br><br><br>
		              <p>* TIP : 중간중간 거품을 걷어주세요 *</p><br>
		              <!-- <button>Show regions</button> -->
		            </div>
		          </div>
		         </div>
		        <div class="slide" data-order="3">
		          <img src="/resources/images/reci3.jpg" alt="" />
		          <div class="slide-content">
		            <!-- <h1>Plan</h1> -->
		            <h2>마무리</h2>
		            <div class="slide-txt">
		              <p>9. 고춧가루가 풀어질때쯤 버섯을 넣어주세요.</p><br><br>
		              <p>10. 약한불에 5분쯤 끓여주면 재료에 맛이 배어 듭니다.</p><br><br>
		              <p>11. 마지막으로 파를 넣고 한소큼 끓여내면 맛있는 닭도리탕이 완성됩니다!</p><br><br>
		              <p>12. 예쁜 그릇에 옮겨준 후 시식~</p><br>
		              <!-- <button>Reservations</button> -->
		            </div>
		          </div>
		         </div>
		      </div>
		    </div>
		    <div class="slide-navigation__txt">
		      <ul>
		        <li><span data-order="1">재료 준비</span></li>
		        <li><span data-order="2">조리</span></li>
		        <li><span data-order="3">마무리</span></li>
		      </ul>
		    </div>
		  </div>
		</div>
		<!-- <img alt="" src='/resources/images/season_reci.PNG' > -->
	</div>
	
	<!-- 다담기 상품 -->   
	<div class="new_pro_li">
        
        <div class="pro_list">
            <ul class="pro_list_ul">
            <c:forEach items="${seasonItem }" var="seasonItem">
                <li class="pro_list_li">
                    <div class="pro_module">
                        <div class="pro_img_wrap">
                            <a href='/product/item?itemCode=<c:out value="${seasonItem.itemCode}"/>' class="conts">
                                <img alt="" src='/resources/upload/<c:out value="${seasonItem.idNo}"/>/<c:out value="${seasonItem.itemImg1}"/>' >
                            </a>
        
                        </div>    
                        <div class="txt_wrap">
                            <a href='/product/item?itemCode=<c:out value="${seasonItem.itemCode}"/>' class="conts">
                                <div class=tit_info>
                                    <span class="info_itemName"><c:out value="${seasonItem.itemName}"/></span>
                                </div>
                                <!-- END tit_info -->
                                <div class="price_info">
                                    <p class="sale">
                                        <span class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${seasonItem.price}" />
                                            <span class="won">원</span>
                                        </span>
                                    </p>
                                    <p class="normPrice">
                                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${seasonItem.normPrice}" />
                                        <span class="won">원</span>
                                    </p>
                                </div>
                            </a>
							<button class="add_to_cart" value="${seasonItem.itemCode}" onclick="addToBasketEvent(this.value)"></button>
                        </div>
                        <!-- END txt_wrap -->
                    </div>
                    <!-- END pro_moduel  -->
                </li>

            </c:forEach>
            </ul>    
        </div>
        <button id="regBtn" onclick="allToBasket()">다담기</button>
        <!--END pro_list  -->
    </div>		

	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.6/highlight.min.js"></script>
	
	<script>
		hljs.initHighlightingOnLoad();
	
		$('.hero__scroll').on('click', function(e) {
			$('html, body').animate({
				scrollTop: $(window).height()
			}, 1200);
		});
	</script>
	
	<script>
		$(window).load(function() {
	        $('.post-module').hover(function() {
	            $(this).find('.description').stop().animate({
	                height: "toggle",
	                opacity: "toggle"
	            }, 300);
	        });
	    });
	
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