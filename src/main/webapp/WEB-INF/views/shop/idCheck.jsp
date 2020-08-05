<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<input type="hidden" id="seller" value='<c:out value="${sessionMember.memCode}" />'>

<script type="text/javascript" charset="UTF-8">
	if($("#seller").val() != 'SELLER' || $("#seller").val() == '') {
		alert("잘못된 접근입니다.");
		location.href='/';
	} 
</script>
