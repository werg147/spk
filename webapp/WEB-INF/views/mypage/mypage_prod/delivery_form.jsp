<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>배송정보입력</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/delivery.css">
</head>
<body>

	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
			<div class="middle">
				<c:import url="/WEB-INF/views/include/sidemenu.jsp"></c:import>
				<!--//sidemenu//-->
				<div class="content_product">
					<div class="content_delevery_product_header">
						<div id="name">배송정보등록</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_delevery_num">주문번호 135648654123</div>
					<div class="content_delevery_num_line"></div>
					<div class="delivery_info">
						<div class="deleverymanage_list">
							<div class="delevery_product_content">
								<div class="delevery_product_content_img">
									<img
										src="${pageContext.request.contextPath}/assets/image/글러브.jpg">
								</div>
								<div class="deleverymanage_list1">
									<table class="delevery_product_detail_title">
										<colgroup>
											<col style="width: 200px">
											<col style="width: 600px">
										</colgroup>
										<tr>
											<td>상품명</td>
											<td>[에버레스트] 글러브</td>
										</tr>
										<tr>
											<td>상품품번</td>
											<td>gl12456874</td>
										</tr>
										<tr>
											<td>색상|사이즈|개수</td>
											<td>블랙 | 2</td>
										</tr>
										<tr>
											<td>카테고리</td>
											<td>운동용품</td>
										</tr>
										<tr>
											<td>가격</td>
											<td>38,000원</td>
										</tr>
										<tr>
											<td>판매일자</td>
											<td>2020/03/01</td>
										</tr>
									</table>
								</div>
								<!--//deleverymanage_list1-->
							</div>
							<!--//delevery_product_content-->
							<div class="delevery_product_content">
								<div class="delevery_product_content_img">
									<img
										src="${pageContext.request.contextPath }/assets/image/복싱복.jpg">
								</div>
								<div class="deleverymanage_list1">
									<table class="delevery_product_detail_title">
										<colgroup>
											<col style="width: 200px">
											<col style="width: 600px">
										</colgroup>
										<tr>
											<td>상품명</td>
											<td>[아디다스] 복싱복</td>
										</tr>
										<tr>
											<td>상품품번</td>
											<td>cl12456874</td>
										</tr>
										<tr>
											<td>색상|사이즈|개수</td>
											<td>블루 | 95(M) | 2</td>
										</tr>
										<tr>
											<td>카테고리</td>
											<td>의류</td>
										</tr>
										<tr>
											<td>가격</td>
											<td>60,000원</td>
										</tr>
										<tr>
											<td>판매일자</td>
											<td>2020/03/01</td>
										</tr>
									</table>
								</div>
								<!--//deleverymanage_list1-->
							</div>
							<!--//delevery_product_content-->
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
							<div class="head">배송정보입력</div>
							<div class="content_delevery_num_line"></div>
							<table class="delivery_info_table">
								<colgroup>
									<col style="width: 200px">
									<col style="width: 600px">
								</colgroup>
								<tr>
									<td><label for="postoff">택배사</label></td>
									<td class="content_delevery_num_select_box"><select
										id="postoff">
											<option selected>택배사선택</option>
											<option>CJ대한통운</option>
											<option>우체국택배</option>
											<option>한진택배</option>
											<option>롯데택배</option>
											<option>경동택배</option>
											<option>일양로지스</option>
									</select></td>
								</tr>
								<tr>
									<td><label for="deliv_num">운송장번호</label></td>
									<td><input type="text" id="deliv_num"></td>
								</tr>
							</table>
							<div class="delevery_btn">
								<button class="product_delready_btn">
									<a href="./배송판매자_마이페이지_배송관리.html">배송준비</a>
								</button>
								<button class="product_delinfosave_btn">
									<a href="./배송판매자_마이페이지_배송관리.html">배송정보저장</a>
								</button>
								<button class="product_delclose_btn">
									<a href="./배송판매자_마이페이지_배송관리.html">배송목록으로</a>
								</button>
							</div>
						</div>
						<!--delivery_info_persondelevery_btnal-->
					</div>
					<!--//delivery_info-->
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