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
								이번달 출금 예정 수익금 <strong>000,000원</strong>
							</p>
						</div>
					</div>
					<div class="duration_serach">
						<p>조회기간</p>
						<div>
							<div>이번달</div>
							<div>지난달</div>
							<div>3개월</div>
							<div>6개월</div>
							<div>1년</div>
							<div>3년</div>
						</div>
					</div>
					<table id="profit_table">
						<tr>
							<td colspan="2">총 누적 수익금</td>
							<td>000,000원</td>
						</tr>
						<tr>
							<td colspan="2">출금 완료 수익금</td>
							<td>000,000원</td>
						</tr>
						<tr>
							<td rowspan="2">보유 수익금</td>
							<td>출금 가능 수익금</td>
							<td>0원</td>
						</tr>
						<tr>
							<td>출금 예정 수익금</td>
							<td>0원</td>
						</tr>
					</table>
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
</html>