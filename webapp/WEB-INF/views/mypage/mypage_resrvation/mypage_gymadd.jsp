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
						<div>체육관 등록</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>

					<!--등록폼-->
					<div class="gym_regi_form">
						<form action="${pageContext.request.contextPath}/mypage/book/gymadd" method="post" enctype="multipart/form-data">
							<table>
								<tr>
									<td class="basic">체육관 이름</td>
									<td colspan="4"><input class="input_text" type="text" name="gym_name"> 
									<!-- 테스트용 사업자번호 --><input type="hidden" name="sell_no" value="${authUser.sell_no }"></td>
								</tr>

								<tr>
									<td class="basic">체육관 주소</td>
									<td colspan="4"><input class="input_text" type="text" name="gym_address"></td>
								</tr>

								<tr>
									<td class="basic">체육관 전화번호</td>
									<td colspan="4"><input class="input_text" type="text" name="gym_ph"></td>
								</tr>

								<tr class="input_plus">
									<td>체육관 운영시간</td>
									<td colspan="4"><textarea name="gym_time"></textarea></td>
								</tr>

								<tr class="basic_chk">
									<td>체육관 주 종목</td>

								
									<td class="basic_chk_padding">
										<input id="box" type="radio" name="gym_event" value="복싱"> <label for="box">복싱</label>
									</td>
									<td class="basic_chk_padding">
										<input id="box" type="radio" name="gym_event" value="킥복싱"> <label for="box">킥복싱</label>
									</td>
									<td class="basic_chk_padding">
										<input id="jiu" type="radio" name="gym_event" value="주짓수"> <label for="jiu">주짓수</label>
									</td>
									<td class="basic_chk_padding">
										<input id="mma" type="radio" name="gym_event" value="종합격투기"> <label for="mma">종합격투기</label>
									</td>
								</tr>

								<tr class="basic_chk">
									<td>체육관 편의시설</td>

									<td><input id="park" type="checkbox" name="conve" value="park"> <label for="park">주차장</label></td>
									<td><input id="shower" type="checkbox" name="conve" value="shower"> <label for="shower">샤워실</label></td>
									<td colspan="2"><input id="towel" type="checkbox" name="conve" value="towel"> <label for="towel">수건</label></td>
								</tr>

								<tr>
									<td></td>
									<td class="basic_chk_padding">
										<input id="locker" type="checkbox" name="conve" value="locker"> <label for="locker">락커</label>
									</td>
									<td class="basic_chk_padding">
										<input id="glove" type="checkbox" name="conve" value="glove"> <label for="glove">글러브</label>
									</td>
									<td class="basic_chk_padding" colspan="2">
										<input id="wear" type="checkbox" name="conve" value="wear"> <label for="wear">운동복</label>
									</td>
								</tr>

								<tr class="input_plus">
									<td>공지사항</td>
									<td colspan="2"><textarea name="gym_notice"></textarea></td>
								</tr>



								<tr>
									<td class="basic">체육관 사진</td>
									<td colspan="2"><input type="file" name="file"></td>
								</tr>

							</table>

							<div class="gym_regi_btn_site">
								<button class="gym_regi_btn" type="submit">체육관 등록</button>
							</div>

						</form> <!-- //form -->
					</div>
					<!--//gym_regi_form-->
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