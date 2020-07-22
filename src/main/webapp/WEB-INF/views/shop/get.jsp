<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
<style>
        img{
      width : 250px;
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
        .get_content{
            width: 1300px;
            height: 1000px;
            margin:0 auto;
           
        }
        .get_wrap{
                 
            position: relative;
           display: inline-block;
           padding-top: 30px;
           
        }
        
        .side{
          
            width: 200px;
            height: 200px;
            background-color: white;
            float: left;
            margin-right: 90px;
            border:solid #ffc30b;
            
        }
        .get_main{
            float:  right;
            width: 1000px;
            height: 1000px;
            background-color: white;
        } 
        .get_side_tit{
            padding-top: 12px;
            padding-bottom:12px ;
            text-align: center;
            width: 100%;
            background-color: #ffc30b;
            font-size: 20px;
            font-weight: 900;
            

        }
        .get_main .get_tit{
            font-size: 30px;
            margin-bottom:50px;
            text-align: center;

        }
        .get_form{
            margin:50px 100px 0 150px;
            
        }
        .container label{
            font-weight: 900;
            font-size: 17px;
        }
        .container{
            margin-bottom: 10px;
        }
        .getBtn #rBtn,
        .getBtn #lBtn{
            background-color: #ffc30b; 
            border: none;
            color: white;
            padding: 8px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            margin: px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            font-weight: bold;
        }
        .getBtn #rBtn:hover,
        .getBtn #lBtn:hover
         {
        background-color: white; 
        color: #ffc30b; 
        border: 2px solid #ffc30b;
        }
        .getBtn #rBtn:focus,
        .getBtn #lBtn:focus
         {
        outline:none;  
        
        }
        .getBtn{
            float: right;
             margin-bottom: 20px;
        }
    </style>

</head>
<%@include file="../includes/header.jsp" %>
<body>

    <div class="get_content">
        <div class="get_wrap">
            <div class="side">
                <div class="1nb_list">
                    <div class="get_side_tit">
                        상품 관리
                    </div>
                    <div class="get_side_menu">
                        <ul class="get_menu">
                            <li> <a href='/shop/register'><i class="fa fa-check" ></i>상품 등록</a></li>
                            <li><a href='/shop/list'><i class="fa fa-check" ></i>상품 리스트</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- side  -->

            <div class="get_main">
                <div class="get_tit">
                    <p><b>[상품 정보]</b></p>
                </div>
                <!--get_tit -->
                <div class="get_form">
                    <form id="actionForm" method="POST">
                        <input type="hidden" name="itemCode" value='<c:out value="${item.itemCode }"/>'>
                        <div class="container">
                            <label for="itemName">상품 이름 : </label> <c:out value="${item.itemName }"/> <br>
                        </div>
                        <div class="container">
                            <label for="category">카테고리 : </label> <c:out value="${getCategory }"/> <br>
                        </div>
                        <div class="container">
                            <label for="itemContent">상품 상세정보</label><br>
                            <textarea name="itemContent" style="height: 200px; width:350px; resize:none;" readonly="readonly"><c:out value="${item.itemContent }"/></textarea>
                        </div>
                        <div class="container">
                            <label for="price">판매가격 : </label> <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" /><br>
                            <label for="normPrice">정상가격 : </label> <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.normPrice}" />
                        </div>
                        <div class="container">
                            <label for="stock">재고 : </label> <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.stock}" /> <br>
                        </div>
                        
                        <div class="container">
                            <label for="status"><b>표시상태 설정</b></label><br>
                            <label for="">진열상태</label>
                            <input type="hidden" id="disValue" value='<c:out value="${item.dispStat}"/>'>
                            <input type="radio" name="dispStat" value="진열함" onclick="return false;">진열함
                            <input type="radio" name="dispStat" value="진열안함" onclick="return false;">진열안함<br>
                            <label for="">판매상태</label>
                            <input type="hidden" id="saleValue" value='<c:out value="${item.saleStat}"/>'>
                            <input type="radio" name="saleStat" value="판매중" onclick="return false;">판매중
                            <input type="radio" name="saleStat" value="판매중지" onclick="return false;">판매중지
                            <input type="radio" name="saleStat" value="품절" onclick="return false;">품절
                        </div>
                        <div class="container">
                            <label>상품 특성<small style="opacity:0.75;">(특성이 선택되어 있지 않으면 기본입니다.)</small></label><br>
                            <input type="hidden" id="chkValue" value='<c:out value="${item.itemChr}"/>'>
                            <input type="checkbox" name="itemChr" value="신상품" onclick="return false;">신상품
                            <input type="checkbox" name="itemChr" value="할인" onclick="return false;">할인
                        </div>
             
                        <div class="container">
                             <label>메인 이미지</label>
                             <div class="select_img1">
                                 <img class="thumbnail" src='/resources/upload/idNo/<c:out value="${item.itemImg1}"/>' onError="this.src='/resources/images/noImg.png'" />
                             </div>
                         </div>
                         <div class="container">
                             <label>서브 이미지</label>
                             <div class="select_img2">
                                 <img class="thumbnail" src='/resources/upload/idNo/<c:out value="${item.itemImg2}"/>' onError="this.src='/resources/images/noImg.png'" />
                             </div>
                         </div>
                         <div class="container">
                             <label>서브 이미지</label>
                             <div class="select_img3">
                                 <img class="thumbnail" src='/resources/upload/idNo/<c:out value="${item.itemImg3}"/>' onError="this.src='/resources/images/noImg.png'" />
                             </div>
                         </div>
                         <div class="container">
                             <label>서브 이미지</label>
                             <div class="select_img4">
                                 <img class="thumbnail" src='/resources/upload/idNo/<c:out value="${item.itemImg4}"/>' onError="this.src='/resources/images/noImg.png'" />
                             </div>
                         </div>
                         <div class="container">
                             <label>상품 상세 설명 이미지</label>
                             <div class="select_img5">
                                 <img class="thumbnail" src='/resources/upload/idNo/<c:out value="${item.imgDetail}"/>' onError="this.src='/resources/images/noImg.png'" />
                             </div>
                         </div>
                         
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
