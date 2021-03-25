<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/booking.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">

</head>
<body>

	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->

			<div class="middle">

				<!--//side_menu//-->

				<!--////////////////////////////////////////////-->

				<div class="content_seller">
					<div class="content_booking_header">
						<div>잘못된 접근</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>

					<div class="error_box">
						<div class="error_title">500</div>
						<div class="error_content">웹 사이트 유지관리 중이거나 프로그래밍 오류가 있을 수 있습니다.</div>
					</div>
						<div id="space"></div>
						<div id="space"></div>
						<div id="space"></div>
						<div id="space"></div>
						<div id="space"></div>
					</div>
					<!--//not_seller-->
				</div>
				<!--//middle-->
				<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
				</div>

				<!--//footer//-->
			</div>
			<!--//container-->
		</div>
		<!--//wrap-->
</body>
</html>