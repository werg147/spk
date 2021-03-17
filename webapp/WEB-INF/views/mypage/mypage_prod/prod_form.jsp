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
					<form name="uploadForm" id="uploadForm"
						enctype="multipart/form-data" method="post">
						<table class="product_insert_content">
							<colgroup>
								<col style="width: 200px">
								<col style="width: 600px">
							</colgroup>
							<tr class="basic">
								<td><label for="prod_cate">상품카테고리</label></td>
								<td>
									<div class="content_product_insert_select_box">
										<select id="prod_cate">
											<option selected>운동용품</option>
											<option>의류</option>
											<option>잡화</option>
										</select>
									</div>
								</td>
							</tr>
							<tr class="basic">
								<td><label for="exer_cate">종목카테고리</label></td>
								<td><div class="content_product_insert_select_box">
										<select id="exer_cate">
											<option selected>종목</option>
											<option>킥복싱</option>
											<option>복싱</option>
											<option>주지수</option>
										</select>
									</div></td>
							</tr>
							<tr class="basic">
								<td><label for="prod_name">상품명</label></td>
								<td><input type="text" id="prod_name"></td>
							</tr>
							<tr class="basic">
								<td><label for="prod_price">제품가격</label></td>
								<td><input type="text" id="prod_price"></td>
							</tr>
							<tr class="basic">
								<td><label for="brand_name">브랜드명</label></td>
								<td><input type="text" id="brand_name"></td>
							</tr>
							<tr class="product_insert_div_img">
								<td>대표이미지</td>
								<td>
									<div>
										<div class="dropZone1">이미지를 넣어주세요</div>
										<div id="imgadd1"></div>
									</div>
								</td>
							</tr>
							<tr class="product_insert_div_img">
								<td>추가이미지</td>
								<td>
									<div>
										<div class="dropZone2">이미지를 넣어주세요</div>
										<div id="imgadd2"></div>
									</div>
								</td>

							</tr>
							<tr class="sizecolor_div">
								<td>색상 및 사이즈</td>
								<div>
									<td id=sizecolor><label for="color">색상</label> <input
										type="text" id="color"> <label for="size">사이즈
									</label> <input type="text" id="last"> <label for="size">재고
									</label> <input type="last" id="size">
										<button>+</button>
										<div>
											<div>블랙 55 35</div>
											<div>블루 66 70</div>
										</div></td>
								</div>
							</tr>
							<tr class="plus">
								<td><label for="prod_info">제품소개(성분)</label></td>
								<td><textarea id="prod_info"></textarea></td>
							</tr>
							<tr class="plus">
								<td><label for="prod_making">제조/수입내용</label></td>
								<td><textarea id="prod_making"></textarea></td>
							</tr>
							<tr class="plus">
								<td><label for="prod_notice">세탁방법 및 주의사항</label></td>
								<td><textarea id="prod_notice"></textarea></td>
							</tr>
							<tr class="plus">
								<td><label for="prod_guarantee">품질보증기준</label></td>
								<td><textarea id="prod_guarantee"></textarea></td>
							</tr>
							<tr class="large">
								<td><label for="prod_detail">상세페이지</label></td>
								<td>
									<div>
										<p>상세페이지 이미지등록</p>
										<label class="input-file-button" for="input-file">업로드</label>
										<input type="file" id="input-file" style="display: none;">
									</div> <textarea id="prod_detail"></textarea>
								</td>
							</tr>
						</table>

						<div class="product_insert_btn">
							<button class="insert_btn">상품등록</button>
							<button class="product_delclose_btn">상품목록으로</button>
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
// 파일 리스트 번호
var fileIndex = 0;
// 등록할 전체 파일 사이즈
var totalFileSize = 0;
// 파일 리스트
var fileList = new Array();
// 파일 사이즈 리스트
var fileSizeList = new Array();
// 등록 가능한 파일 사이즈 MB
var uploadSize = 50;
// 등록 가능한 총 파일 사이즈 MB
var maxUploadSize = 500;

$(function (){
    // 파일 드롭 다운
    fileDropDown();
});

// 파일 드롭 다운
function fileDropDown(){
    var dropZone1 = $(".dropZone1");
    //Drag기능 
    dropZone1.on('dragenter',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone1.css('background-color','#E3F2FC');
    });
    dropZone1.on('dragleave',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone1.css('background-color','#FFFFFF');
    });
    dropZone1.on('dragover',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone1.css('background-color','#E3F2FC');
    });
    dropZone1.on('drop',function(e){
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone1.css('background-color','#FFFFFF');
        
        var files = e.originalEvent.dataTransfer.files;
        if(files != null){
            if(files.length < 1){
                alert("폴더 업로드 불가");
                return;
            }
            selectFile(files)
        }else{
            alert("ERROR");
        }
    });
}



