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

					<div class="alarm_header">알림</div>
					<!--//alarm_header//-->

					<div class="line"></div>
					<!-- //line -->

					<!-- 반복리스트 -->
					<div class="alram_list">
						<div class="test">
							<h3 class="Order_date">02월 25일</h3>
							<div class="Box_alarm">
								<span><a class="Addr_goods" href="">강남체육관</a></span><br> <span class="Kind_goods">매칭</span> <span class="Kind_goods_state">매칭대기 중</span>
								<p class="Notice_alarm">
									(등록자이름)님께 매칭을 신청하였습니다.<br> 시설이용시 준수사항을 지켜주세요.
							</div>
						</div>
						<!--//test-->

						<div class="test">
							<h3 class="Order_date">02월 01일</h3>
							<div class="Box_alarm">
								<span><a class="Addr_goods" href="">권투글러브</a></span><br> <span class="Kind_goods">상품</span> <span class="Kind_goods_state">결제완료</span>
								<p class="Notice_alarm">(상품이름)의 결제가 완료되었습니다.</p>
								이용해주셔서 감사합니다.
							</div>
						</div>
						<!--//test-->

					</div>
					<!--//alram_list-->

				</div>
				<!-- //content -->
				<!-- //반복리스트 -->

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