//주소 다음카카오 API에서 받아오기
function execDaumPostcode() {
	new daum.Postcode({
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

			document.getElementById('zipcode').value = data.zonecode; 
			// 5자리
			// 새우편번호
			// 사용
			document.getElementById('roadAddress').value = fullRoadAddr;
			document.getElementById('jibunAddress').value = data.jibunAddress;

			// if (data.autoRoadAddress) {
			// var expRoadAddr = data.autoRoadAddress
			// + extraRoadAddr;
			// document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
			// + expRoadAddr + ')';
			//
			// } else if (data.autoJibunAddress) {
			// var expJibunAddr = data.autoJibunAddress;
			// document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
			// + expJibunAddr + ')';
			//
			// } else {
			// document.getElementById('guide').innerHTML = '';
			// }

			// 우편번호 검색에서 검색하고 눌렀을 때 모달창 안닫히는 문제, 우편번호 검색에서 다른 주소 눌렀을 때 안 바뀌는 문제
		}
	}).open()
	// autoClose의 default가 true기 때문에 별도처리할 필요없음
	// 해결
};
window.onload = function() {
	init();
}

function init() {

	var sameAsMem = $("#sameAsMem");
	var receiver = $("#receiver");
	var memName = $("#memName");
	var contact = $("#contact");
	var receivContact = $("#receivContact");
	var memAddr = $("#memAddr");
	var reqNote = $("#reqNote");

	var receivAddr = $("#receivAddr");

	sameAsMem.change(function() {

		if (sameAsMem.is(":checked")) {
			receiver.val(memName.val());
			receivContact.val(contact.val());
			receivAddr.val(memAddr.val());
		} else {
			receiver.val("");
			receivContact.val("");
			receivAddr.val("");
		}

	});

	var submitBtn = $("#submitBtn");

	submitBtn.click(function(e) {
		e.preventDefault();
		
		if (receiver.val().trim() == "" || receiver.val() == null) {
			alert("수령인을 입력해주세요");
			receiver.focus();
		} else if (receiver.val().length > 10) {
			alert("수령인의 이름이 너무 깁니다")
			receiver.focus();
		} else if (receivContact.val().trim() == ""
				|| receivContact.val() == null) {
			alert("수령인의 연락처를 입력해주세요")
			receivContact.focus();
		} else if (receivContact.val().length > 13) {
			alert("수령인 연락처가 너무 깁니다")
			receivContact.focus();
		} else if (receivAddr.val().trim() == "" || receivAddr.val() == null) {
			alert("배송지의 주소를 입력해주세요")
			receivAddr.focus();
		} else if (receivAddr.val().length > 40) {
			alert("배송지의 주소가 너무 깁니다")
			receivAddr.focus();
		} else if (reqNote.val().length > 16) {
			alert("배송메시지의 길이가 너무 깁니다");
			reqNote.focus();
		} else {

			orderResult.submit();
		}
		
		
	});

}
