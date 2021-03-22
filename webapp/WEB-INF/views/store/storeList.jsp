<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/store.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
</head>

<body>
    
  <div class="wrap">
    <div class="container">
    
      <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	  <!--//header//-->
    
</div><!--//container-->
</div><!--//wrap-->
	
	
<!--///////////////상품리스트///////////////-->

<!--아이콘 링크-->
<script src="https://kit.fontawesome.com/5a9452f10d.js" crossorigin="anonymous"></script>
<!-- search -->
      
<div class="wrap">
	<div class="container">

      <!-- item -->
      <div class="searching_item">
        
        <!--드롭다운 종목카테고리-->
        <div class="event_cate" style="bottom:-9px">
          <select class="cate_select" onchange="this.form.sort.value=this.value;this.form.submit()">
            <option value="">종목</option>
            <option value="1">복싱</option>
            <option value="2">킥복싱</option>
            <option value="3">주짓수</option>
            <option value="4">종합격투기</option>
          </select>
        </div>

        <div class="ico_cate">
          <span class="tit" id="on">전체보기</span>
          <span class="tit">운동용품</span>
          <span class="tit">의류</span>
          <span class="tit">잡화</span>
        </div>
        
        <!-- 스토어 검색 -->
        <form id="form_gim" action="${pageContext.request.contextPath}/store/list" method="get">
          <input class="input-text" type="text" name="search" placeholder="상품명 검색">
          <button class="gim_btn"><i class="fas fa-search"></i></button>
        </form>
      </div>
  </div>
  <!--div container-->
</div>
<!--div wrap-->
        

      


<div class="wrap2">
	<div class="container2">
    <div id="goodsList">
      <ul>
        <!--첫번째 줄-->
        <c:forEach items="${storeList}" var="stoVo">
	        <li>
	          <input type="hidden" name="prod_no" value="${stoVo.prod_no}">
	          <input type="hidden" name="sell_no" value="${stoVo.sell_no}">
	          <input type="hidden" name="prod_cate" value="${stoVo.prod_cate}">
	          <input type="hidden" name="event_cate" value="${stoVo.event_cate}">
	          <div class="item">
	              <a class="img" style="background-image: url();" href="">
	                <img src="${pageContext.request.contextPath}/upload/${stoVo.prod_img_savename}"  width="308" height="396">
	              </a> 
	
	              <div>
	                <a class="info" href="">
	                  <span class="name">[${stoVo.prod_brand}]${stoVo.prod_name}</span>
	                  <span class="price"><fmt:formatNumber value="${stoVo.prod_price}" pattern="#,###"/>원</span>
	                  <span class="desc"></span>
	                </a>
	             </div>
	          </div>      
	        </li> 
        </c:forEach>
        
      </ul>
    </div>
  </div>
  <!--container-->
</div>
<!--wrap-->


<div class="wrap">
	<div class="container">

    <br><br>

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
      

    <br><br><br><br><br><br><br><br><br><br><br><br>


	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<!--//footer//-->

  </div>
  <!--container-->
</div>
<!--wrap--> 




</body>


</html>