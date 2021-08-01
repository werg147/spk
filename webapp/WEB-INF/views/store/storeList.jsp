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
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>  
   
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
          </select>
        </div>

        <div class="ico_cate">
          <span class="tit all" id="on">전체보기</span>
          <span class="tit 운동용품">운동용품</span>
          <span class="tit 의류">의류</span>
          <span class="tit 잡화">잡화</span>
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
	              <a class="img" href="${pageContext.request.contextPath}/store/read?prodNo=${stoVo.prod_no}">
	                <img src="${pageContext.request.contextPath}/upload/${stoVo.prod_img_savename}"  width="308" height="396">
	              </a> 
	
	              <div>
	                <a class="info" href="${pageContext.request.contextPath}/store/read?${stoVo.prod_no}">
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

<script type="text/javascript">

	//키워드 셀렉시 해당 prod_cate 리스트 뿌리기 (서치랑 동일)
	$(".ico_cate").on("click",".tit",function(){
		//클릭테스트
		console.log("카테고리 클릭");
		
		var url = "${pageContext.request.contextPath}/store/list"
		var urlh = "${pageContext.request.contextPath}/store/list?prod_cate="
		var urlc = "${pageContext.request.contextPath}/store/list?"
		var urlg = "${pageContext.request.contextPath}/store/list"
			
			
		if($(this).val() === '전체보기'){
			var test = $(this).val();
			console.log(test);
			console.log("전체보기 인식");
			$(location).attr('href',url);
				
		} else if($(this).val() === '운동용품'){
			console.log("운동용품 인식");
			
		} else if($(this).val() === '의류'){
			console.log("의류 인식");
			
		} else if($(this).val() === '잡화'){
			console.log("잡화 인식");
		}
						
		
		
		
		
		
	});

</script>


</html>