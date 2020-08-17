<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
</head>
<body>

<div class="event_content">
	<div class="event_wrap">
        <div class="event_pro">
            <div class="event_tit">
	            하이
	            <c:forEach items="${recommend }" var="recommend">
	           		아이디 : <c:out value="${recommend.idNo}" />
	           		아이템 : <c:out value="${recommend.itemCode}" />
	           		값 : <c:out value="${recommend.value}" />
	           	</c:forEach>
            </div>
        </div>
    </div>
</div>


</body>
</html>