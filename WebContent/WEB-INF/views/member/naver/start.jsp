<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
    <!--폐기 땅땅-->
    <script>
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "EZAyCLocCK4jspxmXDYC",
			callbackUrl: "http://localhost:8090/Inphomation/naverLogin",
			callbackHandle: true
			/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
		}
	);

	naverLogin.init();
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				/* 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				var email = naverLogin.user.getEmail();
				if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					/* 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				}

				window.location.replace("처리후 되돌아갈 곳");
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
</script>