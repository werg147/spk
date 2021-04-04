<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
						<div>상품수정</div>
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

											<option value="운동용품"
												${prodvo.event_cate == '운동용품' ? 'selected="selected"' : ''}>운동용품</option>
											<option value="의류"
												${prodvo.event_cate == '의류' ? 'selected="selected"' : ''}>의류</option>
											<option value="잡화"
												${prodvo.event_cate == '잡화' ? 'selected="selected"' : ''}>잡화</option>

										</select>
									</div>
								</td>
							</tr>
							<tr class="basic">
								<td><label for="event_cate">종목카테고리</label></td>
								<td><div class="content_product_insert_select_box">
										<select id="event_cate" name="event_cate">
											<option value="킥복싱"
												${prodvo.prod_cate == '킥복싱' ? 'selected="selected"' : ''}>킥복싱</option>
											<option value="복싱"
												${prodvo.prod_cate == '복싱' ? 'selected="selected"' : ''}>복싱</option>
											<option value="주지수"
												${prodvo.prod_cate == '주지수' ? 'selected="selected"' : ''}>주지수</option>
											<option value="종합격투기"
												${prodvo.prod_cate == '종합격투기' ? 'selected="selected"' : ''}>종합격투기</option>
										</select>
									</div></td>
							</tr>
							<tr class="basic">
								<td><label for="prod_name">상품명</label></td>
								<td><input type="text" id="prod_name" name="prod_name"
									value="${prodvo.prod_name}"></td>
							</tr>
							<tr class="basic">
								<td><label for="prod_price">제품가격</label></td>
								<td><input type="text" id="prod_price" name="prod_price"
									value="${prodvo.prod_price}"></td>
							</tr>
							<tr class="basic">
								<td><label for="prod_brand">브랜드명</label></td>
								<td><input type="text" id="prod_brand" name="prod_brand"
									value="${prodvo.prod_brand}"></td>
							</tr>
							<tr class="product_insert_div_img">
								<td>대표이미지</td>
								<td class="img_td">
									<div>
										<div class="dropZone1">
											<p>이미지를 끌어오세요</p>
										</div>
										<div id="img_add_box">
											<div id="imgadd1">
												<div class="thumb" id="${prodvo.pimgList[0].prod_img_no}">
													<img
														src="${pageContext.request.contextPath}/upload/${prodvo.pimgList[0].prod_img_savename}">
													<div class="imgaddclose" id="mainclose">X</div>
												</div>
											</div>

										</div>
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
										<div id="img_add_box">
											<div id="imgadd2">
												<c:forEach items="${pimgList}" var="ProdimgVo">
													<c:if test="${ProdimgVo.prod_img_type != 'main'}">
														<div class="thumb" id="${ProdimgVo.prod_img_no}">
															<img
																src="${pageContext.request.contextPath}/upload/${ProdimgVo.prod_img_savename}">
															<div class="imgaddclose"
																id="subclose${ProdimgVo.prod_img_no}">X</div>
															<input value="${ProdimgVo.prod_img_no}" type="hidden"
																id="thumb_remove">
														</div>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr class="sizecolor_div">
								<td>색상 및 사이즈</td>

								<td id=sizecolor><label for="color">색상</label> <input
									type="text" id="color" name="color"> <label
									for="prod_size">사이즈</label> <input type="text" id="prod_size"
									name="prod_size"> <label for="stock">재고</label> <input
									type="text" id="stock" name="stock">
									<button id="sizecolor_btn" type="button">등록</button>
									<div class="colorsizestocktab">
										<div id="sizebox"></div>
									</div></td>

							</tr>
							<tr class="plus">
								<td><label for="prod_desc">제품소개(성분)</label></td>
								<td><textarea id="prod_desc" name="prod_desc">${prodvo.prod_desc}</textarea></td>
							</tr>
							<tr class="plus">
								<td><label for="prod_from">제조/수입내용</label></td>
								<td><textarea id="prod_from" name="prod_from">${prodvo.prod_from}</textarea></td>
							</tr>
							<tr class="plus">
								<td><label for="prod_wash">세탁방법 및 주의사항</label></td>
								<td><textarea id="prod_wash" name="prod_wash">${prodvo.prod_wash}</textarea></td>
							</tr>
							<tr class="plus">
								<td><label for="prod_qual">품질보증기준</label></td>
								<td><textarea id="prod_qual" name="prod_qual">${prodvo.prod_qual}</textarea></td>
							</tr>
							<tr class="large">
								<td><label for="prod_detail">상세페이지</label></td>
								<td>
									<div>
										<p>상세페이지 이미지등록</p>
										<label class="input-file-button" for="input-file"></label> <input
											type="file" name="detailfile" id="detailfile">
									</div> <textarea id="prod_detail" name="prod_detail">${prodvo.prod_detail}</textarea>
								</td>
							</tr>
						</table>
						<div class="product_insert_btn">
							<input type="hidden" name="sell_no"
								value="${sessionScope.authUser.sell_no}">
							<button class="insert_btn" type="button">상품등록</button>
							<button class="product_delclose_btn" type="reset">
								<a href="${pageContext.request.contextPath}/mypage/prod">상품목록으로</a>
							</button>
						</div>
					</form>

				</div>
				<!--//delivery_info-->

			</div>
			<!--//content_product//-->
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--//footer//-->
		</div>
		<!--//middle//-->

	</div>
	<!--//container//-->
	</div>
	<!--//wrap//-->

