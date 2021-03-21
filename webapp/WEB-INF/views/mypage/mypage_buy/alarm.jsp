<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>알림</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/mypage_buy.css">
</head>

<body>

	<div class="wrap">

		<div class="container">

			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header-->

			<div class="middle">

				<c:import url="/WEB-INF/views/include/sidemenu.jsp"></c:import>
				<!--//side_menu//-->

				<div class="content">

					<div class="sub_header">알림</div>
					<!--//alarm_header//-->

					<div class="line"></div>
					<!-- //line -->

					<!-- 반복리스트 -->
					<div class="alram_list">

						<c:forEach items="${requestScope.AlarmList }" var="aList">
							<div class="alarm_content">
								<h3 class="Order_date">${aList.alarm_date }</h3>
								<div class="Box_alarm">
									<c:choose>
										<c:when test="${aList.sell_type.equals('배송') }">
											<span><a class="Addr_goods" href="">${aList.prod_name }</a></span>
										</c:when>
										<c:otherwise>
											<span><a class="Addr_goods" href="">${aList.gym_name }</a></span>
										</c:otherwise>
									</c:choose>
									<span class="Kind_goods">${aList.sell_type }</span>
									<p class="Notice_alarm">${aList.alarm_content }</p>
								</div>
							</div>
						</c:forEach>
						<!--//alarm_content-->

					</div>
					<!--//alram_list-->
					<!-- //반복리스트 -->

					<form action="${pageContext.request.contextPath }/mypage/payment_complete" method="get">
						<button type="submit">결제하기</button>
					</form>

					<form action="${pageContext.request.contextPath }/mypage/delivery_ready" method="get">
						<button type="submit">주문확인</button>
					</form>

					<form action="${pageContext.request.contextPath }/mypage/delivery_ing" method="get">
						<button type="submit">발송하기</button>
					</form>

					<form action="${pageContext.request.contextPath }/mypage/delivery_complete" method="get">
						<button type="submit">배송완료</button>
					</form>

					<form action="${pageContext.request.contextPath }/mypage/matching_registration" method="get">
						<button type="submit">매칭등록</button>
					</form>

					<form action="${pageContext.request.contextPath }/mypage/matching_application" method="get">
						<button type="submit">매칭신청</button>
					</form>

					<form action="${pageContext.request.contextPath }/mypage/matching_refused" method="get">
						<button type="submit">거절하기</button>
					</form>

					<form action="${pageContext.request.contextPath }/mypage/matching_accept " method="get">
						<button type="submit">수락하기</button>
					</form>

					<form action="${pageContext.request.contextPath }/mypage/matching_complete " method="get">
						<button type="submit">파트너평가</button>
					</form>

				</div>
				<!-- //content -->

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