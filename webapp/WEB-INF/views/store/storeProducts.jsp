<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/store.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
</head>

<body class="proBody" onload="init();">
    
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
										<span class="not_login">로그인 후, 적립혜택이 제공됩니다.</span>
									</div>
							</span>
						</div>
						
						<!--색상 (있을때)--><!--사이즈(없을때)--> 
						
						<div class="goods_info">
							
							
								<dl class="list fst">
									<dt class="tit">색상</dt> <dd class="desc">${productVo.cssList[0].color}</dd>
								</dl> 
	
							
								<dl class="list">
									<dt class="tit">사이즈</dt> <!----> <dd class="desc">${productVo.cssList[0].prod_size}</dd>
								</dl>
							
							
							<!--사이즈 (있을때)-->
							<!--
							<dl class="list fst">
								<dt class="tit">사이즈</dt> 
								<dd class="desc">
									<select id="prod_cate">
										<option selected>선택하기</option>
										<option>S</option>
										<option>M</option>
										<option>L</option>
										<option>XL</option>
									</select>
								</dd>
							</dl>
							-->

						<!--개수 
							<dl class="list">
								<dt class="tit">개수</dt> <dd class="desc">1개</dd>
							</dl>
							
							<div class="countpm">
								<span class="count">
									<button type="button" class="btn down on">수량내리기</button> 
									<input type="number" readonly="readonly" onfocus="this.blur()" class="inp"> 
									<button type="button" class="btn up on">수량올리기</button>
								</span>
							</div>
						-->
							
								<!-- 수량, 총 금액 form -->
								<form name="form" method="get">
								<dl class="list">
									<dt class="tit">
										수량 : <input type=hidden name="sell_price" value="${productVo.prod_price}">
									</dt> 
									<dd class="desc">
										<div class="countpm">
											<span class="count">
												<button type="button" class="btn down on" value=" - " onclick="del();">
													<img src="${pageContext.request.contextPath}/assets/image/store_img/ico_minu.jpg">
											    </button> 
												<input type="text" class="amount read_only" name="amount" value="1" size="3" onchange="change();">
												<button type="button" class="btn up on" value=" + " onclick="add();">
													<img src="${pageContext.request.contextPath}/assets/image/store_img/ico_plus.jpg">
												</button>
											</span>
										</div>
										
									</dd>
								</dl>
									
									

									
									<div class="price_total">
										<!--총 금액-->
										<div class="total">
											<div class="price">
												<strong class="tit totit">총 상품금액 :</strong> 
												<span class="sum">
												<span class="num"><input type="text" class="num" name="sum" size="11" readonly></span> <span class="won">원</span></span>
											</div> 
											<p class="txt_point">
												<span class="ico">적립</span> 
												<span class="no_login"> 
													<span>로그인 후, 적립혜택 제공</span>
												</span>
											</p>
										</div>
			
										<!--장바구니, 바로구매 버튼-->
										<div class="group_btn">
											<div class="view_function">
												<button type="button" class="btn btn_buy"><a href="../영훈/결제하기.html" style="font-size: 16px; color: #ffffff;">바로 구매</a></button> 
												<button type="button" class="btn btn_cart"><a href="../경환/cart.html" style="font-size: 16px; color: #C51212;">장바구니</a></button>
											</div> 
										</div>
									</div>
								</form>
								
						</div>



						<!--상품선택
						<div id="cartPut">
							<div class="goods_info">
								<dl class="list fst">
									<dt class="tit">선택 상품</dt> 
									
									<dd class="desc">
									
										<select id="prod_cate">
											<option selected>선택하기</option>
											<option>펀치킹 레드</option>
											<option>펀치킹 화이트</option>
											<option>펀치킹 블랙</option>
										</select>
									</dd>
									
								</dl>
							</div>
							
							선택된 상품
							<div class="list_goods">
								<ul class="list">
									<li class="on">
										<span class="btn_position on">
											<button type="button" class="btn_del">
												<span class="txt">x</span>
											</button>
										</span> 
										<span class="name">[에버라스트] 복싱 백글러브</span>
										<div class="option">
											<span class="count">
												<button type="button" class="btn down on">-</button> 
												<input type="number" readonly="readonly" onfocus="this.blur()" class="inp"> 
												<button type="button" class="btn up on">+</button>
											</span> <span class="price">
												<span class="dc_price">153,600원</span>
											</span>
										</div>
									</li>
								</ul>
							</div>
						</div>--> <!--cartPut-->

						<!--
						<div class="price_total">
							<총 금액
							<div class="total">
								<div class="price">
									<strong class="tit">총 상품금액 :</strong> 
									<span class="sum">
									<span class="num">153,600</span> <span class="won">원</span></span>
								</div> 
								<p class="txt_point">
									<span class="ico">적립</span> 
									<span class="no_login"> 
										<span>로그인 후, 적립혜택 제공</span>
									</span>
								</p>
							</div>

							장바구니, 바로구매 버튼
							<div class="group_btn">
								<div class="view_function">
									<button type="button" class="btn btn_buy"><a href="../영훈/결제하기.html" style="font-size: 16px; color: #ffffff;">바로 구매</a></button> 
									<button type="button" class="btn btn_cart"><a href="../경환/cart.html" style="font-size: 16px; color: #C51212;">장바구니</a></button>
								</div> 
							</div>
						</div>
						-->
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
									<span class="bhs_button" style="line-height:30px; width:130px;">후기쓰기</span>
								</a>
							</p>

						</div> <!--board-->
						
		

						<!-- 페이징 버튼 영역 -->
						<div id="paging">
							<ul>
							<li><a href="">◀</a></li>
							<li><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">4</a></li>
							<li class="active"><a href="">5</a></li>
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
										<span class="bhs_button" onclick="javascript:btn()" style="line-height:30px; width:130px;">상품문의</span>
									</a>
								</p>


								<!-- 페이징 버튼 영역 -->
								<div id="paging">
									<ul>
										<li><a href="">◀</a></li>
										<li><a href="">1</a></li>
										<li><a href="">2</a></li>
										<li><a href="">3</a></li>
										<li><a href="">4</a></li>
										<li class="active"><a href="">5</a></li>
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


