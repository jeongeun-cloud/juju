<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
         li{
            list-style: none;
            float: left;
        }
        a{
            text-decoration: none;
            color: #303030;
            font-size: 17px;
        }
        .modi_content{
            width: 1300px;
            height: 100%;
            margin:0 auto;
            
         }
        .modi_wrap{
                 
            position: relative;
            display: inline-block;
            padding-top: 30px;
           
                
             }
        .side{
        box-sizing: border-box;
          width: 200px;
          height: 200px;
          background-color: white;
          float: left;
          margin-right: 90px;
          border:solid #ffc30b;
           
         }
        .modi_side_tit{
            padding-top: 12px;
            padding-bottom:12px ;
            text-align: center;
            width: 100%;
          
            background-color: #ffc30b;
            font-size: 20px;
            font-weight: 900;
            

         }
        .modi_main{
            float:  right;
            width: 1000px;       
            background-color: white;
        } 
        .modi_main .modi_tit{
            font-size: 30px;
            margin-bottom:50px;

        }
        .modi_form{
            margin: 50px 100px 0 150px;

        }
        .container label{
            font-size: 20px;
            font-weight: 900;
            
        }
        .container{
            margin-bottom:20px;
        }
        /* 버튼 */
        .modi_btn #uploadBtn,
        .modi_btn #rBtn,
        .modi_btn #lBtn{
            background-color: #ffc30b; /* Green */
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
        .modi_btn #uploadBtn:hover,
        .modi_btn #rBtn:hover,
        .modi_btn #lBtn:hover{
        background-color: white; 
        color: #ffc30b; 
        border: 2px solid #ffc30b;
        }
        .modi_btn #uploadBtn:focus,
        .modi_btn #rBtn:focus,
        .modi_btn #lBtn:focus{
        outline:none;
        }
        
        .modi_btn{
            float: right;
        }
        /* 버튼 끝 */
    </style>
