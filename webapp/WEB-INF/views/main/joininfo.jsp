<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>알림</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/mypage_buy.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
</head>

<body>

	<div class="wrap">

		<div class="container">

			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header-->

			<div class="middle" id="joinmiddle">

				<div class="content_mypage">

					<div class="content_info_update_header">
						<div>회원정보입력</div>
					</div>
					<!--//content_matchingInfo_header//-->

					<div class="line"></div>
					<!-- //line -->

					<div class="content_bottom">
						<form>
							<div class="info_table">
								<table class="">
									<colgroup>
										<col style="width: 200px">
										<col style="width: 600px">
									</colgroup>
									<tr>
										<td id="info_imgbox"><img
											src="${pageContext.request.contextPath}/assets/image/마이페이지 남성_글러브.png"></td>
										<td>
											<div class="add_div_box">
												<div>
													닉네임 <input type="text" id="nickname" name="nickname"
														placeholder="닉네임을 입력해주세요.">
												</div>
												<div>
													아이디 <input type="text" id="user_id" name="user_id"
														placeholder="아이디를 입력해주세요.">
												</div>
												<div>
													프로필 사진 넣기 <input type="file" name="user_photo"
														id="user_photo">
												</div>
											</div>
										</td>
									</tr>
									<tr id="hp">
										<td id="hp_title"><label for="hp">전화번호</label></td>
										<td id="hp_content">
											<div id="add_hp">
												<div id="hp_content1">
													<input type="text" id="user_ph" placeholder="전화번호" inputmode="ph">
												</div>
											</div>
										</td>
									</tr>
									<tr id="address">
										<td id="address_title"><label for="address">주소</label></td>
										<td id="address_content">
											<div id="add_search">
												<div id="address_content1">
													<input type="text" id="address" placeholder="주소">
												</div>
												<button id="search_btn">검색하기</button>
											</div>
											<div id="address_content2">
												<input type="text" id="address" placeholder="상세주소">
											</div>
										</td>
									</tr>
								</table>
							</div>
							<!--match_table-->
							<div class="info_update_btn">
								<button class="insert_btn" type="submit">저장</button>
								<a href="${pageContext.request.contextPath}"><button class="delclose_btn">취소</button></a>
							</div>
						</form>
					</div>
					<!--//content_bottom-->

				</div>
				<!--//content_mypage-->

			</div>
			<!--//middle-->

			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->

		</div>
		<!--//container-->

	</div>
	<!--wrap-->

</body>

<script type="text/javascript">
	
$(document).on('keyup', 'input[inputmode=ph]', function(event) {
	this.value = this.value.replace(/[^0-9]/g, ''); // 입력값이 숫자가 아니면 공백
	this.value = this.value.replace(/-/g, ''); // ,값 공백처리
	this.value = this.value.replace(/\B(?=(\d{4})+(?!\d))/g, "-"); // 정규식을 이용해서 3자리 마다 , 추가 	
});
	
	$(".insert_btn").on("click", function() {
		var nickname = $("[name='nickname']").val();
		if (nickname == null || nickname == "") {
			alert("닉네임을 입력해주세요.");
			return false;
		}
		var user_id = $("[name='user_id']").val();
		if (user_id == null || user_id == "") {
			alert("아이디를 입력해주세요.");
			return false;
		}

		function removeComma(str) {
			n = parseInt(str.replace(/-/g, ""));
			return n;
		}
		var ph = $("[name='user_ph']").val();
		var user_ph = removeComma(ph);
		if (user_ph == null || user_ph == "") {
			alert("전화번호를 입력해주세요.");
			return false;
		}
		function removeComma(str) {
			n = parseInt(str.replace(/,/g, ""));
			return n;
		}
		var address = $("[name='address']").val();
		if (address == null || address == "") {
			alert("주소를 입력해주세요.");
			return false;
		}

		
	});
</script>

</html>