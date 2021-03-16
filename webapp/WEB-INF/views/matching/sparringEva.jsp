<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/header.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sparring_eva.css">
	

</head>
<body>

	<div class="wrap">
		<div class="container">
			
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
			</div>
			</div>
			<!--내용-->
			<div class="wrap">
				<div class="container">

					<!--상단여백-->
					<div class="pd">
						<!---->
					</div>

					<div class="spar_area">

						<!--매칭정보 영역-->
						<div class="sp_info">
							<div class="sp_date">
								<h2>2021.05.21</h2>
								<div class="info">상봉 팀파이터 체육관 18:00 ~ 21:00</div>
							</div>

							<p class="info_p">
								<span class="tit">중랑구 사가정로 375 중랑13길</span>
							</p>

							<!--상대방 프로필사진-->
							<div class="opp_info">
								<div class="opp_info_img">
									<img
										src="${pageContext.request.contextPath }/assets/image/store_img/200_200.jpg"
										alt="상대방 프로필 사진">
								</div>
							</div>

							<!--상대방 정보-->
							<div class="opp_tit">
								<strong> <span>이번 스파링 파트너</span>
								</strong>
							</div>

							<div class="opp_tit2">
								<span style="color: #C51212;">방배동 불사조</span><span
									style="font-size: 14px;"> 는(은)</span>
							</div>

							<div class="opp_tit2">
								<span style="font-size: 20px;">프로필에 비해서</span>
							</div>

							<form action="">
								<!--평가(물주먹 불주먹 핵주먹)-->
								<div class="img_area">
									<div class="btn_img">
										<img
											src="${pageContext.request.contextPath }/assets/image/store_img/fist1.png"
											alt="물주먹"> <span>
									</div>
									<div class="btn_img">
										<img
											src="${pageContext.request.contextPath }/assets/image/store_img/fist2_on.png"
											alt="불주먹">
									</div>
									<div class="btn_img">
										<img
											src="${pageContext.request.contextPath }/assets/image/store_img/fist3.png"
											alt="핵주먹">
									</div>
								</div>

								<!--평가아이콘 선택시 [ ]이었습니다 뜨도록 (생략가능)-->
								<div class="opp_tit2">
									<span style="font-size: 20px; color: #C51212;">[불주먹]</span><span
										style="font-size: 20px;">이었습니다!</span>
								</div>

								<div class="opp_comp">
									<div class="label_area">
										<label>총 </label> <input type="text" placeholder="예시: 5"
											name="" value=""> <label> 판 중에서</label>
									</div>
									<div class="label_area">
										<label>저는 </label> <input type="text" placeholder="예시: 2"
											name="" value=""> <label> 판을 이기고,</label>
									</div>
									<div class="label_area">
										<label>파트너는 </label> <input type="text" placeholder="예시: 3"
											name="" value=""> <label> 판을 이겼습니다.</label>
									</div>
								</div>

								<!--버튼-->
								<div class="btn_area">
									<div class="btn_opp">
										<button type="submit">확인</button>
									</div>
								</div>
							</form>

						</div>
						<!--sp_info-->




					</div>
					<!--spar_area-->

					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br>


				<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->
				</div>
				<!--//container-->
			</div>
			<!--//wrap-->
			
			
			</body>
			</html>