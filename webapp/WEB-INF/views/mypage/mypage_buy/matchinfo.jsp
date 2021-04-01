<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>알림</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style_12.css">

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

					<div class="content_matchingInfo_header">
						<div>매칭프로필&nbsp관리</div>
					</div>
					<!--//content_matchingInfo_header//-->

					<div class="line"></div>
					<!-- //line -->

					<div class="content_bottom">
					<div id="form_submit" class="content_bottom">
						<!-- 입력폼 → 매칭프로필저장 -->
						<form id="profile_form" class="form_box_12" action="" method="get">
								

									<table class="insert_matcingInfo">
										<colgroup>
											<col style="width: 100px">
											<col style="width: 100px">
											<col style="width: 600px">
										</colgroup>
										<!-- 종목선택 -->
										<tr class="basic">
											<td colspan="2"><label for="prod_cate" class="ba_ti_tle">매치불러오기</label></td>
											<td>
												<div class="">
													<select class="sel1box" id="exer_cate">
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
										
										
										
										<!-- 대관없이 매칭글시에만 보임 end-->
										<tr class="basic">
											<td colspan="2"><label for="prod_cate" class="ba_ti_tle">주특기</label></td>
											<td>
												<div id="event_chked" class="chk_box">
													<input  type='checkbox' id="pro_chk" name='eventName' value='1' /><label >복싱</label>
													<input  type='checkbox' id="pro_chk" name='eventName' value='2' /><label >킥복싱</label>
													<input  type='checkbox' id="pro_chk" name='eventName' value='3' /><label >종합격투기</label>
													<input  type='checkbox' id="pro_chk" name='eventName' value='4' /><label >주짓수</label>
												</div>
											</td>
										</tr>
										<!-- //주특기 -->

										<tr class="basic">
											<td colspan="2"><label for="prod_name" class="ba_ti_tle">신장</label></td>
											<td><input id="height_info"type="text" id="prod_name" placeholder="신장을 입력해주세요." name="height"></td>
										</tr>
										<!-- //신장 -->

										<tr class="basic">
											<td colspan="2"><label for="prod_price" class="ba_ti_tle">체중</label></td>
											<td><input id="weight_info"type="text" id="prod_price" placeholder="체중을 입력해주세요."  name="weight"></td>
										</tr>
										<!-- //체중 -->

										<tr class="basic">
											<td colspan="2"><label for="brand_name" class="ba_ti_tle">경력</label></td>
											<td>
												<div class="chk_box">
													<input type='radio' id="pro_chk" name='career' value='프로' />프로
													<input class="ama_cl" type='radio' id="pro_chk" name='career'
														value='아마추어' />아마추어
												</div>
											</td>
										</tr>
										<!-- //경력 -->

										<tr class="basic">
											<td colspan="2"><label for="brand_name" class="ba_ti_tle">전공</label></td>
											<td>
												<div class="chk_box">
													<input class="radio-value" type='radio' id="pro_chk" name='chk_major' value="no" />무
													<input class="radio-value" type='radio' id="pro_chk" name='chk_major' value="yes"/>유
													<input class="op1" id="major_info" type="text" id="prod_price" placeholder="전공을 입력해주세요." name="major" value="없음">
												</div>
											</td>
										</tr>
										<!-- //전공 -->

										<tr class="basic">
											<td colspan="2"><label for="exer_cate" class="ba_ti_tle">최근운동</label></td>
											<td>
												<div class="content_product_insert_select_box">
													<select class="sel1box" id="exer_cate4" name="recentlyExer">
														<option  selected>최근운동</option>
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
											<td colspan="2"><label for="exer_cate" class="ba_ti_tle">실전 스파링횟수</label></td>
											<td>
												<div class="content_product_insert_select_box">
													<input id="exer_sparring_info" class="text_sparring_exp" type="text" name="exp"> 회
												</div>
											</td>
										</tr>
										<!-- 반복단 -->
											<td class="ba_t1"><label for="prod_cate" class="ba_ti_tle ba_t">공식기록</label></td>
										<tbody id="record_app">
										<tr class="basic">
											
											<td><label for="prod_cate" >종목</label></td>
											<td>
												<div id="conpro" class="content_product_insert_select_box">
													<select data-num="0" class="even120 eveneven" id="even_cate" name="recordList[0].recordEvent">
														<option selected>종목</option>
														<option value="1">복싱</option>
														<option value="2">킥복싱</option>
														<option value="3">종합격투기</option>
														<option value="4">주짓수</option>
													</select>
												</div>
											</td>
										</tr>
										<!-- //공식기록 - 대회분류 -->
										<!-- //공식기록 - 대회분류 -->
										
										<tr class="basic">
											<td><label for="prod_cate"></label></td>
											<td><label for="prod_cate" >대회분류</label></td>
											<td>
												<div class="content_product_insert_select_box">
												
													<select class="cham0" id="cham_cate" name="recordList[0].recordType">
														<option selected>대회분류</option>
														
													</select>
												</div>
											</td>
										</tr>

										<tr id="cate_na0" class="ba01">
											
										</tr>
										<!-- //공식기록 - 종목 -->

										<tr class="cham_year20" class="basic">
											
										</tr>
										<!-- //공식기록 - 출전연도 -->

										<tr class="basic">
											<td><label for="prod_cate"></label></td>
											<td><label for="prod_cate" >순위</label></td>
											<td>
												<div class="content_product_insert_select_box">
													<select class="cham_rank0" id="match_cate" name="recordList[0].recordMatch">
														<option selected>순위</option>
														
													
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
									
										
	
									<div class="product_insert_btn">
										
										<button id="info_subm" class="insert_btn" type="submit">등록</button>
										
										<a href=""><button class="product_delclose_btn">취소</button></a>
									</div>
									<!-- //product_insert_btn -->
									<!-- session값 생겨도 히든으로 표시할 것 아이작스에서 쓰고있음 -->
									<input id="session_user_no" type="text" name="userNo" value="${authUser.user_no}">
									<input type="text" name="subnum" value="${param.subnum}">
									<input type="text" name="selectbooking_no" value="${param.selectbooking_no}">
									<c:if test="${param.booking_no != 0}">
										<input type="text" name="bookingno" value="${param.booking_no}">
										<input type="text" name="bbuyno" value="${param.bbuyno}">
										<input type="text" name="bbuyuser" value="${param.bbuyuser }">
									</c:if>
									
								</form>
								<!-- //입력폼 → 주문하기 -->

					</div>
					</div>
					<!-- //content_bottom -->

				</div>
				<!--//content_mypage-->

			</div>
			<!--//middle//-->

			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->

		</div>
		<!-- //container -->

	</div>
	<!-- //wrap -->

