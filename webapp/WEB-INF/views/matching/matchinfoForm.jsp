<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kor">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>매칭프로필관리</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style_1.css">
</head>

<body>

	<div class="wrap">

		<div class="container">

				<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
			<!--//header//-->

			<div class="content_matchingInfo_header">
				<div class="c_ma_title">
					프로필 입력
				</div>
			</div>

			<div class="line_1"></div>
			<!-- //line -->
			<!--//content_matchingInfo_header//-->
			<div class="middle">

				
				<!-- content_notice -->
				<div class="content_notice">
					<div class="c_notice_1">
						<div class="middle_img">
							<img class="middle_glove" src="${pageContext.request.contextPath }/assets/image/img/glove1.jpg" alt="">
							<!-- <img class="middle_glove" src="/image/img/glove2.jpg" alt=""> -->
						</div>
						<h2 class="content_notice_h2"><span>정확한</span> 작성은 <br>
							<span>정확한</span> 매칭에 <br>
							<span>정확성</span>을 올립니다!
						<h2>
					</div>
				</div>
				<!-- content_notice end -->

				<div class="content_mypage">




					<div class="form2_container">

						<div class="sparring_ex_box">
										
							<h2 class="sparring_ex_title">스파링 경험이 5회 이상이십니까?</h2>
							<input class="sparring_ex ex_01"  id="co" type="radio" name="sparring_ex" value="yes" checked="checked"> <label for="co">네</label>
							<input class="sparring_ex2 ex_01" id="co2" type="radio" name="sparring_ex" value="no"><label for="co2"> 아니요</label>
						</div>
						<div class="con_match">


							<div id="form_submit" class="content_bottom">

								<!-- 입력폼 → 매칭프로필저장 -->
								<form action="${pageContext.request.contextPath}/sparring/write" method="get">

									<table class="insert_matcingInfo">
										<colgroup>
											<col style="width: 100px">
											<col style="width: 100px">
											<col style="width: 600px">
										</colgroup>
										<!-- 종목선택 -->
										<tr class="basic">
											<td colspan="2"><label for="prod_cate">매치불러오기</label></td>
											<td>
												<div class="">
													<select  id="exer_cate">
														<option selected>이전 매치</option>
															<c:forEach items="${profileList}"  var="vo" varStatus="status">
																<option id="before_item" data-no="${status.count}">${vo.profileDate}</option>
															</c:forEach>
													</select>
												</div>
											</td>
										</tr>
										<!-- 종목선택 end -->

										<!-- 대관없이 매칭글시에만 보임-->
										<!-- 종목선택 -->
										
										<c:if test="${bookingno == 0}">
										<tr class="basic">
											<td colspan="2"><label for="prod_cate">스파링종목</label></td>
											<td>
												<div id="spa_event1" class="">
													<select id="exer_cate1" name="profileGymEvent">
														<option selected>종목 선택</option>
														<option value="복싱">복싱</option>
														<option value="킥복싱">킥복싱</option>
														<option value="주짓수">주짓수</option>
														<option value="종합격투기">종합격투기</option>
													</select>
												</div>
											</td>
										</tr>
										<!-- 종목선택 end -->
										<!-- 원하는 시간 입력 -->
										<tr class="basic">
											<td colspan="2"><label for="prod_cate">원하는 장소</label></td>
											<td>
												<div class="">
													<button class="insert_btn_10">검색</button>
												</div>
											</td>
										</tr>
										<!-- 원하는 시간 입력 end -->
										<tr class="basic">
											<td colspan="2"><label for="prod_cate">원하는 일시</label></td>
											<td>
												<div class="form_day_10">
													<label for="day"></label><input id="exer_cata2" class="day_textbox" type="text" placeholder="21/03/08" name="day" value="">
												</div>
												<div class="">
													<select id="exer_cate3" name="time">
														<option selected>시간선택</option>
														<option value="9:00~12:00">9:00~12:00</option>
														<option value="12:00~15:00">12:00~15:00</option>
														<option value="15:00~18:00">15:00~18:00</option>
														<option value="18:00~21:00">18:00~21:00</option>
														<option value="21:00~24:00">21:00~24:00</option>
														<option value="새벽시간">새벽시간</option>
														<option value="시간상관없음">시간상관없음</option>
													</select>
												</div>
											</td>
										</tr>
										</c:if>
										<!-- 원하는 시간 입력 end -->
										<!-- 종목선택 end -->
										<!-- 대관없이 매칭글시에만 보임 end-->
										<tr class="basic">
											<td colspan="2"><label for="prod_cate">주특기</label></td>
											<td>
												<div id="event_chked" class="chk_box">
													<input type='checkbox' id="pro_chk" name='eventName' value='1' />복싱
													<input type='checkbox' id="pro_chk" name='eventName' value='2' />킥복싱
													<input type='checkbox' id="pro_chk" name='eventName' value='3' />종합격투기
													<input type='checkbox' id="pro_chk" name='eventName' value='4' />주짓수
												</div>
											</td>
										</tr>
										<!-- //주특기 -->

										<tr class="basic">
											<td colspan="2"><label for="prod_name">신장</label></td>
											<td><input id="height_info"type="text" id="prod_name" placeholder="신장을 입력해주세요." name="height"></td>
										</tr>
										<!-- //신장 -->

										<tr class="basic">
											<td colspan="2"><label for="prod_price">체중</label></td>
											<td><input id="weight_info"type="text" id="prod_price" placeholder="체중을 입력해주세요."  name="weight"></td>
										</tr>
										<!-- //체중 -->

										<tr class="basic">
											<td colspan="2"><label for="brand_name">경력</label></td>
											<td>
												<div class="chk_box">
													<input type='radio' id="pro_chk" name='career' value='프로' />프로
													<input type='radio' id="pro_chk" name='career'
														value='아마추어' />아마추어
												</div>
											</td>
										</tr>
										<!-- //경력 -->

										<tr class="basic">
											<td colspan="2"><label for="brand_name">전공</label></td>
											<td>
												<div class="chk_box">
													<input class="radio-value" type='radio' id="pro_chk" name='chk_major' value="no" />무
													<input class="radio-value" type='radio' id="pro_chk" name='chk_major' value="yes"/>유
													<input  id="major_info" type="text" id="prod_price" placeholder="전공을 입력해주세요." name="major" value="">
												</div>
											</td>
										</tr>
										<!-- //전공 -->

										<tr class="basic">
											<td colspan="2"><label for="exer_cate">최근운동</label></td>
											<td>
												<div class="content_product_insert_select_box">
													<select id="exer_cate4" name="recentlyExer">
														<option selected>최근운동</option>
														<option  value="주 5회 이상">주 5회 이상</option>
														<option  value="주 3회 이상">주 3회 이상</option>
														<option  value="주 1회 이상">주 1회 이상</option>
														<option  value="월 1회 이상">월 1회 이상</option>
														<option  value="3달 이상 안함">3달 이상 안함</option>
														<option  value="6달 이상 안함">6달 이상 안함</option>
													</select>
												</div>
											</td>
										</tr>
										<!-- //최근운동 -->
										<!--스파링횟수-->
										<tr class="basic">
											<td colspan="2"><label for="exer_cate">실전 스파링횟수</label></td>
											<td>
												<div class="content_product_insert_select_box">
													<input id="exer_sparring_info" class="text_sparring_exp" type="text" name="exp"> 회
												</div>
											</td>
										</tr>
										<!-- 반복단 -->
											<td><label for="prod_cate">공식기록</label></td>
										<tbody id="record_app">
										<tr class="basic">
											<td><label for="prod_cate">대회분류</label></td>
											<td>
												<div class="content_product_insert_select_box">
													<select id="cham_cate" name="recordList[0].recordType">
														<option selected>대회분류</option>
														<option value="지역">지역</option>
														<option value="전국">전국</option>
														<option value="세계">세계</option>
													</select>
												</div>
											</td>
										</tr>
										<!-- //공식기록 - 대회분류 -->

										<tr class="basic">
											<td><label for="prod_cate"></label></td>
											<td><label for="cham_name">대회명</label></td>
											<td>
												<div class="content_product_insert_select_box">
													<input type="text" id="cham_name" placeholder="대회명을 입력해주세요." name="recordList[0].recordName" >
												</div>
											</td>
										</tr>
										<!-- //공식기록 - 대회분류 -->

										<tr class="basic">
											<td><label for="prod_cate"></label></td>
											<td><label for="prod_cate">종목</label></td>
											<td>
												<div class="content_product_insert_select_box">
													<select id="even_cate" name="recordList[0].recordEvent">
														<option selected>종목</option>
														<option value="1">복싱</option>
														<option value="2">킥복싱</option>
														<option value="3">종합격투기</option>
														<option value="4">주짓수</option>
													</select>
												</div>
											</td>
										</tr>
										<!-- //공식기록 - 종목 -->

										<tr class="basic">
											<td><label for="prod_cate"></label></td>
											<td><label for="prod_cate">출전연도</label></td>
											<td>
												<div class="content_product_insert_select_box">
													<select id="even_year" name="recordList[0].recordDate">
														<option selected>출전연도</option>
														<option value="2021">2021</option>
														<option value="2020">2020</option>
														<option value="2019">2019</option>
													</select>
												</div>
											</td>
										</tr>
										<!-- //공식기록 - 출전연도 -->

										<tr class="basic">
											<td><label for="prod_cate"></label></td>
											<td><label for="prod_cate">매치</label></td>
											<td>
												<div class="content_product_insert_select_box">
													<select id="match_cate" name="recordList[0].recordMatch">
														<option selected>매치</option>
														<option value="일반매치">일반매치</option>
														<option value="타이틀매치">타이틀매치</option>

													</select>
												</div>
											</td>
										</tr>
										<!-- 반복단 end-->
										
										
										</tbody>
										<!-- //공식기록 - 매치 -->
									</table>
									<!-- //insert_matcingInfo -->

									<div class="official_button">
										<button id="official_btn" class="official_button_plus" type="button">추가하기</button>
									</div>
									<!-- //공식기록 추가 -->
									<!-- //공식기록 추가 -->
									<label class="coment_title" for="word">상대에게 한마디</label><input class="coment_one" type="text" name="word">
										
	
									<div class="product_insert_btn">
										<c:choose>
											<c:when test="${param.bookingno == 0 }">
												<button id="info_subm" class="insert_btn" type="submit">매칭글 등록</button>
											</c:when>
											<c:otherwise>
												<button id="info_subm" class="insert_btn" type="submit">결제후 등록</button>
											</c:otherwise>
										</c:choose>
										<a href=""><button class="product_delclose_btn">취소</button></a>
									</div>
									<!-- //product_insert_btn -->
									<!-- session값 생겨도 히든으로 표시할 것 아이작스에서 쓰고있음 -->
									<input id="session_user_no" type="hidden" name="userNo" value="2">
									<input type="hidden" name="bookingno" value="${param.bookingno}">
									<input type="text" name="mainnum" value="${param.mainnum }">
								</form>
								<!-- //입력폼 → 주문하기 -->

							</div>
						</div>
						<!-- //content_bottom -->
					</div>
					<!--form 컨테이너-->
									<div id="hideMsg1">
										
									</div>
				</div>
				<!--//content_mypage-->

			</div>
			<!--//content_product//-->

		</div>
		<!-- //container -->

	</div>
	<!-- //wrap -->
	
