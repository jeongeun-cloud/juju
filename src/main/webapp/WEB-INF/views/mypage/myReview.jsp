<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="./../includes/header.jsp" %>
<%@include file="./../includes/menuBar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>  <!-- 모달띄어줌 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>

body {
   font-family: Arial, Helvetica, sans-serif;
   color: #303030;
}

li {
   list-style: none;
}

.regi_menu a{
   text-decoration: none;
   color: #303030;
   font-size: 17px;
}

table {
   border-collapse: collapse;
   width: 100%;
}

/* 배치 */
th, td {
   padding: 8px;
   text-align: left;
   border-bottom: 1px solid #ddd;
}

th {
   background-color: black; 
   color: white;
   text-align: left;
}

tr:hover {
   background-color: #f5f5f5;
}

.check {
   width: 5%;
   height: 30px;
   left: 30%;
}

.text {
   width: 50%;
   height: 25px;
}

.serch {
   margin-left: 200px;
   margin-bottom: 10px;
}

.sb {
   height: 35px;
}

/* 글쓰기, 검색 버튼 시작 */
#regBtn,
#searchBtn {
  background-color: #ffc30b; 
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}


#regBtn:hover,
#searchBtn:hover {
  background-color: white; 
  color: #ffc30b; 
  border: 2px solid #ffc30b;
}
#regBtn:focus,
#searchBtn:focus { 
    outline: none; 
}


#regBtn {

margin-right: 0%;

}
/* 글쓰기, 검색 버튼 끝 */

/* 페이지 버튼 디자인 시작 */

.pageBtns {
	text-align: center;
}

.pageBtns a{
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.pagination1 a:hover:not(.active) {
    background-color: #f6dd90;
    border-radius: 50%;
}

/* 페이지 버튼 디자인 끝 */

/* 모달디자인 시작  */
.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: white;
  color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: white;
  color: white;
}


#closeBtn {
  background-color: #ffc30b; 
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

#closeBtn:hover {
  background-color: white; 
  color: #ffc30b; 
  border: 2px solid #ffc30b;

}

#closeBtn:focus {
    outline: none; 

}
/* 모달 디자인 끝 */

/* 사이드 메뉴 */
.side{
     width: 200px;
     height: 500px;
     background-color: white;
     float: left;
     margin-right: 90px;
     border:solid #ffc30b ;
}

 .regi_side_tit{
      padding-top: 12px;
      padding-bottom:12px ;
      text-align: center;
      width: 100%;
      background-color: #ffc30b;
      font-size: 20px;
      font-weight: 900;
}

.regi_menu {
	margin-top:20px;
}

/* 사이드 메뉴 끝 */

.col-lg-12 {
	text-align: center;
    margin: 10px 0 30px 0;
}
        
.regi_main{
   float:  right;
   width: 1000px;
   height: 1000px;
   background-color: white;
} 

.regi_main .regi_tit{
   font-size: 30px;
   margin-bottom:50px;
   text-align: center;
}

.regi_content{
   width: 1300px;
   height: 1000px;
   margin:0 auto;
}
        
.regi_wrap{
   position: relative;
   display: inline-block;
   padding-top: 30px;
}

table img {
	height: 100px;
}

</style>
</head>
<body>

<div class="regi_content">
 <div class="regi_wrap">

<!-- side 시작 -->
   <div class="side">
      <div class="1nb_list">
         <div class="regi_side_tit">마이페이지</div>
           <div class="regi_side_menu">
               <ul class="regi_menu">
                    <p><b>쇼핑 이용 정보</b></p>
                    <li><a href='/mypage/myPerchaseList'><i class="fa fa-check" ></i>주문내역</a></li>
                    <li><a href='/order/basketList'><i class="fa fa-check" ></i>장바구니</a></li>
                    <br>
                    <p><b>게시판 이용 내역</b></p>
                    <li> <a href='/mypage/myQna/list'><i class="fa fa-check" ></i>1:1문의</a></li>
                     <li><a href='/mypage/myReview'><i class="fa fa-check" ></i>나의 상품평</a></li>
                    <li><a href='myPrdReply'><i class="fa fa-check" ></i>나의 상품 문의</a></li>
               
               
               
                    <c:if test="${!empty sessionMember}">
                    <li><a href='/mypage/modifyPwd'><i class="fa fa-check" ></i>비밀번호 변경</a></li>
                    <li><a href='/mypage/memberDelete'><i class="fa fa-check" ></i>회원 탈퇴</a></li>
                    </c:if>
                    

                </ul>
           </div>
     </div>
     <!-- 1nb_list -->
  </div>
