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
					
					
					<c:forEach items="${delList}" var="delvo">
						<div class="delevery_list">
							<div class="product_name">[${delvo.prod_brand}] ${delvo.prod_name}</div>
							<div class="list_line"></div>
							<div class="delevery_product_content">
								<div>
									<img
										src="${pageContext.request.contextPath}/upload/${delvo.prod_img_savename}">
								</div>
								<div class="table_box">
									<table class="delevery_insert_table">
										<colgroup>
											<col style="width: 150px">
											<col style="width: 280px">
										</colgroup>
										<tr>
											<td>주문번호</td>
											<td>${delvo.buy_no}</td>
										</tr>
										<tr>
											<td>상품품번</td>
											<td>${delvo.prod_no}</td>
										</tr>
										<tr>
											<td>색상 | 사이즈 | 개수</td>
											<td id="sizeboxadd"><div>${delvo.color} | ${delvo.prod_size} | ${delvo.count}</div></td>
										</tr>
										<tr>
											<td>카테고리</td>
											<td>${delvo.prod_cate}</td>
										</tr>
										<tr>
											<td>가격</td>
											<td>${delvo.buyprod_price}원</td>
										</tr>
										<tr>
											<td>판매일자</td>
											<td>${delvo.buy_date}</td>
										</tr>
										<tr>
											<td>배송상태</td>
											<td>${delvo.buy_del_state}</td>
										</tr>
									</table>
									<div class="delevery_product_content_btn">
										<button class="product_delinfo_btn">
											<a href="${pageContext.request.contextPath}/mypage/prod/delform?buy_no=${delvo.buy_no}&sell_no=${delvo.sell_no}">배송정보등록</a>
										</button>
										<button class="product_nosale_btn">
											<a href="${pageContext.request.contextPath}/mypage/prod/delno?buyprod_no=${delvo.buyprod_no}&buy_del_state=${delvo.buy_del_state}">판매불가</a>
										</button>
									</div>
								</div>
								<!--//table_box-->
							</div>
							<!--//delevery_product_content-->
						</div>
						<!--//list//-->
					</c:forEach>
						

					</div>
					<!--//content_delevery_product_list-->
					<div id="space"></div>
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