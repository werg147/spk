<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/booking.css">
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
						<div>체육관 관리</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>

					<!--추후 생길 탭의 위쪽 라인에 위치-->
					<div class="regi_btn_site">
						<a href="${pageContext.request.contextPath}/mypage/book/gymaddform">
							<button type="button" class="regi_btn">체육관 등록</button>
						</a>
					</div>

					<!-- <div>탭부분(다수 체육관 소유 시)</div> -->
					<div class="own_gym">
						<ul class="own_gym_list">
							<li>체육관1</li>
							<li>체육관2</li>
						</ul>										
					</div>


					<!-- 대관 등록 버튼 -->
					<div class="regi_btn_site">
						<button type="button" class="regi_btn" onClick="location.href='#'">대관 등록</button>
					</div>

					<!--체육관 정보-->
					<div class="gym_regi_form">
						<form action="${pageContext.request.contextPath}/mypage/book/gymmodify" method="get"
							enctype="multipart/form-data">
							<table>
								<tr>
									<td class="basic">체육관 이름</td>
									<td colspan="2"><input class="input_text" type="text" name="gym_name"
										value="${gymMap.gymVo.gym_name }"></td>
								</tr>

								<tr>
									<td class="basic">체육관 주소</td>
									<td colspan="2"><input class="input_text" type="text" name="gym_address"
										value="${gymMap.gymVo.gym_address }"></td>
								</tr>

								<tr>
									<td class="basic">체육관 전화번호</td>
									<td colspan="2"><input class="input_text" type="text" name="gym_ph"
										value="${gymMap.gymVo.gym_ph }"></td>
								</tr>

								<tr class="input_plus">
									<td>체육관 운영시간</td>
									<td colspan="2"><textarea name="gym_time">${gymMap.gymVo.gym_time }</textarea></td>
								</tr>

								<tr class="basic_chk">
									<td>체육관 주 종목</td>
									<td colspan="2"></td>
								</tr>

								<tr>
									<td class="basic_chk_padding"><c:choose>
											<c:when test="${gymMap.gymVo.gym_event eq 'box' }">
												<input id="box" type="radio" name="gym_event" value="box" checked="checked">
												<label for="box">복싱/킥복싱</label>
											</c:when>
											<c:otherwise>
												<input id="box" type="radio" name="gym_event" value="box">
												<label for="box">복싱/킥복싱</label>
											</c:otherwise>
										</c:choose>
									</td>

									<td class="basic_chk_padding"><c:choose>
											<c:when test="${gymMap.gymVo.gym_event eq 'jiu' }">
												<input id="jiu" type="radio" name="gym_event" value="jiu" checked="checked">
												<label for="jiu">주짓수</label>
											</c:when>
											<c:otherwise>
												<input id="jiu" type="radio" name="gym_event" value="jiu">
												<label for="jiu">주짓수</label>
											</c:otherwise>
										</c:choose>
									</td>

									<td class="basic_chk_padding"><c:choose>
											<c:when test="${gymMap.gymVo.gym_event eq 'mma' }">
												<input id="mma" type="radio" name="gym_event" value="mma" checked="checked">
												<label for="mma">종합격투기</label>
											</c:when>
											<c:otherwise>
												<input id="mma" type="radio" name="gym_event" value="mma">
												<label for="mma">종합격투기</label>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>

								<tr class="basic_chk">
									<td>체육관 편의시설</td>
									<td colspan="2"></td>
								</tr>

								<tr>
									<td>
										<c:forEach var="vo" items="${gymMap.conList}">
											<c:choose>
										
												<c:when test="${vo.con_name eq '주차장' && vo.con_state eq 1 }">
													<input id="park" type="checkbox" name="conve" value="park" checked="checked">
													<label for="park">주차장</label>
												</c:when>
										
												<c:when test="${vo.con_name eq '주차장'}">
													<input id="park" type="checkbox" name="conve" value="park">
													<label for="park">주차장</label>
												</c:when>
											</c:choose>
										</c:forEach>
									</td>
									<td>
										<c:forEach var="vo" items="${gymMap.conList}">
											<c:choose>
											
												<c:when test="${vo.con_name eq '샤워실' && vo.con_state eq 1 }">
													<input id="shower" type="checkbox" name="conve" value="shower" checked="checked">
													<label for="shower">샤워실</label>
												</c:when>
											
												<c:when test="${vo.con_name eq '샤워실' }">
													<input id="shower" type="checkbox" name="conve" value="shower">
													<label for="shower">샤워실</label>
												</c:when>
											</c:choose>
										</c:forEach>
									</td>
									<td>
										<c:forEach var="vo" items="${gymMap.conList}">
											<c:choose>
											
												<c:when test="${vo.con_name eq '수건' && vo.con_state eq 1 }">
													<input id="towel" type="checkbox" name="conve" value="towel" checked="checked">
													<label for="towel">수건</label>
												</c:when>
											
												<c:when test="${vo.con_name eq '수건' }">
													<input id="towel" type="checkbox" name="conve" value="towel">
													<label for="towel">수건</label>
												</c:when>
											</c:choose>
										</c:forEach>
									</td>

								</tr>

								<tr>
									<td class="basic_chk_padding">
										<c:forEach var="vo" items="${gymMap.conList}">
											<c:choose>
											
												<c:when test="${vo.con_name eq '락커' && vo.con_state eq 1 }">
													<input id="locker" type="checkbox" name="conve" value="locker" checked="checked">
													<label for="locker">락커</label>
												</c:when>
											
												<c:when test="${vo.con_name eq '락커' }">
													<input id="locker" type="checkbox" name="conve" value="locker">
													<label for="locker">락커</label>
												</c:when>
											</c:choose>
										</c:forEach>
									</td>
									<td class="basic_chk_padding">
										<c:forEach var="vo" items="${gymMap.conList}">
											<c:choose>
											
												<c:when test="${vo.con_name eq '글러브' && vo.con_state eq 1 }">
													<input id="glove" type="checkbox" name="conve" value="glove" checked="checked"> 
													<label for="glove">글러브</label>
												</c:when>
											
												<c:when test="${vo.con_name eq '글러브' }">
													<input id="glove" type="checkbox" name="conve" value="glove"> 
													<label for="glove">글러브</label>
												</c:when>
											</c:choose>
										</c:forEach>
									</td>
									<td class="basic_chk_padding" colspan="2">
										<c:forEach var="vo" items="${gymMap.conList}">
											<c:choose>
											
												<c:when test="${vo.con_name eq '글러브' && vo.con_state eq 1 }">
													<input id="wear" type="checkbox" name="conve" value="wear" checked="checked"> 
													<label for="wear">운동복</label>
												</c:when>
											
												<c:when test="${vo.con_name eq '글러브' }">
													<input id="wear" type="checkbox" name="conve" value="wear"> 
													<label for="wear">운동복</label>
												</c:when>
											</c:choose>
										</c:forEach>
									</td>
								</tr>

								<tr class="input_plus">
									<td>공지사항</td>
									<td colspan="2"><textarea name="gym_notice">${gymMap.gymVo.gym_notice }</textarea></td>
								</tr>


								<tr>
									<td class="basic">체육관 사진</td>
									<td colspan="2"><input type="file"></td>
									<!-- img태그 넣기 -->
								</tr>

							</table>

							<div class="gym_regi_btn_site">
								<button class="gym_regi_btn" type="submit">정보 수정</button>
								<button class="gym_regi_btn" type="submit">체육관 삭제</button>
							</div>

						</form>
					</div>
					<!--//gym_regi_form-->
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
	</div>
</body>
</html>