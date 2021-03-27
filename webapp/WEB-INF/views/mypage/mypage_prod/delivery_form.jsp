<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
</head>
<body>

	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
			<div class="middle">
				<c:import url="/WEB-INF/views/include/sidemenu.jsp"></c:import>
				<!--//sidemenu//-->
				<form
					action="${pageContext.request.contextPath}/mypage/prod/delmodify"
					method="post">
					<div class="content_product">
						<div class="content_delevery_product_header">
							<div id="name">배송정보등록</div>
						</div>
						<!--//content_delevery_product_header//-->
						<div class="content_delevery_num">주문번호 ${delfound.buy_no}</div>
						<div class="content_delevery_num_line"></div>
						<div class="delivery_info">
							<div class="deleverymanage_list">
								<c:forEach items="${delList}" var="delvo">
									<div class="delevery_product_content">
										<div class="delevery_product_content_img">
											<img
												src="${pageContext.request.contextPath}/upload/${delvo.prod_img_savename}">
										</div>
										<div class="deleverymanage_list1">
											<table class="delevery_product_detail_title">
												<colgroup>
													<col style="width: 200px">
													<col style="width: 600px">
												</colgroup>
												<tr>
													<td>상품명</td>
													<td>[${delvo.prod_brand}] ${delvo.prod_name}</td>
												</tr>
												<tr>
													<td>상품품번</td>
													<td>${delvo.prod_no}<input type="hidden"
														name="buyprod_no" value="${delvo.buyprod_no}">
													</td>
												</tr>
												<tr>
													<td>색상 | 사이즈 | 개수</td>
													<td>${delvo.color}|${delvo.prod_size} | ${delvo.count}</td>
												</tr>
												<tr>
													<td>카테고리</td>
													<td>${delvo.prod_cate}</td>
												</tr>
												<tr>
													<td>가격</td>
													<td><fmt:formatNumber value="${delvo.buyprod_price}"
															pattern="#,###" />원</td>
												</tr>
												<tr>
													<td>판매일자</td>
													<td>${delvo.buy_date}</td>
												</tr>
											</table>
										</div>
										<!--//deleverymanage_list1-->
									</div>
									<!--//delevery_product_content-->
								</c:forEach>

							</div>
							<!--//delevery_product_content-->
						</div>
						<!--//list//-->

						<c:choose>
							<c:when
								test="${delfound.buy_del_state == '결제완료' || delfound.buy_del_state == '배송준비중'}">
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
											<div>${delfound.buy_name}</div>
											<div>${delfound.buy_ph}</div>
											<div>${delfound.buy_address}</div>
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
												name="buy_delivery" id="select_delivery">
													<option>택배사선택</option>
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
											<td><input type="number" id="deliv_num" name="buy_del_no"
												value=""></td>
										</tr>
									</table>
									<div class="delevery_btn">
										<c:if test="${delfound.buy_del_state == '결제완료'}">
											<button class="product_delready_btn" type="button">
												<a
													href="${pageContext.request.contextPath}/mypage/prod/delstatechange?buyprod_no=${delfound.buyprod_no}">배송준비</a>
											</button>
										</c:if>
										<button class="product_delinfosave_btn" id="product_delinfosave_btn" type="submit">배송정보저장</button>
										<button class="product_delclose_btn" type="button">
											<a
												href="${pageContext.request.contextPath}/mypage/prod/delmanage">배송목록으로</a>
										</button>
									</div>
								</div>
								<!--delivery_info_persondelevery_btnal-->

							</c:when>
							<c:otherwise>
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
											<div>${delfound.buy_name}</div>
											<div>${delfound.buy_ph}</div>
											<div>${delfound.buy_address}</div>
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
											<td class="content_delevery_num_select_box">${delfound.buy_delivery}</td>
										</tr>
										<tr>
											<td><label for="deliv_num">운송장번호</label></td>
											<td>${delfound.buy_del_no}</td>
										</tr>
									</table>
									<div class="delevery_btn">
										<button class="product_delclose_btn" type="button">
											<a
												href="${pageContext.request.contextPath}/mypage/prod/delmanage">배송목록으로</a>
										</button>
									</div>
								</div>
								<!--delivery_info_persondelevery_btnal-->

							</c:otherwise>
						</c:choose>
					</div>
					<!--//delivery_info-->
				</form>
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

	<script type="text/javascript">
	
	$("#product_delinfosave_btn").on("submit", function(){
		
		const buy_delivery_element = document.querySelector('#select_delivery');
		const buy_delivery_value = buy_delivery_element.value;
		var buy_delivery = buy_delivery_value;
		var buy_del_no = $("#deliv_num").val();
		
		console.log("buy_delivery" + buy_delivery + "buy_del_no" + buy_del_no);
		
		if(buy_delivery=="택배사선택"){
			alert("택배사를 선택해주세요.");
			return false;
		}
		
		if(buy_del_no==null || buy_del_no==""){
			alert("운송장번호를 입력해주세요.");
			return false;
		}
		return true;
	})
	</script>
	
</html>