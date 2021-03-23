<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/delivery.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
</head>
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
					<div class="content_product_header">
						<div>상품관리</div>
						<button class="product_registration_btn">
							<a href="${pageContext.request.contextPath}/mypage/prod/form">상품등록</a>
						</button>
						<div class="content_product_select_box">
							<select>
								<option selected>최근등록순</option>
								<option>판매개수</option>
								<option>가격</option>
								<option>카테고리-의류</option>
								<option>카테고리-잡화</option>
								<option>카테고리-운동용품</option>
							</select>
						</div>
					</div>
					<!--//content_product_header//-->

					<div class="content_product_line"></div>
					<div class="content_product_list">
					
					<c:forEach items="${prodList}" var="prodvo">
					
						<div class="list">
							<div class="product_name">[${prodvo.prod_brand}] ${prodvo.prod_name}</div>
							<div class="list_line"></div>
							<div class="product_content">
								<div>
									<img src="${pageContext.request.contextPath}/upload/${prodvo.prod_img_savename}">
								</div>
								<div class="table_box">
									<table class="delevery_insert_table">
										<colgroup>
											<col style="width: 150px">
											<col style="width: 480px">
										</colgroup>
										<tr>
											<td>카테고리</td>
											<td>${prodvo.event_cate}</td>
										</tr>
										<tr>
											<td>상품품번</td>
											<td>${prodvo.prod_no}</td>
										</tr>
										<tr>
											<td>색상 | 사이즈 | 재고</td>
											<td>
												<div>
													<c:forEach items="${prodvo.cssList}" var="cssvo">
														<div>${cssvo.color} | ${cssvo.prod_size} | ${cssvo.stock}</div>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td>가격</td>
											<td>${prodvo.prod_price}원</td>
										</tr>
										<tr>
											<td>등록일자</td>
											<td>${prodvo.prod_date}</td>
										</tr>
									</table>
									<div class="product_content_btn">
										<button class="product_modify_btn">
											<a href="${pageContext.request.contextPath}/mypage/prod/prodmodify?prod_no=${prodvo.prod_no}">수정하기</a>
										</button>
										<button class="product_delete_btn">삭제하기</button>
									</div>
								</div>
								<!--//table_box-->
							</div>
							<!-- //product_content -->
						</div>
						<!--//list//-->
						</c:forEach>
						<!-- 여기까지 반복 -->
						
					</div>
					<!-- //content_product_list -->
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