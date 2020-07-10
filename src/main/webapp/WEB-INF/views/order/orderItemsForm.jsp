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

<link rel="stylesheet" href="../../../resources/css/orderItemsForm.css">

<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../../../resources/jquery/orderItemsForm.js"></script>
</head>
<body>
	<H1>주문내역</H1>
	<form action="orderResult" method="post">
<!-- 	<form name="form_order"> -->
		<table class="list_view">
			<tbody align=center>
				<tr>
				<tr align=center class="fixed">
				
					<!-- itemImg1 from t_item -->
					<td class="fixed">아이템img</td>
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
				<c:forEach items="${orderList}" var="order">
				<tr cellpadding=40 align=center>
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
		
		<input type="hidden" value="cus01" name="idNo">
		
		<div class="clear"></div>

		<br> <br>

		<div class="clear"></div>

		<br>
		<table width=80% class="list_view">
			<tbody>
				<tr align=center class="fixed">
					<td class="fixed">주문번호</td>
					<td class="fixed">총 상품수</td>
					<td class="fixed">총 상품금액</td>
					<td class="fixed">총 배송비</td>
					<td class="fixed">총 할인금액</td>
					<td class="fixed">최종 결제금액</td>

					<td>최종 결제금액</td>
				</tr>
			</tbody>
		</table>

		<H1>배송지정보</H1>
		<input type="checkbox" id="sameAsMem"> 회원정보와 동일 
		<DIV class="detail_table">

			<table>
				<tbody>
					<tr class="dot_line">
						<td class="fixed_join">수령인</td>
						<td><input id="receiver_name" name="receiver_name"
							type="text" size="40" value="${orderer.member_name }" /> <input
							type="hidden" id="h_orderer_name" name="h_orderer_name"
							value="${orderer.member_name }" /> <input type="hidden"
							id="h_receiver_name" name="h_receiver_name"
							value="${orderer.member_name }" /></td>
					</tr>



					<tr class="dot_line">
						<td class="fixed_join">연락처1</td>
						<td><select id="hp1" name="hp1">
								<option>없음</option>
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> - <input size="10px" type="text" id="hp2" name="hp2"
							value="${orderer.hp2 }"> - <input size="10px" type="text"
							id="hp3" name="hp3" value="${orderer.hp3 }"><br> <br>
							<input type="hidden" id="h_hp1" name="h_hp1"
							value="${orderer.hp1 }" /> <input type="hidden" id="h_hp2"
							name="h_hp2" value="${orderer.hp2 }" /> <input type="hidden"
							id="h_hp3" name="h_hp3" value="${orderer.hp3 }" /> <c:set
								var="orderer_hp"
								value="${orderer.hp1}-${orderer.hp2}-${orderer.hp3 }" />
					</tr>


					<tr class="dot_line">
						<td class="fixed_join">연락처2(선택)</td>
						<td><select id="tel1" name="tel1">
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="070">070</option>
						</select> - <input size="10px" type="text" id="tel2" name="tel2"
							value="${orderer.tel2 }"> - <input size="10px"
							type="text" id="tel3" name="tel3" value="${orderer.tel3 }">
						</td>
						<input type="hidden" id="h_tel1" name="h_tel1"
							value="${orderer.tel1 }" />
						<input type="hidden" id="h_tel2" name="h_tel2"
							value="${orderer.tel2 }" />
						<input type="hidden" id="h_tel3" name="h_tel3"
							value="${orderer.tel3 }" />
					</tr>

					<tr class="dot_line">
						<td class="fixed_join">배송지 선택</td>
						<td><input type="radio" name="delivery_place"
							onClick="restore_all()" value="기본배송지" checked>기본배송지
							&nbsp;&nbsp;&nbsp; <input type="radio" name="delivery_place"
							value="새로입력" onClick="reset_all()">새로입력
							&nbsp;&nbsp;&nbsp; <input type="radio" name="delivery_place"
							value="최근배송지">최근배송지 &nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">주소</td>
						<td><input type="text" id="zipcode" name="zipcode" size="5"
							value="${orderer.zipcode }"> <a
							href="javascript:execDaumPostcode()">우편번호검색</a> <br>
							<p>
								지번 주소:<br> <input type="text" id="roadAddress"
									name="roadAddress" size="50" value="${orderer.roadAddress }" /><br>
								<br> 도로명 주소: <input type="text" id="jibunAddress"
									name="jibunAddress" size="50" value="${orderer.jibunAddress }" /><br>
								<br> 나머지 주소: <input type="text" id="namujiAddress"
									name="namujiAddress" size="50"
									value="${orderer.namujiAddress }" />
							</p> <input type="hidden" id="h_zipcode" name="h_zipcode"
							value="${orderer.zipcode }" /> <input type="hidden"
							id="h_roadAddress" name="h_roadAddress"
							value="${orderer.roadAddress }" /> <input type="hidden"
							id="h_jibunAddress" name="h_jibunAddress"
							value="${orderer.jibunAddress }" /> <input type="hidden"
							id="h_namujiAddress" name="h_namujiAddress"
							value="${orderer.namujiAddress }" /></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">배송 메시지</td>
						<td><input id="delivery_message" name="delivery_message"
							type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요." /></td>
					</tr>

					</tboby>
			</table>
		</div>
		<div>
			<br> <br>
			<h1>주문자 정보</h1>
			<table>
				<tbody>
					<tr class="dot_line">
						<td>이름</td>
						<td><input type="text" value="${orderer.member_name}"
							size="15" /></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">연락처</td>
						<td><select id="hp1" name="hp1">
								<option>없음</option>
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> - <input size="10px" type="text" id="hp2" name="hp2"
							value="${orderer.hp2 }"> - <input size="10px" type="text"
							id="hp3" name="hp3" value="${orderer.hp3 }"><br> <br>
							<input type="hidden" id="h_hp1" name="h_hp1"
							value="${orderer.hp1 }" /> <input type="hidden" id="h_hp2"
							name="h_hp2" value="${orderer.hp2 }" /> <input type="hidden"
							id="h_hp3" name="h_hp3" value="${orderer.hp3 }" /> <c:set
								var="orderer_hp"
								value="${orderer.hp1}-${orderer.hp2}-${orderer.hp3 }" />
					</tr>
					<tr class="dot_line">
						<td>이메일</td>
						<td><input type="text"
							value="${orderer.email1}@${orderer.email2}" size="15" /></td>
					</tr>
				</tbody>

			</table>
		</div>




		<div class="clear"></div>
		<br> <br> <br>
		<h1>결제</h1>
		<div class="detail_table">
			<table>
				
			</table>
		</div>
	<div class="clear"></div>
	<br>
	<br>
	<br>
	<center>
		<br> <br> <a href="javascript:fn_show_order_detail();">
			<img width="125" alt=""
			src="${contextPath}/resources/image/btn_gulje.jpg">
		</a>
		
		<button type="submit">결제하기</button>
		
		<a href="${contextPath}/main/main.do"> <img width="75" alt=""
			src="${contextPath}/resources/image/btn_shoping_continue.jpg">
		</a>

	</form>




		<div class="clear"></div>
		<div id="layer" style="visibility: hidden">
			<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
			<div id="popup_order_detail">
				<!-- 팝업창 닫기 버튼 -->
				<a href="javascript:"
					onClick="javascript:imagePopup('close', '.layer01');"> <img
					src="${contextPath}/resources/image/close.png" id="close" />
				</a> <br />
				<div class="detail_table">
					<h1>최종 주문 사항</h1>
					<table>
						<tbody align=left>
							<tr>
								<td width=200px>주문상품번호:</td>
								<td>
									<p id="p_order_goods_id">주문번호</p>
								</td>
							</tr>
							<tr>
								<td width=200px>주문상품명:</td>
								<td>
									<p id="p_order_goods_title">주문 상품명</p>
								</td>
							</tr>
							<tr>
								<td width=200px>주문상품개수:</td>
								<td>
									<p id="p_total_order_goods_qty">주문 상품개수</p>
								</td>
							</tr>
							<tr>
								<td width=200px>주문금액합계:</td>
								<td>
									<p id="p_total_order_goods_price">주문금액합계</p>
								</td>
							</tr>
							<tr>
								<td width=200px>주문자:</td>
								<td>
									<p id="p_orderer_name">주문자 이름</p>
								</td>
							</tr>
							<tr>
								<td width=200px>받는사람:</td>
								<td>
									<p id="p_receiver_name">받는사람이름</p>
								</td>
							</tr>
							<tr>
								<td width=200px>배송방법:</td>
								<td>
									<p id="p_delivery_method">배송방법</p>
								</td>
							</tr>
							<tr>
								<td width=200px>받는사람 휴대폰번호:</td>
								<td>
									<p id="p_receiver_hp_num"></p>
								</td>
							</tr>
							<tr>
								<td width=200px>받는사람 유선번화번호:</td>
								<td>
									<p id="p_receiver_tel_num">배송방법</p>
								</td>
							</tr>
							<tr>
								<td width=200px>배송주소:</td>
								<td align=left>
									<p id="p_delivery_address">배송주소</p>
								</td>
							</tr>
							<tr>
								<td width=200px>배송메시지:</td>
								<td align=left>
									<p id="p_delivery_message">배송메시지</p>
								</td>
							</tr>

								<tr>
								<td width=200px>결제방법:</td>
								<td align=left>
									<p id="p_pay_method">결제방법</p>
								</td>
							</tr>
							<tr>
								<td colspan=2 align=center>
								<input name="btn_process_pay_order" type="button"
									onClick="fn_process_pay_order()" value="최종결제하기">
								<button type="submit"></button>
									</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="clear"></div>
				<br>