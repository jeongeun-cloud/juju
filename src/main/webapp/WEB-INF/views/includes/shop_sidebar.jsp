<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
  /* sidebar */
    :root {
  --dark-gray: #444444;
  --light-gray: #c9c9c5;
}
.accordian {
  max-width: 600px;
  width: 100%;
  color: #b9b9b9;
  font-weight: 100;
  letter-spacing: 0.035em;
  font-size: 14px;
  margin: 0 auto;
}
.accordian ul > li {
  margin-bottom: 8px;
}
 
.accordian h3 {
  cursor: pointer;
  padding: 1.0rem 0.2rem 1.0rem 0rem;
  margin: 0;
  border-top: 1px solid #8FA691;
  display: block;
  font-weight: 500;
  letter-spacing: 0.035em;
  position: relative;
  font-size: 16px;
  color: #b9b9b9;
  
}
.accordian h2{
    padding: 1.0rem 1.0rem 1.0rem 1.0rem;
     margin: 0;
    display: block;
    letter-spacing: 0.035em;
     position: relative;
     color:white;
     background-color: #8FA691;
     font-size:1.3em;
     font-weight: bold;
     
}

.accordian ul ul {
  display: none;
  height: 100%;
  margin-bottom: -7px;
}
.accordian ul ul li {
  background-color: #fff;
  padding: 1rem 1.8rem;
  color: var(--dark-gray);
  box-shadow: none;
  border-left: 1px solid #dfdfdf;
  border-right: 1px solid #dfdfdf;
  border-bottom: 1px solid #dfdfdf;
}
.accordian ul ul li p {
  opacity: 0;
  transition: all 0.5s;

}

.accordian .arrow {
  display: inline-block;
  width: 8px;
  height: 8px;
  margin-right: 8px;
 
}

.sidebarNav {
  max-width: 207px;

}
.sidebarNav h3 {
  border-radius: 0;
  box-shadow: none;
  background: none;
  margin-bottom: 0;
  width: 204px;

}

.sidebarNav ul > li {
  margin: 0;
}
.sidebarNav ul ul li {
  padding: 0;
  background: none;
  border: 0;
  font-weight: 900;
  font-size: 17px;
}
.sidebarNav ul ul li a {
  color: var(--darkgray);
  padding: 1rem 0 1rem 3em;
  display: block;
  text-decoration: none;
  color: white;
}
.sidebarNav ul ul li a:hover {
  text-decoration: underline;
}

.sidebar {
  flex: 1 1 600px;
  margin:0 auto;
  height: 163px;
  width: 207px;
  border: 1px solid #8FA691;
}
.sidebarNav ul {
  margin: 0;
  padding: 0;
  
}
.sidebarNav li {
  list-style: none;
  padding: 0;
}

.cont{

    background-color:#8FA691 ;
    
}
.sidebarNav li h3 a{
    text-decoration: none;
    color: #b9b9b9;
   
}
.sidebarNav li h3 a:hover{
    background: none;
    color: #8fa691;
    font-weight: 900;
}
</style>
</head>
<body>

    
     <div class="sidebar">
       
            <div class="accordian sidebarNav">
                <ul>
                    <h2>
                        상품 관리
                    </h2>
                    <li>
                        <h3>
                             <a href='/shop/register'><span class="arrow"></span>상품 등록</a>
                        </h3>
                    </li>
                    <li>
                        <h3>
                             <a href='/shop/list'><span class="arrow"></span>상품 리스트</a>
                        </h3>
                    </li>

                </ul>
            </div>
        </div>

</body>
</html>