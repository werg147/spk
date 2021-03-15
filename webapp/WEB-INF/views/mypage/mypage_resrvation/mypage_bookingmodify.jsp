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
						<div>대관 수정</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>


					<!--체육관 불러오기-->
					<div class="booking_gym_info">
						<table class="booking_gym_table">
							<tr>
								<td rowspan="8"><img class="gym_info_img" name="스파링장" src="../../../image/스파링장.jpeg"></td>
								<td class="gym_info_title gap">체육관 이름</td>
							</tr>

							<tr>
								<td class="gap_info">(불러온 체육관 이름)</td>
							</tr>

							<tr>
								<td class="gym_info_title gap">체육관 주소</td>
							</tr>

							<tr>
								<td class="gap_info">(불러온 체육관 주소)</td>
							</tr>

							<tr>
								<td class="gym_info_title gap">체육관 운영시간</td>
							</tr>

							<tr>
								<td class="gap_info">(불러온 체육관 운영시간)</td>
							</tr>

							<tr>
								<td class="gym_info_title gap">체육관 편의시설</td>
							</tr>

							<tr>
								<td class="gap_info">(불러온 체육관 편의시설)</td>
							</tr>

						</table>
					</div>
					<!--//체육관 불러오기-->

					<div class="booking_regi_form">
						<!--대관 시간/요금 등록-->
						<!--체육관 불러오기 오른편으로-->
						<form>
							<table>
								<tr class="booking_regi_title">
									<td colspan="2">체육관 이용시간/대여요금</td>
								</tr>
								<tr class="booking_regi_desc">
									<td colspan="2">날짜&nbsp&nbsp&nbsp&nbsp<input type="text">&nbsp<img
										class="calender" name="calender" src="./이미지/calendar.png"></td>
									<!--달력나옴-->
								</tr>

								<tr class="booking_regi_desc">
									<!--클릭으로 추가됨-->
									<td>이용시간&nbsp&nbsp <select>
											<option>12:00</option>
											<option>13:00</option>
									</select> ~ <select>
											<option>12:00</option>
											<option>13:00</option>
									</select>
									</td>
									<td>&nbsp&nbsp&nbsp&nbsp대여요금&nbsp&nbsp<input type="text"></td>
								</tr>
							</table>

							<div>
								<button type="button">추가버튼</button>
							</div>
							<!--css추가-->

							<div class="booking_regi_btn_site">
								<button onclick="location.href='예약판매자7_마이페이지_예약관리1.html'" class="booking_regi_btn"
									type="button">대관 수정</button>
							</div>
						</form>
					</div>
					<!--//대관 시간/요금 등록-->



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