<!-- side 끝-->

<!-- regi_main 시작 -->      
<div class="regi_main">
      
      



      <div class="p2">
   <!-- regi_tit 시작 -->
    <div class="regi_tit">
       <p><b>나의 상품평</b></p>
   </div>
   <!-- regi_tit 끝 -->
          

         <table tit aria-setsize="500px">
            <thead>
               <tr>
                  <th>리뷰이미지</th>   
                  <th>상품명</th>    
                  <th>리뷰제목</th> 
                  <th>리뷰내용</th>  
                  <th>등록일</th>  
               </tr>
            </thead>
            <!-- postingNo
            title
            replyBool
                 regdata -->
                 <!-- 페이징처리 -->
            <tbody id="myReviewTable">
            <c:forEach items="${myReviewList}" var="myReview">
               <tr>
                  <c:if test="${!empty myReview.reviewImg}">
                  <td><img src="/resources/review/${myReview.itemCode}/${myReview.reviewImg}"></td>
                  </c:if>
                  <c:if test="${empty myReview.reviewImg}">
                  <td><img src="/resources/review/myReviewDefault.png"></td>
                  </c:if>
                  <td><a href="/product/item?itemCode=${myReview.itemCode}">
                  <c:out value="${myReview.itemName}" /></a></td>
                  <td><c:out value="${myReview.reviewTitle}" /></td>
 					<c:choose>
    					<c:when test="${fn:length(myReview.reviewContent) > 20}">
        					<td><c:out value="${fn:substring(myReview.reviewContent ,0, 20)} . . ."/></td>
    					</c:when>
    					<c:otherwise>
        					<td><c:out value="${myReview.reviewContent}"/></td>
    					</c:otherwise>
					</c:choose>                
                  <td><fmt:formatDate pattern="yyyy/MM/dd"
                        value="${myReview.regDate }" /></td>
               </tr>
            </c:forEach>
            </tbody>
         </table>

         
               
      <!-- Paging -->
         <div class='pageBtns'>
            <ul class="pagination1">
            
               <c:if test="${pageMaker.prev}">
               <li class="paginate_button1 pervious">
               <a href="${pageMaker.startPage -1}">Previous</a>
               </li>
               </c:if>
               
               <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
               <li class='paginate_button1 ${pageMaker.cri.pageNum == num? "active":""}'>
               <a class="paging" href="/mypage/myReview/page/${num}">${num}</a></li>
               </c:forEach>
               
               <c:if test="${pageMaker.next}">
               <li class="paginate_button1 next">
               <a href="${pageMaker.endPage +1}">Next</a>
               </li>
               </c:if>
            
            </ul>
         </div><!-- endPaging -->     
      </div>
      <!-- p2-->
      
        <div id="review" class="modal">
        <div class="modal-content animate" style="max-width:798px;">
          <div class="imgcontainer">
            <span onclick="modalClose();" class="closeBtn" title="Close Modal">&times;</span>
          </div>
      
          <div class="reviewContainer">
             <label for="title"><b>리뷰 제목</b></label>
            <input type="text" name="reviewTitle" id="reviewTitle" class="reviewtext" placeholder="리뷰 제목을 남겨주세요." required> <br>
      
            <label for="content"><b>리뷰 내용</b></label>
            <textarea name="reviewContent" id="reviewContent" class="reviewtext" rows=5 cols=40 placeholder="내용을 입력하세요.&#10;※ 욕설, 영업에 방해되는 글은 관리자에 의해 삭제됩니다." style="resize:none;"></textarea>
            
            <label for="img"><b>이미지 첨부</b></label>
            <input type='file' name="reviewImg" id="reviewImg" accept="image/gif, image/jpeg, image/png, image/jpg" />
         	<input type="hidden" id="imgValue">
         
            <label for="score"><b>별점</b></label> <br>
              <p id="star_grade">
              <a href="#" id="score1" score="1" onclick="scoreAction($(this).attr('score'));">★</a>
              <a href="#" id="score2" score="2" onclick="scoreAction($(this).attr('score'));">★</a>
              <a href="#" id="score3" score="3" onclick="scoreAction($(this).attr('score'));">★</a>
              <a href="#" id="score4" score="4" onclick="scoreAction($(this).attr('score'));">★</a>
              <a href="#" id="score5" score="5" onclick="scoreAction($(this).attr('score'));">★</a>
              </p>
           
            <!-- 로그인 idNo -->
              <input type="hidden" id="sessionId" value='<c:out value="${sessionMember.idNo}"/>'>
            <!-- 글쓴이 idNo -->
              <input type="hidden" name="idNo" id="idNo">
              <input type="hidden" name="score" id="score" value="0">
              <input type="hidden" name="itemCode" value="${product.itemCode}">
              <input type="hidden" name="reviewNo" id="reviewNo">
            
            <button class="reviewBtn" id="reviewBtn">등록하기</button>
            <button style="display:none;" class="reviewBtn" id="updateBtn">수정하기</button>
          </div>
        </div>
      </div>
      
      
      
      
      
      
