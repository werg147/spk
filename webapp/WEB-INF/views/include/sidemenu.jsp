<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="side_menu">
	<ul id="side_menu_mypage">
		<li>마이페이지</li>
	</ul>
	<c:if test="${sessionScope.authUser.sell_type == '1' || sessionScope.authUser.sell_type == '3'}">
		<ul id="side_menu_booking">
			<li class="title"><span class="menu">예약판매관리</span></li>
			<li><a href="./예약판매자2_마이페이지_사업자계정1.html"><span class="menu">사업자계정
						관리</span><span class="arrow">></span></a></li>
			<li><a href="./예약판매자3_마이페이지_체육관관리_리스트1.html"><span
					class="menu">체육관관리</span><span class="arrow">></span></a></li>
			<li><a href="./예약판매자6_마이페이지_대관관리1.html"><span class="menu">대관관리</span><span
					class="arrow">></span></a></li>
			<li class="side_menu_last"><a href="./예약판매자8_마이페이지_수익관리1.html"><span
					class="menu">수익관리</span><span class="arrow">></span></a></li>
		</ul>
	</c:if>
	<c:if test="${sessionScope.authUser.sell_type == '2' || sessionScope.authUser.sell_type == '3'}">
		<ul id="side_menu_delivery">
			<li class="title"><span class="menu">배송판매관리</span></li>
			<li><a href="./예약판매자2_마이페이지_사업자계정정보1.html"><span class="menu">사업자계정
						관리</span><span class="arrow">></span></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/prod"><span class="menu">상품관리</span><span
					class="arrow">></span></a></li>
			<li><a href="./배송판매자_마이페이지_배송관리.html"><span class="menu">배송관리</span><span
					class="arrow">></span></a></li>
			<li class="side_menu_last"><a href="./배송판매자_마이페이지_수익관리.html"><span
					class="menu">수익관리</span><span class="arrow">></span></a></li>
		</ul>
	</c:if>
	<c:if test="${sessionScope.authUser != null}">
		<ul id="side_menu_user">
			<li><a href="../mypage_buy/alarm.html"><span class="menu">알림</span><span
					class="arrow">></span></a></li>
			<li><a href="../mypage_buy/cart.html"><span class="menu">장바구니</span><span
					class="arrow">></span></a></li>
			<li><a href="../mypage_buy/buylist.html"><span class="menu">구매내역</span><span
					class="arrow">></span></a></li>
			<li><a href="../mypage_buy/info_update.html"><span
					class="menu">회원정보관리</span><span class="arrow">></span></a></li>
			<li class="side_menu_last"><a href="../mypage_buy/matchinfo.html"><span
					class="menu">매칭프로필관리</span><span class="arrow">></span></a></li>
		</ul>
	</c:if>
	
		
	<c:if test="${sessionScope.authUser.sell_type != '3'}">
		<c:choose>
		<%-- 구매자에서 판매자로 전환하는 상황으로 sell_type checkbox넣기선택하도록 --%>
			<c:when test="${sessionScope.authUser.sell_type != '0'}">
				<ul id="side_menu_user">
					<li class="side_menu_last"><a
						href="../mypage_resrvation/예약판매자2_마이페이지_사업자계정1.html"><span
							class="menu">판매자등록</span><span class="arrow">></span></a></li>
				</ul>
			</c:when>
			<%-- 대관판매자에서 배송판매자로 추가등록 상황으로 sell_type=3으로 변경 하도록 --%>
			<c:when test="${sessionScope.authUser.sell_type != '1'}">
				<ul id="side_menu_user">
					<li class="side_menu_last"><a
						href="../mypage_resrvation/예약판매자2_마이페이지_사업자계정1.html"><span
							class="menu">판매자등록</span><span class="arrow">></span></a></li>
				</ul>
			</c:when>
			<%-- 배송판매자에서 대관판매자로 추가등록 상황으로 sell_type=3으로 변경 하도록 --%>
			<c:when test="${sessionScope.authUser.sell_type != '2'}">
				<ul id="side_menu_user">
					<li class="side_menu_last"><a
						href="../mypage_resrvation/예약판매자2_마이페이지_사업자계정1.html">
						<span class="menu">판매자등록</span><span class="arrow">></span></a></li>
				</ul>
			</c:when>
		</c:choose>
	</c:if>
</div>
<!--//side_menu//-->