<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>상품 등록</h2>
    <form role="form" action="/shop/register" method="POST">
        <div class="container"> 
            <label for="category">상품 정보 입력</label><br>
            <select>
                <option>대분류 선택</option>
                <option>대분류 선택</option>
                <option>대분류 선택</option>
                <option>대분류 선택</option>
                <option>대분류 선택</option>
            </select>
            <select>
                <option>중분류 선택</option>
                <option>중분류 선택</option>
                <option>중분류 선택</option>
                <option>중분류 선택</option>
                <option>중분류 선택</option>
            </select>
        </div>
        <input type="text" name="itemName" placeholder="상품명을 입력하세요." style="width: 350px;">
        <div class="container">
            <label for="itemContent">상품 상세정보</label><br>
            <textarea name="itemContent" style="height: 200px; width:350px"></textarea>
        </div>
        <div class="container">
            <label for="price">판매가격</label>
            <input type="text" name="price"><br>
            <label for="normPrice">정상가격</label>
            <input type="text" name="normPrice">
        </div>
        <div class="container">
            <label for="stock">재고</label>
            <input type="text" name="stock"><br>
        </div>
        
        <div class="container">
            <label for="status"><b>표시상태 설정</b></label><br>
            <label for="">진열상태</label>
            <input type="radio" name="dispStat" value="yes" checked="checked">진열함
            <input type="radio" name="dispStat" value="no">진열안함<br>
            <label for="">판매상태</label>
            <input type="radio" name="saleStat" value="yes" checked="checked">판매함
            <input type="radio" name="saleStat" value="no">판매안함
            <input type="radio" name="saleStat" value="noS">품절
        </div>
        <div class="container">
            <label>상품 특성</label>
            <input type="checkbox" name="itemChr" value="newItem">신상품
            <input type="checkbox" name="itemChr" value="best">Best
            <input type="checkbox" name="itemChr" value="discount">할인
        </div>
        <div class="container">
            <input type='file' id="imgInp" />
        </div>
        
        <button type="submit">Submit Button</button>
        <button type="reset">Reset Button</button>
    </form>
</body>
</html>