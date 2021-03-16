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
						<div>체육관 관리</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>

					<div>탭부분(여러 체육관이 있을 경우 여기로 구분함)</div>

					<!--추후 생길 탭과 같은 라인에 위치-->
					<div class="regi_btn_site">
						<button onclick="location.href='예약판매자5_마이페이지_체육관등록1.html'" class="regi_btn">체육관 등록</button>
					</div>

					<div class="regi_btn_site">
						<button onclick="location.href='예약판매자6_마이페이지_대관등록1.html'" class="regi_btn">대관 등록</button>
					</div>

					<!--체육관 정보-->
					<div class="gym_regi_form">
						<form action="" method="">
							<table>
								<tr>
									<td class="basic">체육관 이름</td>
									<td colspan="3"><input class="input_text" type="text"></td>
								</tr>

								<tr>
									<td class="basic">체육관 주소</td>
									<td colspan="3"><input class="input_text" type="text"></td>
								</tr>

								<tr>
									<td class="basic">체육관 전화번호</td>
									<td colspan="3"><input class="input_text" type="text"></td>
								</tr>

								<tr class="input_plus">
									<td>체육관 운영시간</td>
									<td colspan="3"><textarea></textarea></td>
								</tr>

								<tr class="basic_chk">
									<td>체육관 주 종목</td>
									<td colspan="3"></td>
								</tr>

								<tr>
									<td class="basic_chk_padding"><input type="checkbox" name=""> 복싱</td>
									<td class="basic_chk_padding"><input type="checkbox" name=""> 킥복싱</td>
									<td class="basic_chk_padding"><input type="checkbox" name=""> 주짓수</td>
									<td class="basic_chk_padding"><input type="checkbox" name=""> 종합격투기</td>
								</tr>

								<tr class="basic_chk">
									<td>체육관 편의시설</td>
									<td colspan="3"></td>
								</tr>

								<tr>
									<td><input type="checkbox" name=""> 주차장</td>
									<td><input type="checkbox" name=""> 샤워실</td>
									<td colspan="2"><input type="checkbox" name=""> 수건</td>
								</tr>

								<tr>
									<td class="basic_chk_padding"><input type="checkbox" name=""> 락커</td>
									<td class="basic_chk_padding"><input type="checkbox" name=""> 글러브</td>
									<td class="basic_chk_padding" colspan="2"><input type="checkbox" name=""> 운동복</td>
								</tr>

								<tr class="input_plus">
									<td>공지사항</td>
									<td colspan="3"><textarea></textarea></td>
								</tr>


								<tr>
									<td class="basic">체육관 사진</td>
									<td colspan="3"><input type="file"></td>
								</tr>

							</table>

							<div class="gym_regi_btn_site">
								<button onclick="location.href='예약판매자4_마이페이지_체육관관리_리스트1.html'" class="gym_regi_btn"
									type="button">정보 수정</button>
								<button onclick="location.href='예약판매자4_마이페이지_체육관관리_리스트1.html'" class="gym_regi_btn"
									type="button">체육관 삭제</button>
							</div>

						</form>
					</div>
					<!--//gym_regi_form-->

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