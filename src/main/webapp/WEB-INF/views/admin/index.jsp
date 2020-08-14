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
</head>
<body>
<%-- <%@include file="./idCheck.jsp" %> --%>
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
                <div class="mainContent">  
			        <!-- DETAIL FORM -->
		            <div class="formHeader row">
		                <h2 class="text-1 fl">index</h2>
		            </div>
		            
		            <!-- 성은 통계 시작 -->
		            <div class="formBody row form" style="text-align:center;">
			            <div class="quick_m">    
		                    <div class="today_sta">
		                        <div class="quick_tit">
		                            <p><b>Today 현황[오늘 날짜]</b></p>
		                        </div>
		
		                        <div class="today_total">
		                            <div class="today_box">
		                                <div class="pro_regi_sta">
		                                    <div class="today_tit">
		                                        총 회원 수
		                                    </div>
		                                    <div>
		                                       <fmt:formatNumber type="number" maxFractionDigits="3" value="${iT}" />건
		                                    </div>
		                                </div>
		                            </div>   
		                            <!-- today_box -->
		                            
		                            <div class="today_box">
		                                <div class="pro_pay_sta">
		                                    <div class="today_tit">
		                                         가입 수[오늘]   
		                                    </div>
		                                    <div>
		                                         <fmt:formatNumber type="number" maxFractionDigits="3" value="${iTodayT}" />건
		                                    </div>
		                                </div>
		                            </div>   
		                            <!-- today_box -->
		
		                            <div class="today_box">
		                                <div class="pro_order_sta">
		                                    <div class="today_tit">
		                                         총 탈퇴 수  
		                                    </div>
		                                    <div>
		                                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${iWithdrawT}" />건
		                                    </div>
		                                </div>
		                            </div>   
		                            <!-- today_box -->
		
		                            <div class="today_box">
		                                <div class="pro_order_sta">
		                                    <div class="today_tit">
		                                         탈퇴  수[오늘] 
		                                    </div>
		                                    <div>
		                                         <fmt:formatNumber type="number" maxFractionDigits="3" value="${iTodayWithdrawT}" />건
		                                    </div>
		                                </div>
		                            </div>   
		                            <!-- today_box -->
		                        </div>
		                       
		
		                    </div>
		                </div>   
		                
		                <div class="quick_m">    
		                    <div class="today_do">
		                        <div class="quick_tit">
		                            <p><b>미처리 현황</b></p>
		                        </div>
		
		                        <div class="today_do_li">
		                            <div class="today_box">
		                                <div class="pro_regi_sta">
		                                    <div class="today_tit">
		                                        불량 신고 
		                                    </div>
		                                    <div>
		                                        00건
		                                    </div>
		                                </div>
		                            </div>   
		
		                            <div class="today_box">
		                                <div class="pro_regi_sta">
		                                    <div class="today_tit">
		                                        가입/승인 신청 
		                                    </div>
		                                    <div>
		                                        00건
		                                    </div>
		                                </div>
		                            </div>   
		
		                            <div class="today_box">
		                                <div class="pro_regi_sta">
		                                    <div class="today_tit">
		                                       고객 문의[오늘] 
		                                    </div>
		                                    <div>
		                                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${cNum}" />건
		                                    </div>
		                                </div>
		                            </div>   
		
		                            <div class="today_box">
		                                <div class="pro_regi_sta">
		                                    <div class="today_tit">
		                                        상인 문의 [오늘]
		                                    </div>
		                                    <div>
		                                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${sNum}" />건
		                                    </div>
		                                </div>
		                            </div> 
		                        </div>  
		                        <!-- today_do_li -->
		                        
		                    </div>
		                    <!-- today_do -->
		                </div>   
		                <!-- quick_m -->
		            </div>
		            <!-- 성은 통계 끝 -->
		            
		            
		            <!-- 게시판 두개 시작 -->
		            <div class="formBody row form" style="text-align:center;">
		            	<!-- notice -->
		                <div class="column s-6">
		                <div class="formHeader row">
			                <h2 class="text-1 fl">공지사항</h2>
			            	<input type="button" class="btnSave bg-1 text-fff text-bold fr" value="더 보기" onClick="location.href='/community/notice/list'"><br><br>
			            </div>
			               <div class="table form">
			                <div class="row bg-1">
			                    <div class="cell cell-200 text-center text-fff">번호</div>
			                    <div class="cell cell-200 text-center text-fff">글 제목</div>
			                    <div class="cell cell-200 text-fff text-right">등록일</div>
			                </div>
			                
			            	<!--   BEGIN LOOP -->
			                <ul>
			                	<c:forEach items="${noticelist }" var="notice">
					               <li class="row cellRow">
					                  <div class="cell cell-200 text-center"><c:out value="${notice.postingNo }" /></div>
					                  <div class="cell cell-200 text-center"><c:out value="${notice.title }" /></div>
					                  <div class="cell cell-200 text-right"><fmt:formatDate pattern="yyyy/MM/dd" value="${notice.regDate }" /></div>
					               </li>
					            </c:forEach>
					            
			                </ul>
			            	<!--   END LOOP -->
			            	</div>
		                </div>
		                <!-- FAQ -->
		                <div class="column s-6">
		                <div class="formHeader row">
			                <h2 class="text-1 fl">FAQ</h2>
				            <input type="button" class="btnSave bg-1 text-fff text-bold fr" value="더 보기" onClick="location.href='/community/BoardFAQ/list'"><br><br>
			            </div>
			               <div class="table form">
			                <div class="row bg-1">
			                    <div class="cell cell-200 text-center text-fff">번호</div>
			                    <div class="cell cell-200 text-center text-fff">글 제목</div>
			                    <div class="cell cell-200 text-fff text-right">등록일</div>
			                </div>
			                
			            	<!--   BEGIN LOOP -->
			                <ul>
			                	<c:forEach items="${faqlist }" var="faq">
					               <li class="row cellRow">
					                  <div class="cell cell-200 text-center"><c:out value="${faq.postingNo }" /></div>
					                  <div class="cell cell-200 text-center"><c:out value="${faq.title }" /></div>
					                  <div class="cell cell-200 text-right"><fmt:formatDate pattern="yyyy/MM/dd" value="${faq.regDate }" /></div>
					               </li>
					            </c:forEach>
					            
			                </ul>
			            	<!--   END LOOP -->
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