</body>
<script type="text/javascript">
$("document").ready(function(){
	 num = 0
	  

})

$("#record_app").on("change","#cham_cate",function (){
	 
	var cham_01 = $(this).attr('class')
	
	
	 
	 var local=$("."+cham_01+" option:selected").val();
	 var cat=$("."+cham_01+" option:selected").data("catena");
	 $("#cate_na"+cat+"").html( " " );
	 $(".cham_year2"+cat+"").html(" ");
	 console.log(local);
	

	if(local == '지역대회'){
		
		 catena(cat);
		
	}
	
	if(local == '세계선수권대회'){
		cateyear(cat);
	}
});

	

	$("#record_app").on("click",".eveneven",function(){
		$(".eveneven").change("click",function(){
					
			var num = $(this).data("num");
			var clas = '.even12'+num+'';
			
			//종목이 바뀌면 다시 대회이름을 지워줘야함
			$("#cate_na"+num+"").html(" ");
			
			var event = $("option:selected",clas).val();
			console.log("종목선택")
			console.log(event);			
			
			
			
			if(event == 1 || event ==2){
				console.log("1 ,2");
				
				
				cham1(num);
			}else if(event == 3){
				console.log("3");
				
				cham2(num);
			}else if(event == 4){
				console.log("4");
				
				cham3(num);
			}else if(event == '종목'){
				reback(num);
				
			}
		});
	});


//스파링 5회 이상 체크
$(".ex_01").on("click",function(){
	var spaFive = $('.ex_01:checked').val();

	
	if(spaFive == 'no'){
		$(".con_match").hide();
		msg('1');
	}else{
		$(".con_match").show();
		msg('0');
	}
	
});

