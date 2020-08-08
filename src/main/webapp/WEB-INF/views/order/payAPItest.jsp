<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    function paymentSystem(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp44937256'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg = "";
        
        var totalPay =  document.getElementById("totalPay");
        var itemName =  document.getElementById("itemName");
        var itemSpc =  document.getElementById("itemSpc");
        var memName =  document.getElementById("memName");
        var email =  document.getElementById("email");
        var contact =  document.getElementById("contact");
        var memAddr =  document.getElementById("memAddr");
        var zipcode =  document.getElementById("zipcode");
        
        var payPrice = totalPay.value*1 + 2500;
        
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : itemName.value+" 등 "+itemSpc.value+"건",
            amount : payPrice,
            buyer_email : email.value,
            buyer_name : memName.value,
            buyer_tel : contact.value,
            buyer_addr : memAddr.value,
            buyer_postcode : zipcode.value,
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우 - 이거 일단 작동 안됨 
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                });
                // 성공시 진행할 것 
                paymentComplete();
                
               	
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/order/basketList";
                alert(msg);
            }
        });
        
    }
    </script>
 
</body>
</html>
