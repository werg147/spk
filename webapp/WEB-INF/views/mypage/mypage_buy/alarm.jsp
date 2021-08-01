<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
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

					<div class="alarm_header">알림</div>
					<!--//alarm_header//-->

					<div class="line"></div>
					<!-- //line -->

					<!-- 반복리스트 -->
					<div class="alram_list">

						<c:forEach items="${requestScope.AlarmList }" var="aList">
							<div class="alarm_content">
								<h3 class="Order_date">2021-04-04 14:22:51.0</h3>
								<div class="Box_alarm">
									<c:choose>
										<c:when test="${aList.buy_type == 1 }">
											<span class="Kind_goods">배송상품</span>
											<span><a class="Addr_goods" href="${pageContext.request.contextPath }/mypage/buydel?buy_no=${aList.buy_no}">${aList.alarm_title}</a></span>
										</c:when>
										<c:when test="${aList.buy_type == 2 }">
											<span class="Kind_goods">매칭상품</span>
											<span><a class="Addr_goods" href="${pageContext.request.contextPath }/mypage/buymatching?booking_no=${aList.b_buy_no}">${aList.alarm_title }</a></span>
										</c:when>
										<c:when test="${aList.buy_type == 3 }">
											<span class="Kind_goods">대관상품</span>
											<span><a class="Addr_goods" href="${pageContext.request.contextPath }/mypage/buybooking?booking_no=${aList.booking_no}">${aList.alarm_title }</a></span>
										</c:when>
									</c:choose>
									<p class="Notice_alarm">${aList.alarm_content }</p>
									<!-- <a href="${pageContext.request.contextPath }/mypage/상대평가?b_buy_no=${aList.b_buy_no}">상대를 평가해보세요.</a> -->
								</div>
							</div>
						</c:forEach>
						<!--//alarm_content-->

					</div>
					<!--//alram_list-->
					<!-- //반복리스트 -->

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

<script type="text/javascript">
	
</script>

</html>