</body>
	<script type="text/javascript">
	
	$("document").ready(function(){
		 num = 1
		  
	
	})
	//스파링 5회 이상 체크
	$(".ex_01").on("click",function(){
		var spaFive = $('.ex_01:checked').val();
		console.log(spaFive); 
		
		if(spaFive == 'no'){
			$(".con_match").hide();
			msg('1');
		}else{
			$(".con_match").show();
			msg('0');
		}
		
	});
	
	function msg(msgone){
		str = "<div class='hide-text'>5회 이하는 매칭이 불가능 합니다</div>";
		str += '<a href=""><button type="button" class="product_delclose_btn">돌아가기</button></a>'
		if(msgone == '1'){
		$("#hideMsg1").append(str);
			
		}else{
			$("#hideMsg1").html("");
		}
	}
	
	
	//프로필작성 경고문
	$('.radio-value').on('click', function() {

    var valueCheck = $('.radio-value:checked').val(); // 체크된 Radio 버튼의 값을 가져옵니다.
	console.log(valueCheck);
    if ( valueCheck == 'no' ) {
        $('#major_info').attr('disabled', true); // 과일 종류를 입력하는 input 을 활성화합니다.
        
    } else {
        $('#major_info').val(''); // 입력된 과일 종류 값이 있으면, 초기화합니다.
        $('#major_info').attr('disabled', false); // 과일 종류를 입력하는 input 을 비활성화합니다.
    }
});
		
	

	
	
	$("#form_submit").on("submit", function() {
		console.log("확인");
		console.log($("#exer_cate1 option:selected").val());
		if($("#exer_cate1 option:selected").val() == "종목 선택"){
			alert("스파링종목을 선택해주세요");
			return false;
		}
		
		if($("#exer_cata2").val()== ""){
			alert("원하는 일시를 입력해주세요")
			return false;
		}
		
		if($("#exer_cate3 option:selected").val() == "시간선택"){
			alert("원하는 시간을 선택해주세요")
			return false;
		}
		
		
		var eventName2 = $("[name='eventName']:checked").val();
		if(eventName2 == null){
			alert("주특기를 1개 이상 체크해주세요");
			return false;
		}
		
		if($("#height_info").val() == ""){
			alert("신장을 입력해주세요");
			return false;
		}
		if($("#weight_info").val() == ""){
			alert("체중을 입력해주세요");
			return false;
		}
		
		if(!$("input:radio[name=career]").is(':checked')){
			alert("경력을 체크해주세요");
			return false;
		}
		
		if(!$('input:radio[name=chk_major]').is(':checked')){
			alert("전공을 체크해주세요")
			return false;
		}
		if(!$('#major_info').is(":disabled")){
			if($('#major_info').val()==""){
				alert("전공을 입력해주세요")
				return false;
			}
			
		}
		
		if($("#exer_cate4 option:selected").val() == "최근운동"){
			alert("최근 운동상태를 선택해주세요")
			return false;
		}
		
		if($("#exer_sparring_info").val() == ""){
			alert("실전 스파링횟수를 적어주세요");
			return false;
		}
		
		
	});
	/* 버튼클릭시 date_no값 받아와서 날짜 얻어내기 */
	$("#exer_cate").change("click",function(){
				num= 0;
				var rownum= $("select option:selected").data("no");
				
				
				
				var userNo=$("#session_user_no").val();
				

				$.ajax({

					url : "${pageContext.request.contextPath }/sparring/api/selectdate", //컨트롤러의 url과 파라미터
					type : "post", // 겟 포스트
					//contentType : "application/json",
					data : {
						rownum : rownum,
						userNo : userNo
					},

					//dataType : "json",
					success : function(pMap) { //성공시
						console.log(pMap.profileVo);
						console.log(pMap.profileVo.recentlyExer);
						
						/* 프로필 */
						$("#height_info").val(pMap.profileVo.height);
						$("#weight_info").val(pMap.profileVo.weight);
						$("#major_info").val(pMap.profileVo.major);
						if(pMap.profileVo.major != ""){
							$("input:radio[name='chk_major']:radio[value='yes']").prop('checked', true);
						}
						
						
						$("#exer_sparring_info").val(pMap.profileVo.exp);
						$('#exer_cate4 option[value="'+pMap.profileVo.recentlyExer+'"]').prop('selected', 'selected').change();
						
						/* 주특기 */
						var size = $(pMap.eventList).length;
						for(var i=0; i<size ;i++){

							$('input:checkbox[value="'+pMap.eventList[i].eventName+'"]').attr('checked','checked').change();
						}
						
						/* 공식기록 */
						console.log($(pMap.recordList));
						var recordList = $(pMap.recordList);
						
						if($(recordList).length == 0 ){
							
						}else{
							record(recordList);
						}
					},
					error : function(XHR, status, error) { //실패
						console.error(status + " : " + error);
					}
				});
				
			});

			
	
	
	$("#official_btn").on("click",function(){
		console.log("버튼클릭");
		
		
		console.log(num);
		comments(num);
		
		num += 1
	});
	function record(recordList) {
		
		console.log("값이있음");
		$("#record_app").html(" ");
		var listSize = $(recordList).length;
		
		num=0;
		
		for(var i=0; i < listSize; i++){
			
			
		
		
		str = "";
		str += '<tr class="basic">';
		
		str += '<td><label for="prod_cate">대회분류</label></td>';
		str += '	<td>';
		str += '		<div class="content_product_insert_select_box">';
		str += '			<select id="cham_cate'+i+'" name="recordList['+num+'].recordType">';
		str += '				<option selected>대회분류</option>';
		str += '				<option value="지역">지역</option>';
		str += '				<option value="전국">전국</option>';
		str += '				<option value="세계">세계</option>';
		str += '			</select>';
		str += '		</div>';
		str += '	</td>';
		str += '</tr>';
		str += '<tr class="basic">';
		str += '	<td><label for="prod_cate"></label></td>';
		str += '	<td><label for="prod_cate">대회명</label></td>';
		str += '	<td>';
		str += '		<div class="content_product_insert_select_box">';
		str += '			<input type="text" id="cham_name'+i+'" placeholder="대회명을 입력해주세요." name="recordList['+num+'].recordName" >';
		str += '		</div>';
		str += '	</td>';
		str += '</tr>';
		str += '<tr class="basic">';
		str += '	<td><label for="prod_cate"></label></td>';
		str += '	<td><label for="prod_cate">종목</label></td>';
		str += '	<td>';
		str += '		<div class="content_product_insert_select_box">';
		str += '			<select id="even_cate'+i+'" name="recordList['+num+'].recordEvent">';
		str += '				<option selected>종목</option>';
		str += '				<option value="1">복싱</option>';
		str += '				<option value="2">킥복싱</option>';
		str += '				<option value="3">종합격투기</option>';
		str += '				<option value="4">주짓수</option>';
		str += '			</select>';
		str += '		</div>';
		str += '	</td>';
		str += '</tr>';
		str += '	<tr class="basic">';
		str += '	<td><label for="prod_cate"></label></td>';
		str += '	<td><label for="prod_cate">출전연도</label></td>';
		str += '	<td>';
		str += '	<div class="content_product_insert_select_box">';
		str += '			<select id="even_year'+i+'" name="recordList['+num+'].recordDate">';
		str += '				<option selected>출전연도</option>';
		str += '				<option value="2021">2021</option>';
		str += '				<option value="2020">2020</option>';
		str += '				<option value="2019">2019</option>';
		str += '			</select>';
		str += '		</div>';
		str += '	</td>';
		str += '</tr>';
		str += '<tr class="basic">';
		str += '	<td><label for="prod_cate"></label></td>';
		str += '	<td><label for="prod_cate">매치</label></td>';
		str += '	<td>';
		str += '		<div class="content_product_insert_select_box">';
		str += '			<select id="match_cate'+i+'" name="recordList['+num+'].recordMatch">';
		str += '				<option selected>매치</option>';
		str += '				<option value="일반매치">일반매치</option>';
		str += '				<option value="타이틀매치">타이틀매치</option>';
		str += '			</select>';
		str += '		</div>';
		str += '	</td>';
		str += '</tr>';
		

		$("#record_app").append(str);
		
		$("#cham_name"+i).val(recordList[i].recordName);
		$('#cham_cate'+i+' option[value="'+recordList[i].recordType+'"]').prop('selected', 'selected').change();
		$('#even_cate'+i+' option[value="'+recordList[i].recordEvent+'"]').prop('selected', 'selected').change();
		$('#even_year'+i+' option[value="'+recordList[i].recordDate+'"]').prop('selected', 'selected').change();
		$('#match_cate'+i+' option[value="'+recordList[i].recordMatch+'"]').prop('selected', 'selected').change();
		
		num += 1;	
		}
		
		
	}
	
	
	function comments() {

		str = "";
		str += '<tr class="basic">';
		
		str += '<td><label for="prod_cate">대회분류</label></td>';
		str += '	<td>';
		str += '		<div class="content_product_insert_select_box">';
		str += '			<select id="cham_cate" name="recordList['+num+'].recordType">';
		str += '				<option selected>대회분류</option>';
		str += '				<option value="지역">지역</option>';
		str += '				<option value="전국">전국</option>';
		str += '				<option value="세계">세계</option>';
		str += '			</select>';
		str += '		</div>';
		str += '	</td>';
		str += '</tr>';
		str += '<tr class="basic">';
		str += '	<td><label for="prod_cate"></label></td>';
		str += '	<td><label for="prod_cate">대회명</label></td>';
		str += '	<td>';
		str += '		<div class="content_product_insert_select_box">';
		str += '			<input type="text" id="cham_name" placeholder="대회명을 입력해주세요." name="recordList['+num+'].recordName" >';
		str += '		</div>';
		str += '	</td>';
		str += '</tr>';
		str += '<tr class="basic">';
		str += '	<td><label for="prod_cate"></label></td>';
		str += '	<td><label for="prod_cate">종목</label></td>';
		str += '	<td>';
		str += '		<div class="content_product_insert_select_box">';
		str += '			<select id="even_cate" name="recordList['+num+'].recordEvent">';
		str += '				<option selected>종목</option>';
		str += '				<option value="1">복싱</option>';
		str += '				<option value="2">킥복싱</option>';
		str += '				<option value="3">종합격투기</option>';
		str += '				<option value="4">주짓수</option>';
		str += '			</select>';
		str += '		</div>';
		str += '	</td>';
		str += '</tr>';
		str += '	<tr class="basic">';
		str += '	<td><label for="prod_cate"></label></td>';
		str += '	<td><label for="prod_cate">출전연도</label></td>';
		str += '	<td>';
		str += '	<div class="content_product_insert_select_box">';
		str += '			<select id="even_year" name="recordList['+num+'].recordDate">';
		str += '				<option selected>출전연도</option>';
		str += '				<option value="2021">2021</option>';
		str += '				<option value="2020">2020</option>';
		str += '				<option value="2019">2019</option>';
		str += '			</select>';
		str += '		</div>';
		str += '	</td>';
		str += '</tr>';
		str += '<tr class="basic">';
		str += '	<td><label for="prod_cate"></label></td>';
		str += '	<td><label for="prod_cate">매치</label></td>';
		str += '	<td>';
		str += '		<div class="content_product_insert_select_box">';
		str += '			<select id="match_cate" name="recordList['+num+'].recordMatch">';
		str += '				<option selected>매치</option>';
		str += '				<option value="일반매치">일반매치</option>';
		str += '				<option value="타이틀매치">타이틀매치</option>';
		str += '			</select>';
		str += '		</div>';
		str += '	</td>';
		str += '</tr>';
		

		$("#record_app").append(str);
	}
	</script>
</html>