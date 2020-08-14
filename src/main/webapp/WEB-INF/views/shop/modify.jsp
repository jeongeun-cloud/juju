<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        }
        a{
	   	text-decoration: none;
	  	 color: #303030;
	  	 font-size: 17px;
	   }
	   
	   .modi_form{
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
        
        .regi_btn{
            float: right;
           
            
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
      
    
        /* 버튼 */
        .modi_btn #uploadBtn,
        .modi_btn #rBtn,
        .modi_btn #lBtn{
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
        .modi_btn #uploadBtn:hover,
        .modi_btn #rBtn:hover,
        .modi_btn #lBtn:hover{
        background-color: white; 
        color: #8FA691; 
        border: 2px solid #8FA691;
        }
        .modi_btn #uploadBtn:focus,
        .modi_btn #rBtn:focus,
        .modi_btn #lBtn:focus{
        outline:none;
        }
        
        .modi_btn{
            float: right;
            margin-right: 52%;
        }
        /* 버튼 끝 */
        
        .itemImg {
        	width:250px;
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
                 <h3>상품 정보 수정</h3>
                 <p>필요한 정보를 알맞게 수정해 주세요. [상품ID: <c:out value="${item.itemCode }"/>]</p>
                 </div>
                    <div class="modi_form">
                    	<table>
                        <form role="form" action="/shop/modify" method="POST" enctype="multipart/form-data">
                            <!-- 추가 -->
                            <input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
                            <input type="hidden" name='amount' value='<c:out value="${cri.amount }"/>'>
                            <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>' >
                            <input type='hidden' name='type' value='<c:out value="${cri.type }"/>' >
                            <input type="hidden" name="idNo" id="idNo" value='<c:out value="${sessionMember.idNo}"/>' >
                            <input type="hidden" name="itemCode" value='<c:out value="${item.itemCode }"/>'>
                            <div class="container">
                            <tr>
                                <td><label for="itemName"><i class="fa fa-chevron-right"></i>상품 이름</label><br></td>
                                <td><input type="text" name="itemName" id="itemName" style="width: 350px;" value='<c:out value="${item.itemName }"/>'></td>
                            </tr>
                            </div>
                            
                            <div class="container">
                            <tr>
                            <td><label for="category"><i class="fa fa-chevron-right"></i>카테고리 분류</label></td>
                            <td><input type="text" name="getCategory" style="width: 350px;" value='<c:out value="${getCategory }"/>' readonly="readonly"></td>
                            </tr>
                        	</div>
                        
                            <div class="container">
                            <tr>
                                <td><label for="itemContent"><i class="fa fa-chevron-right"></i>상품 상세정보</label></td>
                                <td><textarea name="itemContent" id="itemContent" style="height: 200px; width: 350px; resize:none;"><c:out value="${item.itemContent }" /></textarea></td>
                           </tr>
                            </div>
                            
                            <div class="container">
                            <tr>
                            <td>
                               <small style="opacity:0.75;">가격은 1,000원 ~ 1,000,000원 까지만 허용합니다.</small><br>
                                <label for="price"><i class="fa fa-chevron-right"></i>판매가격</label> 
                            </td>
                            <td>    
                                <input type="text" name="price" id="price" numberOnly value='<c:out value="${item.price }"/>'> <br> 
                            </td>
                            </tr>
                            <tr>
                            <td>
                                <label for="normPrice"><i class="fa fa-chevron-right"></i>정상가격</label> 
                            </td>    
                            <td>  
                                <input type="text" name="normPrice" id="normPrice" numberOnly value='<c:out value="${item.normPrice }"/>'>
                             </td>
                             </tr>
                            </div>
                            
                            <div class="container">
                            <tr>
                                <td><label for="stock"><i class="fa fa-chevron-right"></i>재고</label></td>
                                <td><input type="text" name="stock" id="stock" numberOnly value='<c:out value="${item.stock }"/>'><br></td>
                            </tr>
                            </div>
                    
                            <div class="container">
                            <tr>                    
                                <td><label for="">진열상태</label></td>
                                    <input type="hidden" id="disValue" value='<c:out value="${item.dispStat}"/>'>
                                <td> 
                                    <input type="radio" name="dispStat" value="진열함">진열함
                                    <input type="radio" name="dispStat" value="진열안함">진열안함<br>
                                </td>
                            </tr>      
                            <tr>  
                               <td> <label for="">판매상태</label> </td>
                                    <input type="hidden" id="saleValue" value='<c:out value="${item.saleStat}"/>'>
                               <td>
                                    <input type="radio" name="saleStat" value="판매중">판매중
                                    <input type="radio" name="saleStat" value="판매중지">판매중지 
                                    <input type="radio" name="saleStat" value="품절">품절
                               </td>
                            </tr>
                            </div>
                            <div class="container">
                            <tr>
                              
                              <td>
                               <small style="opacity:0.75;">특성을 선택하지 않으면 기본으로 설정 됩니다.</small><br>
                               <label><i class="fa fa-chevron-right"></i>상품 특성</label><br> 
                               </td>
                                <input type="hidden" id="chkValue" value='<c:out value="${item.itemChr}"/>'>
                               <td>
                                <input type="checkbox" name="itemChr" value="new">신상품 
                                <input type="checkbox" name="itemChr" value="sale">할인
                                <!-- 아무것도 선택하지 않으면 '기본'으로 값이 됨 -->
                                <input type="checkbox" name="itemChr" value="default" style="visibility:hidden">
                                </td>
                            </tr>
                            </div>
                            
                            
                            <div class="container">
                            <tr>
                            <td>
                            	<label><small style="opacity:0.75;">메인, 서브 이미지 규격 : 270*300</small></label><br>
                                <label><i class="fa fa-chevron-right"></i>메인 이미지</label><br>                            
                                <input type='file' id="itemImg1" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                <input type='hidden' name="itemImg1" value="<c:out value="${item.itemImg1}"/>">
                            </td>
                            <td> 
                                <div class="select_img1"><img class='itemImg' src='/resources/upload/<c:out value="${item.idNo}"/>/<c:out value="${item.itemImg1}"/>' onError="this.src='/resources/images/noImg.png'" /></div>
                            </td>
                            </tr>
                            </div>
                            <div class="container">
                            <tr>
                                <td>
                                <label><i class="fa fa-chevron-right"></i>서브 이미지</label><br>
                                <input type='file' id="itemImg2" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                <input type='hidden' name="itemImg2" value="<c:out value="${item.itemImg2}"/>">
                              	</td>
                              	<td>
                                <div class="select_img2"><img class='itemImg' src='/resources/upload/<c:out value="${item.idNo}"/>/<c:out value="${item.itemImg2}"/>' onError="this.src='/resources/images/noImg.png'" /></div>
                            	</td>
                            </tr>
                            </div>
                            
                            <div class="container">
                            <tr>
                                <td>
                                <label><i class="fa fa-chevron-right"></i>서브 이미지</label><br>
                                <input type='file' id="itemImg3" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                <input type='hidden' name="itemImg3" value="<c:out value="${item.itemImg3}"/>">
                               </td>
                               <td>
                                <div class="select_img3"><img class='itemImg' src='/resources/upload/<c:out value="${item.idNo}"/>/<c:out value="${item.itemImg3}"/>' onError="this.src='/resources/images/noImg.png'" /></div>
                            	</td>
                            </tr>
                            </div>
                            
                            <div class="container">
                            <tr>
                                <td>
                                <label><i class="fa fa-chevron-right"></i>서브 이미지</label><br>
                                <input type='file' id="itemImg4" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                <input type='hidden' name="itemImg4" value="<c:out value="${item.itemImg4}"/>">
                                </td>
                                <td>
                                <div class="select_img4"><img class='itemImg' src='/resources/upload/<c:out value="${item.idNo}"/>/<c:out value="${item.itemImg4}"/>' onError="this.src='/resources/images/noImg.png'" /></div>
                            	</td>
                            </tr>
                            </div>
                            <div class="container">
                            <tr>
                            	<td>
                                <label><i class="fa fa-chevron-right"></i>상품 상세 설명 이미지</label><br>
                                <input type='file' id="itemImg5" name="uploadFile" accept="image/gif, image/jpeg, image/png, image/jpg" />
                                <input type='hidden' name="imgDetail" value="<c:out value="${item.imgDetail}"/>">
                                </td>
                                <td>
                                <div class="select_img5"><img class='itemImg' src='/resources/upload/<c:out value="${item.idNo}"/>/<c:out value="${item.imgDetail}"/>' onError="this.src='/resources/images/noImg.png'" /></div>
                            	</td>
                            </tr>
                            </div>

                        </form>
                        </table>
                           <div class="modi_btn">
                                <button id="uploadBtn" >Modify</button>
                                <button type="button" class="btn" id="rBtn" data-oper='remove'>Remove</button>
                                <button type="button" class="btn" id="lBtn" data-oper='list'>List</button>
                           </div>
                    </div>
                    <!-- modi_form -->
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