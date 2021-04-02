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

						<c:forEach items="${requestScope.pMap.alarmList }" var="aList">
							<div class="alarm_content">
								<h3 class="Order_date">${aList.alarm_date }</h3>
								<div class="Box_alarm">
									<c:choose>
										<c:when test="${aList.buy_type == 1 }">
											<span class="Kind_goods">배송상품</span>
											<span><a class="Addr_goods" href="${pageContext.request.contextPath }/mypage/buydel?buy_no=${aList.buy_no}">${aList.alarm_title}</a></span>
										</c:when>
										<c:otherwise>
											<span class="Kind_goods">매칭상품</span>
											<span><a class="Addr_goods" href="${pageContext.request.contextPath }/mypage/buylist?b_buy_no=${aList.b_buy_no}">${aList.gym_name }</a></span>
										</c:otherwise>
									</c:choose>
									<p class="Notice_alarm">${aList.alarm_content }</p>
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

			<div id="paging">
				<ul>
					<c:if test="${pMap.prev == true }">
						<li><a href="${pageContext.request.contextPath }/mypage/alarm?crtPage=${pMap.startPageBtnNo - 1}&keyword=${param.keyword}">◀</a></li>
					</c:if>

					<c:forEach begin="${pMap.startPageBtnNo }" end="${pMap.endPageBtnNo }" step="1" var="page">
						<li><a href="${pageContext.request.contextPath }/mypage/alarm?crtPage=${page}&keyword=${param.keyword}">${page}</a></li>
					</c:forEach>

					<c:if test="${pMap.next == true }">
						<li><a href="${pageContext.request.contextPath }/mypage/alarm?crtPage=${pMap.endPageBtnNo + 1}&keyword=${param.keyword}">▶</a></li>
					</c:if>
				</ul>

				<div class="clear"></div>
			</div>

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