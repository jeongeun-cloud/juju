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
      margin-bottom:300px;
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
   #backImgdefualt {
       background-color:#8FA691;
        width: 1000px;
         height: 200px;
         top:30px;
         position: absolute;
        
        z-index : -100;
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
   
        float: left;
        margin: 60px 30px 0px 30px;
    }
    .sold {
        width: 270px;
        height: 370px;
   
        float: left;
        margin: 60px 30px 0px 30px;
    }
    
    
    
    .itemContent,
    .solditemContent:hover{
    
      color:#637365;
    
    }
    .itemContent {
        height: 80px;
        
  
   }
    
    .solditemContent {
        height: 90px;
         position: relative;
         top:-80px;
        
  
   }
   .item img {
        width: 270px;
        height: 300px;
        overflow: hidden;
        position: relative;
      
     
    }
    
    .sold img {
        width: 270px;
        height: 300px;
        overflow: hidden;
        position: relative;
        top:-80px;
     
    }

      .itemContent #itemName,.solditemContent #itemName{
      
          font-weight: bold;
    	  font-size: 20px;
    	  color : black;
      
      }
    
       .itemContent #itemName{
       
       margin-top:10px;
       
       }
      
      .itemContent #price,.solditemContent #price{
        color : black;
	    font-weight: bold;
	    font-size: 20px;
	      
      }
      
      pro_img_wrap{
      width: 270px;
        height: 300px;
        overflow: hidden;
      }
      
          
 
    #shop {
        height: 30px;

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

.pageBtns {
   text-align: center;
   margin-right: 8%;
}

.page_num a{
    position:relative;
    color: #637365;
    float: left;
    top:150px;
    text-decoration: none;
    padding:15px 25px;
    
   
}

          
.paging{
    
 background-color: white;
 color: #f6dd90;
}

