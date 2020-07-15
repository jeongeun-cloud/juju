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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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
	
	<!--글쓰기 버튼 -->
	.regBtn {
		margin-top: 10px;
		margin-left: 90%;
	}
	

</style>
</head>
<body>
	<div class="pmain">
        <a href='/shop/register'>상품 등록</a>
        <a href='/shop/list'>상품 리스트</a>
		<div class="p2">
			<p><b>상품리스트</b></p>
		    <form name="excelForm" id="excelForm" method="POST" action="/shop/excelDown">
		    	<span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span>
			    <input type="submit" id="excelDown" style="float:right" value="엑셀다운로드"/>
			</form>
			<button id="regBtn" type="button">Register New Item</button> <br>
			총 등록 상품 : <label><c:out value="${pageMaker.total }" /></label>
			
			
			<!-- 검색창-->
			<form id="searchForm" action="/shop/list" method="get">
				<div class="serch">
					<label>상품명</label>
					<select name='type'>
						<option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" /> >--</option>
	                    <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>제목</option>
	                    <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }" />>내용</option>
	                    <option value="NC" <c:out value="${pageMaker.cri.type eq 'NC'? 'selected':'' }" />>제목 or 내용</option>
					</select>
					
 					<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<button>검색</button>
				</div>
			</form>
			
			<table tit aria-setsize="500px">
				<thead>
					<tr>
						<th><input type="checkbox" name="chkAll" id="chkAll"></th>
						<th>번호</th>
						<th>상품명</th>
						<th>판매 가격</th>
						<th>할인 가격</th>
						<th>진열상태</th>
						<th>판매상태</th>
						<th>등록일</th>
						<th>수정</th>
					</tr>
				</thead>
				
				<c:forEach items="${list }" var="item">
					<tr>
						<td><input type="checkbox" name="chk" value='<c:out value="${item.itemCode }" />'></td>
						<td><c:out value="${item.itemCode }" /></td>
						<td>
							<a class='move' href='<c:out value="${item.itemCode }" />'>
								<c:out value="${item.itemName }" />
							</a>
						</td>
						<td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" />원</td>
						<td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.normPrice}" />원</td>
						<td><c:out value="${item.dispStat }" /></td>
						<td><c:out value="${item.saleStat }" /></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${item.regDate }" /></td>
						<td>
							<button data-oper="modify" 
	                        onclick="location.href='/shop/modify?itemCode=<c:out value="${item.itemCode }"/>&pageNum=<c:out value="${pageMaker.cri.pageNum}"/>&amount=<c:out value="${pageMaker.cri.amount}"/>&keyword=<c:out value="${pageMaker.cri.keyword}"/>&type=<c:out value="${pageMaker.cri.type}"/>'">
	                        	수정
	                     	</button>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<div class='pull-right'>
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active" : "" } ">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a href="${pageMaker.endPage +1 }">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
			<!--  end Pagination -->

			<form id='actionForm' action="/shop/list" method='get'>
				<input type='hidden' name='pageNum' id="pageNum" value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' id="amount" value='${pageMaker.cri.amount}'>
				<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>' >
            	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>' >
			</form>
			
			<!-- 모달 추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<!-- <h4 class="modal-title" id="myModalLabel">Modal Title</h4> -->
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 모달 끝 -->

			<button type="button" value="remove" onclick="statAction(this.value);">삭제</button>
			<button type="button" value="dis" onclick="statAction(this.value)">진열</button>
			<button type="button" value="sale" onclick="statAction(this.value)">판매</button>
			<button type="button" value="sold" onclick="statAction(this.value)">품절</button>
			
		</div>
		<!-- p2-->
		
	</div>
	<!-- main-->
	
	<script type="text/javascript">
		$(document).ready(function(){

			// 모달 관련 js
			var result = '<c:out value="${result}"/>';
			
			checkModal(result);
			console.log(result);
			
			history.replaceState({}, null, null);
			
			function checkModal(result) {
				if(result === '' || history.state) {
					return;
				}
				
				if(result.length > 0) {
					if(result != 'success') {
						$(".modal-body").html("상품 " + result + " 번이 등록되었습니다.");
					}
				}
				
				$("#myModal").modal("show");
			} 
			
			
			// 전체 선택
			$("#chkAll").click(function(){
		        //클릭되었으면
		        if($("#chkAll").prop("checked")){
		            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
		            $("input[name=chk]").prop("checked",true);
		            //클릭이 안되있으면
		        }else{
		            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
		            $("input[name=chk]").prop("checked",false);
		        }
		    });
			
			// register로 이동
			$("#regBtn").on("click", function(){
				self.location="/shop/register";
			});
		 	
		});
		
		// 체크박스 일괄 처리
		function statAction(val) {
			
			var checkRow = "";
			$("input[name='chk']:checked").each (function (){
				checkRow = checkRow + $(this).val()+"," ;
			});
		  	checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
		 
		  	if(checkRow == ''){
		    	alert("변경 혹은 삭제할 대상을 선택하세요.");
		    	return false;
		  	}
		  	//console.log("### checkRow => " + checkRow);
		  	
		  	var page = $("#pageNum").val();
		  	var amount = $("#amount").val();
		  	
			// 진열상태 변경 
		  	if(val == "dis") {
		  		location.href="/shop/disModify?itemCode="+checkRow+"&pageNum="+page+"&amount"+amount;
			// 판매상태 변경 
		  	}else if(val == "sale") {
		  		location.href="/shop/saleModify?itemCode="+checkRow+"&pageNum="+page+"&amount"+amount;
			// 품절로 변경 
		  	}else if(val == "sold") {
		  		location.href="/shop/soldModify?itemCode="+checkRow+"&pageNum="+page+"&amount"+amount;
			// 삭제
		  	}else if(val == "remove") {
		  		location.href="/shop/remove?itemCode="+checkRow+"&pageNum="+page+"&amount"+amount;
		  	}
		}
		
		// 페이지 이동 
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		// get
	 	$(".move").on("click", function(e) {
			e.preventDefault();
			
			actionForm.append("<input type='hidden' name='itemCode' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "/shop/get");
			actionForm.submit();
		});
		
		// search
		var searchForm = $("#searchForm");
      	$("#searchForm button").on("click", function(e) {
	        if(!searchForm.find("option:selected").val()) {
	        	alert("검색 종류를 선택하세요");
	            return false;
	         }
         
	         if(!searchForm.find("input[name='keyword']").val()) {
	            alert("키워드를 입력하세요");
	            return false;
	         }
         
	         searchForm.find("input[name='pageNum']").val("1");
	         e.preventDefault();
	         
	         searchForm.submit();
	      });

	</script>

</body>

</html>