<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.css">
    <link rel="stylesheet"  href="../resources/css/admin.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.js"></script>
    <style>
    .quick{
	display:inline-block;
	height:150px;
	width:100%;
	}
    .quick_box{
  	    background-color:white;    	
    	width:250px;
    	height:120px;
    	display:inline-block;
    	padding:10px;
    	margin:10px 20px 0 30px;
    	border-radius:10px;
    	box-shadow: 4px 8px 16px 4px rgba(0,0,0,0.2);
    }
    .quick_wrap{
       width:250px;  
       position:relative;            
        
    }
    .quick_l{
    	height:25px;
    	display:inline-block;    	
    	position:absolute;
    	right:20px;
    	margin-top:20px;
    	color:black;
    }
    .quick_a{
    	height:50px;
    	width:80px;
    	display:inline-block;    	
    	margin-top:50px;
    	margin-left:100px;
    	color:black;
    }
    .aa{
	
	font-size:15px;
	margin-left:5px;
	}
	.aaa{
	
	font-size:30px;
	margin-left:5px;
	font-weight:800;
	}
	.admi_board{
        display: inline-block;
        position: relative;
        width: 100%;
        /* border: solid blue; */
        height: 450px;
        
    }
    .quick_b{
        width:600px;
        margin: 100px 20px 20px 20px;
        float:left;
    }
    .admi_notice{
       
        width: 600px;
        height:400px;
    }
    .admi_faq{
       
        width: 600px;
        height:400px;
    }
    .board_tit {    
        width: 100%;
        font-size: 20px;
        
    }
    .board_btn{
         width:100%;
        margin-left:510px;
        margin-bottom: 10px;
    }
   .more{
    background-color:#637365;
    border: 1px solid #637365;
    color: white;
    }
    table {
	border-collapse: collapse;
	width: 95%;
	margin-left:18px;
		
	}
     th, td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: #637365;
        color: white;
        text-align: left;
        height: 30px;
        text-align:center;
    }
    
    tr:hover {
        background-color: #f5f5f5;
    }
    
    </style>
