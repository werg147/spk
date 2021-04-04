<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/style_1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/store.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/header.css">
<script src="https://kit.fontawesome.com/5a9452f10d.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<!-- Header -->

	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
			<c:if test="${authUser == null}">
				<div class="banner">
					<!-- 어딘가 있어서 자동적용되는 css..헤더아님 -->
					<div id="main_1">회원가입으로</div>
					<div id="main_2">스파클링을 시작해보세요.</div>
					<div id="main_3">
						<a id="custom-login-btn"
							href="https://kauth.kakao.com/oauth/authorize?client_id=e90198f391392e46dc3459bec3b08f4b&redirect_uri=http://localhost:8088/Sparkling_/user/join&response_type=code">
							<img
							src="${pageContext.request.contextPath }/assets/image/kakao_login_medium.png">
						</a> <a id="custom-login-btn"
							href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=9ElAXUf0q0NhBnY7bqKl&state=state_String&redirect_uri=http://localhost:8088/Sparkling_/user/joinnaver">
							<img
							src="${pageContext.request.contextPath }/assets/image/네이버 아이디로 로그인_축약형_Green.PNG"
							width="113">
						</a>
					</div>
				</div>
			</c:if>
				<c:if test="${authUser != null}">
				<div class="banner">
					<!-- 어딘가 있어서 자동적용되는 css..헤더아님 -->
					<div id="main_1">${authUser.nickname}님 안녕하세요!</div>
					<div id="main_2">스파클링에서 스파링을 시작해보세요.</div>
					<div id="main_2"><strong>내 매치</strong> 바로만들기</div>
				</div>
			</c:if>
			<div class="space"></div>
		</div>
	</div>
	<div class="wrap">
		<div class="container">
			<!-- Mach Card -->
			<section class="mach-card">
				<!-- card 1ex -->
				<div class="card_container">
					<div class="card">
						<a class="card1" href="/view/matching/스파링신청서.html"> <img
							class="card_img"
							src="${pageContext.request.contextPath }/assets/image/img/search.jpg"
							alt="">
							<div class="card_profile">
								<div class="card_address">
									<i class="fas fa-map-marker-alt address_icon"></i>
									<div class="card_address_gimname">
										<p>상봉동 팀파이터</p>
										<div class="user_text">13일 | 18:00~21:00</div>
									</div>
									<div class="card_address_kind">
										<p>복싱</p>
									</div>
								</div>
								<div class="card_user">
									<div class="card_user_profil">
										<div class="user_name">
											<i class="fas fa-user"></i>방배동왕주먹
										</div>
										<div class="user_pro">
											<i class="fas fa-star"></i> <span>프로</span>
										</div>
										<div class="user_skill">
											주특기 <span>| 레슬링</span>
										</div>
									</div>
									<div class="card_user_img"></div>
								</div>
								<div class="card_price">
									<div class="card_price_1person">20,000원</div>
									<div class="card_price_2person">40,000원/2인</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				<!-- card end -->
				<!-- card 1ex -->
				<div class="card_container">
					<div class="card">
						<a class="card1" href="/view/matching/스파링신청서.html"> <img
							class="card_img"
							src="${pageContext.request.contextPath }/assets/image/img/search.jpg"
							alt="">
							<div class="card_profile">
								<div class="card_address">
									<i class="fas fa-map-marker-alt address_icon"></i>

									<div class="card_address_gimname">

										<p>상봉동 팀파이터</p>
										<div class="user_text">13일 | 18:00~21:00</div>
									</div>
									<div class="card_address_kind">
										<p>복싱</p>
									</div>
								</div>
								<div class="card_user">
									<div class="card_user_profil">
										<div class="user_name">
											<i class="fas fa-user"></i>방배동왕주먹
										</div>
										<div class="user_pro">
											<i class="fas fa-star"></i> <span>프로</span>
										</div>
										<div class="user_skill">
											주특기 <span>| 레슬링</span>
										</div>
									</div>
									<div class="card_user_img"></div>
								</div>
								<div class="card_price">
									<div class="card_price_1person">20,000원</div>
									<div class="card_price_2person">40,000원/2인</div>
								</div>
							</div> <!--//card_profile-->
						</a>
					</div>
					<!--//card-->
				</div>
				<!--//card_container-->
				<!-- card end -->
				<!-- card 1ex -->
				<div class="card_container">
					<div class="card">
						<a class="card1" href="/view/matching/스파링신청서.html"> <img
							class="card_img"
							src="${pageContext.request.contextPath }/assets/image/img/search.jpg"
							alt="">
							<div class="card_profile">
								<div class="card_address">
									<i class="fas fa-map-marker-alt address_icon"></i>

									<div class="card_address_gimname">

										<p>상봉동 팀파이터</p>
										<div class="user_text">13일 | 18:00~21:00</div>
									</div>
									<div class="card_address_kind">
										<p>복싱</p>
									</div>
								</div>
								<div class="card_user">
									<div class="card_user_profil">
										<div class="user_name">
											<i class="fas fa-user"></i>방배동왕주먹
										</div>
										<div class="user_pro">
											<i class="fas fa-star"></i> <span>프로</span>
										</div>
										<div class="user_skill">
											주특기 <span>| 레슬링</span>
										</div>
									</div>
									<div class="card_user_img"></div>
								</div>
								<div class="card_price">
									<div class="card_price_1person">20,000원</div>
									<div class="card_price_2person">40,000원/2인</div>

								</div>
							</div>
						</a>

					</div>
				</div>
				<!-- card end -->
				<!-- card 1ex -->
				<div class="card_container">
					<div class="card">
						<a class="card1" href="/view/matching/스파링신청서 상대가 없을경우.html.html">
							<img class="card_img"
							src="${pageContext.request.contextPath }/assets/image/rent_no.jpg"
							alt="">
							<div class="card_profile">
								<div class="card_address">
									<i class="fas fa-map-marker-alt address_icon"></i>

									<div class="card_address_gimname">

										<p>장소미정</p>
										<div class="user_text">13일 | 18:00~21:00</div>
									</div>
									<div class="card_address_kind">
										<p>복싱</p>
									</div>
								</div>
								<div class="card_user">
									<div class="card_user_profil">
										<div class="user_name">
											<i class="fas fa-user"></i>방배동왕주먹
										</div>
										<div class="user_pro">
											<i class="fas fa-star"></i> <span>프로</span>
										</div>
										<div class="user_skill">
											주특기 <span>| 레슬링</span>
										</div>

									</div>
									<div class="card_user_img"></div>
								</div>
								<div class="card_price">

									<div class="card_price_1person">20,000원</div>
									<div class="card_price_2person">40,000원/2인</div>

								</div>
							</div> <!--//card_profile-->
						</a>
					</div>
					<!--//card-->
				</div>
				<!--//card_container-->
				<!-- card end -->
			</section>
			<!-- Mach Card end -->
		</div>
		<!--container-->
	</div>
	<!--wrap-->
	<div class="space"></div>

	<div class="wrap">
		<div class="container">
			<div id="goodsList">
				<ul>
					<!--첫번째 줄-->
					<li>
						<div class="item">
							<a class="img" style="background-image: url();"
								href="./store_products.html"> <img
								src="${pageContext.request.contextPath }/assets/image/store_img/glove1.jpg"
								onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'"
								width="308" height="396">
							</a>

							<div>
								<a class="info" href="./store_products.html"> <span
									class="name">[에버라스트] 복싱 백글러브</span> <span class="price">153,675원</span>
									<span class="desc"> <!----></span>
								</a>
							</div>
						</div> <!--.item-->
					</li>

					<!--미리보기 예시 리스트-->
					<li>
						<div class="item left_item">
							<a class="img" style="background-image: url();"
								href="./store_products.html"> <img
								src="${pageContext.request.contextPath }/assets/image/store_img/graybox.jpg"
								onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'"
								width="308" height="396">
							</a>

							<div>
								<a class="info" href="./store_products.html"> <span
									class="name">[붕대] 압박 붕대(10개입)</span> <span class="price">11,500원</span>
									<span class="desc"> <!----></span>
								</a>
							</div>
						</div> <!--.item-->
					</li>
					<li>
						<div class="item left_item">
							<a class="img" style="background-image: url();"
								href="./store_products.html"> <img
								src="${pageContext.request.contextPath }/assets/image/store_img/graybox.jpg"
								onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'"
								width="308" height="396">
							</a>

							<div>
								<a class="info" href="./store_products.html"> <span
									class="name">[샌드백] 가정용 스탠딩 샌드백</span> <span class="price">54,900원</span>
									<span class="desc"> <!----></span>
								</a>
							</div>
						</div> <!--.item-->
					</li>

					<!--두번째 줄-->
					<li>
						<div class="item">
							<a class="img" style="background-image: url();"
								href="./store_products.html"> <img
								src="${pageContext.request.contextPath }/assets/image/store_img/graybox.jpg"
								onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'"
								width="308" height="396">
							</a>

							<div>
								<a class="info" href="./store_products.html"> <span
									class="name">[글러브] 펀치킹 글러브</span> <span class="price">153,675원</span>
									<span class="desc"> <!----></span>
								</a>
							</div>
						</div> <!--.item-->
					</li>
					<li>
						<div class="item left_item">
							<a class="img" style="background-image: url();"
								href="./store_products.html"> <img
								src="${pageContext.request.contextPath }/assets/image/store_img/graybox.jpg"
								onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'"
								width="308" height="396">
							</a>

							<div>
								<a class="info" href="./store_products.html"> <span
									class="name">[붕대] 압박 붕대(10개입)</span> <span class="price">11,500원</span>
									<span class="desc"> <!----></span>
								</a>
							</div>
						</div> <!--.item-->
					</li>
					<li>
						<div class="item left_item">
							<a class="img" style="background-image: url();"
								href="./store_products.html"> <img
								src="${pageContext.request.contextPath }/assets/image/store_img/graybox.jpg"
								onerror="this.src='https://res.kurly.com/mobile/img/1808/img_none_x2.png'"
								width="308" height="396">
							</a>

							<div>
								<a class="info" href="./store_products.html"> <span
									class="name">[샌드백] 가정용 스탠딩 샌드백</span> <span class="price">54,900원</span>
									<span class="desc"> <!----></span>
								</a>
							</div>
						</div> <!--.item-->
					</li>


				</ul>
			</div>
			<!-- //goodsList -->
		</div>
		<!--container-->
	</div>
	<!--wrap-->
	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->

		</div>
		<!--container-->
	</div>
	<!--wrap-->

</body>
</html>