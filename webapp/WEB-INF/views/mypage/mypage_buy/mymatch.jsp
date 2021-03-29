<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 매치보기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/booking.css">
</head>
<body>

	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->

			<div class="middle">
				<c:import url="/WEB-INF/views/include/sidemenu.jsp"></c:import>
				<!--//side_menu//-->

				<!--////////////////////////////////////////////-->

				<div class="content_seller">
					<div class="content_booking_header">
						<div>내 매치 보기</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>

					<!--기간 필터-->
					<div class="time_filter">
						<input type="text" placeholder="기간필터"> ~ <input
							type="text" placeholder="기간필터"> <img name="calender"
							src="달력아이콘"> <select>
							<option>전체</option>
							<option>신청함</option>
							<option>신청받음</option>
						</select>
					</div>


					<!--반복 영역-->
					<c:forEach items="${bbuyList }" var="vo">
					
					<c:choose>
							<c:when test="${vo.u_no == 0 || empty vo.u_no}">
								<a href="${pageContext.request.contextPath }/sparring/matchdetail?bbuyno=${vo.b_buy_no}&userno=${authUser.user_no }&sessionuser=${authUser.user_no }&bookingno=${vo.booking_no}">	
							</c:when>
						<c:otherwise>

								<a href="${pageContext.request.contextPath }/sparring/matchdetail?bbuyno=${vo.b_buy_no}&userno=${vo.u_no }&sessionuser=${authUser.user_no }&bookingno=${vo.booking_no}">
						</c:otherwise>
					</c:choose>
						<div class="match_list">
							<table class="match_list_elnt">
								<tr>
									<td class="tr_img" rowspan="6">
									
									<img class="tr_img" name="스파링장"
										src="${pageContext.request.contextPath }/upload/${vo.gym_img_savename}"></td>
									<c:choose>
										<c:when test="${vo.gym_event == null }">
											<td class="bottom bold">&nbsp&nbsp${vo.b_buy_address}</td>
										</c:when>
										<c:otherwise>
										
											<td class="bottom bold">&nbsp&nbsp${vo.gym_name}</td>
										</c:otherwise>
									</c:choose>
									<td class="td_width img_left">
									<c:choose>
										<c:when test="${vo.b_buy_player_state eq '시합등록자' || vo.b_buy_player_state eq '시합결정자' }">
											<img class="match_img"
												name="sending" src="${pageContext.request.contextPath }/upload/red.png">
										</c:when>
										<c:otherwise>
											<img class="match_img"
												name="sending" src="${pageContext.request.contextPath }/upload/blue.png">
										</c:otherwise>
									</c:choose>
												</td>
								</tr>
	
								<tr>
								<c:choose>
										<c:when test="${vo.gym_event == null }">
											<td class="td_width">&nbsp&nbsp${vo.b_buy_day}&nbsp/&nbsp${vo.b_buy_time}</td>
										</c:when>
										<c:otherwise>
											<td class="td_width">&nbsp&nbsp${vo.booking_date}&nbsp/&nbsp${vo.booking_start} ~ ${vo.booking_end}</td>
										</c:otherwise>
								</c:choose>
									<td></td>
								</tr>
	
								<tr>
									<c:choose>
										<c:when test="${vo.gym_event == null }">
											<td class="td_width">&nbsp&nbsp종목:&nbsp${vo.b_buy_event}</td>
										</c:when>
										<c:otherwise>
											<td class="td_width">&nbsp&nbsp종목:&nbsp${vo.gym_event}</td>
										</c:otherwise>
									</c:choose>
									<td></td>
								</tr>
	
								<tr>
									<td class="td_width bold">&nbsp&nbsp상대:
									<c:forEach items="${vo.userList}" var="uservo">
									${uservo.nickname }
									</c:forEach>
									
									</td>
									<td></td>
								</tr>
	
								<tr>
									<td class="td_width">&nbsp&nbsp${vo.b_buy_price } 
									<c:choose>
										<c:when test="${vo.b_buy_player_state eq '시합등록자' && empty vo.b_buy_price && vo.booking_no == 0}">
											
											<div>&nbsp&nbsp신청자를 기다리는 중입니다.</div>
										</c:when>
										<c:when test="${vo.b_buy_player_state eq '시합등록자' && empty vo.b_buy_price && vo.booking_no != 0}">
											(${vo.booking_state})
											<div>&nbsp&nbsp상대가 대관 후 대결을 신청하였습니다.</div>
										</c:when>
										<c:when test="${vo.b_buy_player_state eq '시합결정자' && !empty vo.b_buy_price && vo.booking_no != 0}">
											(${vo.booking_state})
											<div>&nbsp&nbsp상대와의 매칭이 성사되었습니다.</div>
										</c:when>
										<c:when test="${vo.b_buy_player_state eq '신청자' && empty vo.b_buy_price}">
											
											<div>&nbsp&nbsp대관 된 상대에게 매칭을 신청하였습니다.</div>
										</c:when>
										<c:when test="${vo.b_buy_player_state eq '신청자' && !empty vo.b_buy_price}">
											(${vo.booking_state})
											<div>&nbsp&nbsp상대에게 대관 후 매칭을 신청하였습니다.</div>
										</c:when>
										<c:when test="${vo.b_buy_player_state eq '선택자' && empty vo.b_buy_price}">
											
											<div>&nbsp&nbsp대관 된 상대가 수락하였습니다.</div>
										</c:when>
										<c:when test="${vo.b_buy_player_state eq '선택자' && !empty vo.b_buy_price}">
											(${vo.booking_state})
											<div>&nbsp&nbsp상대와의 매칭이 성사되었습니다.</div>
										</c:when>
										<c:when test="${vo.b_buy_player_state eq '탈락자'}">
											
											<div>&nbsp&nbsp상대와의 매칭이 거절되었습니다.</div>
										</c:when>
									</c:choose>
									
									
									</td>
									<td></td>
								</tr>
	
								<tr>
									<td class="td_width">&nbsp&nbsp
									<c:choose>
										<c:when test="${vo.b_buy_player_state eq '시합결정자' && !empty vo.b_buy_price && vo.booking_no != 0}">

											<div class="status">완료</div>

										</c:when>
										<c:when test="${vo.b_buy_player_state eq '선택자' && empty vo.b_buy_price}">
											<div class="status">수락</div>
											
										</c:when>
										
										<c:when test=" ${vo.b_buy_player_state eq '탈락자'}" >
											<div class="status">거절</div>
									
										</c:when>
										
										<c:otherwise>
											<div class="status">대기</div>
										</c:otherwise>
									</c:choose>
									</td>
									<td></td>
								</tr>
	
							</table>
						</div>
					</a>
					</c:forEach>
					<!--//match_list (반복영역)-->

				</div>
			</div>
			<!--//middle-->

			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->
		</div>
		<!--//container-->
	</div>
	<!--//wrap-->
</body>
</html>