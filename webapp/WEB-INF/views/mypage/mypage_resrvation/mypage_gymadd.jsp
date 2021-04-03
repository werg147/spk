<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/booking.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>

</head>
<body>
	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->

			<div class="middle">
				<c:import url="/WEB-INF/views/include/sidemenu.jsp"></c:import>
				<!--//side_menu//-->

				<!--////////////////////////////////////////////-->

				<div class="content_seller">
					<div class="content_booking_header">
						<div>체육관 등록</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>

					<!--등록폼-->
					<div class="gym_regi_form">
						<form action="${pageContext.request.contextPath }/mypage/book/gymadd" method="post" enctype="multipart/form-data">
							<table id="space2">
								<tr>
									<td class="basic">체육관 이름</td>
									<td colspan="4"><input class="input_text" type="text" name="gym_name"> 
									<!-- 사업자번호 숨김 -->
									<input type="hidden" name="sell_no" value="${authUser.sell_no }"></td>
								</tr>
								
								
								<tr>
									<td class="basic">체육관 주소</td>
									<td colspan="4"><input class="input_text" type="text" name="gym_address"></td>
								</tr>
								
<!-- 								 <tr id="address">
									<td id="address_title" class="basic"><label for="searchaddress">주소</label></td>
									<td colspan="4" id="address_content">
										<div id="add_search">
											<div id="address_content1">
												<input type="hidden" id="confmKey" name="confmKey" value="">

												<input type="text" id=sample4_postcode name="post"
													placeholder="우편번호" readonly> <input type="text"
													id="sample4_roadAddress" name="roadAddress" value=""
													placeholder="도로명주소" readonly>

											</div>
											<button type="button" id="search_btn">검색하기</button>
										</div>
											<div id="address_content2">
												<input type="text" id="addressdetail" name="addressdetail"
													placeholder="나머지주소를 입력해주세요."> <input type="hidden"
													id="sample4_jibunAddress" placeholder="지번주소"> <input
													type="hidden" id="sample4_extraAddress" placeholder="참고항목">
												<span id="guide" style="color: #999; display: none"></span>
											</div>
										</td>
									</tr> -->

								<tr>
									<td class="basic">체육관 전화번호</td>
									<td colspan="4"><input class="input_text" type="text" name="gym_ph"></td>
								</tr>

								<tr class="input_plus">
									<td>체육관 운영시간</td>
									<td colspan="4"><textarea name="gym_time"></textarea></td>
								</tr>

								<tr class="basic_chk">
									<td>체육관 주 종목</td>

								
									<td class="basic_chk_padding">
										<input id="box" type="radio" name="gym_event" value="복싱"> <label for="box">복싱</label>
									</td>
									<td class="basic_chk_padding">
										<input id="kbox" type="radio" name="gym_event" value="킥복싱"> <label for="kbox">킥복싱</label>
									</td>
									<td class="basic_chk_padding">
										<input id="jiu" type="radio" name="gym_event" value="주짓수"> <label for="jiu">주짓수</label>
									</td>
									<td class="basic_chk_padding">
										<input id="mma" type="radio" name="gym_event" value="종합격투기"> <label for="mma">종합격투기</label>
									</td>
								</tr>

								<tr class="basic_chk">
									<td>체육관 편의시설</td>

									<td><input id="park" type="checkbox" name="conve" value="park"> <label for="park">주차장</label></td>
									<td><input id="shower" type="checkbox" name="conve" value="shower"> <label for="shower">샤워실</label></td>
									<td colspan="2"><input id="towel" type="checkbox" name="conve" value="towel"> <label for="towel">수건</label></td>
								</tr>

								<tr>
									<td></td>
									<td class="basic_chk_padding">
										<input id="locker" type="checkbox" name="conve" value="locker"> <label for="locker">락커</label>
									</td>
									<td class="basic_chk_padding">
										<input id="glove" type="checkbox" name="conve" value="glove"> <label for="glove">글러브</label>
									</td>
									<td class="basic_chk_padding" colspan="2">
										<input id="wear" type="checkbox" name="conve" value="wear"> <label for="wear">운동복</label>
									</td>
								</tr>

								<tr class="input_plus">
									<td>공지사항</td>
									<td colspan="4"><textarea name="gym_notice"></textarea></td>
								</tr>
								
 								<tr>
									<td class="basic">체육관 대표사진</td>
									<td colspan="4"><input type="file" name="file1"></td>
								</tr> 
								
								 <tr>
									<td class="basic">체육관 추가사진</td>
									<td colspan="4"><input type="file" name="file2"></td>
								</tr> 
								
								<!-- 
								<tr class="gym_insert_div_img">
									<td>대표이미지</td>
									<td class="img_td" colspan="3">
										<div>
											<div class="dropZone1">
												<p>이미지를 끌어오세요</p>
											</div>
											<div id="img_add_box">
												<div id="imgadd1"></div>
											</div>
										</div>
									</td>
								</tr>
								<tr class="gym_insert_div_img">
									<td>추가이미지</td>
									<td class="img_td" colspan="3">
										<div>
											<div class="dropZone2">
												<p>이미지를 끌어오세요</p>
											</div>
											<div id="img_add_box">
												<div id="imgadd2"></div>
											</div>
										</div>
									</td>
								</tr>
								 -->
							</table>
							
							
							<div class="gym_regi_btn_site">
								<button class="gym_regi_btn" type="submit">체육관 등록</button>
							</div>

						</form> <!-- //form -->
					</div>
					<!--//gym_regi_form-->
					<div id="space"></div>
				</div>
			</div>
			<!--//middle-->
			
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->
		</div>
		<!--//container-->
	</div>
	<!--//wrap-->
</body>

</html>