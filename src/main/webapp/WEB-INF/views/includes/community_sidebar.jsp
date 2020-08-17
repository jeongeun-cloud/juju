<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
  transition: all 0.2s cubic-bezier(0.25, 0.8, 0.25, 1);
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
  background-color: #f7f9f9;
  padding: 2.0rem 1.5rem 1.5rem 2.0rem;
  margin: 0;
  border-top: 1px solid #8FA691;
  display: block;
  font-weight: 500;
  letter-spacing: 0.035em;
  position: relative;
  font-size: 16px;
  transition: all 0.2s cubic-bezier(0.25, 0.8, 0.25, 1);
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.24);
  border-radius: 10px;
  color: #b9b9b9;
}
.accordian h2{
    padding: 2.0rem 1.5rem 1.5rem 2.0rem;
     margin: 0;
    display: block;
    letter-spacing: 0.035em;
     position: relative;
     color:white;
     background-color: #8FA691;
     font-size:1.3em;
     font-weight: bold;
     
}
.accordian h3:hover, .accordian h3.closed {
  color: var(--dark-gray);
  background-color: #fff;
}
.accordian h3:hover .arrow {
  border-top: 2px solid var(--dark-gray);
  border-right: 2px solid var(--dark-gray);
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
  transform: translatey(-20px);
}
.accordian ul ul.open p {
  opacity: 1;
  transform: translatey(0px);
}
.accordian .arrow {
  display: inline-block;
  width: 8px;
  height: 8px;
  border-top: 2px solid var(--light-gray);
  border-right: 2px solid var(--light-gray);
  transform: rotate(135deg);
  transform-origin: center;
  float: right;
  margin-right: 8px;
  transition: transform 600ms cubic-bezier(0.175, 0.885, 0.32, 1);
}
.accordian .arrow.closed {
  margin-top: 4px;
  transform: rotate(-45deg);
  border-top: 2px solid var(--dark-gray);
  border-right: 2px solid var(--dark-gray);
}
.sidebarNav {
  max-width: 247px;
  border: 1px solid #8FA691;

  
}
.sidebarNav h3 {
  border-radius: 0;
  box-shadow: none;
  background: none;
  margin-bottom: 0;
}
.sidebarNav h3:hover, .sidebarNav h3.closed {
  background: none;
  color: #8fa691;
  font-weight: 900;
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
  margin-bottom: 100px;
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

</style>
</head>
<body>

    
     <div class="sidebar">
       
            <div class="accordian sidebarNav">
                <ul>
                    <h2>
       				        고객센터
                    </h2>
                    <li>
                        <h3>
                            <span class="arrow"></span>게시판
                        </h3>
                        <ul class="cont">
                            <li><a href='/community/notice/list'>공지사항</a></li>
                            <li><a href='/community/BoardFAQ/list'>자주묻는질문</a></li>
                        </ul>
                    </li>
                 
                </ul>
            </div>
        </div>
    
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
$(function() { 
  $('.accordian li').on('click', function() {
    if ($(this).find('ul').hasClass('open')) {
      $('ul.open').slideToggle().removeClass('open');
      $('.accordian h3 span').removeClass('closed');
      $('.accordian h3').removeClass('closed');
    } else {
      $('ul.open').slideToggle().removeClass('open');
      $(this).find('ul').slideToggle().addClass('open');
      $('.accordian h3, .accordian h3 span').removeClass('closed');
      $(this).find('h3, h3 span').addClass('closed')
    }
  });
  // Active class starts one open
  $('.accordian li.active ul').slideDown().addClass('open');
});


    </script>
</body>
</html>