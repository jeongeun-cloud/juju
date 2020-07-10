
//주소 다음카카오 API에서 받아오기
function execDaumPostcode() {
    new daum.Postcode(
            {
                oncomplete : function(data) {

                    var fullRoadAddr = data.roadAddress;
                    var extraRoadAddr = '';

                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                + data.buildingName : data.buildingName);
                    }
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    if (fullRoadAddr !== '') {
                        fullRoadAddr += extraRoadAddr;
                    }

                    document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('roadAddress').value = fullRoadAddr;
                    document.getElementById('jibunAddress').value = data.jibunAddress;

                    if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress
                                + extraRoadAddr;
                        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
                                + expRoadAddr + ')';

                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
                                + expJibunAddr + ')';

                    } else {
                        document.getElementById('guide').innerHTML = '';
                    }
                }
            }).open();
}

window.onload = function() {
    init();
}

//주문서 페이지에서 회원정보와 동일한지 체크하는 함수 
//jQuery로 회원정보를 배송정보에 입력시켜줌(jsp에서 체크시)
function init() {
	
	var sameAsMem = $("#sameAsMem");
	var receiver = $("#receiver");
	var memName = $("#memName");
	var contact = $("#contact");
	var receivContact = $("#receivContact");
	var memAddr = $("#memAddr");
	var receivAddr = $("#receivAddr");
	
	sameAsMem.change(function(){
		
		if(sameAsMem.is(":checked")){
			receiver.val(memName.val());
			receivContact.val(contact.val());
			receivAddr.val(memAddr.val());
		} else {
			receiver.val("");
			receivContact.val("");
			receivAddr.val("");
		}
		
		
	});

}



