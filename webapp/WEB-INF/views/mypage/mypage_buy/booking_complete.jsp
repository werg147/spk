<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>배송정보입력</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/delivery.css">
</head>
<body>


	<div class="wrap">

		<div class="container">

			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header-->

			<div class="middle">

				<c:import url="/WEB-INF/views/include/sidemenu.jsp"></c:import>
				<!--//side_menu//-->

				<div class="content_product">
					<div class="content_delevery_product_header">
						<div id="">구매내역</div>
					</div>
					<!--//content_delevery_product_header//-->

					<div class="reservation_info">
						<div class="buy_content_delevery_num">대관번호 ${requestScope.BookingList[0].booking_no}</div>
						<div>대관일자  ${requestScope.BookingList[0].booking_date}</div>
					</div>
					<div class="content_delevery_num_line"></div>
					<div class="buy_delivery_info">

						<!-- 반복리스트 -->
						<div class="buy_deleverymanage_list">
							<div class="buy_delevery_product_content">
								<div class="buy_delevery_product_content_img">
									<img src="../../../image/img/rental.jpeg">
								</div>
								<div class="buy_deleverymanage_list1">
									<table>
										<tr>
											<td>${requestScope.BookingList[0].gym_name}</td>
										</tr>
										<tr>
											<td>${requestScope.BookingList[0].booking_price}</td>
										</tr>
									</table>
									<div class="buy_reservaino_btn">
										<div>${requestScope.BookingList[0].booking_state}</div>
										<button class="buy_reservation_review_btn">파트너평가</button>
									</div>
								</div>
								<!--//buy_deleverymanage_list1-->
							</div>
							<!--//buy_delevery_product_content-->
						</div>
						<!--//list//-->
						<!-- //반복리스트 -->

						<div class="delivery_info_personal">
							<div class="delivery_info_header">
								<div class="head">결제내역</div>
								<div class="content_delevery_num_line"></div>
							</div>
							<div class="delivery_info_content">
								<div class="delivery_info_content_title">
									<div>결제방법</div>
									<div>결제금액</div>
								</div>
								<div class="delivery_info_content_title_re">
									<div>${requestScope.BookingList[0].b_buy_paytype}</div>
									<div>${requestScope.BookingList[0].b_buy_price}원</div>
								</div>
							</div>
						</div>
						<!--delivery_info_persondelevery_btnal-->

					</div>
					<!--//delivery_info-->

					<div class="go_back">
						<button class="go_back_btn"><a href="${pageContext.request.contextPath }/mypage/bookinglist?user_no=${requestScope.BookingList[0].user_no}">구매목록보기</a></button>
					</div>
				</div>
				<!--//content_product//-->

			</div>
			<!--//middle//-->

		</div>
		<!--//container//-->

	</div>
	<!--//wrap//-->

</body>

</html>