<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<title>구매내역</title>
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
							<li class="sub_on del"><a href="" class="t1_1"> <span>배송상품</span>
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

					<!-- 대관구매내역 반복리스트 -->
					<c:forEach items="${requestScope.BookingList }" var="bookingList">
						<div class="goods_pay_section">

							<div class="goods_group">
								<ul class="goods_group_list">
									<li id="" class="goods_pay_item">

										<div class="goods_item">
											<a href="" class="goods_thumb"> <img src="${pageContext.request.contextPath}/assets/image/마이페이지 남성_글러브.png" alt="강남체육관" width="90" height="90">
											</a>

											<div class="goods_info">
												<a href="" class="goods">
													<p class="name">${bookingList.gym_name }</p>
													<ul class="info">
														<li><span class="blind">상품금액</span> ${bookingList.booking_price }원</li>

														<li class="date"><span class="blind">상품구매날짜</span> ${bookingList.booking_date }</li>
													</ul>
												</a> <span class="state_statusName">${bookingList.b_buy_state }</span>
												<p class="guide">
													현재 ${bookingList.booking_state } 입니다.
													<c:choose>
														<c:when test="${bookingList.booking_state eq '예약중'|| bookingList.booking_state eq '예약대기중' }">
													상대를 기다리는 중 입니다.
												</c:when>

														<c:otherwise>
													감사합니다.
												</c:otherwise>

													</c:choose>

												</p>
											</div>
											<!-- //goods_info -->

										</div> <!-- //goods_item -->

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

					</c:forEach>
					<!-- //대관구매내역 반복리스트 -->

					<!-- 매칭구매내역 반복리스트 -->
					<c:forEach items="${requestScope.BbuyList }" var="bbuyList">
						<div class="goods_pay_section">

							<div class="goods_group">
								<ul class="goods_group_list">
									<li id="" class="goods_pay_item">

										<div class="goods_item">
											<a href="" class="goods_thumb"> <img src="${pageContext.request.contextPath}/assets/image/마이페이지 남성_글러브.png" alt="강남체육관" width="90" height="90">
											</a>

											<div class="goods_info">
												<a href="" class="goods">
													<p class="name">${bbuyList.gym_name }</p>
													<ul class="info">
														<li><span class="blind">상품금액</span> ${bbuyList.b_buy_price }원</li>

														<li class="date"><span class="blind">상품구매날짜</span> ${bbuyList.b_buy_date }</li>
													</ul>
												</a> <span class="state_statusName">${bbuyList.b_buy_player_state }</span>
												<p class="guide">매칭이 종료되었습니다. 감사합니다</p>
											</div>
											<!-- //goods_info -->

										</div> <!-- //goods_item -->

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

					</c:forEach>
					<!-- //매칭구매내역 반복리스트 -->

					<!-- 배송구매내역 반복리스트 -->
					<c:forEach items="${requestScope.BuyList }" var="buyList">

						<div class="goods_pay_section">
							<div class="goods_group">
								<ul class="goods_group_list test">
									<li id="" class="goods_pay_item">
										<div class="goods_item">
											<a href="" class="goods_thumb"> <img src="${pageContext.request.contextPath}/assets/image/글러브.jpg" alt="파워글러브" width="90" height="90">
											</a>

											<div class="goods_info">
												<a href="${pageContext.request.contextPath }/mypage/제품상세페이지?buy_no=${buyList.buy_no}" class="goods">
													<p class="name" name="name">${buyList.prod_name }</p>
													<ul class="info">
														<li><span class="blind" name="price">상품금액</span>${buyList.prod_price }원</li>

														<li class="date"><span class="blind" name="date">상품구매날짜</span>${buyList.buy_date }</li>
													</ul>
												</a> <span class="state_statusName" name="state">${buyList.buy_del_state }</span>
												<p class="guide">배송이 완료되었습니다. 감사합니다.</p>
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

					</c:forEach>
					<!-- //배송구매내역 반복리스트 -->

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

<script type="text/javascript">
	console.log("콘솔")

	$(function() {
		$('.del').click(function() {
			$('.test').fadeIn(1000);

			console.log("성공");
		})
	});
</script>

</html>