</head>
<body>
<%@include file="../includes/header.jsp" %>
    <div class="modi_content">
        <div class="modi_wrap">
            <div class="side">
                <div class="1nb_list">
                    <div class="modi_side_tit">
                        상품 관리
                    </div>
                    <div class="modi_side_menu">
                        <ul class="modi_menu">
                            <li> <a href='/shop/register'><i class="fa fa-check" ></i>상품 등록</a></li>
                            <li><a href='/shop/list'><i class="fa fa-check" ></i>상품 리스트</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- side -->
            <div class="modi_main">
                <div class="modi_tit">
                    <p><b><i class="fa fa-list-alt"></i>상품 수정</b></p>
                </div>
                    <div class="modi_form">
                        <form role="form" action="/shop/modify" method="POST" enctype="multipart/form-data">
                            <!-- 추가 -->
                            <input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
                            <input type="hidden" name='amount' value='<c:out value="${cri.amount }"/>'>
                            <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>' >
                            <input type='hidden' name='type' value='<c:out value="${cri.type }"/>' >
                            
                            <div class="container">
                                <label for="category"><i class="fa fa-scissors"></i>상품 정보 수정</label><br>
                            </div>
                            <input type="hidden" name="itemCode" value='<c:out value="${item.itemCode }"/>'>
                            <div class="container">
                                <label for="itemName"><i class="fa fa-chevron-right"></i>상품 이름</label><br>
                                <input type="text" name="itemName" id="itemName" style="width: 350px;" value='<c:out value="${item.itemName }"/>'>
                            </div>
                            <div class="container">
                            <label for="category"><i class="fa fa-chevron-right"></i>카테고리 분류</label><br>
                            <input type="text" name="getCategory" style="width: 350px;" value='<c:out value="${getCategory }"/>' readonly="readonly">
                        </div>
                            <div class="container">
                                <label for="itemContent"><i class="fa fa-chevron-right"></i>상품 상세정보</label><br>
                                <textarea name="itemContent" id="itemContent" style="height: 200px; width: 350px; resize:none;"><c:out value="${item.itemContent }" /></textarea>
                            </div>
                            <div class="container">
                                <small style="opacity:0.75;">가격은 1,000원 ~ 1,000,000원 까지만 허용합니다.</small><br>
                                <label for="price"><i class="fa fa-chevron-right"></i>판매가격</label> 
                                <input type="text" name="price" id="price" numberOnly value='<c:out value="${item.price }"/>'> <br> 
                                <label for="normPrice"><i class="fa fa-chevron-right"></i>정상가격</label> 
                                <input type="text" name="normPrice" id="normPrice" numberOnly value='<c:out value="${item.normPrice }"/>'>
                            </div>
                            <div class="container">
                                <label for="stock"><i class="fa fa-chevron-right"></i>재고</label> 
                                <input type="text" name="stock" id="stock" numberOnly value='<c:out value="${item.stock }"/>'><br>
                            </div>
                    
                            <div class="container">
                                <label for="status"><b><i class="fa fa-chevron-right"></i>표시상태 설정</b></label><br> 
                                <label for="">진열상태</label>
                                    <input type="hidden" id="disValue" value='<c:out value="${item.dispStat}"/>'>
                                    <input type="radio" name="dispStat" value="진열함">진열함
                                    <input type="radio" name="dispStat" value="진열안함">진열안함<br>
                                <label for="">판매상태</label> 
                                    <input type="hidden" id="saleValue" value='<c:out value="${item.saleStat}"/>'>
                                    <input type="radio" name="saleStat" value="판매중">판매중
                                    <input type="radio" name="saleStat" value="판매중지">판매중지 
                                    <input type="radio" name="saleStat" value="품절">품절
                            </div>
                            <div class="container">
                                <label><i class="fa fa-chevron-right"></i>상품 특성<small style="opacity:0.75;">(특성을 선택하지 않으면 기본으로 설정 됩니다.)</small></label><br> 
                                <input type="hidden" id="chkValue" value='<c:out value="${item.itemChr}"/>'>
                                <input type="checkbox" name="itemChr" value="신상품">신상품 
                                <input type="checkbox" name="itemChr" value="할인">할인
                                <!-- 아무것도 선택하지 않으면 '기본'으로 값이 됨 -->
                                <input type="checkbox" name="itemChr" value="기본" style="visibility:hidden">
                            </div>
                            
                            <div class="container">
                                <label><i class="fa fa-chevron-right"></i>메인 이미지</label>
                                <input type='file' id="itemImg1" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                <input type='hidden' name="itemImg1" value="<c:out value="${item.itemImg1}"/>">
                                <!-- <div class="select_img1"><img src='/resources/upload/idNo/<c:out value="${item.itemImg1}"/>' onError="this.src='/resources/images/noImg.png'" /></div> -->
                            </div>
                            <div class="container">
                                <label><i class="fa fa-chevron-right"></i>서브 이미지</label>
                                <input type='file' id="itemImg2" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                <input type='hidden' name="itemImg2" value="<c:out value="${item.itemImg2}"/>">
                                <!-- <div class="select_img2"><img src='/resources/upload/idNo/<c:out value="${item.itemImg2}"/>' onError="this.src='/resources/images/noImg.png'" /></div> -->
                            </div>
                            <div class="container">
                                <label><i class="fa fa-chevron-right"></i>서브 이미지</label>
                                <input type='file' id="itemImg3" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                <input type='hidden' name="itemImg3" value="<c:out value="${item.itemImg3}"/>">
                                <!-- <div class="select_img3"><img src='/resources/upload/idNo/<c:out value="${item.itemImg3}"/>' onError="this.src='/resources/images/noImg.png'" /></div> -->
                            </div>
                            <div class="container">
                                <label><i class="fa fa-chevron-right"></i>서브 이미지</label>
                                <input type='file' id="itemImg4" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                <input type='hidden' name="itemImg4" value="<c:out value="${item.itemImg4}"/>">
                                <!-- <div class="select_img4"><img src='/resources/upload/idNo/<c:out value="${item.itemImg4}"/>' onError="this.src='/resources/images/noImg.png'" /></div> -->
                            </div>
                            <div class="container">
                                <label><i class="fa fa-chevron-right"></i>상품 상세 설명 이미지</label>
                                <input type='file' id="itemImg5" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                <input type='hidden' name="imgDetail" value="<c:out value="${item.imgDetail}"/>">
                                <!-- <div class="select_img5"><img src='/resources/upload/idNo/<c:out value="${item.imgDetail}"/>' onError="this.src='/resources/images/noImg.png'" /></div> -->
                            </div>
                    
                            <div class="modi_btn">
                                <button id="uploadBtn" >Modify</button>
                                <button type="button" class="btn" id="rBtn" data-oper='remove'>Remove</button>
                                <button type="button" class="btn" id="lBtn" data-oper='list'>List</button>
                            </div>
                        </form>
                    </div>
                    <!-- modi_form -->
            </div>
        </div>
    </div>
   
   <script
     src="https://code.jquery.com/jquery-3.5.1.js"
     integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
     crossorigin="anonymous"></script>
   <script type="text/javascript">
      
      var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif)$");
       var maxSize = 5242880;
       
       function checkExtension(fileName, fileSize) {
          
          if(fileSize >= maxSize) {
             alert("파일 사이즈 초과");
             return false;
          }
          
          if(!regex.test(fileName)) {
             alert("이미지만 업로드 가능합니다!");
             return false;
          }
          return true;
       }
       
      // 이미지 체크
      for(let i=1; i<=5; i++) {
          $("#itemImg"+i).change(function(){   
             var imgFile = $('#itemImg'+i).val();
             var fileSize = document.getElementById("itemImg"+i).files[0].size;
            
            if(!checkExtension(imgFile, fileSize)) {
               $('#itemImg'+i).val("");
               return false;
            }
          });
      }
              
       // 사진 보이기
       for(let i=1; i<=5; i++) {
         $("#itemImg"+i).change(function(){
            if(this.files && this.files[0]) {
               var reader = new FileReader;
                
               reader.onload = function(data) {
                   $(".select_img"+i+" img").attr("src", data.target.result).width(500);        
                }
                reader.readAsDataURL(this.files[0]);
            }
         });
       }
       
      // 등록
      $("#uploadBtn").on("click", function(e) {
         
         function removeComma(str){
            n = str.replace(/,/g,"");
            
            return n;
         }
         
         if($('#itemName').val()=='' || $('#itemName').val().trim() == '') {
            alert('상품명이 입력되지 않았습니다.');
            $('#itemName').focus();
            return false;
         }else if($('#itemContent').val()=='' || $('#itemContent').val().trim() == ''){
            alert('상품 상세 정보가 입력되지 않았습니다.');
            $('#itemContent').focus();
            return false;
         }else if($('#price').val()=='' || removeComma($('#price').val()) < 1000 || removeComma($('#price').val()) > 1000000){
            alert('유효하지 않은 판매가 입니다.');
            $('#price').focus();
            return false;
         }else if($('#normPrice').val()=='' || removeComma($('#normPrice').val()) < 1000 || removeComma($('#normPrice').val()) > 1000000){
            alert('유효하지 않은 정상가 입니다.');
            $('#normPrice').focus();
            return false;
         }else if($('#stock').val()==''){
            alert('재고가 입력되지 않았습니다.');
            $('#stock').focus();
            return false;
         }else if($("input[type=checkbox][name=itemChr]")[0].checked == true || $("input[type=checkbox][name=itemChr]")[1].checked == true) {
            $("input[type=checkbox][name=itemChr]")[2].checked = false;
         }
         
         $('#price').val(removeComma($('#price').val()));
         $('#normPrice').val(removeComma($('#normPrice').val()));
         $('#stock').val(removeComma($('#stock').val()));
         
         $("form").submit();   // ajax로 수정해야 할지?
      });
      
      
      $(document).ready(function(){
         var formObj = $("form");
         
         // 각 버튼(지우기, 리스트로 돌아가기)
         $('.btn').on("click", function(e) {
            e.preventDefault();
            
            var operation = $(this).data("oper");
            
            console.log(operation);
            
            if(operation === 'remove') {
               formObj.attr("action", "/shop/remove");
            }else if(operation === 'list') {
               formObj.attr("action", "/shop/list").attr("method", "get");
               var pageNumTag = $("input[name='pageNum']").clone();
               var amountTag = $("input[name='amount']").clone();
               var keyTag = $("input[name='keyword']").clone();
               var typeTag = $("input[name='type']").clone();
               
               formObj.empty();
               formObj.append(pageNumTag);
               formObj.append(amountTag);
               formObj.append(keyTag);
               formObj.append(typeTag);
            }
            formObj.submit();
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
          
          // 단위 콤마 찍어주기
          $("#price").val(addCommas($("#price").val()));
          $("#normPrice").val(addCommas($("#normPrice").val()));
          $("#stock").val(addCommas($("#stock").val()));
          
          //3자리 단위마다 콤마 생성
         function addCommas(x) {
             return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         }
          
         //모든 콤마 제거
         function removeCommas(x) {
             if(!x || x.length == 0) return "";
             else return x.split(",").join("");
         }

         // 숫자만 입력
         $("input:text[numberOnly]").on("focus", function() {
             var x = $(this).val();
             x = removeCommas(x);
             $(this).val(x);
         }).on("focusout", function() {
             var x = $(this).val();
             if(x && x.length > 0) {
                 if(!$.isNumeric(x)) {
                     x = x.replace(/[^0-9]/g,"");
                 }
                 x = addCommas(x);
                 $(this).val(x);
             }
         }).on("keyup", function() {
             $(this).val($(this).val().replace(/[^0-9]/g,""));
         });
      });
   </script>
</body>
</html>