.paginations a:hover:not(.active) {
          background-color:#F0F2F0;
          border-radius: 50%;

          
          }
   
   
   
    /*버튼 */
    .Dangol{
      background-color: #8FA691; 
     border: none;
     color: white;
     padding: 10px;
     text-align: center;
     font-weight: 700;
     text-decoration: none;
     display: inline-block;
     font-size: 14px;
     margin: 4px 2px;
     cursor: pointer;
     border-radius: 20px;
     
    }
    .Dangol:focus{
    outline:none;
    }
    
    #shopName{
    width: 500px;
    text-align: left;
    font-size:38px;
    
    }
    
    #dangol_content{
    border-bottom: 30px;
    }
    
     .add_to_cart img{
       position:relative; 
       width: 50px;   
       height: 50px;
       top:0;
       
            
        }
        
         .add_to_cart{
        border:none;
        background-color:white;
        display:inline;
        position:relative; 
        left:215px;
        bottom:50px;
     
       
        }
        
        .add_to_cart:focus{
        outline:none;
        }
        
         .sold .soldout{
          position: relative; 
          text-align:center; 
           font-size: 3.5em;
           font-weight: bold; 
           color: white;
           top: 200px;
           
        

       }
       

 .soldcolor{
        display:block;
        position: relative;
        background-color:black;
        top:80px;
        height:300px;
        bottom:0;
        left:0;
        right:0;
        }
        
         .ddcolor{
        display:block;
        position: relative;
        background-color:black;
        top:80px;
        height:300px;
        bottom:0;
        left:0;
        right:0;
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
             <img src='/resources/seller/<c:out value="${seller.businessCode}"/>/<c:out value="${seller.backImg}"/>'  onError="this.style.display='none'">
              <div id="thumbnail">
                 <img src='/resources/seller/<c:out value="${seller.businessCode}"/>/<c:out value="${seller.thumbImg}"/>' onError="">
              </div> 
           </div>
          <div id="backImgdefualt"></div>
          <div id="shop">
 	 	  <p id='shopName'><c:out value="${seller.shopName}"/></p>
             
             <!--단골 되기 버튼  -->
             <div id='dangol_content'>
                <c:if test="${memidNo ne '' }">
                <input type="button" value="<c:out value="${checkDangol}"/>" id="Dangol" class="Dangol" onclick="dangol();"></input>
                </c:if>
                <c:if test="${memidNo eq '' }">
                로그인 하시면 단골 등록 하실 수 있습니다.
                </c:if>
                 <p>단골 수 : <c:out value="${totalDangol }"/></p>
             </div>
          </div>
      
          <div id="itemContainer">
            
             <c:forEach items="${list }" var="list">
             <c:if test="${list.saleStat=='판매중'}">
              
                <div class="item">
                <div class='ddcolor'>
                   <a style=color:black href="/product/item?itemCode=<c:out value='${list.itemCode}'/>" >
                        <img src="/resources/upload/<c:out value="${list.idNo}"/>/<c:out value="${list.itemImg1}"/>" />
                     </a>   
                        <div class="itemContent">
                         <p id='itemName'><c:out value="${list.itemName}"/></p>
                         <p id='price'><fmt:formatNumber type="number"  maxFractionDigits="3" value="${list.price}" /><span class="won">원</span></p>								
                      
                        <c:if test="${list.saleStat=='품절'||list.saleStat=='판매중지'}">
                               <button type="button" class="add_to_cart" value="${list.itemCode}" onclick="alert('죄송합니다. 구매 불가한 상품입니다.')"><img src="/resources/images/addcart.png"></button>
                        </c:if>
                        <c:if test="${list.saleStat!='품절'&& list.saleStat!='판매중지'}">
                               <button type="button" class="add_to_cart" value="${list.itemCode}" onclick="addToBasketEvent(this.value)"><img src="/resources/images/addcart.png"></button> 
                         </c:if>
						<input type='hidden' id='listidNo' value='${list.idNo}'>      
                      </div>
                  </div>
                  </div>
              </c:if>
                  
                  <!-- -판매중end -->
                  <c:if test="${list.saleStat=='품절'}">
                 
                               <div class="sold">
                                <div class='soldcolor'> 
                                   <p class="soldout" >품절</p>
                 				  <a style=color:black href="/product/item?itemCode=<c:out value='${list.itemCode}'/>"  style="opacity:0.2;">
                      			  <img class="active" src="/resources/upload/<c:out value="${list.idNo}"/>/<c:out value="${list.itemImg1}"/>" style="opacity:0.2;" />
								</a>
                               
                                 <div class="solditemContent">               
                                 <p id='itemName'><c:out value="${list.itemName}"/></p>
								<p id='price'><fmt:formatNumber type="number"  maxFractionDigits="3" value="${list.price}" /><span class="won">원</span></p>								
								
								 <c:if test="${list.saleStat=='품절'||list.saleStat=='판매중지'}">
								  	 <button type="button" class="add_to_cart" value="${list.itemCode}" onclick="alert('죄송합니다. 구매 불가한 상품입니다.')"><img src="/resources/images/addcart.png"></button>
								</c:if>
							    <c:if test="${list.saleStat!='품절'&& list.saleStat!='판매중지'}">
								     <button type="button" class="add_to_cart" value="${list.itemCode}" onclick="addToBasketEvent(this.value)"><img src="/resources/images/addcart.png"></button> 
								</c:if>
								<input type='hidden' id='listidNo' value='${list.idNo}'>    
                  			 </div> 
                  			 </div>
                  			 </div>
                   </c:if>  
             
                
                
                 <!-- -판매중end -->
                  <c:if test="${list.saleStat=='판매중지'}">
                               <div class="sold">
                                <div class='soldcolor'> 
                                <p class="soldout" >판매중지</p>
                 				  <a style=color:black href="/product/item?itemCode=<c:out value='${list.itemCode}'/>"  >
                      			  <img class="active" src="/resources/upload/<c:out value="${list.idNo}"/>/<c:out value="${list.itemImg1}"/>"style="opacity:0.2;" />
								</a>
						
                                 <div class="solditemContent">               
                                 <p id='itemName'><c:out value="${list.itemName}"/></p>
								<p id='price'><fmt:formatNumber type="number"  maxFractionDigits="3" value="${list.price}" /><span class="won">원</span></p>								
								 <c:if test="${list.saleStat=='품절'||list.saleStat=='판매중지'}">
								  	 <button type="button" class="add_to_cart" value="${list.itemCode}" onclick="alert('죄송합니다. 구매 불가한 상품입니다.')"><img src="/resources/images/addcart.png"></button>
								</c:if>
							    <c:if test="${list.saleStat!='품절'&& list.saleStat!='판매중지'}">
								     <button type="button" class="add_to_cart" value="${list.itemCode}" onclick="addToBasketEvent(this.value)"><img src="/resources/images/addcart.png"></button> 
								</c:if>
								<input type='hidden' id='listidNo' value='${list.idNo}'>    
                  			 </div> 
                  			 </div> 
                  			  </div>
                   </c:if>  
                </c:forEach>     
                  
                   
          </div>
          
          <!-- 페이징 -->
          <div class='page_num'>
               <ul class="paginations">
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
                <input type='hidden' name='idNo' id="idNo" value=''>   
                <input type='hidden' name='pageNum' id="pageNum" value='${pageMaker.itemcri.pageNum}'>
                <input type='hidden' name='amount' id="amount" value='${pageMaker.itemcri.amount}'>

            </form>
          
        </div>
   </div>
   <!--shopId  -->
   <input type="hidden" id="hiddenShopId"  value="${seller.shopName}"/>
   
     
</div>

<script>
   $(document).ready(function(){
        
   
      
      
      var actionForm = $("#actionForm");
      $(".paginate_button a").on("click", function(e) {
         e.preventDefault();
         
          var   idNo = $("#listidNo").val();
         console.log(idNo);
         
          $("#idNo").val(idNo);
         
         actionForm.find("input[name='pageNum']").val($(this).attr("href"));
         actionForm.find("input[name='idNo']").val(idNo);
      
         actionForm.submit();
      });
   

   });

   
      //단골 신청 ,취소
      function dangol(){
         var shopName = document.getElementById("hiddenShopId").value;      
         
         var dangolBtn= document.getElementById("Dangol");
         
         if(dangolBtn.value=='단골되기'){
            dangolBtn.value='단골취소'
            return $.ajax({
               url:'/product/store/addDangol',
               type:"GET",
               data:{"shopName":shopName},
               dataType:"text",
               success:function(result){
                  console.log("알람통신 성공");
                  alert("단골신청이 완료되었습니다.")
               },
               error:function(){console.log("알람통신 실패")}
            });
         }
         else {
            dangolBtn.value='단골되기';
            
            
            console.log("가게"+shopName);
            return $.ajax({
               url:'/product/store/cancelDangol',
               type:"GET",
               data:{"shopName":shopName},
               dataType:"text",
               success:function(result){
                  console.log("알람통신 성공");
                  alert("단골 취소가 완료되었습니다.")
               },
               error:function(){console.log("알람통신 실패")}
            });
            
         }
            
            
      }


</script>



   <%@include file="../includes/footer.jsp" %>   

</body>
</html>