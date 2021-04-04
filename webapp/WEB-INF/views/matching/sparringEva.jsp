<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/sparring_eva.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>


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
						<h2>${bbuyVo.booking_date }</h2>
						<div class="info">${bbuyVo.gym_name}${bbuyVo.booking_start } ~ ${bbuyVo.booking_end }</div>
					</div>

					<p class="info_p">
						<span class="tit">${bbuyVo.gym_address }</span>
					</p>

					<!--상대방 프로필사진-->
					<div class="opp_info">
						<div class="opp_info_img">
							<img src="${pageContext.request.contextPath }/update/${bbuyVo.user_photo}" alt="상대방 프로필 사진">
						</div>
					</div>

					<!--상대방 정보-->
					<div class="opp_tit">
						<strong> <span>이번 스파링 파트너</span>
						</strong>
					</div>

					<div class="opp_tit2">
						<span style="color: #C51212;">${bbuyVo.nickname}</span><span style="font-size: 14px;"> 는(은)</span>
					</div>

					<div class="opp_tit2">
						<span style="font-size: 20px;">프로필에 비해서</span>
					</div>

					<form id="score_form" action="${pageContext.request.contextPath }/sparring/evawrite" method="get">
						<!--평가(물주먹 불주먹 핵주먹)-->
						<div class="img_area">
							<div class="btn_img">
								<img id="water" src="${pageContext.request.contextPath }/assets/image/store_img/fist1.png" alt="물주먹"> <span>
							</div>
							<div class="btn_img">
								<img id="fire" src="${pageContext.request.contextPath }/assets/image/store_img/fist2_on.png" alt="불주먹">
							</div>
							<div class="btn_img">
								<img id="hack" src="${pageContext.request.contextPath }/assets/image/store_img/fist3.png" alt="핵주먹">
							</div>
						</div>

						<!--평가아이콘 선택시 [ ]이었습니다 뜨도록 (생략가능)-->
						<div id="punch_box" class="opp_tit2"></div>

						<div class="opp_comp">
							<div class="label_area">
								<label>총 </label> <input id="score" type="text" placeholder="예시: 5" name="score" value=""> <label> 판 중에서</label>
							</div>
							<div class="label_area">
								<label>저는 </label> <input id="win" type="text" placeholder="예시: 2" name="win" value=""> <label> 판을 이기고,</label>
							</div>
							<div class="label_area">
								<label>파트너는 </label> <input id="lose" type="text" placeholder="예시: 3" name="lose" value=""> <label> 판을 이겼습니다.</label>
							</div>
						</div>

						<!--버튼-->
						<div class="btn_area">
							<div class="btn_opp">
								<button type="submit">확인</button>
							</div>
						</div>
						
							<input type="hidden" name="b_buy_no" value="${bbuyVo.b_buy_no}"> 
							<input type="hidden" name="user_no" value="${bbuyVo.user_no}"> 
							<input class="attri_0" type="hidden" name="matchAttri" value="">
						
					</form>

				</div>
				<!--sp_info-->




			</div>
			<!--spar_area-->

			<br> <br> <br> <br> <br> <br> <br> <br> <br> <br>


			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->
		</div>
		<!--//container-->
	</div>
	<!--//wrap-->


</body>
	<script type="text/javascript">
	$("#score_form").on("submit",function(){
		
		console.log("클릭확인")
		
		var attriPunchhtml = $("#punch_box").html();
		var score = $("#score").val();
		var win = $("#win").val();
		var lose = $("#lose").val();
		var result = win+lose;
		//숫자로 바꾸기
		score *= 1;
		win *= 1;
		lose *=1;
		
		console.log(result);
		if(attriPunchhtml == ''){
			alert("상대 주먹의 세기를 선택해주세요")
			return false;
		}
		if(score == ''){
			alert("스파링 총 수를 입력해 주세요")
			return false;
		}
		if(win == ''){
			alert("스파링 승리 횟수를 입력해 주세요")
			return false;
		}
		if(lose == ''){
			alert("상대의 승리  횟수를 입력해 주세요")
			return false;
		}
		if(score != win+lose){
			alert("스파링 총 횟수와 이긴횟수를 확인해 주세요")
			return false;
		}
		
		return true;
	});
	
	$(".btn_img").on("click","img",function(){
		
		var id = $(this).attr("id");
		var punchAttr = "";
		
		if(id == 'water'){
			punchAttr = '물주먹';
			$(".attri_0").val("물");
		}else if(id == 'fire'){
			punchAttr = '불주먹';
			$(".attri_0").val("불");
		}else if(id == 'hack'){
			punchAttr = '핵주먹';
			$(".attri_0").val("핵");
		}
		
		punch(punchAttr)
		
		
		
	});
	
	function punch(punchAttr){
		
		$("#punch_box").html("");
		str = '<span style="font-size: 20px; color: #C51212;">['+punchAttr+']</span><span style="font-size: 20px;">이었습니다!</span>';
		$("#punch_box").append(str);
		
	}

	</script>


</html>