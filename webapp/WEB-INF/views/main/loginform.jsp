<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/header.css">
</head>

<body>
	<!-- Header -->

	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
		</div>
		<!--//container-->
	</div>
	<!--//wrap-->

	<div class="wrap">
		<div class="container">
			<div class="login_header">
				<div class="login_title">로그인</div>
			</div>
			<!--//login_header//-->
			<div class="line_1"></div>
			<!-- //line -->
			<div class="middle">
				<div class="login_notice">
					<div class="login_notice_1">
						<div class="login_middle_img">
							<img class="login_middle_glove"
								src="${pageContext.request.contextPath }/assets/image/img/glove1.jpg"
								alt="">
							<!-- <img class="middle_glove" src="/image/img/glove2.jpg" alt=""> -->
						</div>
						<h2 class="login_notice_h2">
							<span>스파클링</span>에서 <br> <span>최고의 경험</span>을 만드세요
						</h2>
					</div>
					<!--//login_notice_1-->
				</div>
				<!-- //login_notice-->
				<div class="loginform">
					<!-- 입력폼 → 매칭프로필저장 -->
					<form action="${pageContext.request.contextPath}/user/login" method="GET">
						<table class="login">
							<colgroup>
								<col style="width: 100px">
								<col style="width: 200px">
							</colgroup>
							<tr class="basic">
								<td><label for="user_id">아이디</label></td>
								<td>
									<div class="content_product_insert_select_box">
										<input type="text" id="user_id" placeholder="아이디를 입력해주세요." name="user_id">
									</div>
								</td>
							</tr>
							<tr class="basic">
								<td><label for="password">비밀번호</label></td>
								<td>
									<div class="content_product_insert_select_box">
										<input type="text" id="password" placeholder="아이디를 입력해주세요."
											name="password">
									</div>
								</td>
							</tr>
						</table>
						<c:if test="${param.result == 'fail'}">
							<p>아이디와 비밀번호를 확인하고 다시 로그인해주세요</p>
						</c:if>
						<div class="login_btn">
							<button type="submit" class="login_insert_btn">로그인</button>
							<button class="join_btn">회원가입</button>
						</div>
					</form>
					<!-- //입력폼 → 주문하기 -->
					<a id="custom-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=e90198f391392e46dc3459bec3b08f4b&redirect_uri=http://localhost:8088/Sparkling_/user/join&response_type=code"> <img
						src="${pageContext.request.contextPath }/assets/image/kakao_login_medium_narrow.png">
					</a>
				</div>
				<!--//loginform-->
			</div>
			<!-- //middle -->
		</div>
		<!-- //container -->
	</div>
	<!-- //wrap -->


	<div class="wrap">

		<div class="container">
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->
		</div>
		<!-- //container -->

	</div>
	<!-- //wrap -->

</body>

</html>