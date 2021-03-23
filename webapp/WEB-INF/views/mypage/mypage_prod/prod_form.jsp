<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품등록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/delivery.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>

</head>
<body>
	<div class="wrap">
		<div class="container">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<!--//header//-->
			<div class="middle">
				<c:import url="/WEB-INF/views/include/sidemenu.jsp"></c:import>
				<!--//sidemenu//-->

				<div class="content_product">
					<div class="content_delevery_product_header">
						<div>상품등록</div>
					</div>
					<!--//content_delevery_product_header//-->
					<div class="content_product_line"></div>
					<form action="" id="uploadForm" method="" enctype="">
						<table class="product_insert_content">
							<colgroup>
								<col style="width: 200px">
								<col style="width: 600px">
							</colgroup>
							<tr class="basic">
								<td><label for="prod_cate">상품카테고리</label></td>
								<td>
									<div class="content_product_insert_select_box">
										<select id="prod_cate" name="prod_cate">
											<option value="운동용품" selected>운동용품</option>
											<option value="의류">의류</option>
											<option value="잡화">잡화</option>
										</select>
									</div>
								</td>
							</tr>
							<tr class="basic">
								<td><label for="event_cate">종목카테고리</label></td>
								<td><div class="content_product_insert_select_box">
										<select id="event_cate" name ="event_cate">
											<option selected>종목</option>
											<option value="킥복싱">킥복싱</option>
											<option value="복싱">복싱</option>
											<option value="주지수">주지수</option>
											<option value="종합격투기">종합격투기</option>
										</select>
									</div></td>
							</tr>
							<tr class="basic">
								<td><label for="prod_name">상품명</label></td>
								<td><input type="text" id="prod_name" name="prod_name"></td>
							</tr>
							<tr class="basic">
								<td><label for="prod_price">제품가격</label></td>
								<td><input type="text" id="prod_price" name="prod_price"></td>
							</tr>
							<tr class="basic">
								<td><label for="prod_brand">브랜드명</label></td>
								<td><input type="text" id="prod_brand" name="prod_brand"></td>
							</tr>
							<tr class="product_insert_div_img">
								<td>대표이미지</td>
								<td class="img_td">
									<div>
										<div class="dropZone1">
											<p>이미지를 끌어오세요</p>
										</div>
										<div id="imgadd1"></div>
									</div>
								</td>
							</tr>
							<tr class="product_insert_div_img">
								<td>추가이미지</td>
								<td class="img_td">
									<div>
										<div class="dropZone2">
											<p>이미지를 끌어오세요</p>
										</div>
										<div id="imgadd2"></div>
									</div>
								</td>

							</tr>
							<tr class="sizecolor_div">
								<td>색상 및 사이즈</td>
								
									<td id=sizecolor>
										<label for="color">색상</label> 
										<input type="text" id="color" name="color"> 
										<label for="prod_size">사이즈</label>
										<input type="text" id="prod_size" name="prod_size"> 
										<label for="stock">재고</label> 
										<input type="text" id="stock" name="stock">
										<button id="sizecolor_btn" type="button">등록</button>
										<div class="colorsizestocktab">
											<div id="sizebox"></div>
										</div>
									</td>
							
							</tr>
							<tr class="plus">
								<td><label for="prod_desc">제품소개(성분)</label></td>
								<td><textarea id="prod_desc" name="prod_desc"></textarea></td>
							</tr>
							<tr class="plus">
								<td><label for="prod_from">제조/수입내용</label></td>
								<td><textarea id="prod_from" name="prod_from"></textarea></td>
							</tr>
							<tr class="plus">
								<td><label for="prod_wash">세탁방법 및 주의사항</label></td>
								<td><textarea id="prod_wash" name="prod_wash"></textarea></td>
							</tr>
							<tr class="plus">
								<td><label for="prod_qual">품질보증기준</label></td>
								<td><textarea id="prod_qual" name="prod_qual"></textarea></td>
							</tr>
							<tr class="large">
								<td><label for="prod_detail">상세페이지</label></td>
								<td>
									<div>
										<p>상세페이지 이미지등록</p>
										<label class="input-file-button" for="input-file"></label>
										<input type="file" name="detailfile" id="detailfile">
									</div> <textarea id="prod_detail" name="prod_detail"></textarea>
								</td>
							</tr>
						</table>
						<div class="product_insert_btn">
							<input type="hidden" name="sell_no" value="${sessionScope.authUser.sell_no}">
							<button class="insert_btn" type="button">상품등록</button>
							<button class="product_delclose_btn" type="reset"><a href="${pageContext.request.contextPath}/mypage/prod">상품목록으로</a></button>
						</div>
					</form>
				</div>
				<!--//delivery_info-->
			</div>
			<!--//content_product//-->
		</div>
		<!--//middle//-->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!--//footer//-->
	</div>
	<!--//container//-->
	</div>
	<!--//wrap//-->

