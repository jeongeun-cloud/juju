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
<style>
        td{
            border-bottom: 1px solid #ddd;
            padding: 8px;
            height: 30px;
                 }
        li{
            list-style: none;
        }
	   a{
	   	text-decoration: none;
	  	 color: #303030;
	  	 font-size: 17px;
	   }        	
        .regi_form{
        	margin-top:50px;
            margin-left: 100px;
        }
        #uploadBtn,
        #resetBtn{
            background-color: #8FA691 ; 
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            font-weight: bold;
            margin: 20px 2px;
          
        }
        #uploadBtn:focus,
        #resetBtn:focus{
         outline:none;
         border: none;
        }
        .regi_btn{
            float: right;
            margin-right:330px;
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
	/* 사이드 메뉴 끝 */
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
                <h3>상품 등록</h3>
                <p>자신의 상점 상품을 등록해주세요.</p>
                </div>
                
                <div class="regi_form">
                        <form role="form" action="/shop/register" method="POST" enctype="multipart/form-data">
                            <table>
                                <div class="container"> 
                                    <tr>
                                    <td>
                                    <label for="" ><i class="fa fa-chevron-right"></i>상품 정보 입력</label><br>
                                    </td>
                                            <td>                                    
                                            <select class="mainCateg" id="mainCateg">
                                                <option value="">대분류 선택</option>
                                            </select>
                                            <select class="midCateg" id="midCateg">
                                                <option value="">중분류 선택</option>
                                            </select>
                                            </td>
                                    </tr>    
                                </div>
                                <!-- 분류코드 저장하기 위한 hidden값 -->
                                <input type="hidden" name="classCode" id="classCode" >
                                <input type="hidden" name="idNo" id="idNo" value='<c:out value="${sessionMember.idNo}"/>' >

                                <tr>
                                <td><label for="price"><i class="fa fa-chevron-right"></i>상품명</label></td>
                                <td><input type="text" name="itemName" id="itemName" placeholder="상품명을 입력하세요." style="width: 350px;">
                                </td>
                                </tr>

                                <div class="container">
                                <tr>
                                <td>
                                    <label for="itemContent"><i class="fa fa-chevron-right"></i>상품 상세정보</label><br>
                                </td>
                                <td>
                                    <textarea name="itemContent" id="itemContent" style="height: 200px; width:350px; resize:none;"></textarea>
                                </td>
                                </tr>
                                </div>

                                <div class="container">
                                <tr>
                                <td>
                                    <small style="opacity:0.75;">가격은 1,000원 ~ 1,000,000원 까지만 허용합니다.</small><br><br>
                                    <label for="price"><i class="fa fa-chevron-right"></i>판매가격</label>
                                </td>
                                <td>
                                    <input type="text" name="price" id="price" numberOnly><br>
                                </td>
                                </tr>
                                <tr>
                                <td>
                                    <label for="normPrice"><i class="fa fa-chevron-right"></i>정상가격</label>
                                </td>
                                <td>
                                    <input type="text" name="normPrice" id="normPrice" numberOnly>
                                </td>    
                                </tr>
                                </div>

                                <div class="container" >
                                <tr>
                                    <td>
                                        <label for="stock" > <i class="fa fa-chevron-right"></i>재고</label>
                                    </td>
                                    <td>
                                        <input type="text" name="stock" id="stock" numberOnly><br>
                                    </td>
                                </tr>
                                </div>
                                
                                <div class="container">

                                    <div class="display">
                                            
                                            <div class="display_sta">
                                                <tr>
                                                <td>
                                                <label for=""><i class="fa fa-chevron-right"></i>진열상태</label>
                                                </td>
                                                <td>
                                                <input type="radio" name="dispStat" value="진열함" checked="checked">진열함
                                                <input type="radio" name="dispStat" value="진열안함">진열안함<br>
                                                </td>
                                                </tr>
                                                <tr>
                                                <td>
                                                <label for=""><i class="fa fa-chevron-right"></i>판매상태</label>
                                                </td>
                                                <td>
                                                <input type="radio" name="saleStat" value="판매중" checked="checked">판매중
                                                <input type="radio" name="saleStat" value="판매중지">판매중지
                                                </td>
                                                </tr>
                                            </div>
                                                
                                    </div>    
                                </div>

                                <div class="container">
                                    <tr>
                                    <td>
                                    <small style="opacity:0.75;">특성을 선택하지 않으면 기본으로 설정 됩니다.</small><br><br>
                                    <label><i class="fa fa-chevron-right"></i>상품 특성</label><br>
                                    </td>
                                    <td>
                                    <input type="checkbox" name="itemChr" value="new">신상품
                                    <input type="checkbox" name="itemChr" value="sale">할인
                                    
                                    <!-- 아무것도 선택하지 않으면 '기본'으로 값이 됨 -->
                                    <input type="checkbox" name="itemChr" value="default" checked="checked" style="visibility:hidden">
                                    </td>
                                    </tr>
                                </div>
                                
                                <!-- 파일 업로드 시작 -->
                                
                                <div class="container_i">
                                    <tr>
                                    <td>
                                    <label><small style="opacity:0.75;">메인, 서브 이미지 규격 : 270*300</small></label><br><br><br>
                                    <label><i class="fa fa-chevron-right"></i>메인 이미지</label>
                                    </td>
                                    <td>
                                    <input type='file' id="itemImg1" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                    <div class="select_img1"><img src="" /></div>
                                    </td>
                                    </tr>
                                </div>

                                <div class="container_i">
                                    <tr>
                                    <td>
                                    <label><i class="fa fa-chevron-right"></i>서브 이미지</label>
                                    </td>
                                    <td>
                                    <input type='file' id="itemImg2" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                    <div class="select_img2"><img src="" /></div>
                                    </td>
                                    </tr>
                                </div>

                                <div class="container_i">
                                    <tr>
                                    <td>
                                    <label><i class="fa fa-chevron-right"></i>서브 이미지</label>
                                    </td>
                                    <td>
                                    <input type='file' id="itemImg3" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                    <div class="select_img3"><img src="" /></div>
                                    </td>
                                    </tr>
                                </div>

                                <div class="container_i">
                                    <tr>
                                    <td>
                                    <label><i class="fa fa-chevron-right"></i>서브 이미지</label>
                                    </td>
                                    <td>
                                    <input type='file' id="itemImg4" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                    <div class="select_img4"><img src="" /></div>
                                    </td>
                                    </tr>
                                </div>
                                <div class="container_i">
                                    <tr>
                                    <td>
                                    <label><i class="fa fa-chevron-right"></i>상품 상세 설명 이미지</label>
                                    </td>
                                    <td>
                                    <input type='file' id="itemImg5" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                    <div class="select_img5"><img src="" /></div>
                                    </td>
                                    </tr>
                                </div>
                            </table> 
                                <!-- <button type="button" onclick="submitAction();">Submit Button</button> -->
                                <!-- <button type="submit">Submit Button</button> -->
                                <div class="regi_btn">
                                    <button id="uploadBtn">Submit Button</button>
                                    <button id="resetBtn" type="reset">Reset Button</button>
                                </div>
                               
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
      var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|PNG|JPG)$");
       var maxSize = 5242880;
       
       function checkExtension(fileType, fileSize) {
          if(fileSize >= maxSize) {
             alert("파일 사이즈 초과");
             return false;
          }
          
          if(!regex.test(fileType)) {
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
         
          if(!$('#mainCateg > option:selected').val()) {
             alert("대분류가 선택되지 않았습니다.");
             $('#mainCateg').focus();
             return false;
         }else if(!$('#midCateg > option:selected').val()) {
             alert("중분류가 선택되지 않았습니다.");
             $('#midCateg').focus();
             return false;
         }else if($('#itemName').val()=='' || $('#itemName').val().trim() == '') {
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
         }else if($("#itemImg1").val() == "") {
            alert("메인 이미지가 첨부되어 있지 않습니다.");
            $("#itemImg1").focus();
            return false;
         }else if($("#itemImg2").val()=="" || $("#itemImg3").val() == "" || $("#itemImg4").val()=="") {
            alert("서브 이미지는 모두 첨부 되어야 합니다.");
            return false;
         }else if($("#itemImg5").val() == "") {
            alert("상품 상세 이미지가 첨부되어 있지 않습니다.");
            $("#itemImg5").focus();
            return false;
         }else if($("input[type=checkbox][name=itemChr]")[0].checked == true || $("input[type=checkbox][name=itemChr]")[1].checked == true) {
            $("input[type=checkbox][name=itemChr]")[2].checked = false;
         }
          
         $('#price').val(removeComma($('#price').val()));
         $('#normPrice').val(removeComma($('#normPrice').val()));
         $('#stock').val(removeComma($('#stock').val()));
         
         $("form").submit();
         /* 
         $.ajax({
            url : '/shop/register',
            processData : false,
            contentType : false,
            data : formData,
            type : 'POST',
            //dataType:'json',
            success : function(result) {
               console.log(result);
               
            }
         }); */ // $.ajax
      });
       
      
      $(document).ready(function(){
          // 컨트롤러에서 데이터 받기
          var jsonData = JSON.parse('${category}');
         // console.log(jsonData);
         
         var mainArr = new Array();
         var mainObj = new Object();
         
         // 대분류 셀렉 박스에 삽입할 데이터 준비
         for(var i=0; i< jsonData.length; i++) {
            if(jsonData[i].lv == "1") {
               mainObj = new Object();
               mainObj.mainCateg = jsonData[i].mainCateg;
               mainObj.item = jsonData[i].item;
               
               mainArr.push(mainObj);
            }
         }
         
         // 셀렉 박스에 데이터 삽입
         var mainSelect = $("select.mainCateg");
         
         for(var i=0; i < mainArr.length; i++) {
            mainSelect.append("<option value='" + mainArr[i].mainCateg + "'>" + mainArr[i].item + "</option>");
         }
         
         $(document).on("change", "select.mainCateg", function() {
            
            var midArr = new Array();
            var midObj = new Object();
            
            for(var i=0; i<jsonData.length; i++) {
               if(jsonData[i].lv == "2") {
                  midObj = new Object();
                  midObj.mainCateg = jsonData[i].mainCateg;
                  midObj.midCateg = jsonData[i].midCateg;
                  midObj.classCode = jsonData[i].classCode;
                  midObj.item = jsonData[i].item;
                  
                  midArr.push(midObj);
               }
            }
            
            var midSelect = $("select.midCateg");
            
            midSelect.children().remove();
             $("option:selected", this).each(function(){
              
                var selectVal = $(this).val();  
               midSelect.append("<option value=''>중분류 선택</option>");
               
               for(var i = 0; i < midArr.length; i++) {
                  if(selectVal == midArr[i].midCateg) {
                     midSelect.append("<option value='" + midArr[i].mainCateg + "'>" + midArr[i].item + "</option>");
                  }
               }
               
               /* $("#classCode").val(midArr[i].classCode); */
             });
   
         });
         
         // 모든 카테고리를 셀렉하면 classCode에 값 주기
         $(document).on("change", "select.midCateg", function() {
             var classCode = $(".mainCateg option:selected").val() +''+ $(".midCateg option:selected").val();
            $("#classCode").val(classCode);
         });
         
         // 체크박스 다중 값 저장 후 form submit
         // 이게 없어도 저절로 , 찍혀서 들어가는 이유가 뭐지..?
         /* function submitAction() {
            var checkRow = "";
            $("input[name='chrArr']:checked").each (function (){
               checkRow = checkRow + $(this).val()+"," ;
            });
              checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
          
              if(checkRow == ''){
                alert("상품특성을 선택하세요.");
                return false;
              }
              //console.log("### checkRow => " + checkRow);
              $("#itemChr").val(checkRow);
              //location.href="/shop/remove?itemCode="+checkRow;
              $("form").submit();
         } */
         
         
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
         
         // 리셋 버튼 누르면 보이는 이미지도 삭제 되게끔
         $("#resetBtn").on("click", function(e) {
            for(let i=1; i<=5; i++) {
                $(".select_img"+i+" img").attr("src", "");
             }
         });
      });
   
    </script>
</body>
</html>