<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>알림</title>
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

				<div class="content_mypage">

					<div class="content_info_update_header">
						<div>회원정보관리</div>
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
										<td id="info_imgbox"><img src="${pageContext.request.contextPath}/assets/image/마이페이지 남성_글러브.png"></td>
										<td>
											<div class="add_div_box">
												<div>닉네임(아이디)</div>
												<div>
													<button class="add_btn">프로필 사진 변경하기</button>
												</div>
											</div>
										</td>
									</tr>
									<tr id="hp">
										<td id="hp_title"><label for="hp">전화번호</label></td>
										<td id="hp_content">
											<div id="add_hp">
												<div id="hp_content1">
													<input type="text" id="hp" placeholder="전화번호">
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
								<button class="insert_btn">저장</button>
								<button class="delclose_btn">취소</button>
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

</html>