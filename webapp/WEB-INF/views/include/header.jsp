<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="header">
	<div class="header_logo">
		<a href="${pageContext.request.contextPath}"><img
			src="${pageContext.request.contextPath }/assets/image/로고.png"></a>
	</div>
	<div class="header_menu">
		<ul>
			<li id="no1"><a
				href="${pageContext.request.contextPath }/views/matching/스파링 매칭.html"><span>스파링
						매치</span></a></li>
			<li id="no2"><a
				href="${pageContext.request.contextPath}/store/list"><span>스토어</span></a></li>
		</ul>
	</div>
	<div class="header_icon">
		<c:choose>
			<c:when test="${sessionScope.authUser == null}">
				<div>
					<a href="${pageContext.request.contextPath}/user/loginform">
						<div id="login">Login</div>
					</a>
				</div>
			</c:when>

			<c:otherwise>
				<div>
					<a href="${pageContext.request.contextPath}/user/logout">
						<div id="login">Logout</div>
					</a>
				</div>
			</c:otherwise>

		</c:choose>

		<div>
			<c:choose>
				<c:when test="${sessionScope.authUser == null}">
					<a href="${pageContext.request.contextPath}/user/loginform">
				</c:when>
				
				<c:when test="${sessionScope.authUser.sell_type == '1' || sessionScope.authUser.sell_type == '3'}">
					<a href="${pageContext.request.contextPath}/mypage/book/gymaddform">
				</c:when>
				<c:when test="${sessionScope.authUser.sell_type == '2'}">
					<a href="${pageContext.request.contextPath}/mypage/prod">
				</c:when>
	
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/mypage/alarm">
				</c:otherwise>

			</c:choose>
			 
			 
			<img src="${pageContext.request.contextPath }/assets/image/마이페이지 남성_글러브.png"></a>
		</div>
		<div>
			<a href="./html/alarm.html"> <img
				src="${pageContext.request.contextPath }/assets/image/bell_2.png"></a>
		</div>
		<div>
			<a href="./html/cart.html"> <img
				src="${pageContext.request.contextPath }/assets/image/cart3.png"></a>
		</div>
	</div>
</div>
<!--//header//-->