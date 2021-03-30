<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/booking.css">
</head>
<body>
	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
	<!--//header//-->
		</div>
	</div>
	<!-- Header end -->

	<!-- wrap -->
	<div class="wrap">
		<div class="container">
			<div class="middle">
				<c:import url="/WEB-INF/views/include/sidemenu.jsp"></c:import>
				<!--//side_menu//-->

				<!--////////////////////////////////////////////-->

				<div class="content_seller">
					<div class="content_booking_header">
						<div>예약 현황</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>

					<!--체육관 정보(불러옴)-->
					<div class="booking_list_elnt">
						<div class="gym_info">
							<div class="gym_image">
								<img name="스파링장" src="${pageContext.request.contextPath }/assets/image/스파링장.jpeg">
							</div>

							<div class="gym_info_title">
								<div class="gym_info_title_no">체육관 이름</div>
								<br>
								<div class="gym_info_title_no">체육관 주소</div>
							</div>

							<div class="gym_info_detail">
								<div>${gymVo.gym_name }</div>
								<br>
								<div>${gymVo.gym_address }</div>
							</div>

							<div class="gym_info_btn_site">
								<a href="${pageContext.request.contextPath }/mypage/book/gym?no=${gymVo.sell_no }&gymno=${gymVo.gym_no}">
								<button class="gym_info_btn" type="button">체육관 정보</button>
								</a>
								<a href="${pageContext.request.contextPath }/mypage/book/bookaddform?gymno=${gymVo.gym_no }">
									<button class="gym_info_btn" type="button">대관 등록</button>
								</a>
							</div>
						</div>
						<!--//gym_info-->
					</div>
					<!--//booking_list_elnt (반복영역)-->

					<!--기간 필터-->
					<div class="time_filter">
						<input type="text" placeholder="기간필터"> ~ <input type="text" placeholder="기간필터">
						<!-- <img name="calender" src="달력아이콘"> -->
					</div>


					<!--예약현황 리스트-->
					<div class="booking_manage">
						<table class="booking_manage_list">
							<thead>
								<tr>
									<th>날짜</th>
									<th>시간</th>
									<th>요금</th>
									<th>상태</th>
									<th>예약자명</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
								<!--반복영역-->
								<c:forEach var="vo" items="${gymVo.bookingList }">
									<tr>
										<td>${vo.booking_date }</td>
										<td>${vo.booking_start }~${vo.booking_end }</td>
										<td>${vo.booking_price }</td>
										<td>${vo.booking_state }</td>
										<td></td>
										
										<td>
											<c:if test="${vo.booking_state eq '대기'}">
												<a href="${pageContext.request.contextPath }/mypage/book/bookremove?bookno=${vo.booking_no }&gymno=${gymVo.gym_no}">
													<button class="booking_manage_btn" type="button">삭제</button>
												</a>
											</c:if>
										</td>
									</tr>
								</c:forEach> <!-- //반복 영역 -->

							</tbody>
						</table>
					</div> <!--//booking_manage-->
					
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