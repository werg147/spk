package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.GymDao;
import com.javaex.vo.ConVo;
import com.javaex.vo.GymImgVo;
import com.javaex.vo.GymVo;

@Service
public class GymService {

	@Autowired
	private GymDao gymDao;
	
	//체육관 정보 불러오기
	public GymVo gymInfo(int gymno) {
		System.out.println("[GymService] gymInfo()");
		return gymDao.gymSelectOne(gymno);
	}
	
	//체육관 등록 (체육관, 체크박스값, 파일 등록)
	public void gymAdd(GymVo gymVo, List<String> conve, MultipartFile file) {
		System.out.println("[GymService] gymAdd()");

		String con;
		ConVo conVo;
		
		//체육관 정보만 insert
		gymDao.gymInsert(gymVo); 
		
		//등록한 체육관 번호 가져오기(이거 하려면 insert문에 select key 써야 됨)
		int gymNo = gymVo.getGym_no();
		System.out.println("체육관번호>>> "+gymNo);
		
		//주변시설 데이터 6가지를 전부 넣은 후 
		ConVo conVo1 = new ConVo(gymNo, "주차장");
		ConVo conVo2 = new ConVo(gymNo, "샤워실");
		ConVo conVo3 = new ConVo(gymNo, "수건");
		ConVo conVo4 = new ConVo(gymNo, "락커");
		ConVo conVo5 = new ConVo(gymNo, "글러브");
		ConVo conVo6 = new ConVo(gymNo, "운동복");
		
		gymDao.conInsert(conVo1);
		gymDao.conInsert(conVo2);
		gymDao.conInsert(conVo3);
		gymDao.conInsert(conVo4);
		gymDao.conInsert(conVo5);
		gymDao.conInsert(conVo6);
		
		//if문으로 해당 시설이 있는지 확인해서 있으면 con_state를 1로 변경함
		for(int i=0; i<conve.size(); i++) {
			con = conve.get(i);
			
			if("park".equals(con)) { 
				conVo = new ConVo(gymNo, "주차장");
				gymDao.conUpdate(conVo);
				
			}else if ("shower".equals(con)) {
				conVo = new ConVo(gymNo, "샤워실");
				gymDao.conUpdate(conVo);
				
			}else if ("towel".equals(con)) {
				conVo = new ConVo(gymNo, "수건");
				gymDao.conUpdate(conVo);
				
			}else if ("locker".equals(con)) {
				conVo = new ConVo(gymNo, "락커");
				gymDao.conUpdate(conVo);
				
			}else if ("glove".equals(con)) {
				conVo = new ConVo(gymNo, "글러브");
				gymDao.conUpdate(conVo);
				
			}else if ("wear".equals(con)) {
				conVo = new ConVo(gymNo, "운동복");
				gymDao.conUpdate(conVo);
				
			} 
		}
		
		//체육관 이미지 처리
		System.out.println("[file original name] --> "+file.getOriginalFilename()); 
		
		/////DB에 저장할 파일정보 수집/////
		
		//서버 파일패스(경로)
		String saveDir = "C:\\javaStudy\\upload";
		
		//오리지널 파일명
		String orgName = file.getOriginalFilename();
		
		//확장자명
		String exName = orgName.substring(orgName.lastIndexOf("."));
		
		//서버 저장파일명 + 확장자명 --> logoFile에 해당
		String imgFile = System.currentTimeMillis()+UUID.randomUUID().toString() + exName;
		
		//서버 저장경로+파일명
		String filePath = saveDir + "\\" + imgFile;


		//서버 하드디스크에 저장
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bos = new BufferedOutputStream(out);
			
			bos.write(fileData);
			bos.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		GymImgVo gimgVo = new GymImgVo(gymNo, imgFile, orgName); 
		gymDao.gimgInsert(gimgVo);

	}
}
