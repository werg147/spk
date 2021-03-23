<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<!--//side_menu//-->

				<!--////////////////////////////////////////////-->

				<div class="content_seller">
					<div class="content_booking_header_fx">
						<div>배송판매자 등록</div>
						
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>

					<div class="content_seller_regi">
						<div class="seller_regi_title">사업자 정보</div>
						<br>

						<!--입력폼 (추후 form 추가)-->
						<c:choose>
							<c:when test="${authUser.book_type == 0}">
								<form action="${pageContext.request.contextPath}/mypage/prod/prodselleradd" method="get">
							</c:when>
							<c:otherwise>
								<form action="${pageContext.request.contextPath}/mypage/prod/prodsellermodify" method="get">
								<input type="hidden" name="sell_no" value="${authUser.sell_no}">
							</c:otherwise>
						</c:choose>
						
							<table class="seller_regi_form">
								<tbody>

									<tr>
										<td class="basic">사업자 이름</td>
										<td><input class="input_con" type="text"
											name="prod_sell_name" placeholder="이름을 입력해주세요"></td>
									</tr>
									<tr>
										<td class="basic">사업체 이름</td>
										<td><input class="input_con" type="text"
											name="prod_com_name" placeholder="회사명을 입력해주세요"></td>
									</tr>
									<tr>
										<td class="basic">사업자 번호</td>
										<td><input class="input_con" type="text" name="prod_business_no"
											placeholder="번호를 입력해주세요">
											<div class="seller_alert">'-'와 공백을 제외하고 입력해주세요. (예:
												1231212345)</div></td>
									</tr>

									<tr>
										<td class="basic">사업자 주소</td>
										<td><input class="input_con" type="text" name="prod_sell_address"
											placeholder="주소를 입력해주세요"></td>
									</tr>

									<tr>
										<td class="basic" >사업자 계좌번호</td>
										<td><select name="prod_sell_bank">
												<option>은행 선택</option>
												<option>국민은행</option>
												<option>신한은행</option>
												<option>우리은행</option>
												<option>하나은행</option>
												<option>기업은행</option>
												<option>농협</option>
												<option>카카오뱅크</option>
										</select>
											<div class="account_input">
												<input class="input_con" type="text" name="prod_sell_account"
													placeholder="계좌번호를 입력해주세요">
											</div>
											<div class="seller_alert">'-'와 공백을 제외하고 입력해주세요. (예:
												1234567890123)</div></td>
									</tr>
									<input type="hidden" name="prod_type" value="1">
									<input type="hidden" name="user_no" value="${authUser.user_no}">
								</tbody>
							</table>

							<div class="seller_regi_btn_site">
								<button class="seller_regi_btn" type="submit" >판매자 등록</button>
							</div>
						</form>
						<!--입력폼-->
						<div id="space"></div>
					</div>
					<!--//content_seller_regi-->
				</div>
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