<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Document</title>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<BODY>
	<H1>주문 완료 페이지</H1>
	<h3>
		<c:out value="${order.orderCode}"></c:out>
	</h3>
	<TABLE class="list_view">
		<TBODY align=center>


			<h2>주문자 정보</h2>
			<table style="width: 100%">
				<tr>
					<th>이름</th>
					<th>연락처</th>
				</tr>
		<%-- 		<tr>
					<td><c:out value="${member.memName}"></c:out></td>
					<td><c:out value="${member.Contact}"></c:out></td>
				</tr>

			</table>

			<h2>배송 정보</h2>
			<table style="width: 100%">
				<tr>
					<th>이름(회사)</th>
					<th>주소</th>
					<th>휴대폰</th>
					<th>요청사항</th>
				</tr>
				<tr>
					<td><c:out value="${delivery.receiver}"></c:out></td>
					<td><c:out value="${delivery.recivAddr}"></c:out></td>
					<td><c:out value="${delivery.receivContacat}"></c:out></td>
					<td><c:out value="${delivery.reqNote}"></c:out></td>
				</tr> --%>

			</table>

			<h2>결제 정보</h2>
	</table>

	<TR>
	<%-- 	<c:forEach var="item" items="${myOrderList }">
			<td>${item.order_id }</td>
			<TD class="goods_image"><a
				href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
					<IMG width="75" alt=""
					src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			</a></TD>
			<TD>
				<h2>
					<A
						href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_title }</A>
				</h2>
			</TD>
			<td>
				<h2>${item.order_goods_qty }개<h2>
			</td>
			<td><h2>${item.order_goods_qty *item.goods_sales_price}원
					(10% 할인)</h2></td>
			<td><h2>0원</h2></td>
			<td><h2>${1500 *item.order_goods_qty }원</h2></td>
			<td>
				<h2>${item.order_goods_qty *item.goods_sales_price}원</h2>
			</td>
	</TR>
	</c:forEach> --%>
	</TBODY>
	</TABLE>
	<DIV class="clear"></DIV>
	<form name="form_order">
		<br> <br>
		<H1>2.배송지 정보</H1>
		<DIV class="detail_table">

			<TABLE>
				<TBODY>
					<TR class="dot_line">
						<TD class="fixed_join">배송방법</TD>
						<TD>${myOrderInfo.delivery_method }</TD>
					</TR>
					<TR class="dot_line">
						<TD class="fixed_join">받으실 분</TD>
						<TD>${myOrderInfo.receiver_name }</TD>
					</TR>
					<TR class="dot_line">
						<TD class="fixed_join">휴대폰번호</TD>
						<TD>
							${myOrderInfo.receiver_hp1}-${myOrderInfo.receiver_hp2}-${myOrderInfo.receiver_hp3}</TD>
					</TR>
					<TR class="dot_line">
						<TD class="fixed_join">유선전화(선택)</TD>
						<TD>
							${myOrderInfo.receiver_tel1}-${myOrderInfo.receiver_tel2}-${myOrderInfo.receiver_tel3}</TD>
						</TD>
					</TR>


					<TR class="dot_line">
						<TD class="fixed_join">주소</TD>
						<td>${myOrderInfo.delivery_address}</td>>
					</TR>
					<TR class="dot_line">
						<TD class="fixed_join">배송 메시지</TD>
						<TD>${myOrderInfo.delivery_message}</TD>
					</TR>
					<TR class="dot_line">
						<TD class="fixed_join">선물 포장</TD>
						<td>${myOrderInfo.gift_wrapping}</td>
					</TR>
				</TBODY>
			</TABLE>

		</DIV>
		<div>
			<br> <br>
			<h2>주문고객</h2>
			<table>
				<TBODY>
					<tr class="dot_line">
						<td><h2>이름</h2></td>
						<td><input type="text" value="${orderer.member_name}"
							size="15" disabled /></td>
					</tr>
					<tr class="dot_line">
						<td><h2>핸드폰</h2></td>
						<td><input type="text"
							value="${orderer.hp1}-${orderer.hp2}-${orderer.hp3}" size="15"
							disabled /></td>
					</tr>
					<tr class="dot_line">
						<td><h2>이메일</h2></td>
						<td><input type="text"
							value="${orderer.email1}@${orderer.email2}" size="15" disabled />
						</td>
					</tr>
				</TBODY>
			</table>
		</div>
		<DIV class="clear"></DIV>
		<br> <br> <br>
		<H1>3.결제정보</H1>
		<DIV class="detail_table">
			<table>
				<TBODY>
					<TR class="dot_line">
						<TD class="fixed_join">결제방법</TD>
						<TD>${myOrderInfo.pay_method }</TD>
					</TR>
					<TR class="dot_line">
						<TD class="fixed_join">결제카드</TD>
						<TD>${myOrderInfo.card_com_name}</TD>
					</TR>
					<TR class="dot_line">
						<TD class="fixed_join">할부기간</TD>
						<TD>${myOrderInfo.card_pay_month }</TD>
					</TR>
				</TBODY>
			</table>
		</DIV>
	</form>
	<DIV class="clear"></DIV>
	<br>
	<br>
	<br>
	<center>
		<br> <br> <a href="${contextPath}/main/main.do"> <IMG
			width="75" alt=""
			src="${contextPath}/resources/image/btn_shoping_continue.jpg">
		</a>
		<DIV class="clear"></DIV>