</body>

<script type="text/javascript">

var cssList = [];
var listnum = 0;
var cssVo;


////여기부터 이미지등록/////////////////////
//파일 리스트 번호
var fileIndex = 0;
// 등록할 전체 파일 사이즈
var totalFileSize = 0;
// 파일 리스트
var fileList1 = new Array();
var fileList2 = new Array();


var uploadFiles1 = [];
var uploadFiles2 = [];

$(function (){
    // 파일 드롭 다운
    fileDropDown1();
    fileDropDown2();
});

function fileDropDown1(){
    var dropZone1 = $(".dropZone1");
    //Drag기능 
    dropZone1.on('dragenter',function(e){
        e.stopPropagation();
        e.preventDefault();
        dropZone1.css('background-color','#A9A9A9');
    });
    dropZone1.on('dragleave',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone1.css('background-color','#E3E3E3');
    });
    dropZone1.on('dragover',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone1.css('background-color','#A9A9A9');
    });
    dropZone1.on('drop',function(e){
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone1.css('background-color','#E3E3E3');
        var files = e.originalEvent.dataTransfer.files;//0
        console.log('files'+files);
        
			for (var i = 0; i < files.length; i++) {
				files[i].mainsub = 'main'+files[i].name;
				var file1 = files[i];
				console.log(file1);
				var count = uploadFiles1.push(file1); //업로드 목록에 추가
				console.log('count'+count);
				console.log(uploadFiles1);
				preview1(file1, count - 1); //미리보기 만들기
	
        }
        if(files != null){
            if(files.length < 1){
                alert("폴더 업로드 불가");
                return;
            }
            selectFile1(files)
        }else{
            alert("ERROR");
        }
    });
}


function preview1(file1, idx) {
	var reader = new FileReader();
	reader.onload = (function(f, idx) {
		return function(e) {
			var div = '<div class="thumb"> \
				<img src="'
                + e.target.result
                + '" title="'
                + escape(f.name)
                + '"/> \
				<div class="close" data-idx="' + idx + '">삭제</div> \
				</div>';
                       
			$("#imgadd1").append(div);
		};
	})(file1, idx);
	reader.readAsDataURL(file1);
}

// 파일 선택시
function selectFile1(files){
    // 다중파일 등록
    if(files != null){
        for(var i = 0; i < files.length; i++){
            // 파일 이름
            var fileName = files[i].name;
            var fileNameArr = fileName.split("\.");
            // 확장자
            var ext = fileNameArr[fileNameArr.length - 1];
            if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
                // 확장자 체크
                alert("등록 불가 확장자");
                break;
            }
        }
    }else{
        alert("ERROR");
    }
}


