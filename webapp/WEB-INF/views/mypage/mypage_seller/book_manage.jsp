<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사업자 계정</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>

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
					<div class="content_booking_header_fx">
						<div>예약판매 계정관리</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>

					<div class="content_seller_regi">
						<div class="seller_regi_title">사업자 정보</div>
						<br>

						<!--입력폼 (추후 form 추가)-->
						<form id="addForm" action="${pageContext.request.contextPath}/mypage/book/booksellermodify" method="get">
						<input type="hidden" name="sell_no" value="${authUser.sell_no}">
							<table class="seller_regi_form">
								<tbody>

									<tr>
										<td class="basic">사업자 이름</td>
										<td><input class="input_con" type="text"
											name="book_sell_name" placeholder="이름을 입력해주세요"value="${sellervo.book_sell_name}"></td>
									</tr>
									<tr>
										<td class="basic">사업체 이름</td>
										<td><input class="input_con" type="text"
											name="book_com_name" placeholder="회사명을 입력해주세요"value="${sellervo.book_com_name}"></td>
									</tr>
									<tr>
										<td class="basic">사업자 번호</td>
										<td><input class="input_con" type="text" name="book_business_no"
											placeholder="번호를 입력해주세요"value="${sellervo.book_business_no}">
											<div class="seller_alert">'-'와 공백을 제외하고 입력해주세요. (예:
												1231212345)</div></td>
									</tr>

									<tr>
										<td class="basic">사업자 주소</td>
										<td><input class="input_con" type="text" name="book_sell_address"
											placeholder="주소를 입력해주세요"value="${sellervo.book_sell_address}"></td>
									</tr>

									<tr>
										<td class="basic" >사업자 계좌번호</td>
										<td><select name="book_sell_bank">
												<option disabled>은행 선택</option>
												<option value="국민은행" ${sellervo.book_sell_bank == '국민은행' ? 'selected="selected"' : ''}>국민은행</option>
												<option value="신한은행" ${sellervo.book_sell_bank == '신한은행' ? 'selected="selected"' : ''}>신한은행</option>
												<option value="우리은행" ${sellervo.book_sell_bank == '우리은행' ? 'selected="selected"' : ''}>우리은행</option>
												<option value="하나은행" ${sellervo.book_sell_bank == '하나은행' ? 'selected="selected"' : ''}>하나은행</option>
												<option value="기업은행" ${sellervo.book_sell_bank == '기업은행' ? 'selected="selected"' : ''}>기업은행</option>
												<option value="농협" ${sellervo.book_sell_bank == '농협' ? 'selected="selected"' : ''}>농협</option>
												<option value="카카오뱅크" ${sellervo.book_sell_bank == '카카오뱅크' ? 'selected="selected"' : ''}>카카오뱅크</option>
										</select>
											<div class="account_input">
												<input class="input_con" type="text" name="book_sell_account"
													placeholder="계좌번호를 입력해주세요"value="${sellervo.book_sell_account}">
											</div>
											<div class="seller_alert">'-'와 공백을 제외하고 입력해주세요. (예:
												1234567890123)</div></td>
									</tr>
									<input type="hidden" name="book_type" value="1">
									<input type="hidden" name="user_no" value="${authUser.user_no}">
								</tbody>
							</table>


							<div class="seller_regi_btn_site">
								<button  class="seller_regi_btn" type="submit">사업자 정보 수정</button>
							</div>
						</form>
						<!--입력폼-->
						<div id="space"></div>
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

<script type="text/javascript">


	$("#addForm").on("submit", function() {
	
		var name = $("[name='book_sell_name']").val();

		var comName = $("[name='book_com_name']").val();

		var no = $("[name='book_business_no']").val();
		
		var address = $("[name='book_sell_address']").val();
		
		var bank = $("[name='book_sell_bank']").val();
		
		var acc = $("[name='book_sell_account']").val();
		

		var formArr = new Array(name, comName, no, address, bank, acc);
		
		for(var i=0; i<formArr.length; i++){
			if(!formArr[i]){
				alert("모든 정보를 입력해 주세요");
				return false;
			};
		}
		
		return true;
		
	});
</script>
</html>