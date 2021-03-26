<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style_1.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script src="https://kit.fontawesome.com/5a9452f10d.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<!-- Header -->
	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
		</div>
	</div>
	<!--//header-->


	<!-- Sparring -->
	<div class="wrap">
		<div class="container">
			<div class="sm2_1">
				<h1 class="sm_title2">스파링을 시작해보세요!</h1>
			</div>
			<!-- search -->
			<section class="sm_searching">
				<!-- item1 -->
				<div class="sm_searching_item1">

					<div class="sm_searching_item2_list2 ">
						<a class="item2_list_a1" href="">
							<div class="list1_btn2">
								<div class="item2_list_a1_div">
									<i class="fas fa-map-marker-alt"></i> 내게 맞는 매치 보기
								</div>
							</div>
						</a>
					</div>
					<!--검색-->
					<form class="sm_searching_item1_form" action="">

						<a class="item2_list_a3" href="">
							<div class="list1_btn1">
								<div>전체보기</div>
							</div>
						</a> <select class="item1_address" name="address2" id="">
							<option class="item1_address_option" value="21-03-05">날짜선택</option>
						</select> <select class="item1_address" name="address2" id="">
							<option class="item1_address_option" value="21-03-05">시간선택</option>
						</select> <input class="input-text" type="text"
							placeholder="시군구 또는 체육관 이름..">

						<button class="address_btn">검색</button>
					</form>
				</div>
				<!-- 체육관 검색 -->


				<!-- item2 -->
				<div class="sm_searching_item2">
					<div class="sm_searching_item2_list list2">

						<div class="list2_btn2">
							<div>내 매치 만들기</div>
						</div>
						<!-- 매치버튼박스 -->
						<div style="display:block;" class="mach-box-jquery">
							<div class="mach_btn_box">
								<div class="mach_box1">
									<div class="mach_box_sub">직접 대관하시면 상대매칭이 수월합니다.</div>
									<a href="${pageContext.request.contextPath }/sparring/rent">
										<button class="mach_box_sub_btn">대관후 매치만들기</button>
									</a>
								</div>
								<div class="mach_box2">
									<div class="mach_box_sub">프로필을 공개하고 상대를 기다려보세요.</div>
									<a href="${pageContext.request.contextPath }/sparring/writeForm?user_no=${authUser.user_no}">
										<button class="mach_box_sub_btn">대관없이 매치만들기</button>
									</a>
								</div>
							</div>
						</div>
						<!-- 매치버튼박스 end -->
					</div>
				</div>

			</section>

			<!-- Mach Card -->
			<section class="mach-card">
				<!-- card 1ex -->
				<c:forEach items="${bBuyList}" var="vo">
				<a href="${pageContext.request.contextPath }/sparring/matchdetail?bbuyno=${vo.b_buy_no}&userno=${vo.user_no}&sessionuser=${authUser.user_no}">
				<!-- 
				 <a href="${pageContext.request.contextPath }/sparring/matchdetail?bbuyno=${vo.b_buy_no}&userno=${vo.user_no}">
				 -->
				<div class="card_container">
					<div class="card">
					<c:choose>
						<c:when test="${vo.gym_img_savename == null}">
							<img
								class="card_img" src="${pageContext.request.contextPath}/upload/0.jpg" alt="">
						</c:when>
						<c:otherwise>
							<img
								class="card_img" src="${pageContext.request.contextPath}/upload/${vo.gym_img_savename}" alt="">
						</c:otherwise>
					</c:choose>
							<div class="card_profile">
								<div class="card_address">
									<i class="fas fa-map-marker-alt address_icon"></i>

									<div class="card_address_gimname">
									<c:choose>
						<c:when test="${vo.gym_name == null}">
										<p>${vo.b_buy_address} 장소미정</p>
										<div class="user_text">${vo.b_buy_day} | ${vo.b_buy_time}</div>
							
						</c:when>
						<c:otherwise>
							<p>${vo.addressHalf} ${vo.gym_name}</p>
							<div class="user_text">${vo.booking_date} | ${vo.booking_start }~${vo.booking_end }</div>
						</c:otherwise>
					</c:choose>

										
									</div>
									<div class="card_address_kind">
									<c:choose>
										<c:when test="${vo.gym_event==null}">
											<p>${vo.b_buy_event}</p>
										</c:when>
										<c:otherwise>
											<p>${vo.gym_event }</p>
										</c:otherwise>
									</c:choose>
									</div>
								</div>
								<div class="card_user">
									<div class="card_user_profil">
										<div class="user_name">
											<i class="fas fa-user"></i>${vo.nickname}
										</div>
										<div class="user_pro">
											<i class="fas fa-star"></i> <span>${vo.career}</span>
										</div>
										<div class="user_skill">
											주특기 | 
											<span>
											<c:forEach items="${vo.eventList }" var="eventvo">
												<c:choose>
													<c:when test="${eventvo.eventName == 1}">
														복싱
													</c:when>
													<c:when test="${eventvo.eventName == 2}">
														킥복싱
													</c:when>
													<c:when test="${eventvo.eventName == 3}">
														종합격투기
													</c:when>
													<c:when test="${eventvo.eventName == 4}">
														주짓수
													</c:when>
												</c:choose>
											</c:forEach>
											
											</span>
										</div>
									</div>
									<div class="card_user_img"></div>
								</div>
								<!--  
								<div class="card_reser">예약중</div>
								-->
								<div class="card_price">
									<c:if test="${vo.b_buy_price !=null}">
									<div class="card_price_1person">
										<fmt:formatNumber type="number"
												maxFractionDigits="3"
												value="${vo.b_buy_price}" />원</div>
									<div class="card_price_2person">
										<fmt:formatNumber type="number"
												maxFractionDigits="3"
												value="${vo.b_buy_price * 2}" />원/2인</div>
									</c:if>

								</div>
							</div>
						</a>

					</div>
				</div>
				</a>
				</c:forEach>
				<!-- card end -->
				

				<!-- card 1ex -->
				<div class="card_container">
					<div class="card">
						<a class="card1" href="/view/matching/스파링신청서 상대가 없을경우.html.html">
							<img class="card_img" src="/image/rent_no.jpg" alt="">
							<div class="card_profile">
								<div class="card_address">
									<i class="fas fa-map-marker-alt address_icon"></i>

									<div class="card_address_gimname">

										<p>중랑구 상봉동</p>
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
											<i class="fas fa-star"></i> <span>${vo.career}</span>
										</div>
										<div class="user_skill">
											주특기 <span>| 레슬링</span>
										</div>
									</div>
									<div class="card_user_img"></div>
								</div>

							</div>
						</a>

					</div>
				</div>
				<!-- card end -->



			</section>
			<!-- Mach Card end -->

			<!-- Paging-->
			<section id="paging">
				<ul>
					<li><a href="">◀</a></li>
					<li><a href="">1</a></li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li class="active"><a href="">5</a></li>
					<li><a href="">6</a></li>
					<li><a href="">7</a></li>
					<li><a href="">8</a></li>
					<li><a href="">9</a></li>
					<li><a href="">10</a></li>
					<li><a href="">▶</a></li>
				</ul>


				<div class="clear"></div>
			</section>
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->
		</div>
		<!-- container end -->
	</div>
	<!-- wrap end -->
</body>

<script type="text/javascript">
	$("document").ready(function(){
		$(".mach-box-jquery").hide();
		
	})
	$(".list2_btn2").on("click",function(){
		console.log("클릭");
		
		if($(".mach-box-jquery").css('display') == 'block' ){
			$(".mach-box-jquery").hide();
		}else{
			$(".mach-box-jquery").show();
		}
		
		
		
	});
	
	function btnlist(){
	str="";
	str+=""
		
	}
</script>
</html>
