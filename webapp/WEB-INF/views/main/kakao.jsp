<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<a href="javascript:kakaoLogin()">
<img src="${pageContext.request.contextPath }/assets/image/kakao_login_medium_narrow.png"
  width="222"
/>
</a>
<p id="token-result"></p>

</body>
<script type="text/javascript">
//window.Kakao.init("e382583db836112054e48e525ac35dda");
Kakao.init('e382583db836112054e48e525ac35dda');
Kakao.isInitialized();

function kakaoLogin(){
	window.Kakao.Auth.login({
		scope:'profile, account_email, gender',
		success: function(authObj){
			console.log(authObj);
			window.KaKao.API.request({
				url:'/v2/user/me',
				success: res =>{
					const kakao_account = res.kakao_account;
					console.log(kakao_account);
				}
			});
		}
	})
}
</script>

</html>