function msg(msgone){
	$("#hideMsg1").html("");
	
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

if ( valueCheck == 'no' ) {
   $('#major_info').attr('disabled', true); // 과일 종류를 입력하는 input 을 활성화합니다.
   
} else {
   $('#major_info').val(''); // 입력된 과일 종류 값이 있으면, 초기화합니다.
   $('#major_info').attr('disabled', false); // 과일 종류를 입력하는 input 을 비활성화합니다.
}
});
	




$("#profile_form").on("submit", function() {
	event.preventDefault();
	console.log("확인 123");
	
	var eventValue = new Array();
	var major12 = "";
	
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
	}else{
		var	event_num = 0 ;
		$("[name='eventName']:checked").each(function(e){
			
			eventname= $(this).val();
			eVo = {
					eventName : eventname
			}
			eventValue[event_num] =eVo;
			
			event_num ++ ;	
		});
			
			
			
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
		}else{
			major12 = $('#major_info').val();
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
	var height = $("#height_info").val();
	
	var weight = $("#weight_info").val();
	
	
	var career = $("input:radio[name='career']:checked").val();
	
	
	var recentlyExer = $("#exer_cate4 option:selected").val();
	var sessionUserNo = $("#session_user_no").val();
	
	
	var recordList12 = new Array();  
	if(num == 0){
		var recordEvent1 = $('select[name="recordList[0].recordEvent"]').val();
		var recordType1 = $('select[name="recordList[0].recordType"]').val();
		var recordDate1 = $('select[name="recordList[0].recordDate"]').val();
		var recordMatch1 = $('select[name="recordList[0].recordMatch"]').val();
		var recordName1 = $('input[name="recordList[0].recordName"]').val();
		
		
	
		var reVo = {
				recordEvent : recordEvent1,
				recordType : recordType1,
				recordDate : recordDate1,
				recordMatch : recordMatch1,
				recordName : recordName1
		}
		
		recordList12[0] = reVo;
	}else{
		
	
		for(var i = 0; i<num; i++){
			var recordEvent1 = $('select[name="recordList['+i+'].recordEvent"]').val();
			var recordType1 = $('select[name="recordList['+i+'].recordType"]').val();
			var recordDate1 = $('select[name="recordList['+i+'].recordDate"]').val();
			var recordMatch1 = $('select[name="recordList['+i+'].recordMatch"]').val();
			var recordName1 = $('input[name="recordList['+i+'].recordName"]').val();
			
			
		
			var reVo = {
					recordEvent : recordEvent1,
					recordType : recordType1,
					recordDate : recordDate1,
					recordMatch : recordMatch1,
					recordName : recordName1
			}
			
			recordList12[i] = reVo;
			
		}
	}
	
	var pVo = {};
	pVo.height = height;
	pVo.weight = weight;
	pVo.career = career;
	pVo.recentlyExer = recentlyExer;
	pVo.recordList = recordList12;
	pVo.eventList = eventValue;
	pVo.userNo = sessionUserNo;
	console.log(JSON.stringify(pVo));

		$.ajax({
			url : "${pageContext.request.contextPath }/mypage/api/write", //컨트롤러의 url과 파라미터
			type : "post", // 겟 포스트
			contentType : "application/json",
			data : JSON.stringify(pVo),
			
			//dataType : "json",
			success : function() { //성공시
				alert("프로필 등록이 되었습니다");
			},
			error : function(XHR, status, error) { //실패
				console.error(status + " : " + error);
			}
		});
		
		


});
/* 버튼클릭시 date_no값 받아와서 날짜 얻어내기 */
$("#exer_cate").change("click",function(){
			
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
			
					/* 프로필 */
					$("#height_info").val(pMap.profileVo.height);
					$("#weight_info").val(pMap.profileVo.weight);
					$("#major_info").val(pMap.profileVo.major);
					
					
					
					if(pMap.profileVo.career == '프로'){
						
					$("input:radio[name='career']:radio[value='프로']").prop('checked', true);
					
					}else if(pMap.profileVo.career == '아마추어'){
						$("input:radio[name='career']:radio[value='아마추어']").prop('checked', true);
					}
					
					
					
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
	
	if(num == 0){
		num += 1;
		
	}
	
	console.log(num);
	comments2(num);
	num += 1;
});


