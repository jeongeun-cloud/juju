<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/admin_main.css">
    <title>Document</title>

</head>
<body>
<%@include file="./idCheck.jsp" %>
<%@include file="../includes/header.jsp" %>
    <div class="admi_container">
        <div cass="admi_tit">
            <h1>주주마켓 Admin</h1>
        </div>
        
        <div class="admi_manager">
           

            <div class="quick_wrap">
                <div class="quick_m">
                    <div class="quick_find">
                        <div class="quick_tit">
                            <p><b>빠르게 찾기</b></p>
                        </div>
                        <p>관리자 ID</p>
                        <input class="quick_btn" type="button" value="배너관리" onClick="location.href='/admin/mainBanner'">
                        <input class="quick_btn" type="button" value="회원현황" onClick="location.href='/admin/memberStat'">
                        <input class="quick_btn" type="button" value="상인관리" onClick="location.href='#'">
                    </div>
                </div>

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
                                       1:1 문의 
                                    </div>
                                    <div>
                                        00건
                                    </div>
                                </div>
                            </div>   

                            <div class="today_box">
                                <div class="pro_regi_sta">
                                    <div class="today_tit">
                                        상인 문의 
                                    </div>
                                    <div>
                                        00건
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
            <!-- quick_wrap -->

        </div>
        <!-- admi_manager -->

        <div class="admi_board">
            <div class="quick_b">
                <div class="admi_notice">
                    <div class="board_tit">
                        <p><b>-주주마켓 공지사항</b></p>
                    </div>
                    <div class="board_notice_content">
                        <div class="board_btn">
                            <input type="button" value="더 보기">
                        </div>
                        내용
                    </div>

                </div>
            </div>    
            <div class="quick_b">
                <div class="admi_faq">
                    <div class="board_tit">
                        <p><b>-주주마켓 FAQ</b></p>
                    </div>
                    <div class="board_faq_content">
                        <div class="board_btn">
                            <input type="button" value="더 보기">
                        </div>
                        내용
                    </div>

                </div>
            </div>
        </div>
        <!--admi_board  -->
    </div>
    <!-- admi_container -->
   	
</body>
</html>
