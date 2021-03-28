<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>알림</title>
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

					<div class="buy_info">
						<div class="buy_content_delevery_num">주문번호 ${bmap.buyVo.buy_no}</div>
						<div>구매일자 ${bmap.buyVo.buy_date}</div>
					</div>
					<div class="content_delevery_num_line"></div>
					<div class="buy_delivery_info">
					
					<c:forEach items="${bmap.pbList}" var="pbVo">
						<div class="buy_deleverymanage_list">
							<div class="buy_delevery_product_content">
									<div class="buy_delevery_product_content_img">
										<img src="${pageContext.request.contextPath}/upload/${pbVo.prod_img_savename}">
									</div>
									<div class="buy_deleverymanage_list1">
										<table>
											<tr>
												<td>[${pbVo.prod_brand}] ${pbVo.prod_name}</td>
											</tr>
											<tr>
												<td><fmt:formatNumber value="${pbVo.buyprod_price}" pattern="#,###"/>원 | ${pbVo.color} ${pbVo.count}개</td>
											</tr>
										</table>
										<div class="buy_delever_btn">
											<div>배송준비중</div>
											<button class="buy_delever_review_btn">배송조회</button>
											<a href="${pageContext.request.contextPath}/store/reviewForm"><button class="buy_delever_review_btn">리뷰쓰기</button></a>
										</div>
									</div>
							
								<!--//buy_deleverymanage_list1-->
							</div>
							<!--//buy_delevery_product_content-->
						</div>
						<!--//list//-->
					</c:forEach>
						
						<div class="delivery_info_personal">
							<div class="delivery_info_header">
								<div class="head">배송정보</div>
								<div class="content_delevery_num_line"></div>
							</div>
							<div class="delivery_info_content">
								<div class="delivery_info_content_title">
									<div>받는 분</div>
									<div>핸드폰</div>
									<div>주소</div>
								</div>
								<div class="delivery_info_content_title_re">
									<div>${bmap.buyVo.buy_name}</div>
									<div>${bmap.buyVo.buy_ph}</div>
									<div>${bmap.buyVo.buy_address}</div>
								</div>
							</div>
						</div>
						<!--delivery_info_persondelevery_btnal-->

					</div>
					<!--//delivery_info-->

					<div class="go_back">
						<button class="go_back_btn">구매목록보기</button>
					</div>
				</div>
				<!--//content_product//-->

			</div>
			<!--//middle//-->

			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->

		</div>
		<!--//container//-->

	</div>
	<!--//wrap//-->

</body>

</html>