</body>

<script type="text/javascript">
	var deleteList = [];
	var mainadded = 1;
	var subadded = '${fn:length(prodvo.pimgList)}' - 1;
	console.log(subadded);

	//불러온 이미지 닫기
	$("#mainclose").on(
			"click",
			function() {
				console.log("mainimg close");
				const div = document
						.getElementById('${prodvo.pimgList[0].prod_img_no}');
				div.remove();
				console.log('${prodvo.pimgList[0].prod_img_name}' + "지움");

				deleteList.push('${prodvo.pimgList[0].prod_img_no}');
				console.log(deleteList);

				mainadded--;

			});

	var imgnum = $("#thumb_remove").val();

	//불러온 이미지 닫기
	$("#subclose" + imgnum).on("click", function() {
		console.log("subimg close");
		const div = document.getElementById(imgnum);
		div.remove();
		console.log(imgnum + "지움");

		deleteList.push(imgnum);
		console.log(deleteList);

		subadded--;
	});

	//가격표시
	$(document).on('keyup', 'input[inputmode=numeric]', function(event) {
		this.value = this.value.replace(/[^0-9]/g, ''); // 입력값이 숫자가 아니면 공백
		this.value = this.value.replace(/,/g, ''); // ,값 공백처리
		this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가 	
	});

	$(document).ready(function() {
		console.log("페이지열림")
		startLoadFile();
	});

	function startLoadFile() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/mypage/prod/prodModifyinfo?prod_no=${prodvo.prod_no}",
					type : 'GET',
					dataType : 'json',
					success : function(data) {
						console.log(data)
						createcolor(data.cssList);

						name = "detailfile"

						$("#detailfile ")

						//createImages(data.pimgList);
					}
				});
	}

	//컬러사이즈 불러오기
	function createcolor(cssList) {

		for (let i = 0; i < cssList.length; i++) {
			var color = cssList[i].color;
			var prod_size = cssList[i].prod_size;
			var stock = cssList[i].stock;

			console.log(color, prod_size, stock, listnum)
			cssVo = {
				color : color,
				prod_size : prod_size,
				stock : stock
			};

			console.log(cssVo);

			add(color, prod_size, stock, listnum);
			console.log("선택자추가");

			cssList[listnum] = cssVo;
			console.log(cssList);
			console.log("선택자추가");

			listnum++;
			console.log("색상추가개수" + listnum);
		}
	}

	//이미지불러오기 작업중
	function createImages(pimgList) {
		if (pimgList.prod_img_type == main) {
			pimgList.prod_img_savename
		} else {
			for (let i = 0; i < pimgList.length; i++) {

			}

		}

	}

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

	var count1 = 0;
	var count2 = 0;
	var minus1 = 0;
	var minus2 = 0;
	var colorminus = 0;
	var listnum;

	$(function() {
		// 파일 드롭 다운
		fileDropDown1();
		fileDropDown2();
	});

	function fileDropDown1() {
		var dropZone1 = $(".dropZone1");
		//Drag기능 
		dropZone1.on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
			dropZone1.css('background-color', '#A9A9A9');
		});
		dropZone1.on('dragleave', function(e) {
			e.stopPropagation();
			e.preventDefault();
			// 드롭다운 영역 css
			dropZone1.css('background-color', '#E3E3E3');
		});
		dropZone1.on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			// 드롭다운 영역 css
			dropZone1.css('background-color', '#A9A9A9');
		});
		dropZone1.on('drop', function(e) {
			e.preventDefault();
			// 드롭다운 영역 css
			dropZone1.css('background-color', '#E3E3E3');
			var files = e.originalEvent.dataTransfer.files;//0
			console.log('files' + files);

			for (var i = 0; i < files.length; i++) {
				files[i].mainsub = 'main' + files[i].name;
				var file1 = files[i];
				console.log(file1);
				count1 = uploadFiles1.push(file1); //업로드 목록에 추가
				console.log('count' + count1);
				console.log(uploadFiles1);
				preview1(file1, count1 - 1); //미리보기 만들기

			}
			if (files != null) {
				if (files.length < 1) {
					alert("폴더 업로드 불가");
					return;
				}
				selectFile1(files)
			} else {
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
				<div class="imgclose" data-idx="' + idx + '">X</div> \
				</div>';

				$("#imgadd1").append(div);
			};
		})(file1, idx);
		reader.readAsDataURL(file1);
	}

	// 파일 선택시
	function selectFile1(files) {
		// 다중파일 등록
		if (files != null) {
			for (var i = 0; i < files.length; i++) {
				// 파일 이름
				var fileName = files[i].name;
				var fileNameArr = fileName.split("\.");
				// 확장자
				var ext = fileNameArr[fileNameArr.length - 1];
				if ($.inArray(ext, [ 'exe', 'bat', 'sh', 'java', 'jsp', 'html',
						'js', 'css', 'xml' ]) >= 0) {
					// 확장자 체크
					alert("등록 불가 확장자");
					break;
				}
			}
		} else {
			alert("ERROR");
		}
	}

	$("#imgadd1").on("click", ".imgclose", function(e) {
		var $target = $(e.target);
		var idx = $target.attr('data-idx');
		uploadFiles1[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성

		console.log("/////////////")

		console.log(uploadFiles1)
		minus1++;
		console.log("minus" + minus1);

		$target.parent().remove(); //프리뷰 삭제

	});

	/////////////////여기부터 두번째 이미지등록(서브)///////////////////////////////////////
	// 파일 드롭 다운
	function fileDropDown2() {
		var dropZone2 = $(".dropZone2");
		//Drag기능 
		dropZone2.on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
			dropZone2.css('background-color', '#A9A9A9');
		});
		dropZone2.on('dragleave', function(e) {
			e.stopPropagation();
			e.preventDefault();
			// 드롭다운 영역 css
			dropZone2.css('background-color', '#E3E3E3');
		});
		dropZone2.on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			// 드롭다운 영역 css
			dropZone2.css('background-color', '#A9A9A9');
		});
		dropZone2.on('drop', function(e) {
			e.preventDefault();
			// 드롭다운 영역 css
			dropZone2.css('background-color', '#E3E3E3');
			var files = e.originalEvent.dataTransfer.files;//0
			console.log('files' + files);

			for (var i = 0; i < files.length; i++) {
				files[i].mainsub = 'sub' + files[i].name;
				var file2 = files[i];
				console.log(file2);
				var count2 = uploadFiles2.push(file2); //업로드 목록에 추가
				console.log('count2' + count2);
				console.log(uploadFiles2);
				preview2(file2, count2 - 1); //미리보기 만들기

			}
			if (files != null) {
				if (files.length < 1) {
					alert("폴더 업로드 불가");
					return;
				}
				selectFile2(files)
			} else {
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
				<div class="imgclose" data-idx="' + idx + '">X</div> \
				</div>';

				$("#imgadd2").append(div);
			};
		})(file2, idx);
		reader.readAsDataURL(file2);
	}

	// 파일 선택시
	function selectFile2(files) {
		// 다중파일 등록
		if (files != null) {
			for (var i = 0; i < files.length; i++) {
				// 파일 이름
				var fileName = files[i].name;
				var fileNameArr = fileName.split("\.");
				// 확장자
				var ext = fileNameArr[fileNameArr.length - 1];
				if ($.inArray(ext, [ 'exe', 'bat', 'sh', 'java', 'jsp', 'html',
						'js', 'css', 'xml' ]) >= 0) {
					// 확장자 체크
					alert("등록 불가 확장자");
					break;
				}
			}
		} else {
			alert("ERROR");
		}
	}

	$("#imgadd2").on("click", ".imgclose", function(e) {
		var $target = $(e.target);
		var idx = $target.attr('data-idx');
		uploadFiles2[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성

		console.log("/////////////")
		for (let i = 0; i < fileList2.length; i++) {
			console.log(fileList2[i])
		}
		minus2++;
		console.log("minus" + minus2);
		$target.parent().remove(); //프리뷰 삭제

	});

	///////////////////////두번째 여기까지 이미지등록////////////////////////////////

	//////////여기부터 사이즈 등록////////

	/* var colorsizestock = new Array(); */

	$("#sizecolor_btn").on("click", function() {

		var color = $("#color").val();
		var prod_size = $("#prod_size").val();
		var stock = $("#stock").val();

		if (color == null || color == "") {
			alert("색상을 입력해주세요.");
			return false;
		}
		if (prod_size == null || prod_size == "") {
			alert("사이즈를 입력해주세요. (사이즈가 없는 상품은 free로 기재)");
			return false;
		}
		if (stock == null || stock == "") {
			alert("재고를 입력해주세요.");
			return false;
		}
		if (stock < 1) {
			alert("재고는 1개이상 입력해주세요.");
			return false;
		}

		cssVo = {
			color : color,
			prod_size : prod_size,
			stock : stock
		};

		console.log(cssVo);

		add(color, prod_size, stock, listnum);
		console.log("선택자추가");

		cssList[listnum] = cssVo;
		console.log(cssList);
		console.log("선택자추가");

		listnum++;
		console.log("색상추가개수" + listnum);
	});

	/*옵션의 삭제버튼 클릭할때 */
	$(".colorsizestocktab").on("click", ".close", function() {
		var $this = $(this);
		listnum = $this.data("listnum");
		deletedata(listnum);
		console.log(listnum);
		colorminus++
		console.log("색상제거개수" + colorminus)
	});

	function add(color, prod_size, stock, listnum) {
		var div = '<div class="thumb2" id="' +listnum+'">'
		div += '<div> 색상: ' + color + ', 사이즈: ' + prod_size + ', 재고: ' + stock
				+ '</div>'
		div += '<div data-listnum="'+listnum+'" class="close"><a>X</a>'
		div += '</div>'
		console.log("번호추가: " + listnum);
		$("#sizebox").append(div);

	}

	//업로드 파일 삭제
	function deletedata(listnum) {

		// 파일 배열에서 삭제
		delete cssVo[listnum];

		// 업로드 파일 테이블 목록에서 삭제
		$("#" + listnum).remove();
		console.log("delete" + cssVo[listnum]);

	}

	///////////////////이미지등록 공통부분//////////////
	$(".insert_btn")
			.on(
					"click",
					function() {
						event.preventDefault();

						var formData = new FormData();

						//상품카테고리
						const prod_cate_element = document
								.querySelector('#prod_cate');
						const prod_cate_value = prod_cate_element.value;
						var prod_cate = prod_cate_value;
						formData.append("prod_cate", prod_cate);
						//object.prod_cate = prod_cate_value;

						//종목카테고리
						const event_cate_element = document
								.querySelector('#event_cate');
						const event_cate_value = event_cate_element.value;
						var event_cate = event_cate_value;

						if (event_cate == "종목") {
							alert("종목을 선택해주세요.");
							return false;
						}

						formData.append("event_cate", event_cate);
						//object.event_cate = event_cate_value;

						//상품명
						var prod_name = $("[name='prod_name']").val();
						console.log(prod_name);

						if (prod_name == null || prod_name == "") {
							alert("상품명을 입력해주세요.");
							return false;
						}
						formData.append("prod_name", prod_name);
						//object.prod_name = prod_name;

						//제품가격

						function removeComma(str) {
							n = parseInt(str.replace(/,/g, ""));
							return n;
						}

						var price = $("[name='prod_price']").val();
						var prod_price = removeComma(price);
						console.log(prod_price);
						if (prod_price == null || prod_price == "") {
							alert("제품가격을 입력해주세요.");
							return false;
						}
						formData.append("prod_price", prod_price);
						//object.prod_price = prod_price;

						//브랜드명
						var prod_brand = $("[name='prod_brand']").val();
						if (prod_brand == null || prod_brand == "") {
							alert("브랜드명을 입력해주세요.");
							return false;
						}
						formData.append("prod_brand", prod_brand);
						//object.prod_brand = prod_brand;

						//제품소개
						var prod_desc = $("[name='prod_desc']").val();
						if (prod_desc == null || prod_desc == "") {
							alert("제품소개(성분)을 입력해주세요.");
							return false;
						}
						formData.append("prod_desc", prod_desc);
						//object.prod_desc = prod_desc;

						//제조수입내용
						var prod_from = $("[name='prod_from']").val();
						if (prod_from == null || prod_from == "") {
							alert("제조/수입내용을 입력해주세요.");
							return false;
						}
						formData.append("prod_from", prod_from);
						//object.prod_from = prod_from;

						//세탁주의사항
						var prod_wash = $("[name='prod_wash']").val();
						if (prod_wash == null || prod_wash == "") {
							alert("세탁방법 및 주의사항을 입력해주세요.");
							return false;
						}
						formData.append("prod_wash", prod_wash);
						//object.prod_wash = prod_wash;

						//품질보증
						var prod_qual = $("[name='prod_qual']").val();
						if (prod_qual == null || prod_qual == "") {
							alert("품질보증기준을 입력해주세요.");
							return false;
						}
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

						var detailfile = $("input[name=detailfile]").val();
						//파일 선택 필수
						if (detailfile == null || detailfile == "") {
							alert("상세페이지 이미지를 등록해주세요.");
							return false;
						}

						formData.append("detailfile",
								$("input[name=detailfile]")[0].files[0]);

						//대표이미지 개수 1개까지 등록가능
						var maincount = count1 - minus1 + mainadded;
						if (maincount > 1) {
							console.log("대표이미지개수" + maincount);
							alert("대표이미지는 한개만 등록가능합니다.");
							return false;
						}
						if (maincount < 1) {
							console.log("대표이미지개수" + maincount);
							alert("대표이미지를 등록해주세요.");
							return false;
						}

						//대표이미지 개수 1개이상 필수등록
						var maincount2 = count2 - minus2 + subadded;

						//사이즈 등록필수알림
						var colorcount = listnum - colorminus;
						if (colorcount < 1) {
							console.log("색상등록개수" + colorcount);
							alert("색상 및 사이즈를 등록해주세요.");
							return false;
						}

						$.each(uploadFiles1, function(i, file1) {
							if (file1.upload != 'disable') { //삭제하지 않은 이미지만 업로드 항목으로 추가
								formData.append('mainfile', file1,
										file1.mainsub);
							}
						});

						$.each(uploadFiles2,
								function(i, file2) {
									if (file2.upload != 'disable') { //삭제하지 않은 이미지만 업로드 항목으로 추가
										formData.append('subfile', file2,
												file2.mainsub);
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

						$
								.ajax({
									url : '${pageContext.request.contextPath}/mypage/prod/write',
									data : formData,
									contentType : false,
									processData : false,
									type : 'post',
									success : function(prod_no) {
										if (prod_no != null) {
											console.log(prod_no);
											console.log("상품등록 성공");

											var object = {};
											object.cssList = cssList;
											object.prod_no = prod_no;

											console
													.log("==========================================================")
											console.log(object);
											console
													.log("==========================================================")

											var json = JSON.stringify(object);
											console
													.log("==========================================================")
											console.log(json);
											console
													.log("==========================================================")

											$
													.ajax({
														url : '${pageContext.request.contextPath}/mypage/prod/sizewrite',
														contentType : "application/json",
														data : json,
														type : 'post',
														success : function(
																count) {
															if (count > 0) {
																alert("성공");
																location
																		.reload();

															} else {
																alert("실패");
																location
																		.reload();
															}
														}
													});

										} else {
											alert("실패");
											location.reload();
										}

									}

								});

					});

	////여기까지 이미지등록/////////////////////
</script>
</html>