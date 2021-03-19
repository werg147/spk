<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- 지우지말것 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <!-- 지우지말것 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style_1.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <script src="https://kit.fontawesome.com/5a9452f10d.js" crossorigin="anonymous"></script>

</head>

<body>
    <!-- Header -->

    <div class="wrap">
        <div class="container">
            	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
        </div>
    </div>
    <!-- Header end -->
    <!-- detail -->
    <div class="wrap">
        <div class="container">
            <!-- detail -->
            <div class="sm_1">
                <div class="sm_title">
                    <h1>체육관 정보</h1>
                    <div class="sm_title_back"><a href="">체육관대관 </a> > <a href="">체육관정보</a></div>
                </div>
            </div>
            <section class="detail_info">

                <div class="detail_info_img">
                    <div class="detail_info_first-img"><img class="detail_info_first-img_main" src="/image/img/rental.jpeg"
                            alt=""></div>
                    <div class="detail_info_sub-imgs">
                        <!-- **사진 총 6개만 받을 것 -->
                        <!-- sub img 1pc -->
                        <a class="detail_info_sub-a" href=""><img class="detail_info_sub-img" src="/image/img/rental.jpeg"
                                alt=""></a>
                        <!-- sub img 1pc end-->
                        <!-- sub img 1pc -->
                        <a class="detail_info_sub-a" href=""><img class="detail_info_sub-img" src="/image/img/rental.jpeg"
                                alt=""></a>
                        <!-- sub img 1pc end-->
                        <!-- sub img 1pc -->
                        <a class="detail_info_sub-a" href=""><img class="detail_info_sub-img" src="/image/img/rental.jpeg"
                                alt=""></a>
                        <!-- sub img 1pc end-->
                        <!-- sub img 1pc -->
                        <a class="detail_info_sub-a" href=""><img class="detail_info_sub-img" src="/image/img/rental.jpeg"
                                alt=""></a>
                        <!-- sub img 1pc end-->
                        <!-- sub img 1pc -->
                        <a class="detail_info_sub-a" href=""><img class="detail_info_sub-img" src="/image/img/rental.jpeg"
                                alt=""></a>
                        <!-- sub img 1pc end-->
                        <!-- sub img 1pc -->
                        <a class="detail_info_sub-a" href=""><img class="detail_info_sub-img" src="/image/img/rental.jpeg"
                                alt=""></a>
                        <!-- sub img 1pc end-->

                    </div>
                </div>
                <div class="detail_info_amenities">
                    <div class="amenities">
                        <div class="amenities_item1">
                            <!-- 체육관 네임 -->
                           
                            <div class="amen_box">
                                
                                <p class="amenities_item1_title">팀파이터<span> 체육관</span></p>
                                <div class="amenities_item1_skill">종합격투기</div>
                            </div>
                            
                            <div class="amen_box2">
                                <div>
                                    <div class="amenities_item1_sub5">010-2725-7878</div>
                                    <!-- 주소 -->
                                    <div class="amenities_item1_sub">
                                        <span class="amenities_item1_sub2"><i class="fas fa-map-marker-alt"></i>서울시 중랑구
                                            상봉동</span>
                                    </div>
                                </div>
                                
                            </div>
                               
                        </div>
                        <div class="amenities_item2">
                            <!-- 네글자만 쓰세요 -->
                            <div class="amenities_item2_sub">
                                <img class="amenities_item2_sub_img" src="/image/img/paking.png" alt="">
                                <div class="amenities_item2_sub_title">
                                    <div>무료 주차</div>
                                </div>
                            </div>
                            <div class="amenities_item2_sub">
                                <img class="amenities_item2_sub_img" src="/image/img/shower.png" alt="">
                                <div class="amenities_item2_sub_title">
                                    <div>샤워 가능</div>
                                </div>
                            </div>
                            <div class="amenities_item2_sub">
                                <img class="amenities_item2_sub_img" src="/image/img/glove.png" alt="">
                                <div class="amenities_item2_sub_title">
                                    <div>용품 대여</div>
                                </div>
                            </div>
                            <div class="amenities_item2_sub">
                                <img class="amenities_item2_sub_img" src="/image/img/wear.png" alt="">
                                <div class="amenities_item2_sub_title">
                                    <div>운동복대여</div>
                                </div>
                            </div>
                            <div class="amenities_item2_sub">
                                <img class="amenities_item2_sub_img" src="/image/img/wear.png" alt="">
                                <div class="amenities_item2_sub_title">
                                    <div>운동복대여</div>
                                </div>
                            </div>
                            <div class="amenities_item2_sub">
                                <img class="amenities_item2_sub_img" src="/image/img/wear.png" alt="">
                                <div class="amenities_item2_sub_title">
                                    <div>운동복대여</div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </section>
            <!-- detail end -->
            <!-- reservation -->
            <section class="reservation">
                <div class="reservation_day">
                    <!--스와이프-->
                    <div class="sp_box">
                        <div class="swiper-button-prev rn_prev"></div>
                        <div class="swiper-container rn_container">

                            <div class="swiper-wrapper rn_wrapper">
                                <div class="swiper-slide  rn_slide">
                                    <div class="box1">
                                        <div>1</div>
                                        <div>월</div>
                                    </div>
                                </div>

                                <div class="swiper-slide rn_slide">
                                    <div>
                                        <div>2</div>
                                        <div>화</div>
                                    </div>
                                </div>
                                <div class="swiper-slide rn_slide">
                                    <div>
                                        <div>3</div>
                                        <div>수</div>
                                    </div>
                                </div>

                                <div class="swiper-slide rn_slide">
                                    <div>
                                        <div>4</div>
                                        <div>목</div>
                                    </div>
                                </div>
                                <div class="swiper-slide rn_slide">
                                    <div>
                                        <div>5</div>
                                        <div>금</div>
                                    </div>
                                </div>
                                <div class="swiper-slide rn_slide">
                                    <div>
                                        <div>6</div>
                                        <div>토</div>
                                    </div>
                                </div>
                                <div class="swiper-slide rn_slide">
                                    <div>
                                        <div>7</div>
                                        <div>일</div>
                                    </div>
                                </div>
                                <div class="swiper-slide rn_slide">
                                    <div>
                                        <div>8</div>
                                        <div>월</div>
                                    </div>
                                </div>
                                <div class="swiper-slide rn_slide">
                                    <div>
                                        <div>9</div>
                                        <div>화</div>
                                    </div>
                                </div>
                                <div class="swiper-slide rn_slide">
                                    <div>
                                        <div>10</div>
                                        <div>수</div>
                                    </div>
                                </div>
                               
                            </div>

                        </div>

                        <div class="swiper-button-next rn_next"></div>
                    </div>
                    <!--스와이프 end-->
                </div>
                <div class="reservation_hour">
                    <!-- hour_item 1pc -->
                    <div class="hour_item">
                        <a href="">
                            <div class="hour_item_clock">
                                18:00~20:00
                            </div>
                            <div class="hour_item_price">
                                50,000원
                            </div>
                        </a>
                    </div>
                    <!-- hour_item 1pc end -->
                    <!-- hour_item 1pc -->
                    <div class="hour_item">
                        <a href="">
                            <div class="hour_item_clock">
                                18:00~20:00
                            </div>
                            <div class="hour_item_price">
                                50,000원
                            </div>
                        </a>
                    </div>
                    <!-- hour_item 1pc end -->
                    <!-- hour_item 1pc -->
                    <div class="hour_item">
                        <a href="">
                            <div class="hour_item_clock">
                                18:00~20:00
                            </div>
                            <div class="hour_item_price">
                                50,000원
                            </div>
                        </a>
                    </div>
                    <!-- hour_item 1pc end -->
                    <!-- hour_item 1pc -->
                    <div class="hour_item">
                        <a href="">
                            <div class="hour_item_clock">
                                18:00~20:00
                            </div>
                            <div class="hour_item_price">
                                50,000원
                            </div>
                        </a>
                    </div>
                    <!-- hour_item 1pc end -->
                    <!-- hour_item 1pc -->
                    <div class="hour_item">
                        <a href="">
                            <div class="hour_item_clock">
                                18:00~20:00
                            </div>
                            <div class="hour_item_price">
                                50,000원
                            </div>
                        </a>
                    </div>
                    <!-- hour_item 1pc end -->
                    <!-- hour_item 1pc -->
                    <div class="hour_item">
                        <a href="">
                            <div class="hour_item_clock">
                                18:00~20:00
                            </div>
                            <div class="hour_item_price">
                                50,000원
                            </div>
                        </a>
                    </div>
                    <!-- hour_item 1pc end -->
                    <!-- hour_item 1pc -->
                    <div class="hour_item">
                        <a href="">
                            <div class="hour_item_clock">
                                18:00~20:00
                            </div>
                            <div class="hour_item_price">
                                50,000원
                            </div>
                        </a>
                    </div>
                    <!-- hour_item 1pc end -->
                    <!-- hour_item 1pc -->
                    <div class="hour_item">
                        <a href="">
                            <div class="hour_item_clock">
                                18:00~20:00
                            </div>
                            <div class="hour_item_price">
                                50,000원
                            </div>
                        </a>
                    </div>
                    <!-- hour_item 1pc end -->
                </div>
            </section>
            <!-- reservation end -->
            <!-- notice -->
            <section class="notice">
                <div class="notice_title">
                    <h1>체육관 공지사항</h1>
                </div>
                <div class="notice_text">
                    <p class="time_notice"> ◈ 체육관 운영시간은 09:00~22:00 입니다</p>
                    <p>◈모든 매치는 현재 매치 중, 이동 시 마스크 필수 착용입니다</p>
                    <p> ■매치 진행 중 마스크 착용 필수. 미착용 시 매치 참여 제한</p>
                    <p> ■주차 : 무료(구장 앞에 꼬깔 치우고 **대각선**으로 주차)</p>
                    <p>■흡연 : 구장 출입문 옆 흡연구역 외 절대 금연(흡연구역 외에서 흡연 적발 시 이후 서비스 이용에 제재가 있을 수 있습니다.</p>
                    <p> ■글러브 대여, 음료 구입 시 칠판에 있는 계좌로 입금 해주세요.</p>
                    <p>더 자세한 정보는 상봉 팀파이터의 시설 정보에서 확인하세요</p>
                </div>
                <br>

            </section>
            <!-- notice end-->
            <!-- map -->
            <section class="dae_map">
                <h1>위치</h1>
                <div id="map" style="width:500px;height:400px;"></div>
            </section>
            <!-- map end -->
            <!-- 버튼 -->
            <div id="dae_footer">

                <div>
                    <a href="/view/matching/matchinfo.html">
                        <button class="dae_button_item"><span class="dea_btn">대관하기</span></button>
                        
                    </a>
                    <a href="/view/matching/대관하기.html">
                        
                        <button class="dae_button_item3"><span class="dea_btn">돌아가기</span></button>
                    </a>
                </div>

            </div>
            <!-- 버튼 end -->
    <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->
        </div>
    </div>
    <script>
        var mySwiper = new Swiper('.swiper-container', {
            slidesPerView: 7,

            //loop: true,

            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',

            },
        });

    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d61061c16087356c2dfec36676de88d">
    </script>
    
    <script type="text/javascript">
    	var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    	mapOptions = { //지도를 생성할 때 필요한 기본 옵션
    		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
    		level: 4 //지도의 레벨(확대, 축소 정도)
    	};

    	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    	
    	 geocoder.addressSerch(
    		//'주소'
    		address,
    		function(result,status){
    			//정상적으로 검색이 완료됐으면
    			if(status === kakao.maps.services.Status.OK) {
    				var coords = new kakao.maps.LatLng(
    						result[0].y,result[0].x);
    				
    				var content = '<div class="customoverlay">' 
    				+ '   <span class="title">'
    				+'<div style="font-style:normal; color:red; font-weight:bold; font-size:2.0em">'
    				+number + '</div>' + '</span>'
    				+'</div>';
    				
    				var position = new kakao.maps.LatLng(result[0].y,result[0].x);
    				
    				var customOverlay = new kakao.maps.CustomOverlay({
    					map : map,
    					position : position,
    					coontent : content,
    					yAnchor : 1
    				});
    				
    				map.setCenter(coords);
    			}
    		});
    	for(i=0; i<myAddress.length; i++){
    		myMarker(i+1,myAddress[i]);
    	}
    	)
    </script>
    
</body>

</html>
	