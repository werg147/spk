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

				<div class="content_mypage">

					<div class="content_matchingInfo_header">
						<div>매칭프로필관리</div>
					</div>
					<!--//content_matchingInfo_header//-->

					<div class="line"></div>
					<!-- //line -->

					<div class="content_bottom">

						<!-- 입력폼 → 매칭프로필저장 -->
						<form>

							<table class="insert_matcingInfo">
								<colgroup>
									<col style="width: 100px">
									<col style="width: 100px">
									<col style="width: 600px">
								</colgroup>

								<tr class="basic">
									<td colspan="2"><label for="prod_cate">주특기</label></td>
									<td>
										<div class="chk_box">
											<input type='checkbox' id="pro_chk" name='pro' value='pro' />복싱 <input type='checkbox' id="pro_chk" name='ama' value='ama' />킥복싱 <input type='checkbox' id="pro_chk" name='pro' value='pro' />종합격투기
											<input type='checkbox' id="pro_chk" name='ama' value='ama' />주짓수
										</div>
									</td>
								</tr>
								<!-- //주특기 -->

								<tr class="basic">
									<td colspan="2"><label for="prod_name">신장</label></td>
									<td><input type="text" id="prod_name" placeholder="신장을 입력해주세요."></td>
								</tr>
								<!-- //신장 -->

								<tr class="basic">
									<td colspan="2"><label for="prod_price">체중</label></td>
									<td><input type="text" id="prod_price" placeholder="체중을 입력해주세요."></td>
								</tr>
								<!-- //체중 -->

								<tr class="basic">
									<td colspan="2"><label for="brand_name">경력</label></td>
									<td>
										<div class="chk_box">
											<input type='radio' id="pro_chk" name='chk_carrer' value='pro' />프로 <input type='radio' id="pro_chk" name='chk_carrer' value='ama' />아마추어
										</div>
									</td>
								</tr>
								<!-- //경력 -->

								<tr class="basic">
									<td colspan="2"><label for="brand_name">전공</label></td>
									<td>
										<div class="chk_box">
											<input type='radio' id="pro_chk" name='chk_major' value='pro' />무 <input type='radio' id="pro_chk" name='chk_major' value='ama' />유 <input type="text" id="prod_price"
												placeholder="전공을 입력해주세요.">
										</div>
									</td>
								</tr>
								<!-- //전공 -->

								<tr class="basic">
									<td colspan="2"><label for="exer_cate">최근운동</label></td>
									<td>
										<div class="content_product_insert_select_box">
											<select id="exer_cate">
												<option selected>최근운동</option>
												<option>주 5회 이상</option>
												<option>주 3회 이상 5회 미만</option>
												<option>주 1회 이상 3회 미만</option>
											</select>
										</div>
									</td>
								</tr>
								<!-- //최근운동 -->

								<tr class="basic">
									<td><label for="prod_cate">공식기록</label></td>
									<td><label for="prod_cate">대회분류</label></td>
									<td>
										<div class="content_product_insert_select_box">
											<select id="exer_cate">
												<option selected>대회분류</option>
												<option>지역</option>
												<option>전국</option>
												<option>세계</option>
											</select>
										</div>
									</td>
								</tr>
								<!-- //공식기록 - 대회분류 -->

								<tr class="basic">
									<td><label for="prod_cate"></label></td>
									<td><label for="prod_cate">대회명</label></td>
									<td>
										<div class="content_product_insert_select_box">
											<input type="text" id="prod_price" placeholder="대회명을 입력해주세요.">
										</div>
									</td>
								</tr>
								<!-- //공식기록 - 대회분류 -->

								<tr class="basic">
									<td><label for="prod_cate"></label></td>
									<td><label for="prod_cate">종목</label></td>
									<td>
										<div class="content_product_insert_select_box">
											<select id="prod_cate">
												<option selected>종목</option>
												<option>복싱</option>
												<option>킥복싱</option>
												<option>종합격투기</option>
												<option>주짓수</option>
											</select>
										</div>
									</td>
								</tr>
								<!-- //공식기록 - 종목 -->

								<tr class="basic">
									<td><label for="prod_cate"></label></td>
									<td><label for="prod_cate">출전연도</label></td>
									<td>
										<div class="content_product_insert_select_box">
											<select id="prod_cate">
												<option selected>출전연도</option>
												<option>2021</option>
												<option>2020</option>
												<option>2019</option>
											</select>
										</div>
									</td>
								</tr>
								<!-- //공식기록 - 출전연도 -->

								<tr class="basic">
									<td><label for="prod_cate"></label></td>
									<td><label for="prod_cate">매치</label></td>
									<td>
										<div class="content_product_insert_select_box">
											<select id="prod_cate">
												<option selected>매치</option>
												<option>일반매치</option>
												<option>타이틀매치</option>

											</select>
										</div>
									</td>
								</tr>
								<!-- //공식기록 - 매치 -->

							</table>
							<!-- //insert_matcingInfo -->

							<div class="official_button">
								<button class="official_button_plus" type="button">추가하기</button>
							</div>
							<!-- //공식기록 추가 -->


							<div class="product_insert_btn">
								<button class="insert_btn">저장</button>
								<button class="product_delclose_btn">취소</button>
							</div>
							<!-- //product_insert_btn -->

						</form>
						<!-- //입력폼 → 주문하기 -->

					</div>
					<!-- //content_bottom -->

				</div>
				<!--//content_mypage-->

			</div>
			<!--//middle//-->

			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->

		</div>
		<!-- //container -->

	</div>
	<!-- //wrap -->

</body>

</html>