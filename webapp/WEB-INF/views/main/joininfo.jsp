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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

					<div class="joinmiddleline"></div>
					<!-- //line -->

					<div class="content_bottom">
						<form>
							<div class="info_table">
								<table class="join">
									<colgroup>
										<col style="width: 300px">
										<col style="width: 100px">
										<col style="width: 600px">
									</colgroup>
									<tr class="infotite">
										<td rowspan="4" id="info_imgbox"><img
											src="${pageContext.request.contextPath}/assets/image/마이페이지 남성_글러브.png"></td>
										<td>이름</td>
										<td><input type="text" id="nickname" name="nickname"
											placeholder="닉네임을 입력해주세요."></td>
									</tr>
									<tr class="infotite">
										<td>닉네임</td>
										<td><input type="text" id="user_id" name="user_id"
											placeholder="아이디를 입력해주세요."></td>
									</tr>
									<tr class="infotite">
										<td>성별</td>
										<td><input class="gender" type="radio" name="gender"
											value="M" checked="checked"> <label>남성</label> <input
											class="gender" type="radio" name="gender" value="F"><label>여성</label>
										<td>
									</tr>
									<tr id="wideinfo">
										<td colspan="2">프로필 사진 넣기 <input type="file"
											name="user_photo" id="user_photo">
										</td>

									</tr>
									
									<tr id="hp">
										<td id="hp_title"><label for="hp">전화번호</label></td>
										<td colspan="2" id="hp_content">
											<div id="add_hp">
												<div id="hp_content1">
													<input type="text" id="user_ph" placeholder="전화번호"
														inputmode="ph">
												</div>
											</div>
										</td>
									</tr>
									<tr id="address">
										<td id="address_title"><label for="address">주소</label></td>
										<td colspan="2" id="address_content">
											<div id="add_search">
												<div id="address_content1">
													<input type="hidden" id="confmKey" name="confmKey" value="">
													<input type="text" id=sample4_postcode name="post"
														placeholder="우편번호"> <input type="text"
														id="sample4_roadAddress" name="roadAddress"
														placeholder="도로명주소">
												</div>
												<button type="button" id="search_btn"
													onclick="sample4_execDaumPostcode()">검색하기</button>
											</div>
											<div id="address_content2">
												<input type="text" id="lastadd" name="juso"
													placeholder="나머지주소를 입력해주세요."> <input type="hidden"
													id="sample4_jibunAddress" placeholder="지번주소"> <input
													type="hidden" id="sample4_detailAddress" placeholder="상세주소">
												<input type="hidden" id="sample4_extraAddress"
													placeholder="참고항목"> <span id="guide"
													style="color: #999; display: none"></span>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<!--match_table-->
							<div class="info_update_btn">
								<button class="insert_btn" type="submit">저장</button>
								<a href="${pageContext.request.contextPath}"><button
										class="delclose_btn">취소</button></a>
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
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}

	//주소 api

	///////////////////////////

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