function record(recordList) {
	
	console.log("레코드");
	$("#record_app").html(" ");
	var listSize = $(recordList).length;
	
	
	num=0;
	
	
	for(var i=0; i < listSize; i++){
	comments(num);
		
	var rname= recordList[i].recordName;
	console.log("레코드네임");
	console.log(rname);
	
	if(recordList[i].recordName == '' || recordList[i].recordDate == null || recordList[i].recordType == null || recordList[i].recordMatch == null){
		
	}else{
		
	
	if(recordList[i].recordEvent == 1 || recordList[i].recordEvent == 2){
		//복싱, 킥복싱
		recordcham1(num,recordList[i],i);
		
		if(recordList[i].recordName != ' '){
			console.log("복싱,킥복싱 있음");
			
			$('#cham_name'+num).val(recordList[i].recordName);
		
		}
		
	}else if (recordList[i].recordEvent = 3){
		
		//ufc
		recordcham2(num,recordList[i],i);
		
		if(recordList[i].recordName != ' '){
			$('#cham_name'+num).val(recordList[i].recordName);
			
		}
		
	}else if (recordList[i].recordEvent = 4){
		
		//주짓수
		recordcham3(num,recordList[i],i);
		
		if(recordList[i].recordName != ' '){
			$('#cham_name'+num).val(recordList[i].recordName);
			
		}
		
	}
	
	}
	


	num += 1;	
	}
	
	
}


function comments(num) {
	
	str = "";
	
	
	str += '<tr class="basic">';

	str += '	<td><label for="prod_cate">종목</label></td>';
	str += '	<td>';
	str += '		<div class="content_product_insert_select_box">';
	str += '			<select data-num="'+num+'" class="even12'+num+'  eveneven" id="even_cate" name="recordList['+num+'].recordEvent">';
	str += '				<option selected>종목</option>';
	str += '				<option value="1">복싱</option>';
	str += '				<option value="2">킥복싱</option>';
	str += '				<option value="3">종합격투기</option>';
	str += '				<option value="4">주짓수</option>';
	str += '			</select>';
	str += '		</div>';
	str += '	</td>';
	str += '</tr>';
	str += '<tr class="basic">';
	str += '<td><label for="prod_cate"></label></td>';
	str += '<td><label for="prod_cate">대회분류</label></td>';
	str += '	<td>';
	str += '		<div class="content_product_insert_select_box">';
	str += '			<select data-yearno="'+num+'" class="cham'+num+'" id="cham_cate" name="recordList['+num+'].recordType">';
	str += '				<option selected>대회분류</option>';

	str += '			</select>';
	str += '		</div>';
	str += '	</td>';
	str += '</tr>';
	str += '<tr id="cate_na'+num+'" class="ba01">';

	str += '</tr>';
	str += '<tr class="cham_year2'+num+'" class="basic">';
	str += '</tr>';
	str += '<tr class="basic">';
	str += '	<td><label for="prod_cate"></label></td>';
	str += '	<td><label for="prod_cate">순위</label></td>';
	str += '	<td>';
	str += '		<div class="content_product_insert_select_box">';
	str += '			<select class="cham_rank'+num+'" id="match_cate" name="recordList['+num+'].recordMatch">';
	str += '				<option  selected>순위</option>';
	str += '			</select>';
	str += '		</div>';
	str += '	</td>';
	str += '</tr>';
	

	$("#record_app").append(str);
	
	
}
function comments2(num) {
	
	str = "";
	
	
	str += '<tr class="basic">';

	str += '	<td><label for="prod_cate">종목</label></td>';
	str += '	<td>';
	str += '		<div class="content_product_insert_select_box">';
	str += '			<select data-num="'+num+'" class="even12'+num+'  eveneven" id="even_cate" name="recordList['+num+'].recordEvent">';
	str += '				<option selected>종목</option>';
	str += '				<option value="1">복싱</option>';
	str += '				<option value="2">킥복싱</option>';
	str += '				<option value="3">종합격투기</option>';
	str += '				<option value="4">주짓수</option>';
	str += '			</select>';
	str += '		</div>';
	str += '	</td>';
	str += '</tr>';
	str += '<tr class="basic">';
	str += '<td><label for="prod_cate"></label></td>';
	str += '<td><label for="prod_cate">대회분류</label></td>';
	str += '	<td>';
	str += '		<div class="content_product_insert_select_box">';
	str += '			<select class="cham'+num+'" id="cham_cate" name="recordList['+num+'].recordType">';
	str += '				<option selected>대회분류</option>';

	str += '			</select>';
	str += '		</div>';
	str += '	</td>';
	str += '</tr>';
	str += '<tr id="cate_na'+num+'" class="ba01">';

	str += '</tr>';
	str += '<tr class="cham_year2'+num+'" class="basic">';
	str += '</tr>';
	str += '<tr class="basic">';
	str += '	<td><label for="prod_cate"></label></td>';
	str += '	<td><label for="prod_cate">순위</label></td>';
	str += '	<td>';
	str += '		<div class="content_product_insert_select_box">';
	str += '			<select class="cham_rank'+num+'" id="match_cate" name="recordList['+num+'].recordMatch">';
	str += '				<option  selected>순위</option>';
	str += '			</select>';
	str += '		</div>';
	str += '	</td>';
	str += '</tr>';
	

	$("#record_app").append(str);
	
	
}

