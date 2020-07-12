<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">   
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<style>
<!
DOCTYPE html> <html lang ="en"> <head> <meta charset ="UTF-8"> <meta name
	="viewport" content ="width=device-width, initial-scale =1.0 "> <title>공지사항
	</title> <!DOCTYPE html> <html> <head> <style>table {
	border-collapse: collapse;
	width: 90%;
}

<!--
배치-->th, td {
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

<!--
화면 나눔-->.pmain {
	width: 100%;
	height: 300px;
}

.p1 {
	width: 15%;
	float: left;
}

.p2 {
	width: 85%;
	float: right;
}

<!--
글쓰기 버튼-->.regBtn {
	margin-top: 10px;
	margin-left: 90%;
}
</style>
</head>
<body>


	<div class="pmain">
		<div class="p1">
			<ul>고객센터
			
			<li><a href='/community/notice/list'>공지사항</a></li>
			<li><a href='/community/Board_FAQ/list'>자주하는질문</a></li>
			</ul>
		</div>

		<div class="p2">


			<p>공지사항</p>
					<!-- 검색창 form-->
           <div class='row'>
      <div class="col-lg-12">
      
      <form id='searchForm' action="/community/notice/list" method='get'>
      <select name='type'>
      <option value=""
      <c:out value="${pageMaker.cri.type ==null?'selected':''}"/>>--</option>
      <option value="T"
      <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
      <option value="C"
      <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
      <option value="I"
      <c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>아이다</option>
      <option value="TC"
      <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
      <option value="TI"
      <c:out value="${pageMaker.cri.type eq 'TI'?'selected':''}"/>>제목 or 아이디</option>
      <option value="TCI"
      <c:out value="${pageMaker.cri.type eq 'TIC'?'selected':''}"/>>제목 or 내용 or 아이디</option>
      
      </select>
      
      <input  type='text' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
      <input name ='pageNum' value='${pageMaker.cri.pageNum}'>
      <input name ='amount' value='${pageMaker.cri.amount}'>
       <button class ='btn btn-default'>검색</button>
      
      </form>
      </div>
      </div><!-- 검색창마지막 -->
			
			<table tit aria-setsize="500px">
				<thead>
					<tr>
						<th>번호</th>
						<th>글 제목</th>
						<th>글 내용</th>

						<th>글 타입</th>
						<th>등록일</th>
					</tr>
				</thead>
                 
                 <!-- 페이징처리 -->
				<c:forEach items="${notice}" var="notice">
					<tr>
						<td><c:out value="${notice.postingNo }" /></td>

                        <td><a class ='move' href='<c:out value="${notice.postingNo}"/>'>
						<c:out value="${notice.title }" /></a></td>
					<%-- 	
						<td><a
							href='/community/notice/get?postingNo=<c:out value="${notice.postingNo}"/>'>
								<c:out value="${notice.title }" />
						</a></td> --%>

						<td><c:out value="${notice.content }" /></td>
						<td><c:out value="${notice.boardType }" /></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd"
								value="${notice.regDate }" /></td>



					</tr>

				</c:forEach>

			</table>
			
		  <!-- modal -->
				  <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				  aria-labelledby="myModalLabel" >
				  <div class="modal-dialog">
			      <div class="modal-content">
			      <div class="modal-header">
			      <button type="button" class="close" data-dismiss="modal"
			      aria-hidden="true">&times;</button>
			      <h4 class="modal-title" id="myModalLabel">Modal title</h4>
			      </div>
			      <div class="modal-body">처리가 완료되었습니다.</div>
			      <div class="modal-footer">
			      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			    
			      </div>
			
			    </div><!--  modal-content -->
				</div><!--  modal dialog -->
				</div><!-- modal 마지막 -->
    
      </div>
			
					<!-- Paging -->
		
			<div class='pull-right'>
			<ul class="pagination">
			
			<c:if test="${pageMaker.prev}">
			<li class="paginate_button pervious">
			<a href="${pageMaker.startPage -1}">Pervious</a>
			</li>
			</c:if>
			
			<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
			<li class='paginate_button ${pageMaker.cri.pageNum == num? "active":""}'>
			<a href="${num}">${num}</a></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
			<a href="${pageMaker.endPage +1}">Next</a>
			</li>
			</c:if>
			
			</ul>
			</div><!-- endPaging -->
			
			<!-- paging form end-->
			<form id='actionForm' action="/community/notice/list" method='get'>
				<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
			    <input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
                <input  type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
			</form><!-- paging form end-->

			<button id='regBtn' type="button" class="btn btn-xs pull-right">글쓰기</button>

		</div>
		<!-- p2-->

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

								alert(result);
								$(".modal-body").html(
										"게시글" + parseInt(result)
												+ "번이 등록되었습니다.");

							}
							$("#myModal").modal("show");

						}

						$("#regBtn").on("click", function() {

							self.location = "/community/notice/register"
						});
						
					});
			
		              
	         $(".paginate_button a").on("click", function(e){
	        	
	        
	         	e.preventDefault();
	         	
	         	console.log('click');
	         
	         	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	         	actionForm.submit();
	         });
	         
	         $(".move").on("click",function(e){
	        	   

	          	e.preventDefault();
	          	actionForm.append("<input type='hidden' name='postingNo' value = '" + $(this).attr("href") + "'>");
	             actionForm.attr("action", "/community/notice/get");
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

	</div>
	<!-- main-->





</body>

</html>