package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.StoreDao;
import com.javaex.vo.QnaVo;

@Service
public class StoreService {
	
	@Autowired
	private StoreDao storeDao;
	
	//qna 작성내용 인서트
	public void qnaWrite(QnaVo qnaVo, MultipartFile file) {
		System.out.println("[Service] qnaWrite()");
		
		//작성 내용 인서트
		storeDao.qnaInsert(qnaVo);
		
		///////이미지 파일 인서트//////
		//db저장할 정보 수집
		String saveDir = "C:\\javastudy\\upload";
		
		//오리지널 파일 이름 (문의이미지 등록명 qna_img_name)
		String qna_img_name = file.getOriginalFilename();
		System.out.println("qna_img_name: " + qna_img_name);
		
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
		

	}
	
	
	
}
