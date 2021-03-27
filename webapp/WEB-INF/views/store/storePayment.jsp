<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style_1.css">
<script src="https://kit.fontawesome.com/5a9452f10d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<title>Document</title>
</head>

<body>
	<!-- Header -->

	<div class="wrap">
		<div class="container">
				<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
		</div>
	</div>
	<!-- Header end -->

	<!-- wrap -->
	<div class="wrap">
		<div class="container">
		
				<form name="proform" method="get" class="sf_form form_20">
				
					<div class="sm">
						<h1 class="sm_title">주문서</h1>
					</div>
					<!-- 결제하기 -->
					<div class="paykind_title2">장바구니</div>
					<div class="payment_line2"></div>
	
	
					<section class="sf_section">
							<div id="cartItemList" class="only_pc">
	
								<div>
									<div class="cart_item_1">
										<div class="cart_select">
											<div class="inner_select">
												<label class="check"> <input type="checkbox"
													name="" checked> <span class="ico"></span>
													전체선택
												</label> <a href="" class="btn_delete"> 선택삭제 </a>
											</div>
										</div>
										<!-- 아이템 1개 -->
										
										<c:forEach items="${pmap.payList}" var="payVo">
											<div class="box room payitem${payVo.cart_no}">
												<ul class="list">
													<li>
														<div class="item_13">
															<label class="check" for=""> <input type="checkbox"
																id="" name="" data-item-id="" data-item-no=""
																data-item-parent-no="" checked> <span class="ico"></span>
															</label>
		
															<div class="name">
																<div class="inner_name">
																	<a
																		href="${pageContext.request.contextPath }/store/read?prodNo=${payVo.prod_no}" class="package">
																		<p>[${payVo.prod_brand}]${payVo.prod_name}</p>
																		
																	</a>
																	<div class="info"></div>
																</div>
															</div>
		
															<div class="goods">
																<a
																	href="${pageContext.request.contextPath }/store/read?prodNo=${payVo.prod_no}"
																	class="thumb"
																	style="background-image: url(${pageContext.request.contextPath }/upload/${payVo.prod_img_savename };">상품이미지
		
																</a>
																<div class="price">
																	<div class="in_price">
																		<!-- 상품가격 -->
																		<span class="selling"><fmt:formatNumber
																				type="number" maxFractionDigits="3"
																				value="${payVo.prod_price * payVo.count}" /> <span
																			class="won">원</span>
																		</span>
		
																		<!-- 수량 -->
																		<span class="cost2"> 총 <fmt:formatNumber
																				type="number" maxFractionDigits="3"
																				value="${payVo.count}" /> <span
																			class="won">개</span>
																		</span>
		
																		<p class="noti"></p>
																	</div>
		
																</div>
															</div>
															
																<button type="button" class="btn_delete" data-cartno="${payVo.cart_no}"
																	data-userno="${pmap.userVo.user_no}">상품삭제</button>
															
														</div>
													</li>
												</ul>
											</div>
										</c:forEach>
										<!-- 아이템 1개 END -->
	
	
	
									</div>
								</div>
	
							</div>
	
	
						
						<div class="sf_modal">
								<div class="sf_address">
									<h3 class="sf_address_item1">
										<i class="modal_icon fas fa-map-marker-alt"></i>배송지
									</h3>
									<div class="sf_address_item2">
										<p class="sf_address_item2_text">${pmap.userVo.address}</p>
										<a href="" class="sf_address_item2_fix">배송지 변경</a>
									</div>
								</div>
							
							<div>
								<div class="sf_box1">
									<div class="sf_price">
										<div class="sf_amount">
											<dt class="sf_tit">상품금액</dt>
											<dd class="price_sf" id="total">
												<span class="num">
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${pmap.total}" />
												</span> 
												<span class="won">원</span>
											</dd>
										</div>								
										<div class="sf_amount">
											<dt class="sf_tit">배송비</dt>
											<dd class="price_sf">
												<span class="num">무료배송</span>
											</dd>
										</div>
	
	
									</div>
	
									<div class="sf_amount_lst">
										<dt class="sf_tit sf_tit_lst">결제금액</dt>
										<dd class="price_sf price_sf_lst" id="total2">
											<span class="num">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${pmap.total}" />
											</span> 
											<span class="won">원</span>
										</dd>
									</div>
								</div>
							</div>
						</div>
					</section>
					<div class="paykind-section">
						<div class="paykind_title">결제방식</div>
					</div>
					
					<section class="paykind">
							<table class="paykind_table">
								<tr>
									<th>카드결제</th>
									<td class="table_card"><input id="" class="table_pay-radio0"
										type="radio" name="b_buy_paytype" value="card">
										<div class="table_pay-radio_select">
											<select name="" id="">
												<option >카드선택</option>
												<option value="shinhan">신한카드</option>
												<option value="woori">우리카드</option>
												<option value="Corporate">기업카드</option>
											</select>
										</div></td>
								</tr>
								<tr>
									<th>토스결제</th>
									<td><input class="table_pay-radio" type="radio" name="b_buy_paytype"
										value="toss"> <img
										src="${pageContext.request.contextPath }/upd/toss.png" alt="">
									</td>
								</tr>
								<tr>
									<th>카카오페이</th>
									<td><input class="table_pay-radio" type="radio" name="b_buy_paytype"
										value="kakao"> kakao</td>
								</tr>
								<tr>
									<th>휴대폰결제</th>
									<td><input class="table_pay-radio" type="radio" name="b_buy_paytype"
										value="phone"> 휴대폰</td>
		
								</tr>
								<tr></tr>
							</table>
							
							
							<div class="btn_payment">
								<button type="button" class="btn_form btn_buy" onclick="btn_click('buy');">결제하기</button>
								<button type="button" class="btn_form btn_cancel" onclick="btn_click('cancel');">취소하기</button>
							</div>
						
					</section>
			</form>
			
		</div>

				
			

		
	</div>
	<!-- payment end -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<!--//footer//-->
	</div>
	<!-- container end-->
	</div>
	<!-- wrap end -->
</body>
<script type="text/javascript">

	$(".btn_delete").on("click", function(){
		console.log("삭제버튼 클릭");
		
		var cartno = $(this).data("cartno");
		var userno = $(this).data("userno");
		console.log(cartno);
		console.log(userno);
		
		//데이터 보내서 삭제
		$.ajax({
			url : "${pageContext.request.contextPath}/store/payform/remove",
			type : "post",
			// contentType : "application/json",
			data : {
				cartno : cartno,
				userno : userno
			},
			dataType : "json",
			success : function(total) {
				console.log(total);

				$(".payitem" + cartno).html(" ");

				price(total);

			},

			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}

		});
	
	});
	
	//삭제하면 가격변동 -> '원' 사라짐..
	function price(total){
		console.log(total);
		
		var str01 = '<span class="num">'
			+ total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			+ '</span> <span class="won"></span> <span class="won">원</span>';
		$("#total").html(" ");
		$("#total").append(str01);
	
		var str02 = '<span class="num">'
			+ total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			+ '</span> <span class="won"></span> <span class="won">원</span>';
		$('#total2').html(" ");
		$('#total2').append(str02);
	}
	
	
	//form submit 두개
	function btn_click(str){
		if(str == "buy"){
			document.proform.action='${pageContext.request.contextPath}/store/pay'
		} else if(str == "cancel"){
			document.proform.action='${pageContext.request.contextPath}/store/payform'
		}
		
		document.proform.submit();
	}
	
	


</script>


</html>
