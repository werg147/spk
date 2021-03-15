<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사업자 계정</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/booking.css">
</head>
<body>
	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
			<div class="middle">
				<c:import url="/WEB-INF/views/include/sidemenu.jsp"></c:import>
				<!--//sidemenu//-->


				<!--////////////////////////////////////////////-->

				<div class="content_seller">
					<div class="content_booking_header">
						<div>계정관리</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>

					<div class="content_seller_regi">
						<div class="seller_regi_title">사업자 정보</div>
						<br>

						<!--입력폼 (추후 form 추가)-->
						<form action="" method="">
							<table class="seller_regi_form">
								<tbody>

									<tr>
										<td class="basic">사업자 이름</td>
										<td><input class="input_con" type="text"
											name="sellerName" placeholder="이름을 입력해주세요"></td>
									</tr>

									<tr>
										<td class="basic">사업자 번호</td>
										<td><input class="input_con" type="text" name="sellerNo"
											placeholder="번호를 입력해주세요"></td>
									</tr>

									<tr>
										<td class="basic">사업자 주소</td>
										<td><input class="input_con" type="text" name="sellerAd"
											placeholder="주소를 입력해주세요"></td>
									</tr>

									<tr>
										<td class="basic">사업자 계좌번호</td>
										<td><select>
												<option>은행 선택</option>
												<option>국민은행</option>
												<option>농협</option>
												<option>카카오뱅크</option>
										</select>
											<div class="account_input">
												<input class="input_con" type="text" name="sellerAcount"
													placeholder="계좌번호를 입력해주세요">
											</div></td>
									</tr>

								</tbody>
							</table>

							<div class="seller_regi_btn_site">
								<button onclick="location.href='예약판매자3_마이페이지_체육관관리_리스트1.html'"
									class="seller_regi_btn" type="button">사업자 정보 수정</button>
							</div>
						</form>
						<!--입력폼-->

					</div>
					<!--//content_seller_regi-->
				</div>
				<!-- //content_seller -->
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