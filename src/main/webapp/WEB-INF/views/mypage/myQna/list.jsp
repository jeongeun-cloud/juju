<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/menuBar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>

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
                    <c:if test="${!empty sessionMember}">
                    <p><b>게시판 이용 내역</b></p>
                    <li> <a href='/mypage/myQna/list'><i class="fa fa-check" ></i>1:1문의</a></li>
                    <li><a href='/mypage/myReview'><i class="fa fa-check" ></i>나의 상품평</a></li>
                    <li><a href='/mypage/myPrdReply'><i class="fa fa-check" ></i>나의 상품 문의</a></li>
                    
                   		 <c:choose>
                           <c:when test="${sessionMember.memCode eq 'CUSTOMER'  
                           				&& sessionMember.memCode ne 'GOOGLE'
                           				&& sessionMember.memCode ne 'KAKAO'
                           				&& sessionMember.memCode ne 'NAVER' }">
                              <li><a href="/mypage/customerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                           <c:when test="${sessionMember.memCode eq 'SELLER'
                           				&& sessionMember.memCode ne 'GOOGLE'
                           				&& sessionMember.memCode ne 'KAKAO'
                           				&& sessionMember.memCode ne 'NAVER' }">
                           }">
                              <li><a href="/mypage/sellerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                           <c:when test="${sessionMember.memCode eq 'JUNIOR'
                           				&& sessionMember.memCode ne 'GOOGLE'                           			
                           				&& sessionMember.memCode ne 'KAKAO'
                           				&& sessionMember.memCode ne 'NAVER' 
                           }">
                              <li><a href="/mypage/sellerInfoModify"><i class="fa fa-check" ></i>개인 정보 수정</a></li>
                           </c:when>
                        </c:choose>
                        <c:choose>
  						<c:when test="${(sessionMember.memCode eq 'CUSTOMER'
                           				|| sessionMember.memCode eq 'JUNIOR'                           			
                           				|| sessionMember.memCode eq 'SELLER')                           			
                           				&& (sessionMember.memCode ne 'GOOGLE'                           			
                           				|| sessionMember.memCode ne 'KAKAO'
                           				|| sessionMember.memCode ne 'NAVER')   
                           				}">
                    <li><a href='/mypage/modifyPwd'><i class="fa fa-check" ></i>비밀번호 변경</a></li>
                    <li><a href='/mypage/memberDelete'><i class="fa fa-check" ></i>회원 탈퇴</a></li>
                        </c:when>
                        </c:choose>
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
       <p><b>1:1문의</b></p>
   </div>
   <!-- regi_tit 끝 -->
          

               <!-- 검색창 form-->
           <div class='row'>
      <div class="col-lg-12">
      
      <form id='searchForm' action="/mypage/myQna/list" method='get'>
      <select name='type'>
      <option value=""
      <c:out value="${pageMaker.cri.type ==null?'selected':''}"/>>--</option>
      <option value="T"
      <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
      <option value="C"
      <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
      <option value="I"
      <c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>아이디</option>
      <option value="TC"
      <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
      <option value="TI"
      <c:out value="${pageMaker.cri.type eq 'TI'?'selected':''}"/>>제목 or 아이디</option>
      <option value="TCI"
      <c:out value="${pageMaker.cri.type eq 'TIC'?'selected':''}"/>>제목 or 내용 or 아이디</option>
      
      </select>
      
      <input  type='text' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
      <input type="hidden"  name ='pageNum' value='${pageMaker.cri.pageNum}'>
      <input type="hidden"  name ='amount' value='${pageMaker.cri.amount}'>

       <button id="searchBtn" class ='btn btn-default'>검색</button>
      
      </form>
      </div>
      </div><!-- 검색창마지막 -->
         
         <table tit aria-setsize="500px">
            <thead>
               <tr>
                  <th>번호</th>    
                  <th>제목</th>   

                  <th>내용</th> 
                  <th>등록일</th>  
               </tr>
            </thead>
            <!-- postingNo
            title
            replyBool
                 regdata -->
                 <!-- 페이징처리 -->
                 
            <c:forEach items="${qna}" var="myQna">
               <tr>
                  <td><c:out value="${myQna.postingNo }" /></td>

                  <td><a class ='move' href='<c:out value="${myQna.postingNo}"/>'>
                  <c:out value="${myQna.title }" /></a></td>
      

                 <td><c:out value="${myQna.content }" /></td>
               
                  <td><fmt:formatDate pattern="yyyy/MM/dd"
                        value="${myQna.regDate }" /></td>
                     

               </tr>

            </c:forEach>

         </table>
         
         
         
         
       <button id='regBtn' type="button" class="btn btn-xs pull-right">글쓰기</button>  
         
               
      <!-- Paging -->
         <div class='pageBtns'>
            <ul class="pagination1">
            
               <c:if test="${pageMaker.prev}">
               <li class="paginate_button1 pervious">
               <a href="${pageMaker.startPage -1}">Pervious</a>
               </li>
               </c:if>
               
               <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
               <li class='paginate_button1 ${pageMaker.cri.pageNum == num? "active":""}'>
               <a href="${num}">${num}</a></li>
               </c:forEach>
               
               <c:if test="${pageMaker.next}">
               <li class="paginate_button1 next">
               <a href="${pageMaker.endPage +1}">Next</a>
               </li>
               </c:if>
            
            </ul>
         </div><!-- endPaging -->
         
         <!-- paging form-->
         <form id='actionForm' action="/mypage/myQna/list" method='get'>
            <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
            <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
             <input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
             <input  type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
         </form><!-- paging form end-->

         

      </div>
      <!-- p2-->
      
      
      
      
      
      
