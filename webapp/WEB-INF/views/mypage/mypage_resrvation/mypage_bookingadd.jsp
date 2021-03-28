<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 메타데이터 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/booking.css">

<!-- CSS -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>

<link href='${pageContext.request.contextPath }/assets/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath }/assets/fullcalendar/lib/main.js'></script>

<!-- ////////////////////////////////////////// -->

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	width: 800px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
	<!--//header//-->
		</div>
	</div>
	<!-- Header end -->

	<!-- wrap -->
	<div class="wrap">
		<div class="container">
			<div class="middle">
				<c:import url="/WEB-INF/views/include/sidemenu.jsp"></c:import>
				<!--//side_menu//-->

				<!--////////////////////////////////////////////-->

				<div class="content_seller">
					<div class="content_booking_header">
						<div>대관 등록</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>


					<!--체육관 불러오기-->
					<div class="booking_gym_info">
						<table class="booking_gym_table">
							<tr>
								<td rowspan="8"><img class="gym_info_img" name="스파링장"
									src="${pageContext.request.contextPath }/assets/image/스파링장.jpeg"></td>
								<td class="gym_info_title gap">체육관 이름</td>
							</tr>

							<tr>
								<td class="gap_info">${gymVo.gym_name}</td>
							</tr>

							<tr>
								<td class="gym_info_title gap">체육관 주소</td>
							</tr>

							<tr>
								<td class="gap_info">${gymVo.gym_address}</td>
							</tr>

							<tr>
								<td class="gym_info_title gap">체육관 운영시간</td>
							</tr>

							<tr>
								<td class="gap_info">${gymVo.gym_time}</td>
							</tr>

<!-- 							<tr>
								<td class="gym_info_title gap">체육관 편의시설</td>
							</tr>

							<tr>
								<td class="gap_info">(불러온 체육관 편의시설)</td>
							</tr> -->

						</table>
					</div>
					<!--//체육관 불러오기-->

					<!-- 달력 라이브러리 -->
					<div id='calendar'></div>


				</div>
			</div>
			<!--//middle-->
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->
		</div>
		<!--//container-->
	</div>
	<!--//wrap-->
	
	<!-- ///////////////////////////////////////////////// -->
	
<%-- 	values(seq_booking_no.nextval, 
       #{gym_no}, 
       #{booking_date}, 
       #{booking_start}, 
       #{booking_end}, 
       #{booking_price}, 
       '대기중', 
       sysdate) --%>
			       
	<!-- 날짜 등록 모달창 -->
	<div class="modal fade" id="addModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">대관 등록</h4>
				</div>
				
				<form method="post" action="${pageContext.request.contextPath }/mypage/book/bookadd"> <!-- 대관등록 주소 추가 -->
					<div class="modal-body">
						<div class="form-group">
							<label class="form-text">날짜</label> 
							&nbsp
							<input id="addModalContent" type="text" name="booking_date" value="" >
						</div>
						<div class="form-group">
							<label class="form-text">시간</label>
							&nbsp
							<input id="addModalContent" type="text" name="booking_start" value="" placeholder="시작시간 ex)11:00">
							&nbsp~&nbsp
							<input id="addModalContent" type="text" name="booking_end" value="" placeholder="종료시간 ex)13:00">	
						</div>
						<div class="form-group">
							<label class="form-text">요금</label>
							&nbsp
							<input id="addModalContent" type="text" name="booking_price" value="" >
						</div>
					</div>
					<input type="hidden" name="gym_no" value="${gymVo.gym_no}">
					<div class="modal-footer">
						<button type="submit" class="btn" id="btnUpload">등록</button>
					</div>
				</form>
				
				
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
</body>

<script type="text/javascript">

	//체육관 번호
	var gymno = "${gymVo.gym_no}";
	console.log("체육관번호 "+gymno);
	
	var books = bookList(gymno);
	console.log("제발"+books);
	
	
	//대관 리스트
	function bookList(gymno){
		
		var bookings = new Array();
		var item = new Object;
			
		$.ajax({
			url: "${pageContext.request.contextPath}/mypage/book/booklist",
			type: "post",
			//contentType : "application/json",
			data : {gymno: gymno},
				
			dataType: "json",
			success: function(bookList) {
				console.log(bookList);
				
				for(var i=0; i<bookList.length; i++){ //시간(title), 날짜(start)
		            var vo = bookList[i]
					var tStart = vo.booking_start;
		            var tEnd = vo.booking_end;
		            var date = vo.booking_date;
		            console.log(date);
		            console.log(tStart);
		            console.log(tEnd);
		            
		            item = {
		            	title: tStart+"~"+tEnd,
		            	start: date
		            }
		            
		            bookings.push(item);
				}
				//books = JSON.stringify(bookings);
				
				//console.log(books);
				//return books;
				
				console.log(bookings);

			},
			error : function(XHR, status, error) { 
				console.error(status + " : " + error);
			}

		}); //ajax
		
		return JSON.stringify(bookings);
		//return bookings;
	} //bookList
	

	
	////////////////////////////////////////////////

	//달력
	document.addEventListener('DOMContentLoaded', function() {
		
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prevYear,prev,next,nextYear today',
				center : 'title',
				right : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			//selectable
			initialView : 'dayGridMonth',
			selectable : true,
			//날짜 클릭시 알림창
			dateClick : function(info) {
				//alert('Date: ' + info.dateStr);
				//alert('Resource ID: ' + info.resource.id);
				var bdate = info.dateStr;
				console.log(bdate);
				
				//모달창을 띄우기 전에 데이터가 들어가 있어야 하니까 데이터 넣고 모달 띄워야 날짜가 안 밀림
				$("#addModal").on('show.bs.modal', function(){
					console.log(bdate);
					$("[name='booking_date']").val(bdate);
				});	
				
				$("#addModal").modal();
			},
			//initialDate: '', 시작날짜 미지정시 현재 날짜로
			navLinks : false, // can click day/week names to navigate views
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
		
			events : bookList(gymno)
				
		});//calender

		calendar.render();
	});//document

	//successCallback(data)
	
	
</script>

</html>