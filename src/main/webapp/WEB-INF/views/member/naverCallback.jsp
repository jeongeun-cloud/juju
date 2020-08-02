<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body> 
	<!-- callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다. -->

	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
	
 		var naver_id_login = new naver_id_login("7Uw4MdMci9xWvrvnp_e8", "http://localhost/member/naverCallback");
	  	// 접근 토큰 값 출력
	  	/* alert(naver_id_login.oauthParams.access_token); */
	  	var naverToken = naver_id_login.oauthParams.access_token;
	  
	  	// 네이버 사용자 프로필 조회
	  	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  
	  	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  	function naverSignInCallback() {
	    	/* alert(naver_id_login.getProfileData('email'));
	    	alert(naver_id_login.getProfileData('name'));
	    	alert(naver_id_login.getProfileData('birthday')); */
	    	
	    	var email = naver_id_login.getProfileData('email');
	    	var name = naver_id_login.getProfileData('name');
	    	var birth = naver_id_login.getProfileData('birthday');
	    	
	    	$.ajax({
				url : '/member/naverLogin',
				data : {emailAccount : email, memName : name, birth : birth, naverToken : naverToken},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					if(result == 'success') {
						alert("로그인 되었습니다.");
						window.location.replace("/");
					}else {
						alert("오류가 생겼습니다. 잠시 후 다시 시도해주세요.");
					}
				}
			});	// $.ajax
	  	}
	   
	  
		/* var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "7Uw4MdMci9xWvrvnp_e8",
				callbackUrl: "http://localhost/member/naverCallback",
				isPopup: false,
				callbackHandle: true
				// callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다.
			}
		); */

		// (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출
		/* naverLogin.init(); */

		// (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close)
		/* window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					// (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크
					var email = naverLogin.user.getEmail();
					var name = naverLogin.user.getName();
					
					
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						// (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 
						naverLogin.reprompt();
						return;
					}else if (name == undefined || name == null) {
						alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					
					// alert(naverLogin.user.getEmail() + "이메일");
					// alert(naverLogin.user.getName() + "이름");
					// alert(naverLogin.user.getBirthday() + "생일");

					var birth = naverLogin.user.getBirthday();


				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		}); */
	</script>
</body>
</html>