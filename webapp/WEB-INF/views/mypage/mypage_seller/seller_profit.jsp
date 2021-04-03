<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수익관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/delivery.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/booking.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/flatpickr/flatpickr.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/flatpickr/flatpickr.js"></script>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
			<div class="middle">
				<c:import url="/WEB-INF/views/include/sidemenu.jsp"></c:import>
				<!--//sidemenu//-->

				<div>
					<div class="header_explain">
						<div id="explain_head">수익관리</div>
						<div id="explain_body">
							<p>
								<strong>수익금은 월 1회 등록된 출금 계좌로 전월수익금이 자동 출금 처리됩니다.</strong>
								(영업일기준)<br> (출금계좌 정보는 마이페이지 >사업자계정 페이지에서 확인 및 수정 가능)
							</p>
						</div>
					</div>
					<div class="profit">
						<div id="profit_main">
							<p>
								이번달 출금 예정 수익금 <strong id="expect">000,000원</strong>
							</p>
						</div>
					</div>
					<form>
						<div class="duration_serach">
							<!--기간 필터-->
							<input type="hidden" name="type" value="${type}"> <input
								type="hidden" name="sell_no" value="${authUser.sell_no}">
							<div class="time_filter input-group date"
								data-provide="datepicker">
								<!-- <input type="text" placeholder="기간필터"> -->
								<!-- 시작시 기본 날짜 설정은 value를 이용 -->
								<input type="text" name="peri_start"
									class="selector flatpickr flatpickr-input" placeholder="기간설정">
								&nbsp~&nbsp
								<!-- <input type="text" id="datePicker" class="form-control" value="2021-04-01"> -->
								<input type="text" name="peri_end"
									class="selector flatpickr flatpickr-input " placeholder="기간설정">
								<button id="test" name="" type="button"
									class="profit_search_btn">조회하기</button>
							</div>
						</div>
					</form>
					<table id="profit_table">
						<colgroup>
							<col style="width: 400px">
							<col style="width: 400px">
						</colgroup>
						<tr>
							<td>기간내 누적 수익금</td>
							<td id="total">0원</td>
						</tr>
						<tr>
							<td>출금 완료 수익금</td>
							<td id="complete">0원</td>
						</tr>
						<tr>
							<td>출금 가능 수익금</td>
							<td id="possible">0원</td>
						</tr>
					</table>
					<div id="space"></div>
				</div>
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
	$(".selector").flatpickr({
		dateFormat : "Y-m-d",
		maxDate : "today",
		disable : [ "today" ]
	});

	$("#test").on("click", function() {
		event.preventDefault();

		var peri_start = $("[name='peri_start']").val();
		var peri_end = $("[name='peri_end']").val();
		var type = $("[name='type']").val();
		var sell_no = $("[name='sell_no']").val();

		if (peri_start == null || peri_start == "") {
			alert("시작일자를 입력해주세요.");
			return false;
		}

		if (peri_end == null || peri_end == "") {
			alert("마지막일자를 입력해주세요.");
			return false;
		}

		console.log("조회시작일: " + peri_start);
		console.log("조회마지막일: " + peri_end);

		var formData = new FormData();

		formData.append("peri_start", peri_start);
		formData.append("peri_end", peri_end);
		formData.append("type", type);
		formData.append("sell_no", sell_no);

		$.ajax({
			url : '${pageContext.request.contextPath}/user/profitsearch',
			data : formData,
			contentType : false,
			processData : false,
			type : 'post',
			success : function(profit) {

				console.log(profit);

				if (profit != null) {
					alert("성공");

					var total = profit.total;
					var complete = profit.complete;
					var possible = profit.possible;
					var expect = profit.expect;
					var type = profit.type;

					console.log("profit.type" + type);

					$("#total").html(total.toLocaleString() + "원");
					$("#complete").html(complete.toLocaleString() + "원");
					$("#possible").html(possible.toLocaleString() + "원");
					$("#expect").html(expect.toLocaleString() + "원");

				} else {
					alert("실패");
					location.reload();
				}
			}

		});

	});
</script>
</html>