package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.SparringDao;
import com.javaex.vo.EventVo;
import com.javaex.vo.ProfileVo;
import com.javaex.vo.RecordVo;

@Service
public class SparringService {
	
	
	/*
	 체크박스는 list로 받고
	 1. 복싱 2.킥복싱 3.종합격투기 4.주짓수
	 */
	@Autowired
	SparringDao sparringDao;
	public void profileWrite(ProfileVo profileVo, String[] eventName, RecordVo recordVo) {
		System.out.println("[Service] : profileWrite()");
		/*********프로필 인스트**********/
		System.out.println("vo :" + profileVo);
		//profile insert + 셀렉트 키로 profileNo 생성
		
		sparringDao.insertProfile(profileVo);
		System.out.println("vo2 :" + profileVo);
		
		//selectKey로 생성된 profileNo값 받기
		int profileNo = profileVo.getProfileNo();
		
		/*********주종목(주특기) event 인서트********/
		//질문하기 dao에서 반복인지 서비스인지 먼저 서비스로해봄 (질문해볼것)
		int[] eventName2 = new int[eventName.length];
		
		for(int i = 0 ; i<eventName.length;i++) {
			
			eventName2[i] = Integer.parseInt(eventName[i]);
			
			System.out.println(eventName2[i]);
			
			EventVo eventVo = new EventVo();
			
			eventVo.setProfileNo(profileNo);
			eventVo.setEventName(eventName2[i]);
			
			sparringDao.insertEvent(eventVo);
			
		}
		
		/***********공식기록 record 인서트*********/
		
		for(int i=0; i<recordVo.getRecordList().size(); i++) {
			System.out.println("??");
			RecordVo rVo = recordVo.getRecordList().get(i);
			
			//받아온 profileNo 넣기
			rVo.setProfileNo(profileNo);
			
			System.out.println(rVo.getRecordName());
			sparringDao.insertRecord(rVo);
			
			}
		
		
	}
	
	//처음 프로필을 들어갈때 날짜정보를 뿌려줘야하기때문에 날짜만 빼온다
	public List<ProfileVo> profileWriteForm(int userNo) {
		// TODO Auto-generated method stub
		System.out.println("[Service] : profileWriteForm");
		
		return sparringDao.selectListProfile(userNo);
		
	}
	
	//프로필생성날짜로 vo 뿌리기
	public Map<String,Object> selectDate(int rownum, int userNo) {
		System.out.println("[Service] : selectDate");
		System.out.println(rownum);
		System.out.println(userNo);
		Map<String,Object> profileMap = new HashMap<String,Object>();
		profileMap.put("rownum", rownum);
		profileMap.put("userNo", userNo);
		
		System.out.println("rownum =" + rownum);
		System.out.println("userNo =" + userNo);
		
		/*********************날짜에 대한 값들 보내기************************/
		
		//프로필
		ProfileVo profileVo = sparringDao.selectOneProfile(profileMap);
		System.out.println(profileVo);
		
		int profileNo = profileVo.getProfileNo();
		//주종목
		List<EventVo> eventList = sparringDao.selectListEvent(profileNo);
		
		//공식기록
		List<RecordVo> recordList = sparringDao.selectListRecord(profileNo);
		
		//하나에 묶기
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("profileVo",profileVo);
		pMap.put("eventList",eventList);
		pMap.put("recordList",recordList);
		return pMap;
	}
}
