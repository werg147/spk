<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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


<!--내용-->
<div class="wrap">
    <div class="container">

        <!--상단여백-->
        <div class="searching_item"><!----></div>

        <div class="page_aticle">
            <div class="page_section section_prdwrite">
                <div class="head_aticle">
                <h2 class="tit">PRODUCT Q&amp;A <span class="tit_sub">상품 Q&amp;A입니다.</span></h2>

                <ul class="list_type1 old">
                    <li><span class="ico"></span><p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p></li>
                    <li><span class="ico"></span><p class="txt">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</p></li>
                </ul>
                </div>

                <form name="formQna" method="post" action="${pageContext.request.contextPath}/store/qnaWrite" enctype="multipart/form-data">
                	<input type="hidden" name="prod_no" value="${param.prodNo}">
                    <input type="hidden" name="qna_date" value="">
                    <input type="hidden" name="user_no" value="${authUser.user_no}">
                    <input type="hidden" name="buy_no" value="300">
              
                
                    <table id="form" class="tbl tbl_type2">
                        <colgroup>
                            <col style="width:130px">
                            <col style="width:920px">
                        </colgroup>
                            <tbody>
                                <tr>
                                    <th>작성자</th>
                                    <td>
                                        <input type="text" name="name" required="" fld_esssential="" label="작성자" value="${authUser.nickname}" readonly="readonly" class="read_only">
                                    </td>
                                </tr>
                               
                                <tr>
                                    <th>핸드폰</th>
                                    <td>
                                        <input type="text" name="phone" label="문자메시지" value="${userVo.user_phone}" readonly="readonly" class="read_only">
                                        <label for="rcvSms" class="label_check">
                                            <input type="checkbox" value="">
                                            문자로 답변을 받겠습니다.
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>비밀글</th>
                                    <td class="secret">
                                        <label for="qna_type">
                                            <input type="checkbox" id="secret" name="qna_type" value="secret">
                                            비밀글
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td class="subject">
                                        <input type="text" name="qna_title" label="제목" value="">
                                    </td>
                                </tr>
                                <tr id="edits">
                                    <td colspan="2" class="txt_field">
                                    </td>
                                </tr>                              
                            </tbody>
                    </table>


		            <!--파일첨부-->
		            
			            <div class="file_up">
			                <!--input box
			                <input type="text" class="upload_text" readonly="readonly">-->
			
			                <!--button-->
			                <div class="">
			           
			                    <input type="file" class="input_file"  name="file" title="파일찾기">
			                </div>
			            </div>
		            
		            <!--입력란-->
		            <div>
		                <textarea class="textarea_size" name="qna_content" value=""></textarea>
		            </div>
		        
		    
		            <!--등록/취소 버튼-->
		            <div class="group_btn_qna">
		                <span class="inner_btn">
		                    <button type="button" onclick="history.back();return false;" class="btn">취소</button>
		                    <button type="submit" value="등록" class="btn btn_submit">등록</button>
		                </span>
		            </div>
		                    
		     </form>
		  </div>
      </div>

        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        
        <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!--//footer//-->


    </div><!--//container-->
</div><!--//wrap-->

</body>
</html>