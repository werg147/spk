<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>store</title>
    <link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/store.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
</head>

<body class="proBody">
    
<div class="wrap">
    <div class="container">
        
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	    <!--//header//-->

    </div><!--//container-->
</div><!--//wrap-->



<div class="wrap">
  <div class="container">
  

		<!--상단여백-->
		<div class="searching_item"><!----></div>

		<div class="section_view">
			
			<div id="sectionView">
				

					<img src="${pageContext.request.contextPath}/upload/${productVo.prod_img_savename}" alt="상품 대표 이미지" class="bg" width="430" height="552"> <!--상품 대표 이미지-->

					<!--상품 정보,선택,가격,장바구니,구매 영역-->
					<div class="goods_area"> 

						<!--[브랜드명] 상품명-->
						<div class="goods_name">
							<strong class="name">[${productVo.prod_brand}] ${productVo.prod_name}</strong>
						</div> 
					
						<!--상품 가격-->
						<div class="goods_price">
							<span class="position">
									<span class="price"><fmt:formatNumber value="${productVo.prod_price}" pattern="#,###"/><span class="won">원</span></span>
									<div>
										<c:if test="${empty authUser.user_no}">
											<span class="not_login">로그인 후, 적립혜택이 제공됩니다.</span>
										</c:if>
									</div>
							</span>
						</div>
						
						<div class="goods_info">	
						
							<!-- 수량, 총 금액 form -->
							<form name="proform" method="get">
								
								<!-- 색상 셀렉 -->
								<dl class="list fst">
									<dt class="tit">색상</dt> 
									<dd class="desc">
										<select class="prod prod_color">
											<option selected>선택하기</option>
											<c:forEach items="${productVo.cssList}" var="cssVo">
												<option>${cssVo.color}</option>
											</c:forEach>
										</select>	
									</dd>
								</dl>
								
								
								<!-- 사이즈 셀렉 -->	
								<dl class="list fst">
									<dt class="tit">사이즈</dt> 
									<dd class="desc">
										<select class="prod prod_size">
											<option selected>선택하기</option>
											<c:forEach items="${productVo.sizeList}" var="siVo">
												<option>${siVo.prod_size}</option>
											</c:forEach>
										</select>
									</dd>
								</dl>
						
								
								
								<div id="cartPut">
	
									<div class="list_goods">
										<ul id="list_li" class="list">
										
										</ul>
									</div>
								</div> 	<!--cartPut-->
		
								
								<div class="price_total">
									
									
									<div class="total">
										<div class="price">
											<strong class="tit totit">총 상품금액 :</strong> 
											<span class="sum">
											<span class="num totalSum"><input type="text" class="num" name="sum" size="11" readonly value="0"></span> <span class="won">원</span></span>
										</div> 
										<p class="txt_point">
											<c:if test="${empty authUser.user_no}">
												<span class="ico">적립</span> 
												<span class="no_login"> 
													<span>로그인 후, 적립혜택 제공</span>
												</span>
											</c:if>
											
										</p>
									</div>
									
									
									<div class="group_btn">
										<div class="view_function">
											<button type="button" class="btn_form btn_buy">바로 구매</button> 
											<button type="button" id="btn_cart" class="btn_form btn_cart">장바구니</button>
										</div> 
									</div>
								</div>
								
								<input type="hidden" class="prod_no" name="prod_no" value="${productVo.prod_no}">
								<!-- <input type="hidden" class="colorsize_no" name="colorsize_no" value="${productVo.cssList[0].colorsize_no}">	 -->						
								
					
							</form> <!-- 수량, 총 금액 form -->
							
							<input type="hidden" name="prod_price" value="${productVo.prod_price}">
							
					</div>

					</div> <!--goods_area-->
			</div> <!--id sectionView-->
		</div> <!--//section_view-->

		<div>

		</div>


		<!--상품 정보 영역-->
		<div class="layout_wrap goods_view_area">

			<!--상세정보,상품정보,고객후기,상담문의 탭-->
			<div class="goods_tab" id="proDesc">
				<ul class="goods_view_tab">
					<li>
						<a href="#proDesc">상품설명</a>
					</li>
					<li>
						<a href="#proInfo">상품정보</a>
					</li>
					<li>
						<a href="#proReview">고객후기</a>
					</li>
					<li>
						<a href="#proQna">상담문의</a>
					</li>
				</ul>
			</div> <!--goods_tab-->

			<!--상세정보(이미지)-->
			<div class="goods_view">
				<img src="${pageContext.request.contextPath}/upload/${productVo.prod_detail_img_savename}" alt="상품 추가 이미지" class="bg">
			</div>





			<!--상세정보,상품정보,고객후기,상담문의 탭-->
			<div class="goods_tab" id="proInfo">
				<ul class="goods_view_tab">
					<li>
						<a href="#proDesc">상품설명</a>
					</li>
					<li>
						<a href="#proInfo">상품정보</a>
					</li>
					<li>
						<a href="#proReview">고객후기</a>
					</li>
					<li>
						<a href="#proQna">상담문의</a>
					</li>
				</ul>
			</div> <!--goods_tab-->

			
			<!--상품정보-->
			<div class="goods_view_infomation" id="goods_infomation">
				<table width="100%" border="0" cellpadding="0" cellspacing="1" class="extra-information">
					<tbody>
						<tr>
							<th scope="row" class="goods-view-form-table-heading">제품소개</th><td>${productVo.prod_desc}</td>
							<th scope="row" class="goods-view-form-table-heading">제조,수입내용</th><td>${productVo.prod_from}</td>
						</tr>
						<tr>
							<th scope="row" class="goods-view-form-table-heading">세탁방법주의</th><td>${productVo.prod_wash}</td>
							<th scope="row" class="goods-view-form-table-heading">품질보증기준</th><td>${productVo.prod_qual}</td>
						</tr>
					</tbody>
				</table>
			</div> <!--.goods_view_infomation #goods_infomation-->
				
				
				
			<!--상세정보,상품정보,고객후기,상담문의 탭-->
			<div class="goods_tab" id="proReview">
				<ul class="goods_view_tab">
					<li>
						<a href="#proDesc">상품설명</a>
					</li>
					<li>
						<a href="#proInfo">상품정보</a>
					</li>
					<li>
						<a href="#proReview">고객후기</a>
					</li>
					<li>
						<a href="#proQna">상담문의</a>
					</li>
				</ul>
			</div> <!--goods_tab-->

			<!--고객후기-->	
			<div class="goods_view_board" id="goods_board">
				<div id="contents-wrapper" class="goods_board">
					<div class="xans-element- xans-product xans-product-additional detail_board  ">
						<div class="board">
							<span class="line"></span>
							

								<div class="title_txt">
									<h2>PRODUCT REVIEW</h2>

									<div class="sort-wrap">
										<ul class="list_type1 old">
											<li>
												<span class="ico"></span>
												<p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.	
												</p>
											</li>
											<li>
												<span class="ico"></span>
												<p class="txt">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.
												</p>
											</li>
										</ul>

										<div class="left_sort">
											<span> 여백 <!--여백--> </span>
										</div>

										<div class="sort" style="bottom:-9px">
											<select class="sort_select" onchange="this.form.sort.value=this.value;this.form.submit()">
												<option value="1">최근등록순</option>
												<option value="2">조회많은순</option>
											</select>
										</div>
									</div> <!--sort-wrap-->
								</div> <!--title_txt-->

								<table class="xans-board-listheader" width="100%" border="0" cellpadding="0" cellspacing="0">
									<caption style="display:none">구매후기 제목</caption>
										<colgroup>
											<col style="width:70px;">
											<col style="width:auto;">
											<col style="width:51px;">
											<col style="width:117px;">
											<col style="width:100px;">
											<col style="width:80px;">
										</colgroup>

										<tbody>
											<tr>
												<th scope="col" class="input_txt">번호</th>
												<th scope="col" class="input_txt">제목</th>
												<th scope="col" class="input_txt">
													<a class="board_hidden"><!--히든--> </a>
												</th>
												<th scope="col" class="input_txt" align="left">작성자</th>
												<th scope="col" class="input_txt">작성일</th>
												<th scope="col" class="input_txt">조회</th>
											</tr>
										</tbody>
								</table>


								
								<!--리뷰글 리스트-->
								<c:forEach items="${productVo.reList}" var="reVo">
									<div class="tr_line">
										<table class="xans-board-listheaderd tbl_newtype1" width="100%" cellpadding="0" cellspacing="0" onclick="view_content(this,event,'notice')">
	
										<caption style="display:none">구매후기 내용</caption>
											<colgroup>
												<col style="width:70px;">
												<col style="width:auto;">
												<col style="width:51px;">
												<col style="width:117px;">
												<col style="width:100px;">
												<col style="width:80px;">
											</colgroup>
	
										<tbody>
										
										
											<tr>
												<td align="center" class="reviewNo">
													${reVo.review_no}
												</td>
												<td class="subject">
													<div>${reVo.review_title}</div>
												</td>
												<td class="user_grade grade_comm">
													<a class="board_hidden"> </a>
												</td>
												<td class="user_grade">
													${reVo.nickname}
												</td>
												<td class="time">
													${reVo.review_date}
												</td>
												<td>
													<span class="review-hit-cnt" data-sno="6412655">${reVo.review_hit}</span>
												</td>
											</tr>
										
											
										</tbody>
									</table>
							
				 					<!-- review_content -->
									<div class="review_view" style="display: none;">
										<div class="inner_review">
											<div class="name_purchase">
												<strong class="name"></strong>
												<p class="package"></p>
											</div>
											
											<c:if test="${not empty reVo.review_img_savename}">
												<div class="review_photo">
													<img src="${pageContext.request.contextPath}/upload/${reVo.review_img_savename}" border="0"><br><br>
												</div>
											</c:if>
												
											<div>
												${reVo.review_content}
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

							
							<p class="btnArea after">
								<a href="${pageContext.request.contextPath}/store/reviewForm?prodNo=${param.prodNo}">
									<span class="bhs_button">후기쓰기</span>
								</a>
							</p>

						</div> <!--board-->
						
		

						<!-- 페이징 버튼 영역 -->
						<div id="paging">
							<ul>
							<li><a href="">◀</a></li>
							<li class="active"><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">4</a></li>
							<li><a href="">5</a></li>
							<li><a href="">6</a></li>
							<li><a href="">7</a></li>
							<li><a href="">8</a></li>
							<li><a href="">9</a></li>
							<li><a href="">10</a></li>
							<li><a href="">▶</a></li>
							</ul>
							
							
							<div class="clear"></div>
						</div>
					</div> <!--xans-element- xans-product xans-product-additional detail_board-->
				</div> <!--.goods_view_board #goods_board-->


				<div class="tab_padding"></div>

				<!--상세정보,상품정보,고객후기,상담문의 탭-->
				<div class="goods_tab" id="proQna">
					<ul class="goods_view_tab">
					<li>
						<a href="#proDesc">상품설명</a>
					</li>
					<li>
						<a href="#proInfo">상품정보</a>
					</li>
					<li>
						<a href="#proReview">고객후기</a>
					</li>
					<li>
						<a href="#proQna">상담문의</a>
					</li>
				</ul>
				</div> <!--goods_tab-->

				<!--상담문의-->	
				<div class="goods_view_board" id="goods_board">
					<div id="contents-wrapper" class="goods_board">
						<div class="xans-element- xans-product xans-product-additional detail_board  ">
							<div class="board">
								<span class="line"></span>
									<div class="title_txt">
										<h2>PRODUCT Q&amp;A</h2>

										<ul class="list_type1 old">
											<li>
												<span class="ico"></span>
												<p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
												</p>
											</li>
											<li>
												<span class="ico"></span>
												<p class="txt">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.
												</p>
											</li>
										</ul>
									</div>
									
									
									
										<table class="xans-board-listheader" width="100%" border="0" cellpadding="0" cellspacing="0">
										
											<tbody>
												<tr>
													<th width="70" scope="col" class="input_txt">번호</th>
													<th width="134" scope="col" class="input_txt board_hidden">
													</th>
													<th width="631" scope="col" class="input_txt">제목</th>
													<th width="80" scope="col" class="input_txt">작성자</th>
													<th width="80" scope="col" class="input_txt">작성일</th>
												</tr>
											</tbody>
										</table>
	
										
										<!--상담글 리스트 출력-->
										<div id="qnaListArea">
											
										</div>
										
										<c:forEach items="${productVo.qnaList}" var="qnaVo">
										<div class="tr_line">										  	
											<table width="100%" class="xans-board-listheaderd">
												<tbody>
														<input type="hidden" name="qnaType" value="${qnaVo.qna_type}">
														<tr>
															<td width="70" align="center">
																${qnaVo.qna_no}
															</td>
															<td width="134">
																<a class="board_hidden"> </a>	
															</td>
															<td class="image" style="padding:22px 19px 23px; text-align:left;">
																<div style="padding:3px 0px 0px 20px;">
																	<p class="subject">${qnaVo.qna_title}</p>
																</div>
															</td>
															<td width="80">
																작성자
															</td>
															<td width="80" style="color:#939393">
																${qnaVo.qna_date}
															</td>
														</tr>
													
													
												</tbody>
											</table>
											
											<!-- qna_content (리뷰와 같아서 이름겹치게 둠)-->
											<div class="review_view" style="display: none;">
												<div class="inner_review">
													<div class="name_purchase">
														<strong class="name"></strong>
														<p class="package"></p>
													</div>
													
													<c:if test="${not empty qnaVo.qna_img_savename}">
														<div class="review_photo">
															<img src="${pageContext.request.contextPath}/upload/${qnaVo.qna_img_savename}" border="0"><br><br>
														</div>
													</c:if>
														
													<div>
														${qnaVo.qna_content}
													</div>
												</div>
											</div>
										</div>
									</c:forEach>	
				

								<p class="btnArea after">
									<a href="${pageContext.request.contextPath}/store/qnaForm?prodNo=${param.prodNo}">
										<span class="bhs_button">상품문의</span>
									</a>
								</p>


								<!-- 페이징 버튼 영역 -->
								<div id="paging">
									<ul>
										<li><a href="">◀</a></li>
										<li class="active"><a href="">1</a></li>
										<li><a href="">2</a></li>
										<li><a href="">3</a></li>
										<li><a href="">4</a></li>
										<li><a href="">5</a></li>
										<li><a href="">6</a></li>
										<li><a href="">7</a></li>
										<li><a href="">8</a></li>
										<li><a href="">9</a></li>
										<li><a href="">10</a></li>
										<li><a href="">▶</a></li>
									</ul>									
									<div class="clear"></div>
								</div>


							</div> <!--board-->
						</div> <!--xans-element- xans-product xans-product-additional detail_board-->

					</div> <!--id="contents-wrapper" class="goods_board"-->

				</div> <!--.goods_view_board #goods_board-->
			</div> <!--class="goods_view_board" id="goods_board"-->

			
		</div> <!--layout_wrap goods_view_area-->
		
		
		<!-- <input type="text" id="authuser" value="${authUser.user_no}"> -->

		<a id="back-to-top"><img src="${pageContext.request.contextPath}/assets/image/store_img/up.png"></a>
		<br><br><br><br><br><br><br><br><br>
		
		
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!--//footer//-->
		


	</div><!--//container-->
