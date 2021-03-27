<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<title>장바구니</title>
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

					<div class="alarm_header">장바구니</div>
					<!--//alarm_header//-->

					<div class="line"></div>
					<!-- //line -->

					<!-- 입력폼 → 주문하기 -->
					<form action="${pageContext.request.contextPath }/mypage/order" method="get">

						<div id="cartItemList" class="only_pc">

							<div>
								<div class="cart_item">

									<div class="cart_select">

										<div class="inner_select">
											<label class="check"> <input type="checkbox" name="checkAll" checked> <span class="ico"></span> 전체선택
											</label> <a href="" class="btn_delete"> 선택삭제 </a>
										</div>

									</div>
									<!-- //cart_select -->

									<!-- 반복리스트 -->
									<div id="cartList">
										<c:forEach items="${cartInfoVo.cList }" var="cList">
											<div class="box room Cartitem${cList.cart_no }">

												<ul class="list">

													<li>
														<div class="item">

															<label class="check" for=""> <input type="checkbox" id="" name="chkItem" data-item-id="" data-item-no="" data-item-parent-no="" checked> <span class="ico"></span>
															</label>
															<!-- //check -->

															<div class="name">
																<div class="inner_name">
																	<a href="" class="package">${cList.prod_name }, ${cList.prod_size }, ${cList.color }</a>
																	<div class="info"></div>
																</div>
															</div>
															<!-- //name -->

															<div class="goods">

																<a href="" class="thumb" style="background-image: url(${pageContext.request.contextPath}/assets/image/글러브.jpg);"> 상품이미지 </a>
																<!-- //thumb -->

																<div class="price">
																	<div class="in_price">
																		<span class="selling">${cList.prod_price } <span class="won">원</span>
																		</span> <span class="cart_count">${cList.count } <span class="won">EA</span>
																		</span>
																	</div>
																</div>
																<!-- //price -->

															</div>
															<!-- //goods -->

															<button type="button" class="btn_delete" data-no="${cList.cart_no }" data-userno=${cList.user_no }>상품삭제</button>
															<!-- //btn_delete -->

														</div> <!-- //item -->

													</li>

												</ul>

											</div>
										</c:forEach>
									</div>
									<!-- //box room -->
									<!-- //반복리스트 -->

								</div>
								<!-- //cart_item -->

								<div class="cart_result">
									<div class="inner_result">
										<div class="cart_delivery">
											<h3 class="tit">배송지</h3>
											<div class="address">
												<p class="addr">${cList.buy_address}</p>
												<a href="" class="btn_default">배송지 변경</a>
											</div>
										</div>

										<div class="amount_view">
											<dl class="amount">
												<dt class="tit">상품금액</dt>
												<dd class="price" id="priceTotal">
													<span class="num"> <fmt:formatNumber type="number" maxFractionDigits="3" value="${cartInfoVo.totalPrice}" /></span> <span class="won"></span> <span class="won">원</span>
												</dd>
											</dl>

											<dl class="amount">
												<dt class="tit">배송비</dt>
												<dd class="price">
													<span class="num">무료배송</span>
												</dd>
											</dl>

											<dl class="amount lst">
												<dt class="tit">결제금액</dt>
												<dd class="price" id="priceTotal2">
													<span class="num"><fmt:formatNumber type="number" maxFractionDigits="3" value="${cartInfoVo.totalPrice}" /></span> <span class="won"></span> <span class="won">원</span>
												</dd>
											</dl>

											<div class="btn_submit">
												<button type="submit" class="btn active">주문하기</button>
											</div>

										</div>

									</div>

								</div>

							</div>

						</div>
						<!-- //cartItemList -->

					</form>
					<!-- //입력폼 → 주문하기 -->

				</div>
				<!--//content-->

			</div>
			<!--//middle-->

			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->

		</div>
		<!--//container-->

	</div>
	<!--//wrap-->

</body>

<!-- 삭제버튼 클릭시 삭제 -->
<script type="text/javascript">
	console.log("콘솔")

	$(".btn_delete").on("click", function() {
		console.log("삭제버튼을 누르면..")

		var no = $(this).data("no");
		var userno = $(this).data("userno");

		console.log(no)

		$.ajax({
			url : "${pageContext.request.contextPath }/mypage/remove",
			type : "post",
			// contentType : "application/json",
			data : {
				no : no,
				userno : userno
			},
			dataType : "json",
			success : function(priceAll) {
				console.log(priceAll);

				$(".Cartitem" + no).html(" ");

				price(priceAll);

			},

			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}

		});

	})

	function price(priceAll) {
		console.log(priceAll)

		var str01 = '<span class="num">'+ priceAll+'</span> <span class="won"></span> <span class="won">원</span>';
		$("#priceTotal").html(" ");
		$("#priceTotal").append(str01);

		var str02 = '<span class="num">'
				+ priceAll
				+ '</span> <span class="won"></span> <span class="won">원</span>';
		$('#priceTotal2').html(" ");
		$('#priceTotal2').append(str02);
	}
</script>
<!-- //삭제버튼 클릭시 삭제 -->

</html>