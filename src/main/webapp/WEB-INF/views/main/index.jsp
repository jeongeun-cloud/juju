<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<%@include file="../includes/header.jsp" %>

<%@include file="../includes/menuBar.jsp" %>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="/resources/css/swiper-bundle.min.css">

<style>

   .mySlides{
    width:100%;
    height:600px;
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
	
	/* 메인 리뷰 */
    .swiper-container {
      width: 100%;
      padding-top: 50px;
      padding-bottom: 50px;
    }

    .swiper-slide {
      width: 300px;
      height: 300px;
      margin-bottom : 40px;

    }
    
    .swiper-img {
       background-size: cover;
       background-position: center;
       width: 300px;
         height: 300px;
    }
    /* 메인 리뷰 끝 */
    
    /* 중간 광고 */
    .adImg img {
    	width:100%;
    }
    /* 중간 광고 끝 */

</style>
<br>
    
        <!-- 첫번째 배너 광고 -->
        <div class="ma_top_banner_wrap" >
            <div class="w3-content w3-display-container" style="max-width:100%; ">
                <img class="mySlides" src="/resources/images/i1.jpg" >
                <img class="mySlides" src="/resources/images/i2.jpg" >
                <img class="mySlides" src="/resources/images/i3.jpg" >
                <img class="mySlides" src="/resources/images/i4.jpg" >
              
                <!-- 밑에 동그라미 -->
                <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
                  <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
                  <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
<!--                   <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
                  <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
                  <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
                  <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(4)"></span> -->
                 
                </div>
            </div>

         </div>
        <!--END 첫번째 배너 광고   -->
        
        <div class="main_new_pro">
           <div class="main_new_tit">                   
              <p><b>새로운 상품</b></p>   
              <h5>매일 새로운 주주마켓의 제품을 만나보세요 </h5>         
           </div>   
           <div class="main_new_li">
              <%@include file="RealNew.jsp" %>
           </div>                  
        </div>
        
        <!-- 첫번 째 중간광고 -->
        <div class="adImg" style="max-width:100%; ">
        	<img id="ad_img_1" src="" >
        </div>
        
        <!-- Swiper -->
        <div class="swiper-container">
          <div class="swiper-wrapper">
             <c:forEach items="${mainReview }" var="review">
                <div class="swiper-slide">
                   <div class='swiper-img' style='background-image:url(/resources/review/<c:out value="${review.itemCode}"/>/<c:out value="${review.reviewImg}"/>)'></div>
                   <p><c:out value="${review.reviewTitle}"/></p>
                </div>
             </c:forEach>
          </div>
          <!-- Add Pagination -->
          <div class="swiper-pagination"></div>
        </div>
        
        <!-- 두번 째 중간광고 -->
 		<div class="adImg" style="max-width:100%; ">
        	<img id="ad_img_2" src="" >
        </div>
 
    <!-- Swiper JS -->
     <script src="/resources/js/swiper-bundle.min.js"></script>
   <script type="text/javascript">
  

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

        /* 메인 리뷰 */
        var swiper = new Swiper('.swiper-container', {
            effect: 'coverflow',
            grabCursor: true,
            centeredSlides: true,
            slidesPerView: 'auto',
            coverflowEffect: {
              rotate: 50,
              stretch: 0,
              depth: 100,
              modifier: 1,
              slideShadows: true,
            },
            pagination: {
              el: '.swiper-pagination',
            },
        });
        /* 메인 리뷰 끝 */
        
        /* 중간 광고 */
        var advertise = new Array();
        
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
        }
        
        
        /* 중간 광고 끝 */
        
   </script>
   
   <%@include file="../includes/footer.jsp" %>
   
</body>
</html>