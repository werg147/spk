<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>배송관리</title>
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
						<div id="name">배송관리</div>
						<div class="content_delevery_product_select_box">
							<select>
								<option selected>배송상태</option>
								<option>결제완료</option>
								<option>배송중</option>
								<option>배송완료</option>
							</select>
						</div>
					</div>
					<!--//content_product_header//-->

					<div class="content_delevery_product_line"></div>
					<div class="content_delevery_product_list">
						<div class="delevery_list">
							<div class="product_name">[에버레스트] 글러브</div>
							<div class="list_line"></div>
							<div class="delevery_product_content">
								<div>
									<img
										src="${pageContext.request.contextPath }/assets/image/글러브.jpg">
								</div>
								<div class="table_box">
									<table class="delevery_insert_table">
										<colgroup>
											<col style="width: 150px">
											<col style="width: 280px">
										</colgroup>
										<tr>
											<td>주문번호</td>
											<td>15678654</td>
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
										<tr>
											<td>배송중</td>
											<td>결제완료</td>
										</tr>
									</table>
									<div class="delevery_product_content_btn">
										<button class="product_delinfo_btn">
											<a href="./배송판매자_마이페이지_배송관리_배송정보입력.html">배송정보등록</a>
										</button>
										<button class="product_nosale_btn">판매불가</button>
									</div>
								</div>
								<!--//table_box-->
							</div>
							<!--//delevery_product_content-->
						</div>
						<!--//list//-->
						<!--list 배치확인용 중복중복중복중복-->
						<div class="delevery_list">
							<div class="product_name">[아디다스] 복싱복</div>
							<div class="list_line"></div>
							<div class="delevery_product_content">
								<div>
									<img
										src="${pageContext.request.contextPath }/assets/image/복싱복.jpg">
								</div>
								<div class="table_box">
									<table class="delevery_insert_table">
										<colgroup>
											<col style="width: 150px">
											<col style="width: 280px">
										</colgroup>
										<tr>
											<td>주문번호</td>
											<td>15678654</td>
										</tr>
										<tr>
											<td>상품품번</td>
											<td>cl12456874</td>
										</tr>
										<tr>
											<td>색상|사이즈|개수</td>
											<td>블루95(M) | 2</td>
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
										<tr>
											<td>배송상태</td>
											<td>결제완료</td>
										</tr>
									</table>
									<div class="delevery_product_content_btn">
										<button class="product_delinfo_btn">
											<a href="./배송판매자_마이페이지_배송관리_배송정보입력.html">배송정보등록</a>
										</button>
										<button class="product_nosale_btn">판매불가</button>
									</div>
								</div>
								<!--//table_box-->
							</div>
							<!--//delevery_product_content-->
						</div>
						<!--//ldelevery_list//여기까지 중복중복중복중복-->
					</div>
					<!--//content_delevery_product_list-->
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