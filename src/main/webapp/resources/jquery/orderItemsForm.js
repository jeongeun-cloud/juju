//주소 다음카카오 API에서 받아오기
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {

			let fullRoadAddr = data.roadAddress;
			let extraRoadAddr = '';

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
	
			document.getElementById('roadAddress').value = fullRoadAddr;
			document.getElementById('jibunAddress').value = data.jibunAddress;

		}
	}).open()

};

window.onload = function() {
	init();
};

function init() {

	let sameAsMem = $("#sameAsMem");
	let recentDelivery = $("#recentDelivery");
	let orderResult = $("#orderResult");

	let memName = $("#memName");
	let contact = $("#contact");
	let memAddr = $("#memAddr");
	
	let receiver = $("#receiver");
	let receivContact = $("#receivContact");
	let receivAddr = $("#receivAddr");
	let reqNote = $("#reqNote");
	
	let recentReceiver = $("#recentReceiver");
	let recentReceivContact = $("#recentReceivContact");
	let recentReceivAddr = $("#recentReceivAddr");

	//회원정보에 저장된 배송지정보 check
	sameAsMem.change(function() {       
		
		console.log("작동되나 이거");
		
		if (sameAsMem.is(":checked")) {
			receiver.val(memName.val());
			receivContact.val(contact.val());
			receivAddr.val(memAddr.val());
			recentDelivery.prop("checked", false);
		} else {
			receiver.val("");
			receivContact.val("");
			receivAddr.val("");
		}

	});
	//최근배송지정보 check
	recentDelivery.change(function(){
		
		if (recentDelivery.is(":checked")) {
			receiver.val(recentReceiver.val());
			receivContact.val(recentReceivContact.val());
			receivAddr.val(recentReceivAddr.val());
			sameAsMem.prop("checked", false);
		} else {
			receiver.val("");
			receivContact.val("");
			receivAddr.val("");
		}
		
		
	});
	

	//결제하기 버튼. [수령인], [수령인-연락처], [배송지], [배송메시지] 유효성 check를 통과해야 넘어감 
	let submitBtn = $("#submitBtn");

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

		let pattern_num = /[0-9]/; // 숫자
		let pattern_eng = /[a-zA-Z]/; // 영어
		let pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		let pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글

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
		let regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

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
