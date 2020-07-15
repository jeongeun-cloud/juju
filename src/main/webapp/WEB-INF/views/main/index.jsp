<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<%@include file="../includes/header.jsp" %>

<%@include file="../includes/menuBar.jsp" %>

<style>
.ma_top_banner_wrap > mySlides {
display:none;
height: 500px;

}

.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}

</style>

<br>
    
        <!-- 첫번째 배너 광고 -->
        <div class="ma_top_banner_wrap" >
            <div class="w3-content w3-display-container" style="max-width:100%; ">
                <img class="mySlides" src="/resources/images/i1.jpg" style="width:100%">
                <img class="mySlides" src="/resources/images/i2.jpg" style="width:100%">
                <img class="mySlides" src="/resources/images/i3.jpg" style="width:100%">
                <img class="mySlides" src="/resources/images/i4.jpg" style="width:100%">
              
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
        <script>
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

        </script>
</body>
</html>