//종목선택
function reback(num){
	$(".cham"+num+"").html(" ");
	
	str="";
	str += '<option data-catena="'+num+'" selected>대회분류</option>';
	
	$(".cham"+num+"").append(str);
	
	$(".cham_year"+num+"").html(" ");
	
	str2 ="";
	str2 +='<option selected>출전연도</option>';
	
	$(".cham_year"+num+"").append(str2);
	
	$(".cham_rank"+num+"").html(" ");
	str3 ="";
	str3 +='<option selected>순위</option>';
	
	$(".cham_rank"+num+"").append(str3);
}

/* 복싱,킥복싱 대회분류 cham1 */

function cham1(num){
	console.log("cham1");
	
	$(".cham"+num+"").html(" ");
	
	str="";
	str += '<option data-catena="'+num+'" selected>대회분류</option>';
	str += '<option data-catena="'+num+'" value="세계선수권대회">세계선수권대회</option>';
	str += '<option data-catena="'+num+'" value="아시아경기대회">아시아경기대회</option>';
	str += '<option data-catena="'+num+'" value="유니버시아드대회">유니버시아드대회</option>'
	str += '<option data-catena="'+num+'" value="아시아선수권대회">아시아선수권대회</option>';
	str += '<option  data-catena="'+num+'" value="지역대회">지역대회</option>';
	
	$(".cham"+num+"").append(str);
	
	$(".cham_year2"+num+"").show();

	
	$(".cham_rank"+num+"").html(" ");
	str3 ="";
	str3 +='<option selected>순위</option>';
	str3 +='<option value="우승">우승</option>';
	str3 +='<option value="준우승">준우승</option>';
	str3 +='<option value="4강">4강</option>';
	str3 +='<option value="8강">8강</option>';
	str3 +='<option value="16강">16강</option>';
	$(".cham_rank"+num+"").append(str3);
}

/* 종합격투기 대회분류 cham1 */

function cham3(num){
	console.log("cham3");
	
	$(".cham"+num+"").html(" ");
	
	strA="";
	strA += '<option data-catena="'+num+'" selected>대회분류</option>';
	strA += '<option data-catena="'+num+'" value="세계수짓수선수권">세계주짓수선수권</option>';
	strA += '<option data-catena="'+num+'" value="비도복세계주짓수선수권">비도복세계주짓수선수권</option>';
	strA += '<option data-catena="'+num+'" value="팬암챔피언쉽">팬암챔피언쉽</option>'
	strA += '<option data-catena="'+num+'" value="유러피언챔피언">유러피언챔피언</option>';
	strA += '<option data-catena="'+num+'" value="IBJJF지역대회">IBJJF지역대회</option>';
	strA += '<option data-catena="'+num+'" value="KBJJF관련대회">KBJJF관련대회</option>';
	strA += '<option  data-catena="'+num+'" value="지역대회">지역대회</option>';
	
	$(".cham"+num+"").append(strA);
	
	$(".cham_year2"+num+"").hide();
	
	
	$(".cham_rank"+num+"").html(" ");
	strA3 ="";
	strA3 +='<option selected>순위</option>';
	strA3 +='<option value="우승">우승</option>';
	strA3 +='<option value="준우승">준우승</option>';
	strA3 +='<option value="4강">4강</option>';
	strA3 +='<option value="8강">8강</option>';
	strA3 +='<option value="16강">16강</option>';
	$(".cham_rank"+num+"").append(strA3);
}


