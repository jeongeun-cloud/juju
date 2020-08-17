<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<%@include file="../includes/header.jsp" %>

<%@include file="../includes/menuBar.jsp" %>

	<link rel="stylesheet"  href="../resources/css/review.css">
	<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.5/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.5/js/swiper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>

   .mySlides{
    width:100%;
    
   }

   .w3-left, .w3-right, .w3-badge {cursor:pointer}
   .w3-badge {height:13px;width:13px;padding:0}
   
   .main_new_pro{
      margin:50px auto;
      width:1300px;
      /* border:solid; */
      height:100%;
   }
   .main_new_tit p{
   font-size:30px;
   text-align: center;
   }
   .main_new_tit h5{
   text-align: center;
   }

	/*실시간 베스트  */

    
    /* 중간 광고 */
    .adImg img {
    	width:100%;
    }
    /* 중간 광고 끝 */
    
    /* 주주 봇 */
    #bot{
        border-radius: 50%;
        width: 50px;
        float : right;
        margin-right:10px;
    }
    #botDiv {
        right:0%;
        position: fixed;
        bottom : 1%;
        cursor : pointer;
    }

    .blinking{
        -webkit-animation:blink 0.5s ease-in-out infinite alternate;
        -moz-animation:blink 0.5s ease-in-out infinite alternate;
        animation:blink 0.5s ease-in-out infinite alternate;
    }
    @-webkit-keyframes blink{
        0% {opacity:0;}
        100% {opacity:1;}
    }
    @-moz-keyframes blink{
        0% {opacity:0;}
        100% {opacity:1;}
    }
    @keyframes blink{
        0% {opacity:0;}
        100% {opacity:1;}
    }
    /* 주주 봇 끝 */

