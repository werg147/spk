<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>배송정보입력</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/delivery.css">
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
						<div class="buy_content_delevery_num">매치번호 ${requestScope.MatchingList.booking_no}</div>
						<div>매치일자 ${requestScope.MatchingList.b_buy_date}</div>
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
											<td>${requestScope.MatchingList.nickname}</td>
										</tr>
										<tr>
											<td>${requestScope.MatchingList.b_buy_price}</td>
										</tr>
									</table>
									<div class="buy_reservaino_btn">
										<div>${requestScope.MatchingList.b_buy_state}</div>
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
								<div class="head">상대정보</div>
								<div class="content_delevery_num_line"></div>
							</div>
							<div class="delivery_info_content">
								<div class="delivery_info_content_title">
									<div>매치상대</div>
									<div>신장</div>
									<div>체중</div>
									<div>체급</div>
									<div>매치시각</div>
								</div>
								<div class="delivery_info_content_title_re">
									<div>${requestScope.MatchingList.nickname}(${requestScope.MatchingList.user_name})</div>
									<div>${requestScope.MatchingList.height}</div>
									<div>${requestScope.MatchingList.weight}</div>
									<div>${requestScope.MatchingList.weight_class}</div>
									<div>${requestScope.MatchingList.booking_start}~${requestScope.MatchingList.booking_end}</div>
								</div>
							</div>
						</div>
						<!--delivery_info_persondelevery_btnal-->

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
									<div>${requestScope.MatchingList.b_buy_paytype}</div>
									<div>${requestScope.MatchingList.b_buy_price}원</div>
								</div>
							</div>
						</div>
						<!--delivery_info_persondelevery_btnal-->

					</div>
					<!--//delivery_info-->

					<div class="go_back">
						<button class="go_back_btn">
							<a href="${pageContext.request.contextPath }/mypage/matchinglist?user_no=${requestScope.BookingList.user_no}">구매목록보기</a>
						</button>
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