$("#imgadd1").on("click", ".close", function(e) {
	var $target = $(e.target);
	var idx = $target.attr('data-idx');
	uploadFiles1[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성
	
	console.log("/////////////")
	for(let i=0; i<fileList1.length; i++){
		console.log(fileList1[i])
		}
	
	$target.parent().remove(); //프리뷰 삭제
	
});


/////////////////여기부터 두번째 이미지등록(서브)///////////////////////////////////////
// 파일 드롭 다운
function fileDropDown2(){
    var dropZone2 = $(".dropZone2");
    //Drag기능 
    dropZone2.on('dragenter',function(e){
        e.stopPropagation();
        e.preventDefault();
        dropZone2.css('background-color','#A9A9A9');
    });
    dropZone2.on('dragleave',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone2.css('background-color','#E3E3E3');
    });
    dropZone2.on('dragover',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone2.css('background-color','#A9A9A9');
    });
    dropZone2.on('drop',function(e){
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone2.css('background-color','#E3E3E3');
        var files = e.originalEvent.dataTransfer.files;//0
        console.log('files'+files);
        
			for (var i = 0; i < files.length; i++) {
				files[i].mainsub = 'sub'+files[i].name;
				var file2 = files[i];
				console.log(file2);
				var count = uploadFiles2.push(file2); //업로드 목록에 추가
				console.log('count'+count);
				console.log(uploadFiles2);
				preview2(file2, count - 1); //미리보기 만들기
	
        }
        if(files != null){
            if(files.length < 1){
                alert("폴더 업로드 불가");
                return;
            }
            selectFile2(files)
        }else{
            alert("ERROR");
        }
    });
}



function preview2(file2, idx) {
	var reader = new FileReader();
	reader.onload = (function(f, idx) {
		return function(e) {
			var div = '<div class="thumb"> \
				<img src="'
                + e.target.result
                + '" title="'
                + escape(f.name)
                + '"/> \
				<div class="close" data-idx="' + idx + '">삭제</div> \
				</div>';
                       
			$("#imgadd2").append(div);
		};
	})(file2, idx);
	reader.readAsDataURL(file2);
}

// 파일 선택시
function selectFile2(files){
    // 다중파일 등록
    if(files != null){
        for(var i = 0; i < files.length; i++){
            // 파일 이름
            var fileName = files[i].name;
            var fileNameArr = fileName.split("\.");
            // 확장자
            var ext = fileNameArr[fileNameArr.length - 1];
            if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
                // 확장자 체크
                alert("등록 불가 확장자");
                break;
            }
        }
    }else{
        alert("ERROR");
    }
}