</div>
<!-- regi_main 끝 -->      
      
      
      
      
      
      
      
      
</div>
<!-- regi_content 끝 -->
</div>      
<!-- regi_wrap 끝 -->
      
      
      

<!-- modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
   <div class="modal-dialog">
       <div class="modal-content">
           <div class="modal-header" style="border-bottom:none;">
               <button type="button" class="close" data-dismiss="modal"  aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="myModalLabel">Modal title</h4>
           </div>
               <div class="modal-body">처리가 완료되었습니다.</div>
               <div class="modal-footer" style="border-top:none;">
               <button id="closeBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
       </div><!--  modal-content -->
   </div><!--  modal dialog -->
</div><!-- modal 마지막 -->





 

<script type="text/javascript">
        var actionForm = $("#actionForm");
   
      
      $(document).ready(
               function() {

                  var result = '<c:out value="${result}"/>';

                  checkModal(result);

                  function checkModal(result) {

                     if (result === '') {
                        return;
                     }

                     if (parseInt(result) > 0) {

                     
                        $(".modal-body").html( "게시글" + parseInt(result) + "번이 등록되었습니다.");

                     }
                     $("#myModal").modal("show");

                  }

                  $("#regBtn").on("click", function() {

                     self.location = "/mypage/myQna/register"
                  });
                  
               });
         
                    
            $(".paginate_button1 a").on("click", function(e){
              
           
               e.preventDefault();
               
               console.log('click');
            
               actionForm.find("input[name='pageNum']").val($(this).attr("href"));
               actionForm.submit();
            });
            
            $(".move").on("click",function(e){
                 

                e.preventDefault();
                actionForm.append("<input type='hidden' name='postingNo' value = '" + $(this).attr("href") + "'>");
                actionForm.attr("action", "/mypage/myQna/get");
                actionForm.submit();
                
             });
            
            <!--검색 스크립트 start-->
            var searchForm =$("#searchForm");
            
            $("#searchForm button").on("click" , function(e){
                  
               if(!searchForm.find("option:selected").val()){
                  alert("검색종류를 선택하세요");
                  return false;
                  
               }
               if(!searchForm.find("input[name='keyword']").val()){
                  alert("검색어 입력하세요");
                  return false;
                  
               }
               
               searchForm.find("input[name='pageNum']").val("1");
               e.preventDefault();
               
               searchForm.submit();
               
               
                });
            
            <!--검색 스크립트 end-->
      </script>




</body>

</html>