<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>


#allFooter {

	height: 40%;
	margin-top: 5%;
}


#footerMakersBar {
	width: 100%;
    height: 50px;
    line-height: 50px;
    background-color : #566357;
    color : white;
}

#footerMakersBarContent {
	width: 80%;
	height: 50px;
	padding-left: 10%;
	padding-right: 10%;
	content-align: center;

}

#footerMakersBarContent ul{
		list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        display:flex;
        justify-content:flex-end;
}




#footerimg {
	width: 100%;
	bottom:0;
	display: block;
}

a:hover,
a:visited,
a:link {
text-decoration: none;
}

</style>


</head>
<body>

<div id="allFooter">
<div id="footerMakersBar">
	<div id="footerMakersBarContent">
	
	
		<ul>
			<li><a href="#" style="color: white;">MAKERS</a></li> 
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<li><a href="#" style="color: white;">이용약관</li>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<li><a href="#" style="color: white;">개인정보처리방침</li>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<li><a href="#" style="color: white;">사이트안내</li>
		</ul>
		
	</div>
</div>

<div>
   <img id="footerimg" src="/resources/images/footerImg.PNG">
</div>
</div>

</body>
</html>