/* 주짓수 대회분류 cham1 */
function cham2(num){
	console.log("cham2");
	
	$(".cham"+num+"").html(" ");
	
	strA="";
	strA += '<option data-catena="'+num+'" selected>대회분류</option>';
	strA += '<option data-catena="'+num+'" value="UFC">UFC</option>';
	strA += '<option data-catena="'+num+'" value="벨라토르">벨라토르(Bellator MMA)</option>';
	strA += '<option data-catena="'+num+'" value="K-1">K-1</option>'
	strA += '<option data-catena="'+num+'" value="PRIDEFC">PRIDE FC</option>';
	strA += '<option data-catena="'+num+'" value="ROAD FC">ROAD FC</option>';
	strA += '<option  data-catena="'+num+'" value="지역대회">지역대회</option>';

	
	$(".cham"+num+"").append(strA);
	
	$(".cham_year2"+num+"").hide();
	
	
	$(".cham_rank"+num+"").html(" ");
	strA3 ="";
	strA3 +='<option selected>순위</option>';
	strA3 +='<option value="우승">우승</option>';
	strA3 +='<option value="준우승">준우승</option>';
	strA3 +='<option value="4강">4강</option>';
	strA3 +='<option value="8강">8강</option>';
	strA3 +='<option value="16강">16강</option>';
	$(".cham_rank"+num+"").append(strA3);
}
/**************불러오기*************/
/* 복싱,킥복싱 대회분류 cham1 */

function recordcham1(num,recordVo,i){
	console.log("cham1");
	console.log(i);
	console.log(num);
	console.log(recordVo);
	$(".cham"+num+"").html(" ");
	
	str="";
	str += '<option selected>대회분류</option>';
	str += '<option data-catena="'+num+'" value="세계선수권대회">세계선수권대회</option>';
	str += '<option data-catena="'+num+'" value="아시아경기대회">아시아경기대회</option>';
	str += '<option data-catena="'+num+'" value="유니버시아드대회">유니버시아드대회</option>'
	str += '<option data-catena="'+num+'" value="아시아선수권대회">아시아선수권대회</option>';
	str += '<option  data-catena="'+num+'" value="지역대회">지역대회</option>';
	
	$(".cham"+num+"").append(str);
	
	$(".cham_year2"+num+"").show();

	
	$(".cham_rank"+num+"").html(" ");
	str3 ="";
	str3 +='<option selected>순위</option>';
	str3 +='<option value="우승">우승</option>';
	str3 +='<option value="준우승">준우승</option>';
	str3 +='<option value="4강">4강</option>';
	str3 +='<option value="8강">8강</option>';
	str3 +='<option value="16강">16강</option>';
	$(".cham_rank"+num+"").append(str3);
	

	
	$("#cham_name"+i).val(recordVo.recordName);
	$('.cham'+i+' option[value="'+recordVo.recordType+'"]').prop('selected', 'selected').change();
	$('.even12'+i+' option[value="'+recordVo.recordEvent+'"]').prop('selected', 'selected').change();
	$('.cham_year'+i+' option[value="'+recordVo.recordDate+'"]').prop('selected', 'selected').change();
	$('.cham_rank'+i+' option[value="'+recordVo.recordMatch+'"]').prop('selected', 'selected').change();
	
}


/* 종합격투기 대회분류 cham2  3번 종합격투기*/
function recordcham2(num,recordVo,i){
	console.log("cham2");
	console.log(i);
	console.log(num);
	console.log(recordVo);
	$(".cham"+num+"").html(" ");
	
	strA="";
	strA += '<option data-catena="'+num+'" selected>대회분류</option>';
	strA += '<option data-catena="'+num+'" value="UFC">UFC</option>';
	strA += '<option data-catena="'+num+'" value="벨라토르">벨라토르(Bellator MMA)</option>';
	strA += '<option data-catena="'+num+'" value="K-1">K-1</option>'
	strA += '<option data-catena="'+num+'" value="PRIDEFC">PRIDE FC</option>';
	strA += '<option data-catena="'+num+'" value="ROAD FC">ROAD FC</option>';
	strA += '<option data-catena="'+num+'" value="지역대회">지역대회</option>';

	
	$(".cham"+num+"").append(strA);
	
	$(".cham_year2"+num+"").hide();
	
	
	$(".cham_rank"+num+"").html(" ");
	strA3 ="";
	strA3 +='<option selected>순위</option>';
	strA3 +='<option value="우승">우승</option>';
	strA3 +='<option value="준우승">준우승</option>';
	strA3 +='<option value="4강">4강</option>';
	strA3 +='<option value="8강">8강</option>';
	strA3 +='<option value="16강">16강</option>';
	$(".cham_rank"+num+"").append(strA3);
	
	$("#cham_name"+i).val(recordVo.recordName);
	$('.cham'+i+' option[value="'+recordVo.recordType+'"]').prop('selected', 'selected').change();
	$('.even12'+i+' option[value="'+recordVo.recordEvent+'"]').prop('selected', 'selected').change();
	$('.cham_year'+i+' option[value="'+recordVo.recordDate+'"]').prop('selected', 'selected').change();
	$('.cham_rank'+i+' option[value="'+recordVo.recordMatch+'"]').prop('selected', 'selected').change();
	
	console.log("종합격투기 끝");
}


