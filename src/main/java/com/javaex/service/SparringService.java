package com.javaex.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.SparringDao;
import com.javaex.vo.BBuyVo;
import com.javaex.vo.BookingVo;
import com.javaex.vo.ConvenienceVo;
import com.javaex.vo.DayVo;
import com.javaex.vo.EventVo;
import com.javaex.vo.GymImgVo;
import com.javaex.vo.GymVo;
import com.javaex.vo.ProfileVo;
import com.javaex.vo.RecordVo;
import com.javaex.vo.UserVo;

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
		
		String major = profileVo.getMajor();
		System.out.println("major"+major);
		if(major == null) {
			profileVo.setMajor("없음");
		}
		String word = profileVo.getWord();
		System.out.println("word"+word);
		if(word == "") {
			profileVo.setWord("잘 부탁드립니다");
		}
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
		System.out.println("확인"+recordVo.getRecordList().get(0).getRecordName());
		
		if(recordVo.getRecordList().get(0).getRecordName() != ""
				) {
		for(int i=0; i<recordVo.getRecordList().size(); i++) {
			System.out.println("??");
			RecordVo rVo = recordVo.getRecordList().get(i);
			
			//받아온 profileNo 넣기
			rVo.setProfileNo(profileNo);
			
			System.out.println(rVo.getRecordName());
			sparringDao.insertRecord(rVo);
			
			}
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

	public List<GymVo> rent() {
		System.out.println("[Service] : rent()");
		
		List<GymVo> gymList =  sparringDao.selectListGym();
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		System.out.println(gymList);
		
		
		
		for(int i = 0; i< gymList.size(); i++) {
			
			//평균 비용의 1인분 값구하기
			int avgPrice = gymList.get(i).getAvgPrice();
			
			int avgOnePrice = (int)avgPrice / 2;
			
			System.out.println("avgOnePrice ="+ avgOnePrice);
			//금액 사이에 쉼표넣기
			gymList.get(i).setAvgOnePrice(avgOnePrice);
			
			String money= formatter.format(avgPrice);
			String moneyHalf = formatter.format(avgOnePrice);
			
			gymList.get(i).setMoney(money);
			gymList.get(i).setMoneyHalf(moneyHalf);
			
			System.out.println(money);
			System.out.println(moneyHalf);
			
			// 주소의 2번째 값만 가지고 하프주소 넣어주기
			
			String[] addressHalf= gymList.get(i).getGym_address().split("\\s");
			
			gymList.get(i).setAddressHalf(addressHalf[1]);
			
			System.out.println(gymList.get(i).getAddressHalf());
			
			
			
		}
		
		
		
		return gymList;
		
	}

	public GymVo rentDetail(int gymNo) {
		// TODO Auto-generated method stub
		System.out.println("[Service] : rentDetail()");
		
		//1.gymVo를 받는다
		GymVo gymVo = sparringDao.selectOneGym(gymNo);
		System.out.println("gymVo ="+ gymVo);
		
		//1end
		//2.gymImgList를 받는다
		List<GymImgVo> gymimgList = sparringDao.selectListGymImg(gymNo);
		System.out.println("gymimgVo = "+ gymimgList);
		
		//2end
		
		//3. 날짜 뿌리기전 오늘기준으로 10일째의 날짜와 요일을 구한다
		Calendar cal = Calendar.getInstance();
		String[] weekDay = { "일", "월", "화", "수", "목", "금", "토" };  
		 
		//뿌리기용 날짜 리스트
		List<DayVo> dayList = new ArrayList<DayVo>();
		
		//오늘부터 10일 날짜구하기
		for(int i = 0; i<10; i++) {
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH)+1;
			int day = cal.get(Calendar.DAY_OF_MONTH)+i;
			int dayofWeek = cal.get(Calendar.DAY_OF_WEEK)+i;
			if(dayofWeek>7) {
				if(dayofWeek >14) {
					dayofWeek = dayofWeek - 14;
				}else {
					dayofWeek = dayofWeek - 7;
				}
			}
			String today ="";
			switch(dayofWeek) {
			case 1: today = "일"; break;
			case 2: today = "월";break;
			case 3:today = "화";break;
			case 4:today = "수";break;
			case 5:today = "목";break;
			case 6:today = "금";break;
			case 7:today = "토";break;
			}
			
		System.out.println(i+"="+ year + "." + month + "." + day+"."+today);
		
		/***********변경할수있음**************/
		//이렇게하는 이유는 검색을 03월 이렇게 되는데 month는 그냥 3 이기때문
		String date = "";
		if(month < 10) {
			date = year + ".0" + month + "." + day;
		} else {
			date = year + "." + month + "." + day;	
		}
		DayVo dayVo = new DayVo(year,month,day,today,date);
		dayList.add(dayVo);
		}
		
		//오늘부터 10일 날짜구하기 end
		//4.오늘의 날짜로 대관 정보가 있는지 확인한후 하나의 vo를받는다
		//(다른날짜에 대한 정보는  ajax로 처리하기 때문)
		System.out.println("오늘 = "+ dayList.get(0));
		String day1 = dayList.get(0).getDate();
		
		//셀렉트 웨어절 구문이 바뀔수 있음 ***************************************
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("day",day1);
		map.put("gymNo",gymNo);
		
		List<BookingVo> bookingList = sparringDao.selectListBooking(map);
		
		
		//5.편의시설 리스트
		
		List<ConvenienceVo> conList = sparringDao.selectListCon(gymNo);
		
		 //gymimgList, dayList, bookingList, conList
		gymVo.setGymimgList(gymimgList);
		gymVo.setDayList(dayList);
		gymVo.setBookingList(bookingList);
		gymVo.setConList(conList);
		
		return gymVo;
	}

	
	
	
	
	
	public GymImgVo gymImgOne(int gymImgNo) {
		System.out.println("[Service] : gymImgOne");
		
		return sparringDao.selectOneGymImg(gymImgNo);
		
	}

	public List<BookingVo> bookingList(String date, int gymNo) {
		System.out.println("[Service] : bookingList");
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("day",date);
		map.put("gymNo",gymNo);
		
		List<BookingVo> bookingList = sparringDao.selectListBooking(map);
		return bookingList;
	}
	
	
	//결제하기
	public Map<String,Object> payment(int bookingNo, int userNo) {
		System.out.println("[Service] : payment()");
		//DecimalFormat formatter = new DecimalFormat("###,###");
		BookingVo bookingVo = sparringDao.selectOneBooking(bookingNo);
		
		System.out.println(bookingVo);
		
		//int price  = bookingVo.getBooking_price();
		
		UserVo userVo = sparringDao.selectAddressUser(userNo);
		
		System.out.println(userVo);
		
		//vo를 Map으로 묶는다
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("bookingVo",bookingVo);
		map.put("userVo",userVo);
		
		return map;
		
	}

	public void pay(BBuyVo bBuyVo) {
		System.out.println("[Service] : pay()");
		int num = bBuyVo.getB_buy_price().lastIndexOf(".");
		
		String str=bBuyVo.getB_buy_price().substring(0, num);
		System.out.println(str);
		int price = Integer.parseInt(str);
		bBuyVo.setPrice(price);
		
		System.out.println(bBuyVo.getBooking_no());
		//먼저 bbuy를 셀렉트 문으로 꺼내서 
		
		//subNum이 0이면 시합등록자 1이면 신청자 
		if(bBuyVo.getSubNum() == 0) {
			bBuyVo.setB_buy_player_state("시합등록자");
			
			if(bBuyVo.getBooking_no()!=0) {
				//subNum 이 0(시합등록자)이면서 대관을 하는 경우
				bBuyVo.setB_buy_state("결제완료");
			}
			//else subNum 이 0(시합등록자)이면서 스파링신청만 하는경우
			
		}else if (bBuyVo.getSubNum() == 1) {
			bBuyVo.setB_buy_player_state("신청자");
			
			if(bBuyVo.getBooking_no()!=0) {
				//subNum이 1(신청자)면서 대관후에 신청하는 경우
				
				bBuyVo.setB_buy_state("결제완료");
			}
				//subNum이 1(신청자)면서 상대에게 신청만하는경우
		}
		
		sparringDao.insertBBuy(bBuyVo);
		
	}
}
