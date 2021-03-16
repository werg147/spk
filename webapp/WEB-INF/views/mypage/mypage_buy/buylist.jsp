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

					<div class="alarm_header">구매내역</div>
					<!--//alarm_header//-->

					<div class="search_date">
						<div class="content_product_insert_select_box">
							<select id="prod_cate">
								<option selected>전체기간</option>
								<option>2021</option>
								<option>2020</option>
								<option>2019</option>
							</select>
						</div>
					</div>
					<!-- //search_date -->

					<div class="buylist_line"></div>
					<!-- //line -->

					<div class="sub_tmenu">
						<ul>
							<li class="sub_on"><a href="" class="t1_1"> <span>배송상품</span>
							</a></li>

							<li class="sub_on"><a href="" class="t1_1"> <span>매칭상품</span>
							</a></li>
						</ul>
					</div>

					<!-- <ul class="list_order">
                            <li class="no_data">
                                주문내역이 없습니다.
                            </li>
                        </ul> -->

					<!-- 반복리스트 -->
					<div class="goods_pay_section">

						<div class="goods_group">
							<ul class="goods_group_list">
								<li id="" class="goods_pay_item">

									<div class="goods_item">
										<a href="" class="goods_thumb"> <img src="${pageContext.request.contextPath}/assets/image/마이페이지 남성_글러브.png" alt="강남체육관" width="90" height="90">
										</a>

										<div class="goods_info">
											<a href="" class="goods">
												<p class="name">강남체육관</p>
												<ul class="info">
													<li><span class="blind">상품금액</span> 25,000원</li>

													<li class="date"><span class="blind">상품구매날짜</span> 2021.02.25</li>
												</ul>
											</a> <span class="state_statusName">매칭종료</span>
											<p class="guide">매칭이 종료되었습니다. 감사합니다</p>
										</div>
										<!-- //goods_info -->

									</div> <!-- //goods_item -->

									<div class="seller_item">

										<div class="inner">
											<span class="seller">강남체육관</span> <span class="tel">02-8765-4321</span>

											<!-- 네이버페이 문의하기 참조 -->
										</div>
										<!-- //inner -->

									</div> <!-- //seller_item -->

									<div class="test">

										<div class="test_2">

											<div class="button_item">
												<a href="" class="state_button function _click"> <span>파트너평가</span>

												</a>
												<!-- 네이버페이 리뷰쓰기 참조 -->
											</div>
											<!-- //button_item -->

										</div>
										<!-- test_2 -->

									</div> <!-- //test -->

								</li>
							</ul>
							<!-- //goods_group_list -->

						</div>
						<!-- //goods_group -->

					</div>
					<!-- //goods_pay_section -->
					<!-- //반복리스트 -->

					<div class="goods_pay_section">
						<div class="goods_group">
							<ul class="goods_group_list">
								<li id="" class="goods_pay_item">
									<div class="goods_item">
										<a href="" class="goods_thumb"> <img src="${pageContext.request.contextPath}/assets/image/글러브.jpg" alt="파워글러브" width="90" height="90">
										</a>

										<div class="goods_info">
											<a href="" class="goods">
												<p class="name">파워글러브</p>
												<ul class="info">
													<li><span class="blind">상품금액</span> 25,000원</li>

													<li class="date"><span class="blind">상품구매날짜</span> 2021.02.01</li>
												</ul>
											</a> <span class="state_statusName">배송완료</span>
											<p class="guide">배송이 완료되었습니다. 감사합니다.</p>
										</div>
									</div>

									<div class="seller_item">
										<div class="inner">
											<span class="seller">복싱몰</span> <span class="tel">02-1234-5678</span>

											<!-- 네이버페이 문의하기 참조 -->
										</div>
									</div>

									<div class="test">

										<div class="test_2">

											<div class="button_item">
												<a href="" class="state_button function _click"> <span>리뷰쓰기</span>

												</a>
												<!-- 네이버페이 리뷰쓰기 참조 -->
											</div>

											<div class="button_item">
												<a href="" class="state_button function _click"> <span>배송조회</span>

												</a>
												<!-- 네이버페이 리뷰쓰기 참조 -->
											</div>

										</div>

									</div>

								</li>
							</ul>
						</div>
					</div>

				</div>
				<!--//content-->

			</div>
			<!--//middle-->

			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->

		</div>
		<!-- //container -->

	</div>
	<!--//wrap-->

</body>
</html>