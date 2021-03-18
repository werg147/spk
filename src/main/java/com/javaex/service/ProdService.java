package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.javaex.dao.ProdDao;
import com.javaex.vo.ProdimgVo;
import com.javaex.vo.ProductVo;

@Service
public class ProdService {
	@Autowired
	private ProdDao proddao;


	public void prodWrite(MultipartFile file, ProductVo prodvo) {
		String saveName;

		if (file.getSize() != 0) {
			// db 저장할 정보 수집
			String saveDir = "C:\\javaStudy\\upload";

			// 오리지널 파일이름
			String orgName = file.getOriginalFilename();

			// 확장자
			String exName = orgName.substring(orgName.lastIndexOf("."));

			// 서버 저장 파일 이름
			saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;

			// 서버 파일 패스 --> 저장경로
			String filePath = saveDir + "\\" + saveName;

			// 파일 사이즈
			long fileSize = file.getSize();

			// 서버하드디스크 파일저장
			try {
				byte[] fileData = file.getBytes();
				OutputStream out = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(out);

				bos.write(fileData);
				bos.close();

			} catch (IOException e) {
				e.printStackTrace();
			}

			prodvo.setProd_detail_img_savename(saveName);
			prodvo.setProd_detail_img_name(orgName);

			System.out.println("변경하면 : " + saveName);
		}

		 proddao.prodInsert(prodvo);
	}

	public void prodImgWrite(MultipartHttpServletRequest request) {

		Iterator<String> itr = request.getFileNames();
		System.out.println(itr);

		String filePath = "C:\\javaStudy\\upload"; // 설정파일로 뺀다.

		while (itr.hasNext()) { // 받은 파일들을 모두 돌린다.

			MultipartFile mpf = request.getFile(itr.next());

			String savename = System.currentTimeMillis() + UUID.randomUUID().toString()
					+ mpf.getOriginalFilename(); // 파일명

			String fileFullPath = filePath + "/" + savename; // 파일 전체 경로

			System.out.println("originalFilename:" + savename + ", fileFullPath:" + fileFullPath);
			try {
				// 파일 저장
				mpf.transferTo(new File(fileFullPath));

			} catch (Exception e) {
				System.out.println("postTempFile_ERROR======>" + fileFullPath);
				e.printStackTrace();
			}
			ProdimgVo imgvo = new ProdimgVo();
			imgvo.setProd_img_savename(savename);
			imgvo.setProd_img_name(mpf.getOriginalFilename());
			imgvo.setProd_img_type("main");
			
			System.out.println(imgvo);
			//proddao.mainImgInsert(imgvo);
		}
	}
}