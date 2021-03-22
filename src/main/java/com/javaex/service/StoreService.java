package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.StoreDao;
import com.javaex.vo.ProdimgVo;
import com.javaex.vo.ProductVo;
import com.javaex.vo.QnaVo;
import com.javaex.vo.QnaimgVo;

@Service
public class StoreService {
	
	@Autowired
	private StoreDao storeDao;
	
	//storeList 가져오기
	public List<ProductVo> storeList(String search) {
		System.out.println("[Service] storeList()");
			
		return storeDao.selectStoList(search);	
	}
	
	
	
	//qna 작성내용 인서트
	public void qnaWrite(QnaVo qnaVo, MultipartFile file) {
		System.out.println("[Service] qnaWrite()");
		
		System.out.println(qnaVo);
		System.out.println(file);
				

		//작성 내용 인서트
		storeDao.qnaInsert(qnaVo);
		
		///////이미지 파일 인서트//////
		//db저장할 정보 수집
		String saveDir = "C:\\javastudy\\upload";
		
		//오리지널 파일 이름 (문의이미지 등록명 qna_img_name)
		String qna_img_name = file.getOriginalFilename();
		//System.out.println("qna_img_name:" + qna_img_name);
		
		//오리지널 파일 비어있음 --> 해당 값이 없어 조건에 맞춰 확장자를 자를 수 없다.
		//java.lang.StringIndexOutOfBoundsException: String index out of range: -1
		//Vo에 private으로 MultipartFile 생성 뒤 Controller에서 Vo로 묶어 받아 올 수 있음.
		//하지만 일반 내용 인서트와 이미지 파일 인서트 구분을 위해 if문으로 걸러주기로 했다.
		//file.toString(); -> 값이 뜸. -> null이 될 수 없기 때문에 위의 qna_img_name으로 걸러주기로 함.
		
		if(ObjectUtils.isEmpty(qna_img_name)) {
			System.out.println("선택된 파일이 없습니다.");
		} else {
			//확장자
			String exName = qna_img_name.substring(qna_img_name.lastIndexOf("."));
			System.out.println("exName: " + exName);
			
			//서버 저장파일 이름 (문의이미지 저장명 qna_img_savename)
			String qna_img_savename = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			System.out.println("qna_img_savename: " + qna_img_savename);
			
			//서버 파일패스 (저장경로)
			String filePath = saveDir + "\\" + qna_img_savename;
			System.out.println("filePath: " + filePath);
			
			
			//서버 하드디스크 파일저장
			try {
				byte[] fileData = file.getBytes();
				
				OutputStream out = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(out);
				
				bos.write(fileData);
				bos.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			//db저장
			//문의는 이미지 하나만 받고 리뷰에 여러개 받기로 함
			//문의 옵션 임의로 넣어줌
			String qna_img_type = "main";
			
			QnaimgVo qnaimgVo = new QnaimgVo();
			
			qnaimgVo.setQna_no(qnaVo.getQna_no());
			qnaimgVo.setQna_img_name(qna_img_name);
			qnaimgVo.setQna_img_savename(qna_img_savename);
			qnaimgVo.setQna_img_type(qna_img_type);
			
			storeDao.qnaimgInsert(qnaimgVo);
			
		}
		


	}
	
	
	
}