// 파일 드롭 다운
function fileDropDown(){
    var dropZone1 = $(".dropZone1");
    //Drag기능 
    dropZone1.on('dragenter',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone1.css('background-color','#E3F2FC');
    });
    dropZone1.on('dragleave',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone1.css('background-color','#FFFFFF');
    });
    dropZone1.on('dragover',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone1.css('background-color','#E3F2FC');
    });
    dropZone1.on('drop',function(e){
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone1.css('background-color','#FFFFFF');
        
        var files = e.originalEvent.dataTransfer.files;
        if(files != null){
            if(files.length < 1){
                alert("폴더 업로드 불가");
                return;
            }
            selectFile(files)
        }else{
            alert("ERROR");
        }
    });
}


// 파일 선택시
function selectFile(files){
    // 다중파일 등록
    if(files != null){
        for(var i = 0; i < files.length; i++){
            // 파일 이름
            var fileName = files[i].name;
            var fileNameArr = fileName.split("\.");
            // 확장자
            var ext = fileNameArr[fileNameArr.length - 1];
            // 파일 사이즈(단위 :MB)
            var fileSize = files[i].size / 1024 / 1024;
            
            if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
                // 확장자 체크
                alert("등록 불가 확장자");
                break;
            }else if(fileSize > uploadSize){
                // 파일 사이즈 체크
                alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                break;
            }else{
                // 전체 파일 사이즈
                totalFileSize += fileSize;
                
                // 파일 배열에 넣기
                fileList[fileIndex] = files[i];
                
                // 파일 사이즈 배열에 넣기
                fileSizeList[fileIndex] = fileSize;

                // 업로드 파일 목록 생성
                addFileList(fileIndex, fileName, fileSize);

                // 파일 번호 증가
                fileIndex++;
            }
        }
    }else{
        alert("ERROR");
    }
}

// 업로드 파일 목록 생성
function addFileList(fIndex, fileName, fileSize){
    var html = "";
    html += "<tr id='fileTr_" + fIndex + "'>";
    html += "    <td class='left' >";
    html +=         fileName + " / " + fileSize + "MB "  + "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'>삭제</a>"
    html += "    </td>"
    html += "</tr>"

    $('#imgadd1').append(html);
}




// 업로드 파일 삭제
function deleteFile(fIndex){
    // 전체 파일 사이즈 수정
    totalFileSize -= fileSizeList[fIndex];
    
    // 파일 배열에서 삭제
    delete fileList[fIndex];
    
    // 파일 사이즈 배열 삭제
    delete fileSizeList[fIndex];
    
    // 업로드 파일 테이블 목록에서 삭제
    $("#fileTr_" + fIndex).remove();
}

// 파일 등록
function uploadFile(){
    // 등록할 파일 리스트
    var uploadFileList = Object.keys(fileList);

    // 파일이 있는지 체크
    if(uploadFileList.length == 0){
        // 파일등록 경고창
        alert("파일이 없습니다.");
        return;
    }
    
    // 용량을 500MB를 넘을 경우 업로드 불가
    if(totalFileSize > maxUploadSize){
        // 파일 사이즈 초과 경고창
        alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
        return;
    }
        
    if(confirm("등록 하시겠습니까?")){
        // 등록할 파일 리스트를 formData로 데이터 입력
        var form = $('#uploadForm');
        var formData = new FormData(form);
        for(var i = 0; i < uploadFileList.length; i++){
            formData.append('files', fileList[uploadFileList[i]]);
        }
        
        $.ajax({
            url:"업로드 경로",
            data:formData,
            type:'POST',
            enctype:'multipart/form-data',
            processData:false,
            contentType:false,
            dataType:'json',
            cache:false,
            success:function(result){
                if(result.data.length > 0){
                    alert("성공");
                    location.reload();
                }else{
                    alert("실패");
                    location.reload();
                }
            }
        });
    }
}


        
    if(confirm("등록 하시겠습니까?")){
        // 등록할 파일 리스트를 formData로 데이터 입력
        var form = $('#uploadForm');
        var formData = new FormData(form);
        for(var i = 0; i < uploadFileList.length; i++){
            formData.append('files', fileList[uploadFileList[i]]);
        }
        
        $.ajax({
            url:"업로드 경로",
            data:formData,
            type:'POST',
            enctype:'multipart/form-data',
            processData:false,
            contentType:false,
            dataType:'json',
            cache:false,
            success:function(result){
                if(result.data.length > 0){
                    alert("성공");
                    location.reload();
                }else{
                    alert("실패");
                    location.reload();
                }
            }
        });
    }

</script>
</html>