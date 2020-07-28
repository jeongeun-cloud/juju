<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/shop_index.css">
    <title>Document</title>

</head>
<%@include file="./idCheck.jsp" %>
<body>
    <div class="admi_container">
        <div class="admi_tit">
            <h1>주주마켓 Admin</h1>
        </div>
        
        <div class="admi_manager">
            <div class="admi_btn_wrap">
                <input type="button" value="상품관리" >
                <input type="button" value="주문관리" onClick="location.href='/shop/sales'">
            </div>

            <div class="quick_wrap">
                <div class="quick_m">
                    <div class="quick_find">
                        <div class="quick_tit">
                            <p><b>빠르게 찾기</b></p>
                        </div>
                        <p>관리자 ID</p>
                        <input class="quick_btn" type="button" value="상품등록" onClick="location.href='/shop/list'">
                        <input class="quick_btn" type="button" value="주문조회">
                        <input class="quick_btn" type="button" value="통계관리">
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
                                        상품 등록 수 
                                    </div>
                                    <div>
                                        00건
                                    </div>
                                </div>
                            </div>   
                            <!-- today_box -->
                            
                            <div class="today_box">
                                <div class="pro_pay_sta">
                                    <div class="today_tit">
                                        결제 건 수  
                                    </div>
                                    <div>
                                        00건
                                    </div>
                                </div>
                            </div>   
                            <!-- today_box -->

                            <div class="today_box">
                                <div class="pro_order_sta">
                                    <div class="today_tit">
                                        주문 수 
                                    </div>
                                    <div>
                                        00건
                                    </div>
                                </div>
                            </div>   
                            <!-- today_box -->
                        </div>
                        <!-- today_total -->
                        <div class="rate">
                            <div class="yest_rate">
                                어제 
                            </div>
                        </div>   
                        <div class="rate"> 
                            <div class="today_rate">
                                오늘
                            </div>
                        </div>

                    </div>
                </div>   

                <div class="quick_m">    
                    <div class="today_do">
                        <div class="quick_tit">
                            <p><b>오늘의 할 일</b></p>
                        </div>

                        <div class="today_do_li">
                            <div class="today_box">
                                <div class="pro_regi_sta">
                                    <div class="today_tit">
                                        배송 미처리 
                                    </div>
                                    <div>
                                        00건
                                    </div>
                                </div>
                            </div>   

                            <div class="today_box">
                                <div class="pro_regi_sta">
                                    <div class="today_tit">
                                        교환/환불 신청 
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
                                        상품 문의 
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