/* 주짓수 대회분류 cham3 */

function recordcham3(num,recordVo,i){
	console.log("cham3");
	
	$(".cham"+num+"").html(" ");
	
	strA="";
	strA += '<option data-catena="'+num+'" selected>대회분류</option>';
	strA += '<option data-catena="'+num+'" value="세계수짓수선수권">세계주짓수선수권</option>';
	strA += '<option data-catena="'+num+'" value="비도복세계주짓수선수권">비도복세계주짓수선수권</option>';
	strA += '<option data-catena="'+num+'" value="팬암챔피언쉽">팬암챔피언쉽</option>'
	strA += '<option data-catena="'+num+'" value="유러피언챔피언">유러피언챔피언</option>';
	strA += '<option data-catena="'+num+'" value="IBJJF지역대회">IBJJF지역대회</option>';
	strA += '<option data-catena="'+num+'" value="KBJJF관련대회">KBJJF관련대회</option>';
	strA += '<option data-catena="'+num+'" value="지역대회">지역대회</option>';
	
	$(".cham"+num+"").append(strA);
	
	$(".cham_year2"+num+"").hide();
	
	
	$(".cham_rank"+num+"").html(" ");
	
	$(".cham_rank"+num+"").append(strA3);
	
	$("#cham_name"+i).val(recordVo.recordName);
	$('.cham'+i+' option[value="'+recordVo.recordType+'"]').prop('selected', 'selected').change();
	$('.even12'+i+' option[value="'+recordVo.recordEvent+'"]').prop('selected', 'selected').change();
	$('.cham_year'+i+' option[value="'+recordVo.recordDate+'"]').prop('selected', 'selected').change();
	$('.cham_rank'+i+' option[value="'+recordVo.recordMatch+'"]').prop('selected', 'selected').change();
	
}

function catena(num){
	
	$("#cate_na"+num+"").html(" ");
	str = "";
	str += '<td><label for="prod_cate"></label></td>';
	str += '<td><label for="cham_name">대회명</label></td>';
	str += '	<td>';
	str += '	<div class="content_product_insert_select_box">';
	str += '		<input class="cate_cham_name" type="text" id="cham_name'+num+'" placeholder="대회명을 입력해주세요." name="recordList['+num+'].recordName" >';
	str += '	</div>';
	str += '</td>';
	
	$("#cate_na"+num+"").append(str);
	
	
}

function cateyear(num){
	
	$(".cham_year2"+num+"").html(" ");
	
	str = "";
	
	str += '<td><label for="prod_cate"></label></td>';
	str += '<td><label for="prod_cate" >출전연도</label></td>';
	str += '<td>';
	str += '	<div class="content_product_insert_select_box">';
	str += '		<select class="cham_year'+num+'" id="even_year" name="recordList['+num+'].recordDate">';
	str += '			<option selected>출전연도</option>';	
	str += '			<option value="4년 주기 대회">4년 주기 대회</option>';
	str += '			<option value="3년 주기 대회">3년 주기 대회</option>';
	str += '			<option value="2년 주기 대회">2년 주기 대회</option>';
	str += '			<option value="1년 주기 대회">1년 주기 대회</option>';
	
	str += '		</select>';
	str += '	</div>';
	str += '</td>';
	
	$(".cham_year2"+num+"").append(str);
}

</script>

</html>