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
								<img name="스파링장" src="../../../image/스파링장.jpeg">
							</div>

							<div class="gym_info_title">
								<div class="gym_info_title_no">체육관이름</div>
								<br>
								<div class="gym_info_title_no">체육관 주소</div>
							</div>

							<div class="gym_info_detail">
								<div>1111111체육관</div>
								<br>
								<div>00시 00구 00로 00 00빌딩 2층</div>
							</div>

							<div class="gym_info_btn_site">
								<button onclick="location.href='예약판매자5_마이페이지_체육관등록1.html'" class="gym_info_btn"
									type="button">체육관 정보</button>
								<button onclick="location.href='예약판매자6_마이페이지_대관등록1.html'" class="gym_info_btn" type="button">대관
									등록</button>
							</div>
						</div>
						<!--//gym_info-->
					</div>
					<!--//booking_list_elnt (반복영역)-->

					<!--기간 필터-->
					<div class="time_filter">
						<input type="text" placeholder="기간필터"> ~ <input type="text" placeholder="기간필터">
						<img name="calender" src="달력아이콘">
					</div>


					<!--예약현황 리스트-->
					<div class="booking_manage">
						<table class="booking_manage_list">
							<thead>
								<tr>
									<th>체육관 이름</th>
									<th>일시/요금</th>
									<th>상태</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
								<!--반복영역-->
								<tr>
									<td>1111111체육관</td>
									<td>1.11/50,000</td>
									<td>예약중</td>
									<td>삭제 및 수정 불가</td>
								</tr>
								<!--//반복-->

								<tr>
									<td>1111111체육관</td>
									<td>1.11/50,000</td>
									<td>예약중</td>
									<td>삭제 및 수정 불가</td>
								</tr>
								<tr>
									<td>1111111체육관</td>
									<td>1.11/50,000</td>
									<td>대기중</td>
									<td>
										<button onclick="location.href='예약판매자8_마이페이지_예약수정.html'" class="booking_manage_btn"
											type="button">수정</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--//booking_manage-->

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