</head>
<body>
<%@include file="./idCheck.jsp" %>
    <div class="container">
        <%@include file="./adminSideBar.jsp" %>
            <div class="mainArea">
            
                <!-- BEGIN NAV -->
                <nav class="navTop row">
                    <div class="menuIcon fl"><span class="fa fa-bars"></span></div>
                    <div class="account fr">
                        <div class="name has-submenu"><c:out value="${sessionMember.idNo}"/><span class="fa fa-angle-down"></span></div>
                        <ul class="accountLinks submenu">
                            <li><a href="/">View website</a></li>
                            <li><a href="/member/logout">Log out<span class="fa fa-sign-out fr"></span></a></li>
                        </ul>
                    </div>
                </nav>
                <!-- END NAV -->
                
                <!-- CONTAINER  -->
    <div >  
			         
        <div class="mainContent">
		            
		    <div class="quick">
			

		       	<div class="quick_box">	
		            <div class="quick_wrap">
		                 <i class="fa fa-user-plus fa-4x" aria-hidden="true"></i>
		                 <div class="quick_l"><label class="aa" >가입 회원 수</label></div>
		                 <div class="quick_a"> <label class="aaa"> <fmt:formatNumber type="number" maxFractionDigits="3" value="${iTodayT}" /> 명</label></div>
		            </div>
		       </div> 

		       	<div class="quick_box">	
		            <div class="quick_wrap">
		                 <i class="fa fa-user-times fa-4x" aria-hidden="true"></i>
		                 <div class="quick_l"><label class="aa" >탈퇴 회원 수</label></div>
		                 <div class="quick_a"> <label class="aaa">  <fmt:formatNumber type="number" maxFractionDigits="3" value="${iTodayWithdrawT}" /> 명</label></div>
		            </div>
		       </div> 
		       
		       <div class="quick_box">	
			       <div class="quick_wrap">
						     <i class="fa fa-file-text fa-4x" aria-hidden="true"></i>
						     <div class="quick_l"><label class="aa" >고객 문의</label></div>
						     <div class="quick_a"><label class="aaa"><fmt:formatNumber type="number" maxFractionDigits="3" value="${cNum}" />건</label></div>
			       		</div>
		       	</div>
		       	
		       	<div class="quick_box">	
			       	 <div class="quick_wrap">
						     <i class="fa fa-file-text-o fa-4x" aria-hidden="true"></i>
						     <div class="quick_l"><label class="aa" >상인 문의</label></div>
						     <div class="quick_a"><label class="aaa"><fmt:formatNumber type="number" maxFractionDigits="3" value="${sNum}" />건</label></div>
			       		</div>
		       	</div>
		    </div>   
		    <!--quick  --> 
		    
	</div>
		        <!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■    -->    
		    <%@include file="./graph.jsp" %>        
		            
      <div class="admi_board">
            <div class="quick_b">
                <div class="admi_notice">
                    <div class="board_tit">
                        <p style="margin-left:15px;">|주주마켓 공지사항</p>
                    </div>
                    <div class="board_notice_content">
                         <div class="board_btn">
                            <input type="button" class="more" value="더 보기" onClick="location.href='/community/notice/list'">
                        </div>
                      	  <div class="index_table">
		                      <table tit aria-setsize="500px">
					            <thead>
					               <tr>
					                  <th>번호</th>
					                  <th>글 제목</th>
					                  <th>등록일</th>
					               </tr>
					            </thead>
					                 
					             
					            <c:forEach items="${noticelist}" var="notice">
					               <tr>
					                  <td><c:out value="${notice.postingNo }" /></td>
					
					                  <td><a class ='move' href='<c:out value="${notice.postingNo}"/>'>
					                  <c:out value="${notice.title }" /></a></td>
					         
					                  <td><fmt:formatDate pattern="yyyy/MM/dd" value="${notice.regDate }" /></td>
					
					               </tr>
					
					            </c:forEach>
					
					         </table>
			         	</div>
                    </div>

                </div>
            </div>    

           <div class="quick_b">
                <div class="admi_faq">
                    <div class="board_tit">
                        <p style="margin-left:15px;">|주주마켓 FAQ</p>
                    </div>
                    <div class="board_faq_content">
                        <div class="board_btn">
                            <input type="button" class="more" value="더 보기" onClick="location.href='/community/BoardFAQ/list'">
                        </div>
                        <div class="index_table">
		                         <table tit aria-setsize="500px">
		                        
		                        <thead>                     
		                       
		                            <tr>
		                                <th>번호</th>
		                                <th>글 제목</th>		                             
		                                <th>등록일</th>
		
		                            </tr>
		                        </thead>
		
		                            <c:forEach items="${faqlist}" var="faq">
		                                <tr>
		                                
		                                    <td><c:out value="${faq.postingNo }" /></td>
		                                    
		                                    <td><a class ='move2' href='<c:out value="${faq.postingNo}"/>'>
		                                    <c:out value="${faq.title }" /></a></td>		                                
		                                    <td><fmt:formatDate pattern="yyyy/MM/dd" value="${faq.regDate }" /></td>
		
		                                </tr>
		                            </c:forEach>
		                        </table>
                        
                        </div>
                     
                    </div>

                </div>
            </div>
            
        </div> 
		        
   
            <!-- END CONTAINER  -->
        	</div>
    	</div>

	<!-- 여기 폼 뒀움!! -->
    <form id='faqForm' action="/community/BoardFAQ/list" method='get'>                   
    </form><!-- paging form end-->
    <!--admi_board  -->
    <form id='noticeForm' action="/community/notice/list" method='get'>
    </form>
    
    <script src="../resources/js/admin.js"></script>
    <script type="text/javascript">
    
	    var noticeForm = $("#noticeForm");
	    $(".move").on("click",function(e){
	        
	
	        e.preventDefault();
	        noticeForm.append("<input type='hidden' name='postingNo' value = '" + $(this).attr("href") + "'>");
	        noticeForm.attr("action", "/community/notice/get");
	        noticeForm.submit();
	
	    });
	    
	    var faqForm = $("#faqForm");
	    $(".move2").on("click",function(e){
	        
	
	        e.preventDefault();
	        faqForm.append("<input type='hidden' name='postingNo' value = '" + $(this).attr("href") + "'>");
	        faqForm.attr("action", "/community/BoardFAQ/get");
	        faqForm.submit();
	        
	     });
    </script>
   	
</body>
</html>