</div>
<!-- regi_main 끝 -->     
</div>

</div>
<script type="text/javascript">
	$(document).ready(function(){
		
		var pageTags = $(".paging");
		var myReviewTable = $("#myReviewTable");
		
		pageTags.on().click(function(e){
			e.preventDefault();
			let pageNum = e.target.innerText;
			console.log(pageNum);
			getListByPage(pageNum)
 			.then(function(response){
 				drawMyReviewList(response);
			})
			.catch(function(error){
				console.log(error);
			});
			
		});
		
		function drawMyReviewList(myReviewList){
			myReviewTable.html("");
			var frag = document.createDocumentFragment();
			for(var i = 0; i<myReviewList.length; i++){
				var str = "";
				var myReview = myReviewList[i];
				var tr = document.createElement("tr");
				if(myReview.reviewImg==null || myReview.reviewImg==""){
					str += "<td><img src='/resources/review/myReviewDefault.png'></td>";
				} else {
					str += "<td><img src='/resources/review/"+myReview.itemCode+"/"+myReview.reviewImg+"'></td>";
				}
				str += "<td><a href='/product/item?itemCode="+myReview.itemCode+"'>"+myReview.itemName+"</a></td>";
		        str += '<td>'+myReview.reviewTitle+'</td>';
		        if(myReview.reviewContent != null) {
		        	if(myReview.reviewContent.length > 20) {
		 		        str += '<td>'+myReview.reviewContent.substring(0,20)+' . . .</td>';
		 		        } else {
		        			str += '<td>'+myReview.reviewContent+'</td>';
		        		}		
		        } else {
		        	str += '<td></td>';
		        }
		        var regDate = myReview.regDate;
		        var date = new Date(regDate);
		        str += '<td>'+formatDate(date)+'</td>';
		        tr.innerHTML = str;
		        frag.appendChild(tr);
			}
			myReviewTable.append($(frag));
		}
		
		/* 	ajax 방식으로 페이징 처리 */
		function getListByPage(pageNum) {
			return $.ajax({
				type: "GET",
				url: "/mypage/myReview/page/"+pageNum,
				contentType : "application/json; charset=UTF-8"
			});
		}
		
		/* 연/월/일만 가져오는 함수 */
		function formatDate(date) { 
			var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
			if (month.length < 2) month = '0' + month; 
			if (day.length < 2) day = '0' + day; 
			return [year, month, day].join('/'); }

		
	});
</script>
</body>
</html>
