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

<style>
	table {
		border-collapse: collapse;
		width: 90%;
	}
	
	<!--배치-->
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
	
	<!--화면 나눔-->
	.pmain {
		width: 100%;
		height: 300px;
	}
	
	.p2 {
		width: 85%;
	}
	
	<!--글쓰기 버튼-->
	.regBtn {
		margin-top: 10px;
		margin-left: 90%;
	}
</style>
</head>
<body>
	<div class="pmain">
		<div class="p2">
			<p><b>상품리스트</b></p>
			<button id="regBtn" type="button">Register New Item</button>
			<!-- 검색창-->
			<div class="serch">
				<select class="check" name="제목+내용 " id="제목">
					<option value="제목">제목</option>
					<option value="내용">내용</option>
					<option value="뭐">뭐</option>
					<option value="임마">임마</option>
				</select> <input class="text" type="text">
				<button class="sb" type="button">검색</button>
			</div>

			<table tit aria-setsize="500px">
				<thead>
					<tr>
						<th>번호</th>
						<th>카테고리와 상품명</th>
						<th>판매 가격</th>
						<th>할인 가격</th>
						<th>상태</th>
						<th>등록일(수정일)</th>
						<th>수정</th>
					</tr>
				</thead>
				
				<c:forEach items="${list }" var="register">
					<tr>
						<td><c:out value="${register.itemCode }" /></td>
						<td><c:out value="${register.itemName }" /></td>
						<td><c:out value="${register.price }" /></td>
						<td><c:out value="${register.normPrice-price }" /></td>
						<td><c:out value="${register.dispStat }" /></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${register.updateDate }" /></td>
						<td><button class="modify" type="button">수정</button></td>
					</tr>
				</c:forEach>
			</table>
			
			<!-- 모달 추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">$times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal Title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 모달 끝 -->

			<button type="button">삭제</button>
			<button type="button">진열</button>
			<button type="button">판매</button>
			<button type="button">품절</button>
			<button type="button">엑셀 다운로드</button>
		</div>
		<!-- p2-->
		
	</div>
	<!-- main-->
	
	<script type="text/javascript">
		$(document).ready(function(){

			var result = '<c:out value="${result}"/>';
			
			
			checkModal(result);
			
			history.replaceState({}, null, null);
			
			function checkModal(result) {
				if(result === '' || history.state ) {
					return;
				}
				
				if(parseInt(result) > 0) {
					$(".modal-body").html("상품 " + parseInt(result) + " 번이 등록되었습니다.");
				}
				
				$("#myModal").modal("show");
			}
			
			
			$("#regBtn").on("click", function(){
				self.location="/shop/register";
			});
		});
	</script>

</body>

</html>