</div><!--//wrap-->


<!-- 장바구니 모달창 -->
	<div class="modal fade" id="modal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
				
					<div id="mtext">
						<p class="m_message">장바구니에 상품이 담겼습니다.</p>
					</div>
			
				</div>
				<div class="m_footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">계속 쇼핑하기</button>
					<button id="goCart" type="button" class="btn btn-primary">장바구니 가기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<input type="hidden" name="user_no" value="${authUser.user_no}">

</body>


<script type="text/javascript">

	//상품 가격 가져오기 / 배열만들기
    var prod_price = ${productVo.prod_price};
    var prodList = [];



	//리뷰보기
	$(document).ready(function(){
		
		$(".tr_line").click(function(){
			
			$(this).find(".review_view").toggle();
			
			
		});
	});
	

	//일단 넘어가고 나중에 걸러주기로	
	$(".bhs_button").on("click",function(){
		
		var user_no = $("[name='user_no']").val();
		console.log(user_no);
		
		if(user_no == null){
			alert('로그인 후 작성 가능합니다.'); 
		} else {
			console.log("로그인했음");
		}
		
	});
		
		
	

	//맨 위로 가기 버튼
	$(function(){
		  $('#back-to-top').on('click',function(e){
		      e.preventDefault();
		      $('html,body').animate({scrollTop:0},600);
		  });
		  
		  $(window).scroll(function() {
		    if ($(document).scrollTop() > 100) {
		      $('#back-to-top').addClass('show');
		    } else {
		      $('#back-to-top').removeClass('show');
		    }
		  });
		});
	
	
	
	//셀렉 옵션 선택시
	$(".prod").on("click", function(){
		//1.두개 모두 선택했을때 --> 셀렉값 넣기
		
		//셀렉값 넣기
		var prod_no = $("[name='prod_no']").val();
		var color = $(".prod_color").val();
		var prod_size = $(".prod_size").val();
		
		
		if(color !== '선택하기' && prod_size !== '선택하기'){
			//셀렉옵션이 전부 선택됐을때
			console.log("옵션 셀렉됨");
			console.log(prod_no);
			console.log(color);
			console.log(prod_size);
			
			
			//2.선택된 옵션 리스트 보여주기
			var str = "";
			
			str += '<li class="on" data-color="'+ color +'" data-size="'+ prod_size +'" >';
			str += '	<span class="btn_position on">';
			str += '		<button type="button" class="btn_del">';
			str += '			<span class="txt">x</span>';
			str += '		</button>';
			str += '	</span>';
			str += '	<span class="name">[${productVo.prod_brand}] ${productVo.prod_name} :: ' + color + " / " + prod_size + '</span>';
			str += '	<div class="option">';
			str += '		<dl class="list">';
			str += '			<dt class="tit_op">';
			str += '				<input type=hidden name="prod_price" value="${productVo.prod_price}">';
			str += '			</dt> ';
			str += '			<dd class="desc">';
			str += '				<div class="countpm">';
			str += '					<span class="count">';
			str += '						<button type="button" class="btnmp down on" value="minus">';
			str += '							<img src="${pageContext.request.contextPath}/assets/image/store_img/ico_minu.jpg">';
			str += '					    </button>';
			str += '						<span class="amountt read_only result" data-color="'+ color +'"  data-size="'+ prod_size +'">0</span>';
			str += '						<button type="button" class="btnmp up on" value="plus">';                            
			str += '							<img src="${pageContext.request.contextPath}/assets/image/store_img/ico_plus.jpg">';
			str += '						</button>';
			str += '					</span>';
			str += '				</div>';
			str += '			</dd>';
			str += '		</dl>';
			str += '		<div class="total">';
			str += '			<div class="price_it">';
			str += '				<span class="sum sum_it">';
			str += '				<input type="text" class="sum_in" name="sum_it" value="0"></span><span class="won">원</span>';
			str += '			</div> ';
			str += '		</div>';
			str += '	</div>';
			str += '</li>';
			
			$("#list_li").append(str);
			
			//데이터값 조회
			console.log("데이터 컬러값")
			var data = $("#data").data();
			console.log(data);
			
			//3.셀렉 초기화하기
			$(".prod_color").val("선택하기");
			$(".prod_size").val("선택하기");

			
		}
	
	});

	
	
	//총 상품금액
	var sum = 0;
	
	//개수 - + 클릭시
	$("#list_li").on("click", ".btnmp", function(){
		console.log("+-클릭");
		
		var btn = $(this);
		var isPM = btn.val();  // + - 버튼 구분
		
		
		// 더하기/빼기
	    if(isPM === 'plus') {
		   console.log("플러스")
		   var crtCnt = btn.prev().text();
		   nowCnt = parseInt(crtCnt) + 1;
		   btn.prev().text(nowCnt); //개수 값 변경 +1
		   
		    
		   btn.parents(".list").next().children(".sum_in").val();

		   //console.log(btn.parents(".list").next().find(".sum_in").val("콘솔"));
		   
		   //플러스 값
		   var p_total = prod_price * nowCnt;
		   console.log("플러스 값: " + p_total);
		   
		   console.log(btn.parents(".list").next().find(".sum_in").val(p_total));
		  
		   //총액
		   sum = sum + prod_price;
		   console.log("총액: " + sum);
	  
        }else if(isPM === 'minus')  {
           var crtCnt = btn.next().text();
           
           if(crtCnt>1){
        	   console.log("마이너스")
        	   nowCnt = parseInt(crtCnt) - 1;
               btn.next().text(crtCnt-1); //개수 값 변경 -1
               
               //마이너스 값
               var m_total = prod_price * nowCnt;
    		   console.log("마이너스 값: " + m_total);
    		   
    		   console.log(btn.parents(".list").next().find(".sum_in").val(m_total));
               
    		   //총액
               sum = sum - prod_price;
               console.log("총액: " + sum);
              
           }
		}
		
		//토탈금액
		$(".totalSum").html('<span class="totalSum"><input type="text" class="num" name="sum" size="11" readonly value="'+ sum +'"></span>');
		
	});
	
	
	
	
	//장바구니 클릭시 cart insert --> 장바구니/계속쇼핑 버튼
	$("#btn_cart").on("click", function(){
		
		//버튼 클릭 테스트
		console.log("장바구니 버튼 클릭");
		event.preventDefault();
		
		var proList = [];
		
		/* 상품번호 */
		var prod_no = $("[name='prod_no']").val();
		
		var lis = $("#list_li>li");
		console.log(lis)

		lis.each(function () {
			var li = $(this);
			var color = li.data("color");
			var size = li.data("size");
			var count = li.find(".result").text() ;
			
			if(count >= 1){
				var prodVo ={};
				prodVo.prod_no = prod_no;
				prodVo.color = color;
				prodVo.prod_size = size;
				prodVo.count = count;
				
				proList.push(prodVo);
			} else {
				console.log("개수 0개");
			}
			
			
		});
		
		console.log(proList);
		
		//장바구니가기 페이지이동 링크
		var url = "${pageContext.request.contextPath}/mypage/cart";
		
		$.ajax({
			
			url : "${pageContext.request.contextPath}/mypage/gotoCart",		
			contentType : "application/json",
			data : JSON.stringify(proList),
			type : 'post',
			
			
			success : function(success){
				console.log("성공여부" + success);
				
				if(success == 0){
					alert("수량이 1개 이상이어야 합니다.");
					return false;
				} else {
					//장바구니/계속쇼핑
					console.log("모달 창 호출");
					
					//모달 창 호출
					$("#modal").modal();
	                
					$("#goCart").on("click", function(){
						//장바구니가기 클릭시 페이지이동
						$(location).attr('href',url);
					});
				}
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});	
		
		
	
		
	});
		
	
	
	//바로구매 클릭시
	$(".btn_buy").on("click",function(){
		
		//버튼 클릭 테스트
		console.log("바로구매 버튼 클릭");
		
		var proList = [];
		
		/* 상품번호 */
		var prod_no = $("[name='prod_no']").val();
		
		var lis = $("#list_li>li");
		console.log(lis)

		lis.each(function () {
			var li = $(this);
			var color = li.data("color");
			var size = li.data("size");
			var count = li.find(".result").text() ;
			
			if(count >= 1){
				var prodVo ={};
				prodVo.prod_no = prod_no;
				prodVo.color = color;
				prodVo.prod_size = size;
				prodVo.count = count;
				
				proList.push(prodVo);
			} else {
				console.log("개수 0개");
			}
			
			
		});
		
		console.log(proList);
		
		//바로구매 결제폼 이동
		var url = "${pageContext.request.contextPath}/store/payform";
		
		$.ajax({
			
			url : "${pageContext.request.contextPath}/store/paynow",		
			contentType : "application/json",
			data : JSON.stringify(proList),
			type : 'post',
			
			
			success : function(success){
				console.log("성공여부" + success);
				
				if(success == 0){
					alert("수량이 1개 이상이어야 합니다.");
					return false;
				} else {
					$(location).attr('href',url);
				}
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});	
		
		
	});
	
	
	
	
	


</script>
</html>