</style>
<br>
        <!-- 첫번째 배너 광고 -->
        <div class="ma_top_banner_wrap" >
            <div class="w3-content w3-display-container" style="max-width:100%; ">
                <img class="mySlides" src="/resources/images/m1new.png" >
                <img class="mySlides" src="/resources/images/m2new.png" >
                <img class="mySlides" src="/resources/images/m3new.png" >
                <img class="mySlides" src="/resources/images/m4new.png" >
              
                <!-- 밑에 동그라미 -->
                <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
                  <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
                  <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>   
                   <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
                   <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
                   <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
                   <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(4)"></span>              
                </div>
            </div>

         </div>
        <!--END 첫번째 배너 광고   -->
        
        <div class="main_new_pro">
           <div class="main_new_tit">                   
              <p><b>새로운 상품</b></p>   
              <h5>매일 새로운 주주마켓의 제품을 만나보세요 </h5>         
           </div>   
           <div class="main_new_li" style="height:1200px;">
              <%@include file="RealNew.jsp" %>
           </div>                  
        </div>
        
        <!-- 첫번 째 중간광고 -->
        <div class="adImg" style="max-width:100%; margin : 20px 0 200px 0;">
        	<img id="ad_img_1" src="/resources/banner/advertise/ad1.jpg" >
        </div>
        
        <!-- 리뷰 -->
		<div class="main_new_tit">
			<p><b>생생한 리뷰</b></p><br>
		</div>
        <div class="blog-slider">
	        <div class="blog-slider__wrp swiper-wrapper">
	         	<c:forEach items="${mainReview }" var="review">
		          <div class="blog-slider__item swiper-slide">
		            <div class="blog-slider__img">
		              
		              <img src="/resources/review/<c:out value="${review.itemCode}"/>/<c:out value="${review.reviewImg}"/>" alt="">
		            </div>
		            <div class="blog-slider__content">
		              <span class="blog-slider__code"><fmt:formatDate pattern="yyyy/MM/dd" value="${review.regDate }" /></span>
		              <div class="blog-slider__title"><c:out value="${review.reviewTitle}"/></div>
		              <div class="blog-slider__text"><c:out value="${review.reviewContent}"/></div>
		              <a href='/product/item?itemCode=<c:out value="${review.itemCode}"/>' class="blog-slider__button">해당 상품 보러가기</a>
		            </div>
		          </div>
	          	</c:forEach>
	        </div>
        	<div class="blog-slider__pagination"></div>
    	</div>
             

    <!-- 두번 째 중간광고 -->
	<div class="adImg" style="max-width:100%; margin : 200px 0 20px 0;">
      	<img id="ad_img_2" src="/resources/banner/advertise/ad2.jpg" >
    </div>
    
    <!-- 주주봇 -->
    <div id="botDiv" >
        <iframe id="jujubot" style="display: none;" align="right" width="350" height="430" allow="microphone;" src="https://console.dialogflow.com/api-client/demo/embedded/35781ec9-2a4e-4180-b560-3405fca64cc6"></iframe><br>
        <img id="bot" class="blinking" src="/resources/images/bot.png">
    </div>
 
    <!-- Swiper JS -->
   	<script type="text/javascript">
	 // 주주 봇
	    $("#bot").on("click", function(){
	        $(this).removeClass("blinking");
	
	        var elem = document.getElementById("jujubot"),
	        Style = window.getComputedStyle(elem),
	        display = Style.getPropertyValue("display");
	
	        if(display == 'none') {
	            $("#jujubot").fadeIn("slow");
	        }else {
	            $("#jujubot").fadeOut("slow");
	        }
	
	    });
 
	   	var swiper = new Swiper('.blog-slider', {
	        spaceBetween: 30,
	        effect: 'fade',
	        loop: true,
	        mousewheel: {
	            invert: false,
	        },
	        // autoHeight: true,
	        pagination: {
	            el: '.blog-slider__pagination',
	            clickable: true,
	        }
	    });
   	
        // top_banner_wrap 기능
        // 밑에 동그라미(순서)가 같이 움직이는 기능 
        var slideIndex = 1;
        showDivs(slideIndex);

        function plusDivs(n) {
           showDivs(slideIndex += n);
        }

        function currentDiv(n) {
           showDivs(slideIndex = n);
        }

        function showDivs(n) {
           var i;
           var x = document.getElementsByClassName("mySlides");
           var dots = document.getElementsByClassName("demo");
           if (n > x.length) {slideIndex = 1}
           if (n < 1) {slideIndex = x.length}
           for (i = 0; i < x.length; i++) {
               x[i].style.display = "none";  
           }
           for (i = 0; i < dots.length; i++) {
               dots[i].className = dots[i].className.replace(" w3-white", " ");
           }
           x[slideIndex-1].style.display = "block";  
           dots[slideIndex-1].className += " w3-white";
        
        }
        
        var myIndex = 0;
        carousel();

        function carousel() {
           var i;
           var x = document.getElementsByClassName("mySlides");
           var dots = document.getElementsByClassName("demo");
           for (i = 0; i < x.length; i++) {
               x[i].style.display = "none";  
           }
           myIndex++;
           if (myIndex > x.length) {myIndex = 1}    
           x[myIndex-1].style.display = "block"; 
        
           
           setTimeout(carousel, 2000);  // Change image every 2 seconds
        }

        /* 중간 광고 */
        /* var advertise = new Array();
        
        <c:forEach items = "${advertise}" var="ad">
        	var json = new Object();
        	json.uuid = "${ad.uuid}";
        	json.imgPath = "${ad.imgPath}";
        	json.imgName = "${ad.imgName}";
        	advertise.push(json);
        </c:forEach>
        
        var str = '/resources/banner/';
        if(advertise.length == 1) {
	        var url1 = str + advertise[0].imgPath + "/" + advertise[0].uuid + "_" + advertise[0].imgName;
	        $("#ad_img_1").attr("src", url1);
        }else {
	        var url1 = str + advertise[0].imgPath + "/" + advertise[0].uuid + "_" + advertise[0].imgName;
	        var url2 = str + advertise[1].imgPath + "/" + advertise[1].uuid + "_" + advertise[1].imgName;
	        $("#ad_img_1").attr("src", url1);
	        $("#ad_img_2").attr("src", url2);
        } */
        /* 중간 광고 끝 */

   </script>
   
   <%@include file="../includes/footer.jsp" %>
   
</body>
</html>