$("#imgadd2").on("click", ".close", function(e) {
	var $target = $(e.target);
	var idx = $target.attr('data-idx');
	uploadFiles2[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성
	
	console.log("/////////////")
	for(let i=0; i<fileList2.length; i++){
		console.log(fileList2[i])
		}
	
	$target.parent().remove(); //프리뷰 삭제
	
});

///////////////////////두번째 여기까지 이미지등록////////////////////////////////


//////////여기부터 사이즈 등록////////

/* var colorsizestock = new Array(); */


$("#sizecolor_btn").on("click", function(){
	
	
	var color = $("#color").val();
	var prod_size = $("#prod_size").val();
	var stock = $("#stock").val();
	
	cssVo = {color:color, prod_size : prod_size, stock : stock };
		
	console.log(cssVo);
	
	
	add(color, prod_size, stock, listnum);
	console.log("선택자추가");
	
	cssList[listnum] = cssVo;
	console.log(cssList);
	console.log("선택자추가");
	
	listnum++;
});

/*옵션의 삭제버튼 클릭할때 */
$(".colorsizestocktab").on("click", ".close", function(){
	var $this = $(this);
	var listnum = $this.data("listnum");
	console.log(listnum);
	deletedata(listnum);
});



function add(color, prod_size, stock, listnum) {
	var div =  '<div class="thumb2" id="' +listnum+'">'
		div += 		'<div> 색상: '+color+', 사이즈: ' + prod_size+', 재고: ' + stock +'</div>'
		div += 		'<div data-listnum="'+listnum+'" class="close">X</a>'
		div += '</div>'
		console.log("번호추가: " + listnum);
	$("#sizebox").append(div);
		
	
}

//업로드 파일 삭제
function deletedata(listnum){

    // 파일 배열에서 삭제
    delete cssVo[listnum];

    
    // 업로드 파일 테이블 목록에서 삭제
    $("#"+listnum).remove();
    console.log("delete" + cssVo[listnum]);

}


///////////////////이미지등록 공통부분//////////////
$(".insert_btn").on("click", function() {
	event.preventDefault();

    var formData = new FormData();

	
	//상품카테고리
	const prod_cate_element = document.querySelector('#prod_cate');
	const prod_cate_value = prod_cate_element.value;
	var prod_cate = prod_cate_value;
    formData.append("prod_cate", prod_cate);
    //object.prod_cate = prod_cate_value;
 
  	//종목카테고리
  	const event_cate_element = document.querySelector('#event_cate');
	const event_cate_value = event_cate_element.value;
	var event_cate = event_cate_value;
    formData.append("event_cate", event_cate);
    //object.event_cate = event_cate_value;
    
	//상품명
    var prod_name = $("[name='prod_name']").val();
    formData.append("prod_name", prod_name);
    //object.prod_name = prod_name;
    
    
    //제품가격
    var prod_price = $("[name='prod_price']").val();
    formData.append("prod_price", prod_price);
    //object.prod_price = prod_price;
    
    //브랜드명
    var prod_brand = $("[name='prod_brand']").val();
    formData.append("prod_brand", prod_brand);
    //object.prod_brand = prod_brand;
    
    //제품소개
    var prod_desc = $("[name='prod_desc']").val();
    formData.append("prod_desc", prod_desc);
    //object.prod_desc = prod_desc;
    
    //제조수입내용
    var prod_from = $("[name='prod_from']").val();
    formData.append("prod_from", prod_from);
    //object.prod_from = prod_from;
    
    //세탁주의사항
    var prod_wash = $("[name='prod_wash']").val();
    formData.append("prod_wash", prod_wash);
    //object.prod_wash = prod_wash;
    
    //품질보증
    var prod_qual = $("[name='prod_qual']").val();
    formData.append("prod_qual", prod_qual);
    //object.prod_qual = prod_qual;
    
    //상세페이지
    var prod_detail = $("[name='prod_detail']").val();
    formData.append("prod_detail", prod_detail);
    //object.prod_detail = prod_detail;
    
    
    //샐러
    var sell_no = $("[name='sell_no']").val();
    formData.append("sell_no", sell_no);
    //object.sell_no = sell_no;

    formData.append("detailfile",$("input[name=detailfile]")[0].files[0]);

      
   	$.each(uploadFiles1, function(i, file1) {
   		if (file1.upload != 'disable'){ //삭제하지 않은 이미지만 업로드 항목으로 추가
   			formData.append('mainfile', file1, file1.mainsub);
   		}
   	});
   	
   	$.each(uploadFiles2, function(i, file2) {
   		if (file2.upload != 'disable'){ //삭제하지 않은 이미지만 업로드 항목으로 추가
   			formData.append('subfile', file2, file2.mainsub);
   		}
   	});
	 
/*
   	for (var key of formData.keys()) {

   	  console.log(key);

   	}

   	for (var value of formData.values()) {

   	  console.log(value);

   	}
*/

    $.ajax({
		url : '${pageContext.request.contextPath}/mypage/prod/write',
		data : formData,
		contentType : false,
		processData : false,
		type : 'post',
		success : function(prod_no) {
			 if(prod_no != null){
				 	console.log(prod_no);
				 	console.log("상품등록 성공");
	                 
	            	var object = {};  
	                object.cssList = cssList;
	                object.prod_no = prod_no;
	                
	                
	                console.log("==========================================================")
	                console.log(object);
	                console.log("==========================================================")
	                
	                var json = JSON.stringify(object);
	                console.log("==========================================================")
	                console.log(json);
	                console.log("==========================================================")
	                


	            	$.ajax({
	            		url : '${pageContext.request.contextPath}/mypage/prod/sizewrite',
	            		contentType: "application/json", 
	            		data : json,
	            		type : 'post',
	            		success : function(count) {
	            			 if(count > 0){
	            	                alert("성공");
	            	                 location.reload(); 

	            	                
	            	            }else{
	            	                alert("실패");
	            	                location.reload();
	            	            }
	            		}
	            	});
	                 
	            }else{
	                alert("실패");
	                location.reload();
	            }

		}
	                
	});



});

////여기까지 이미지등록/////////////////////
	


</script>
</html>