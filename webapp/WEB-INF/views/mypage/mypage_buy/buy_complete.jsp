<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
						<div class="buy_content_delevery_num">주문번호 135648654123</div>
						<div>구매일자 2020/08/31</div>
					</div>
					<div class="content_delevery_num_line"></div>
					<div class="buy_delivery_info">
						<div class="buy_deleverymanage_list">
							<div class="buy_delevery_product_content">
								<div class="buy_delevery_product_content_img">
									<img src="${pageContext.request.contextPath}/assets/image/글러브.jpg">
								</div>
								<div class="buy_deleverymanage_list1">
									<table>
										<tr>
											<td>[에버레스트] 글러브</td>
										</tr>
										<tr>
											<td>38,000원 | 블랙 1개</td>
										</tr>
									</table>
									<div class="buy_delever_btn">
										<div>배송준비중</div>
										<button class="buy_delever_review_btn">배송조회</button>
										<button class="buy_delever_review_btn">리뷰쓰기</button>
									</div>
								</div>
								<!--//buy_deleverymanage_list1-->

							</div>
							<!--//buy_delevery_product_content-->

							<div class="buy_delevery_product_content">
								<div class="buy_delevery_product_content_img">
									<img src="${pageContext.request.contextPath}/assets/image/복싱복.jpg">
								</div>
								<div class="buy_deleverymanage_list1">
									<table>
										<tr>
											<td>[아디다스] 복싱복</td>
										</tr>
										<tr>
											<td>60,000원 | 블루95(M) | 2개</td>
										</tr>
									</table>
									<div class="buy_delever_btn">
										<div>배송완료</div>
										<button class="buy_delever_review_btn">배송조회</button>
										<button class="buy_delever_review_btn">리뷰쓰기</button>
									</div>
								</div>
								<!--//buy_deleverymanage_list1-->

							</div>
							<!--//buy_delevery_product_content-->

						</div>
						<!--//list//-->

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
									<div>오늘은 맑음</div>
									<div>010-5568-7894</div>
									<div>(12345) 서울 강남구 무지개가피었로 123 빨주노초아파트 501호</div>
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