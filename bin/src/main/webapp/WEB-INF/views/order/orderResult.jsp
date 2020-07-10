<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문완료</title>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<BODY>

	<p style="text-align: right;">
		01 장바구니 > 02 주문서 작성/결제 > <strong> 03 주문완료 </strong>
	</p>


	<hr size="2px" color="grey"></hr>

	주문이 완료되었습니다.이용해주셔서 감사합니다.
	<br>주문 내역은 [마이페이지 > 주문내역/배송조회]에서 다시 확인할 수 있습니다.
	<br>
	<strong>주문번호: </strong> ${order.orderCode}
	

	<h3>
		<c:out value="${order.orderCode}"></c:out>
	</h3>


	<form action="orderResult" method="post">
		<!-- 	<form name="form_order"> -->
		<table class="list_view">
			<tbody align=center>
				<tr>
				<tr align=center class="fixed">

					<!-- itemImg1 from t_item -->
					<td class="fixed">아이템Img</td>
					<!-- itemName from t_item -->
					<td class="fixed">주문상품명</td>
					<!-- normPrice from t_item -->
					<td class="fixed">상품금액</td>
					<!-- itemNum from t_basket -->
					<td class="fixed">수량</td>
					<!-- disAmount from t_order_info -->
					<td class="fixed">할인금액</td>
					<!-- price from t_item -->
					<td class="fixed">주문금액</td>
				</tr>

				<!-- 리스트니까 여러 목록이어서 c:forEach로 c:out을 감싸주었음  -->
				<!-- OrderController의 list -> jsp에서 DB 호출시 ${list} -->
				<!-- totalPrice를 구하기 위해 c:set 사용하여 forEach로 반복문 돌려주었음  -->

				<c:set var="totalPrice" value="${0}" />
				<c:forEach var="order" items="${orderList}">
					<c:set var="totalPrice"
						value="${totalPrice + (order.price * order.itemNum)}" />
					<tr cellpadding="40" align=center>
						<td><c:out value="${order.itemImg1}"></c:out></td>
						<td><c:out value="${order.itemName}"></c:out></td>
						<td><c:out value="${order.normPrice}"></c:out></td>
						<td><c:out value="${order.itemNum}"></c:out></td>
						<td><c:out value="${order.normPrice - order.price}"></c:out></td>
						<td><c:out value="${order.price * order.itemNum}"></c:out></td>
					</tr>
				</c:forEach>


			</tbody>
		</table>
	</form>


	<h2>주문자 정보</h2>
	<table border="1" cellpadding="0" cellspacing="0">
		<colgroup>
			<col width="150" />
			<col width="400" />
		</colgroup>

		<tr>
			<td>이름</td>
			<td>${orderResult.memName}</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${orderResult.contact}</td>
		</tr>
		
	</table>


	<h2>배송 정보</h2>
	<table border="1" cellpadding="0" cellspacing="0">
		<colgroup>
			<col width="150" />
			<col width="400" />
		</colgroup>

		<tr>
			<td>이름</td>
			<td>${orderResult.receiver}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${orderResult.receivAddr}</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${orderResult.receivContact}</td>
		</tr>
		<tr>
			<td>요청사항</td>
			<td>${orderResult.reqNote}</td>
		</tr>
	</table>

	<h2>결제 정보</h2>
	<table border="1" cellpadding="0" cellspacing="0">
		<colgroup>
			<col width="150" />
			<col width="400" />
		</colgroup>

		<tr>
			<td>결제 방법</td>
			<td>payment method</td>
		</tr>
		<tr>
			<td>결제금액</td>
			<td>totalPrice + deliCharge</td>
		</tr>

	</table>

	<br> <br> 

  <div class="container">
      <div class="row">
        <div class="col-12">
          <div>
            <button type="submit" class="btn btn-primary">주문내역/배송조회 확인</button>
            <button type="submit" class="btn btn-secondary">쇼핑 계속하기</button>
            <button type="submit" class="btn btn-success">메인으로 가기</button>
            <button type="submit" class="btn btn-danger">로그아웃</button>
          </div>
        </div>
      </div>
    </div>






</BODY>
</html>