</body>


<script type="text/javascript">


	//리뷰보기
	$(document).ready(function(){
		
		$(".tr_line").click(function(){
			
			$(this).find(".review_view").toggle();
			
			
		});
	});
	
	

	
	//수량에 따른 총 가격 계산하기
	var sell_price;
	var amount;

	
	function init () {
		sell_price = document.form.sell_price.value;
		amount = document.form.amount.value;
		document.form.sum.value = sell_price;
		
		change();
	}
	
	function add () {
		hm = document.form.amount;
		sum = document.form.sum;
		hm.value ++ ;
	
		//가격 천의자리 수 마다 , 붙이기
		sum.value = (parseInt(hm.value) * sell_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function del () {
		hm = document.form.amount;
		sum = document.form.sum;
			if (hm.value > 1) {
				hm.value -- ;
				//가격 천의자리 수 마다 , 붙이기
				sum.value = (parseInt(hm.value) * sell_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
	}
	
	function change () {
		hm = document.form.amount;
		sum = document.form.sum;
	
			if (hm.value < 0) {
				hm.value = 0;
			}
			
		//가격 천의자리 수 마다 , 붙이기
		sum.value = (parseInt(hm.value) * sell_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

	}
	
	
	//session값 가져오기 --> 이 방식으로는 오류 Uncaught ReferenceError: $ is not defined
	//일단 넘어가고 나중에 걸러주기로
	var authuser = $("#authuser").val();
	console.log(authuser);
	
	function btn(){ 
		
		alert('로그인 후 작성 가능합니다.'); 
	}

	
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
	
	
	
	
	


</script>
</html>