<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 매치보기</title>
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
						<div>내 매치 보기</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>

					<!--기간 필터-->
					<div class="time_filter">
						<input type="text" placeholder="기간필터"> ~ <input type="text" placeholder="기간필터">
						<img name="calender" src="달력아이콘"> <select>
							<option>전체</option>
							<option>신청함</option>
							<option>신청받음</option>
						</select>
					</div>


					<!--반복 영역-->
					<div class="match_list">
						<table class="match_list_elnt">
							<tr>
								<td class="tr_img" rowspan="6"><img name="스파링장" src="../../../image/스파링장.jpeg"></td>
								<td class="bottom bold">&nbsp&nbsp(체육관 이름 불러오기)</td>
								<td class="td_width img_left"><img class="match_img" name="sending"
									src="../../../image/blue.png"></td>
							</tr>

							<tr>
								<td class="td_width">&nbsp&nbsp날짜&nbsp/&nbsp시간 (각각 불러오기)</td>
								<td></td>
							</tr>

							<tr>
								<td class="td_width">&nbsp&nbsp종목:&nbsp(불러오기)</td>
								<td></td>
							</tr>

							<tr>
								<td class="td_width bold">&nbsp&nbsp상대:&nbsp(불러오기)</td>
								<td></td>
							</tr>

							<tr>
								<td class="td_width">&nbsp&nbsp요금</td>
								<td></td>
							</tr>

							<tr>
								<td class="td_width">&nbsp&nbsp
									<div class="status">매치상태표시</div>
								</td>
								<td></td>
							</tr>

						</table>
					</div>
					<!--//match_list (반복영역)-->

					<!--반복 영역-->
					<div class="match_list">
						<table class="match_list_elnt">
							<tr>
								<td class="tr_img" rowspan="6"><img name="스파링장" src="../../../image/스파링장.jpeg"></td>
								<td class="bottom bold">&nbsp&nbsp어쩌구 스파링장</td>
								<td class="td_width img_left"><img class="match_img" name="sending"
									src="../../../image/red.png"></td>
							</tr>

							<tr>
								<td class="td_width">&nbsp&nbsp2021.03.10&nbsp/&nbsp13:00~15:00</td>
								<td></td>
							</tr>

							<tr>
								<td class="td_width">&nbsp&nbsp종목:&nbsp주짓수</td>
								<td></td>
							</tr>

							<tr>
								<td class="td_width bold">&nbsp&nbsp상대:&nbsp어쩌구불주먹</td>
								<td></td>
							</tr>

							<tr>
								<td class="td_width">&nbsp&nbsp50,000</td>
								<td></td>
							</tr>

							<tr>
								<td class="td_width">&nbsp&nbsp
									<div class="status">수락</div>
								</td>
								<td></td>
							</tr>

						</table>
					</div>
					<!--//match_list (반복영역)-->


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