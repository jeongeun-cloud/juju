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
};

function init() {

	var sameAsMem = $("#sameAsMem");
	var recentDeliveryInfo = $("#recentDelivery");
	var orderResult = $("#orderResult");

	var memName = $("#memName");
	var contact = $("#contact");
	var memAddr = $("#memAddr");
	
	var receiver = $("#receiver");
	var receivContact = $("#receivContact");
	var receivAddr = $("#receivAddr");
	var reqNote = $("#reqNote");
	
	var recentReceiver = $("#recentReceiver");
	var recentReceivContact = $("#recentReceivContact");
	var recentReceivAddr = $("#recentReceivAddr");

	//회원정보에 저장된 배송지정보 check
	sameAsMem.change(function() {
		console.dir(sameAsMem);                             
		
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
	//최근배송지정보 check
	recentDeliveryInfo.change(function(){
		
		console.dir(recentDeliveryInfo);                                                             
		if (recentDeliveryInfo.is(":checked")) {
			receiver.val(recentReceiver.val());
			receivContact.val(recentReceivContact.val());
			receivAddr.val(recentReceivAddr.val());
		} else {
			receiver.val("");
			receivContact.val("");
			receivAddr.val("");
		}
		
		
	});
	

	//결제하기 버튼. [수령인], [수령인-연락처], [배송지], [배송메시지] 유효성 check를 통과해야 넘어감 
	var submitBtn = $("#submitBtn");

	submitBtn.click(function(e) {
		e.preventDefault();

		if (!(receiverCheck())) {
			return false;
		} else if (!(receivContactCheck())) {
			return false;
		} else if (!(receivAddrCheck())) {
			return false;
		} else if (!(reqNoteCheck())) {
			return false;
		} else {
			orderResult.submit();
		}

	});
	
	

	// [수령인](receiver) 입력값 유효성 check
	function receiverCheck() {

		var pattern_num = /[0-9]/; // 숫자
		var pattern_eng = /[a-zA-Z]/; // 영어
		var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글

		if (receiver.val().trim() == "" || receiver.val() == null) {
			alert("[수령인]값을 입력하시오.")
			receiver.focus();
			return false;
		} else if (receiver.val().length > 10) {
			alert("[수령인]10자까지만 입력할 수 있습니다. ")
			receiver.focus();
			return false;
		} else if ((pattern_num.test(receiver.val()))
				|| (pattern_spc.test(receiver.val()))) {
			alert("[수령인]숫자나 특수문자를 입력할 수 없습니다.")
			receiver.focus();
			return false;
		} else {
			return true;
		}
	};

	// [수령인-연락처](receivContact)유효성 check
	function receivContactCheck() {
		//휴대폰번호 정규식
		var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

		if (receivContact.val().trim() == "" || receivContact.val() == null) {
			alert("[배송지-연락처]값을 입력하시오.")
			receivContact.focus();
			return false;
		} else if (receivContact.val().length > 13) {
			alert("[배송지-연락처]13자까지만 입력할 수 있습니다.")
			receivContact.focus();
			return false;
			// 수령인 연락처 입력값 유효성 check
		} else if (!regExp.test(receivContact.val())) {
			alert("[배송지-연락처]숫자,- 만 입력할 수 있습니다.");
			receivContact.focus();
			return false
		} else {
			return true;
		}
	};

	
	//[배송지](receivAddr)유효성check
	function receivAddrCheck() {

		if (receivAddr.val().trim() == "" || receivAddr.val() == null) {
			alert("[배송지]값을 입력해주세요.");
			receivAddr.focus();
			return false;
		} else if (receivAddr.val().length > 40) {
			alert("[배송지]40자까지만 입력할 수 있습니다.");
			receivAddr.focus();
			return false;
		} else {
			return true;
		}
	};
	
	//[배송메시지] 유효성 check
	function reqNoteCheck() {

		 if (reqNote.val().length > 30) {
			alert("[배송메시지]30자까지만 입력할 수 있습니다.");
			reqNote.focus();
			return false;
		} else {
			return true;
		}

	};
	
	

}
