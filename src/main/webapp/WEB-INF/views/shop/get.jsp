<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.css">
<link rel="stylesheet"  href="../resources/css/admin.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
      
         td{
            border-bottom: 1px solid #ddd;
            padding: 8px;
            height: 30px;
         }
          li{
             list-style: none;
             float: left;
         }
         body{
             color: #303030;
         }
         a{
             text-decoration: none;
             color: #303030;
             font-size: 17px;
         }
         
           .get_form{
        	margin-top:50px;
            margin-left: 100px;
        }
         
        .select_img1 ,
        .select_img2 ,
        .select_img3 ,
        .select_img4 ,
        .select_img5 {
        width:100px;
        height:100px;
        position:relative;
        overflow:hidden;
        }
         
        .select_img1 img,
        .select_img2 img,
        .select_img3 img,
        .select_img4 img,
        .select_img5 img{
        	display:block;
        	
           width : 100%;
           height: 100%;
           postion:absoulte;
           top:0;
           botton:0;
           left:0;
           right:0;
        }
        
       
         .getBtn #rBtn,
         .getBtn #lBtn{
             background-color: #8FA691; 
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            font-weight: bold;
            margin: 4px 2px;
         }
         .getBtn #rBtn:hover,
         .getBtn #lBtn:hover
          {
         background-color: white; 
         color: #8FA691; 
         border: 2px solid #8FA691;
         }
         .getBtn #rBtn:focus,
         .getBtn #lBtn:focus{
           outline:none;
        
         
         }
         .getBtn{
            float: right;
            margin-right:758px;
              
         }
         
        .mainContent .title {
        margin-left: 100px;
        }
         
         .mainContent h3{
        font-weight:500;
        font-size:24px;
        margin-bottom:10px;
        }
        .mainContent p{
            color: #b9b9b9;
            margin-top:0;
            
        }
   
     </style>

</head>
<%@include file="./idCheck.jsp" %>
<body>
 <div class="container">
 <%@include file="./shopSideBar.jsp" %>
        
        
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
        
        
         <div class="mainContent" style="margin-top:50px; margin-left:200px;">
                     <div class="title">
                     <h3>상품정보</h3>
                     <p>상품ID : <c:out value="${item.itemCode}"/></p>
                 	</div>
                 <!--get_tit -->
	                 <div class="get_form">
	                     <form id="actionForm" method="POST">
	                         <input type="hidden" name="itemCode" value='<c:out value="${item.itemCode }"/>'>
	                         <table>
                                <div class="container">
                                    <tr>
                                    <td> <label for="itemName">상품 이름 </label> </td>            
                                    <td> <c:out value="${item.itemName }"/> <br></td>
                                    </tr>
                                </div>
                                <div class="container">
                                    <tr>
                                    <td><label for="category">카테고리</label></td>
                                    <td><c:out value="${getCategory }"/> <br></td>
                                    </tr>
                                </div>
                                <div class="container">
                                    <tr>
                                    <td><label for="itemContent">상품 상세정보</label><br></td>
                                    <td><textarea name="itemContent" style="height: 200px; width:350px; resize:none;" readonly="readonly"><c:out value="${item.itemContent }"/></textarea></td>
                                    </tr>    
                                </div>
                                <div class="container">
                                    <tr>
                                    <td><label for="price">판매가격 </label></td>
                                    <td> <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" /><br></td>
                                    </tr>
                                    <tr>
                                    <td><label for="normPrice">정상가격 </label></td>
                                    <td> <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.normPrice}" /></td>
                                    </tr>
                                </div>
                                <div class="container">
                                    <tr>
                                    <td> <label for="stock">재고 </label> </td>
                                    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.stock}" /> <br></td>
                                    </tr>
                                </div>
                                
                                <div class="container">
                                    <tr>
                                    <td><label for="">진열상태</label></td>
                                    <input type="hidden" id="disValue" value='<c:out value="${item.dispStat}"/>'>
                                    <td>
                                    <input type="radio" name="dispStat" value="진열함" onclick="return false;">진열함
                                    <input type="radio" name="dispStat" value="진열안함" onclick="return false;">진열안함<br>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td><label for="">판매상태</label></td>
                                    <input type="hidden" id="saleValue" value='<c:out value="${item.saleStat}"/>'>
                                    <td>
                                    <input type="radio" name="saleStat" value="판매중" onclick="return false;">판매중
                                    <input type="radio" name="saleStat" value="판매중지" onclick="return false;">판매중지
                                    <input type="radio" name="saleStat" value="품절" onclick="return false;">품절
                                    </td>
                                    </tr>
                                </div>
                                <div class="container">
                                    <tr>
                                    <td>
                                    <small style="opacity:0.75;">특성이 선택되어 있지 않으면 기본입니다.</small><br>
                                    <label>상품 특성</label><br>
                                    </td>
                                    <input type="hidden" id="chkValue" value='<c:out value="${item.itemChr}"/>'>
                                    <td>
                                    <input type="checkbox" name="itemChr" value="new" onclick="return false;">신상품
                                    <input type="checkbox" name="itemChr" value="sale" onclick="return false;">할인
                                    </td>
                                    </tr>
                                </div>
                    
                                <div class="container">
                                    <tr>
                                     <td>   
                                    <label>메인 이미지</label>
                                    </td>
                                    <td>
                                    <div class="select_img1">
                                        <img class="thumbnail" src='/resources/upload/<c:out value="${item.idNo}"/>/<c:out value="${item.itemImg1}"/>' onError="this.src='/resources/images/noImg.png'" />
                                    </div>
                                    </td>
                                    </tr>
                                </div>
                               
                                <div class="container">
                                 <tr>
                                    <td>
                                    <label>서브 이미지1</label>
                                    </td>
                                    <td>
                                    <div class="select_img2">
                                        <img class="thumbnail" src='/resources/upload/<c:out value="${item.idNo}"/>/<c:out value="${item.itemImg2}"/>' onError="this.src='/resources/images/noImg.png'" />
                                    </div>
                                    </td>
                                </tr>    
                                </div>
                                <div class="container">
                                <tr>
                                    <td><label>서브 이미지2</label></td>
                                    <td>
                                    <div class="select_img3">
                                        <img class="thumbnail" src='/resources/upload/<c:out value="${item.idNo}"/>/<c:out value="${item.itemImg3}"/>' onError="this.src='/resources/images/noImg.png'" />
                                    </div>
                                    </td>
                                </tr>
                                </div>
                                <div class="container">
                                <tr>
                                    <td><label>서브 이미지3</label></td>
                                    <td>
                                    <div class="select_img4">
                                        <img class="thumbnail" src='/resources/upload/<c:out value="${item.idNo}"/>/<c:out value="${item.itemImg4}"/>' onError="this.src='/resources/images/noImg.png'" />
                                    </div>
                                    </td>
                                </tr>
                                </div>
                                
                                <div class="container">
                                    <tr>
                                    <td>
                                    <label>상품 상세 설명 이미지</label>
                                    </td>
                                    <td>
                                    <div class="select_img5">
                                        <img class="thumbnail" src='/resources/upload/<c:out value="${item.idNo}"/>/<c:out value="${item.imgDetail}"/>' onError="this.src='/resources/images/noImg.png'" />
                                    </div>
                                    </td>
                                    </tr>
                                </div>
                                
                          </table>
                          
                          <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                          <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
                          <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>' >
                          <input type='hidden' name='type' value='<c:out value="${cri.type }"/>' >
              
                          <div class="getBtn">
                          <button type="submit" id="rBtn" data-oper='remove'>Remove</button>
                          <button type="submit" id="lBtn" data-oper='list'>List</button>
                          </div>
                     </form>
 
                     <form id='operForm' action="/shop/modify" method="get">
                         <input type='hidden' id='itemCode' name='itemCode' value='<c:out value="${item.itemCode}"/>'>
                         <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                         <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
                         <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>' >
                         <input type='hidden' name='type' value='<c:out value="${cri.type }"/>' >
                     </form>
                 </div>
             </div>
           </div>
         </div>
 <script src="../resources/js/admin.js"></script>
 <script
 src="https://code.jquery.com/jquery-3.5.1.js"
integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
 crossorigin="anonymous"></script>
   <script type="text/javascript">
   
      $(document).ready(function(){
         var actionForm = $("#actionForm");
         
         $('button').on("click", function(e) {
            e.preventDefault();
            
            var operation = $(this).data("oper");
            
            console.log(operation);
            
            if(operation === 'remove') {
               actionForm.attr("action", "/shop/remove");
               
            }else if(operation === 'list') {
               actionForm.attr("action", "/shop/list").attr("method", "get");
               var pageNumTag = $("input[name='pageNum']").clone();
               var amountTag = $("input[name='amount']").clone();
               
               actionForm.empty();
               actionForm.append(pageNumTag);
               actionForm.append(amountTag);
            }
            actionForm.submit();
         });
         
         
         var operForm = $("#operForm");
         
          $("button[data-oper='list']").on("click", function(e) {
             operForm.find("#itemCode").remove();
             operForm.attr("action", "/shop/list");
             operForm.submit();
          });
          
          /* 라디오 값 불러와서 체크해주기 */
         var disChk = $("#disValue").val();
         var disRadio = $("input[type=radio][name=dispStat]");
         for(i=0; i<disRadio.length; i++) {
             if(disChk == disRadio[i].value) {
                disRadio[i].checked = true;
             }
          }
         
         var saleChk = $("#saleValue").val();
         var saleRadio = $("input[type=radio][name=saleStat]");
         for(i=0; i<saleRadio.length; i++) {
             if(saleChk == saleRadio[i].value) {
                saleRadio[i].checked = true;
             }
          }
          
         // 체크박스 다중값 불러와서 체크해주기
          var chk = $("#chkValue").val();
          chk  = chk.split(",");
          var itemChr = $("input[type=checkbox][name=itemChr]");
          
          for(i=0; i<itemChr.length; i++) {
             for(j=0; j<chk.length; j++) {
                if(chk[j] == itemChr[i].value) {
                   itemChr[i].checked = true;
                }
             }
          }
      });
   </script>
</body>
</html>