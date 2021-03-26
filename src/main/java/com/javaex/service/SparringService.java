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
			
			
			/*주소 api 끝나면 살리기
			String[] addressHalf= gymList.get(i).getGym_address().split("\\s");
			
			if(addressHalf.length <2) {
				gymList.get(i).setAddressHalf(addressHalf[1]);
			}else {
				gymList.get(i).setAddressHalf(addressHalf[0]);
			}
			*/
			gymList.get(i).setAddressHalf(gymList.get(i).getGym_address());
			//여기까지포함
			
			
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
	public Map<String,Object> payment(int bookingNo, int userNo, int subnum) {
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

	public void pay(BBuyVo bBuyVo , int subnum , int bbuyno) {
		System.out.println("[Service] : pay()");
		int num = bBuyVo.getB_buy_price().lastIndexOf(".");
		
		String str=bBuyVo.getB_buy_price().substring(0, num);
		
		System.out.println(str);
		
		int price = Integer.parseInt(str);
		bBuyVo.setPrice(price);
		
		System.out.println(bBuyVo.getBooking_no());
		//먼저 bbuy를 셀렉트 문으로 꺼내서 
		
		//subNum이 0이면 시합등록자 1이면 신청자 
		if(subnum == 0) {
			bBuyVo.setB_buy_player_state("시합등록자");
			
				bBuyVo.setB_buy_state("결제완료");
				sparringDao.insertBBuy(bBuyVo);
		
			
		}else if (subnum == 1) {
			bBuyVo.setB_buy_player_state("신청자");
			bBuyVo.setB_buy_state("결제완료");
			
				sparringDao.insertBBuy(bBuyVo);
		}
		
		int bookingNo = bBuyVo.getBooking_no();
		//대관한 부킹정보는 예약으로 변경
		if(subnum ==0) {
			//시합등록자가 대관할경우 예약대기중
			sparringDao.updateBooking(bookingNo);
		}else if(subnum == 1) {
			//신청자가 대관할 경우 예약중
			sparringDao.updateBooking2(bookingNo);
		}
		
		
		//신청자의 경우 등록자에게 부킹번호 주기
		if(subnum == 1) {
			BBuyVo vo = new BBuyVo();
			vo.setBooking_no(bookingNo);
			vo.setB_buy_no(bbuyno);
			
			sparringDao.updateBBuy(vo);
			
			//시합등록자에게 알람보내기 
		}
		
	}

	public List<BBuyVo> match() {
		System.out.println("[Service] : match");
		
		List<BBuyVo> bBuyList = sparringDao.selectBBuyList();
		
		
		System.out.println(bBuyList);
		
		for(int i = 0 ; i<bBuyList.size(); i++) {
			int profileNo = bBuyList.get(i).getProfile_no();
			
			/*api 주소 부분 생기면 수정해야할 부분
			String[] addressHalf= bBuyList.get(i).getGym_address().split("\\s");
			
			bBuyList.get(i).setAddressHalf(addressHalf[1]);
			
			*/
			bBuyList.get(i).setAddressHalf(bBuyList.get(i).getGym_address());
			//여기까지임
			List<EventVo> eventList = sparringDao.selectListEvent(profileNo);
			
			bBuyList.get(i).setEventList(eventList);
			
		}
		
		return bBuyList;
		
	}
	
	
	//대관구매를 하지 않는 경우 사용
	public BBuyVo insertBBuy(int bookingNo, int subNum,int userNo, ProfileVo profileVo) {
		System.out.println("[Service]: insertBBuy");
		BBuyVo bBuyVo = new BBuyVo();
		
		if(subNum == 1) {
			
			bBuyVo.setB_buy_player_state("신청자");
			//결제안하고 신청한 상태에서 상대가 선택하면 결제
			
		}else {
			
			bBuyVo.setB_buy_player_state("시합등록자");
			
		}
		int profileNo = profileVo.getProfileNo();
		String event = profileVo.getProfileGymEvent();
		String time = profileVo.getTime();
		String day = profileVo.getDay();
		
		//api만들면 바꿔야함
		String address = profileVo.getAddress();
		
		bBuyVo.setBooking_no(bookingNo);
		bBuyVo.setUser_no(userNo);
		bBuyVo.setProfile_no(profileNo);
		bBuyVo.setB_buy_event(event);
		bBuyVo.setB_buy_time(time);
		bBuyVo.setB_buy_day(day);
		bBuyVo.setB_buy_address("서울 중랑구");
		
		System.out.println("event = " + event);
		System.out.println("time = " + time);
		System.out.println("day  = " + day );
		System.out.println("address = " + address);
	
		
		sparringDao.insertBBuy2(bBuyVo);
		
		return bBuyVo;
	}

	public Map<String,Object> MatchDetail(int bBuyNo, int userNo ,int sessionuser,int bookingno) {
		System.out.println("[Service] : bBuyNo");
		
		Map<String,Object> map = new HashMap<String,Object>();
		BBuyVo bBuyVo = new BBuyVo();
		bBuyVo.setB_buy_no(bBuyNo);
		bBuyVo.setUser_no(userNo);
		
		
		//시합등록자구하기
		BBuyVo vo = sparringDao.selectOneBBuy(bBuyVo);
		int event = 0;
		String WC= "";
		
		//체급구하기
		if(vo != null) {
			if(vo.getBooking_no() == 0) {
				int profileNo1 = vo.getProfile_no();
				ProfileVo profileVo = sparringDao.selectProfileEvent(profileNo1);
				
				String gymEvent = profileVo.getProfileGymEvent();
				if(gymEvent.equals("복싱")) {
					event = 1;
				}else if(gymEvent.equals("킥복싱")) {
					event = 2;
				}else if(gymEvent.equals("종합격투기")) {
					event = 3;
				}else if(gymEvent.equals("주짓수")) {
					event = 4;
				}
				int weight = Integer.parseInt(vo.getWeight());
				WC = weightClass(event,weight);
				
			}else {
				BookingVo bookingVo = sparringDao.selectOneBooking(vo.getBooking_no());
				String gymEvent = bookingVo.getGym_event();
				if(gymEvent.equals("복싱")) {
					event = 1;
				}else if(gymEvent.equals("킥복싱")) {
					event = 2;
				}else if(gymEvent.equals("종합격투기")) {
					event = 3;
				}else if(gymEvent.equals("주짓수")) {
					event = 4;
				}
				int weight = Integer.parseInt(vo.getWeight());
				WC = weightClass(event,weight);
				
			}
		}
		System.out.println(vo);
		System.out.println("시합등록자 :" + WC);
		if(vo != null) {
			vo.setWeightC(WC);
		// 시합등록자 구하기END
		}
		//시합 등록자의 승률구하기
		BBuyVo scoreVo = sparringDao.selectOneMatchScore(userNo);
		if(scoreVo != null) {
		
			
			double sumScore = scoreVo.getSumScore();
			double sumWin = scoreVo.getSumWin();
			System.out.println(sumScore+ "," + sumWin);
			
			int rate = (int) ((sumWin /sumScore)*100);
			System.out.println("승률 : "+ rate);
			if(vo != null) {
			vo.setRate(rate);
			//시합 등록자의 승률구하기END
			vo.setScoreCount(scoreVo.getScoreCount());
			}
		}
		
		/**경력리스트,주특기 리스트 구하기**/
		int profileNo = vo.getProfile_no();
		
		List<EventVo> eventList = sparringDao.selectListEvent(profileNo);
		
		//경력리스트
		List<RecordVo> recordList = sparringDao.selectListRecord(profileNo);
		
		if(vo != null) {
			vo.setEventList(eventList);
			vo.setRecordList(recordList);
		}
		//*****상대방구하기****//
		//상대방을 페이지에서 받아올수있는 bookingno로 구하지않고 불러와서 구하는 이유는
		//대관구매하지 않은 시합등록자는 bookingno가 없어 상대를 불러올수없고
		//두번째로 대관구매하지않은 시합등록자에게 시합신청할때 대관구매하는
		//신청자의 bookingno를 시합등록자에게 update로 넣을 예정이기에
		// 누군가 신청한 후에 상대가 표시 되기때문에 불러와서 넣는 구조로한다
		//if(vo.getBooking_no() != 0) {
		
		int bookingNo = vo.getBooking_no();
		System.out.println(bookingNo);
			
		List<BBuyVo> bbuyList = sparringDao.selectBBuyList2(bookingNo);
		
		
		System.out.println(bbuyList);
		
		
		/*주특기와 공식기록 찾기*/
		if(!bbuyList.isEmpty()) {
			
			
			
			BBuyVo vo2=bbuyList.get(0);
			
			int event1 = 0;
			String WC2= "";
		
			
			int profileNo2 = bbuyList.get(0).getProfile_no();
			
			List<EventVo> eventList2 = sparringDao.selectListEvent(profileNo2);
			List<RecordVo> recordList2 = sparringDao.selectListRecord(profileNo2);
			
			
			bbuyList.get(0).setEventList(eventList2);
			bbuyList.get(0).setRecordList(recordList2);
			//신청자의 승률구하기
			int userNo2 = bbuyList.get(0).getUser_no();
			
			BBuyVo scoreVo2 = sparringDao.selectOneMatchScore(userNo2);
			
			if(scoreVo2 != null) {
				double sumScore2 = scoreVo2.getSumScore();
				double sumWin2 = scoreVo2.getSumWin();
				System.out.println("신청자:"+sumScore2+ "," + sumWin2);
				
				int rate2 = (int) ((sumWin2 /sumScore2)*100);
				System.out.println("신청자 승률 : "+ rate2);
				
				bbuyList.get(0).setRate(rate2);
				//시합 등록자의 승률구하기END
			}
			map.put("bBuyList",bbuyList);
			
			
			//체급구하기
			BookingVo bookingVo2 = sparringDao.selectOneBooking(vo2.getBooking_no());
			String gymEvent = bookingVo2.getGym_event();
			if(gymEvent.equals("복싱")) {
				event1 = 1;
			}else if(gymEvent.equals("킥복싱")) {
				event1 = 2;
			}else if(gymEvent.equals("종합격투기")) {
				event1 = 3;
			}else if(gymEvent.equals("주짓수")) {
				event1 = 4;
			}
			int weight2 = Integer.parseInt(vo2.getWeight());
			WC2 = weightClass(event1,weight2);
			
		
			System.out.println(vo);
			System.out.println("신청자 :" + WC2);
			vo2.setWeightC(WC2);
			// 시합등록자 구하기END
		}
		
		/*********대관정보구하기**********/
		if(bookingNo != 0) {
			BookingVo bookingVo = sparringDao.selectOneBooking(bookingNo);
			
			int gymNo = bookingVo.getGym_no();
			//1.gymVo를 받는다
			GymVo gymVo = sparringDao.selectOneGym(gymNo);
			System.out.println("gymVo ="+ gymVo);
					
			//1end
			//2.gymImgList를 받는다
			
			List<GymImgVo> gymimgList = sparringDao.selectListGymImg(gymNo);
			System.out.println("gymimgVo = "+ gymimgList);
					
			//2end
			//
			//5.편의시설 리스트
			
			List<ConvenienceVo> conList = sparringDao.selectListCon(gymNo);
			
			gymVo.setGymimgList(gymimgList);
			gymVo.setConList(conList);
			/*********대관정보 구하기 end**********/
			
			map.put("gAVo",gymVo);
		}
		//MAP에 넣기
		
		
		
		//이미등록한 신청자 확인
		Map<String,Object> userMap = new HashMap<String,Object>();
		userMap.put("bookingNo",bookingNo);
		userMap.put("sessionuser",sessionuser);
		BBuyVo bbuyVoUser = sparringDao.selectOneBBuy(userMap);
		
		System.out.println();
		if(bbuyVoUser != null) {
			map.put("bbuyVoUser",bbuyVoUser);	
		}
		
		///*********대관한 대관정보가 예약중인지 가져오기*********/////
		
		BookingVo bookingVo = sparringDao.selectOnebookingNo(bookingNo);
		if(bookingVo != null) {
			
			System.out.println(bookingVo.getBooking_state());
			map.put("booking_state",bookingVo.getBooking_state());
		}
		
		
		////*********************************************///
		
		
		//*****수락하기 나누기 ******///
		// 시합 등록자가 결제 완료의경우 (직접대관을 한 경우) 상대에게 결제알람을 보낸다
		// 시합 등록자가 결제완료인지 확인
		
		
		
		// 시합등록자가 대관하지 않고 신청자가 먼저 대관을 한경우 수락 하기 버튼을 누르면
		// 해당 bookingNo를 결제한다
		
		
		
		map.put("bBuyVo", vo);
		return map;
	}

	public BBuyVo  bbuyOne(int  bbuyNo, int userNo) {
		System.out.println("[Service] : bbuyOne");
		
		
		BBuyVo bbuyVo = new BBuyVo();
		
		bbuyVo.setB_buy_no(bbuyNo);
		bbuyVo.setUser_no(userNo);
		BBuyVo vo =sparringDao.selectOnebbuy2(bbuyVo);

		System.out.println(vo);
		
		//체급구하기

		int event1 = 0;
		String WC2= "";
		
		//체급구하기
			BookingVo bookingVo2 = sparringDao.selectOneBooking(vo.getBooking_no());
			String gymEvent = bookingVo2.getGym_event();
			if(gymEvent.equals("복싱")) {
				event1 = 1;
			}else if(gymEvent.equals("킥복싱")) {
				event1 = 2;
			}else if(gymEvent.equals("종합격투기")) {
				event1 = 3;
			}else if(gymEvent.equals("주짓수")) {
				event1 = 4;
			}
			int weight2 = Integer.parseInt(vo.getWeight());
			WC2 = weightClass(event1,weight2);
			
		
		System.out.println(vo);
		System.out.println("신청자 :" + WC2);
		vo.setWeightC(WC2);
		//체급
		
		//신청자 의 승률구하기 (등록자랑 같은거사용)
		if(bbuyVo.getScoreCount() != 0) {
			BBuyVo scoreVo = sparringDao.selectOneMatchScore(userNo);
			
			double sumScore = scoreVo.getSumScore();
			double sumWin = scoreVo.getSumWin();
			System.out.println(sumScore+ "," + sumWin);
			
			int rate = (int) ((sumWin /sumScore)*100);
			System.out.println("승률 : "+ rate);
			
			vo.setRate(rate);
			//시합 등록자의 승률구하기END
		}
		/**경력리스트,주특기 리스트 구하기**/
		int profileNo = vo.getProfile_no();
		
		List<EventVo> eventList = sparringDao.selectListEvent(profileNo);
		
		//경력리스트
		List<RecordVo> recordList = sparringDao.selectListRecord(profileNo);
		
		vo.setEventList(eventList);
		vo.setRecordList(recordList);
		
		return vo;
	}
	
	
	/****/
	
	public String weightClass(int event , int weight) {
		
		String wc = "";
		/* 복싱  = 1 킥복싱 = 2 종합격투기 =3 주짓수 = 4 */

		if (event == 1) {

			if (weight <= 46) {
				wc = "라이트미니엄";

			}

			if (46 < weight && weight <= 48) {
				wc = "미니멈급";

			}

			if (48 < weight && weight <= 49) {
				wc = "라이트플라이급";

			}
			if (49 < weight && weight <= 51) {
				wc = "플라이급";
			}
			if (51 < weight && weight <= 52) {
				wc = "슈퍼플라이급";

			}
			if (51 < weight && weight <= 52) {
				wc = "슈퍼플라이급";
			}
			if (52 < weight && weight <= 54) {
				wc = "밴텀급";
			}
			if (54 < weight && weight <= 55) {
				wc = "슈퍼밴텀급";
			}
			if (55 < weight && weight <= 57) {
				wc = "페더급";
			}
			if (57 < weight && weight <= 59) {
				wc = "슈퍼페더급급";
			}
			if (59 < weight && weight <= 61) {
				wc = "라이트급";
			}

			if (bool(weight, 61, 63)) {
				wc = "슈퍼라이트급";
			}
			if (bool(weight, 63, 67)) {
				wc = "웰터급";

			}
			if (bool(weight, 67, 70)) {
				wc = "슈퍼웰터급";
			}
			if (bool(weight, 70, 73)) {
				wc = "미들급";
			}
			if (bool(weight, 73, 76)) {
				wc = "슈퍼미들급";
			}
			if (bool(weight, 76, 79)) {
				wc = "라이트헤비급";
			}
			if (bool(weight, 79, 91)) {
				wc = "크루저급";
			}
			if (91 < weight) {
				wc = "헤비급";
			}

		}else if(event == 2) {
			if(weight<=50) {
				wc="플라이급";
			}
			if (bool(weight,50,55)) {
				wc="벤텀급";
			}
			if (bool(weight,55,60)) {
				wc="페더급";
			}
			if (bool(weight,60,65)) {
				wc="라이트급";
			}
			if (bool(weight,65,70)) {
				wc="웹터급";
			}
			if (bool(weight,70,75)) {
				wc="미들급";
			}
			if (bool(weight,75,80)) {
				wc="라이트 헤비급";
			}
			if (bool(weight,80,85)) {
				wc="헤비급";
			}
			if (bool(weight,85,89)) {
				wc="슈퍼헤비급";
			}
			if (90<= weight) {
				wc="무제한급";
				}
		
		}else if(event == 3) {
			if(weight <=52) {
				wc="스트로급";
			}
			if (bool(weight,52,57)) {
				wc="플라이급";
			}
			if (bool(weight,57,61)) {
				wc="팬텀급";
			}
			if (bool(weight,61,66)) {
				wc="페터급";
			}
			if (bool(weight,66,70)) {
				wc="라이트급";
			}
			if (bool(weight,70,75)) {
				wc="슈퍼라이트급";
			}
			if (bool(weight,75,77)) {
				wc="웹터급";
			}
			if (bool(weight,77,79)) {
				wc="슈퍼웰터급";
			}
			
			if (bool(weight,79,84)) {
				wc="미들급";
			}
			if (bool(weight,84,86)) {
				wc="슈퍼미들급";
			}
			if (bool(weight,86,93)) {
				wc="라이트헤비급";
			}
			if (bool(weight,93,102)) {
				wc="크루저급";
			}
			if (bool(weight,102,120)) {
				wc="헤비급";
			}
			if (120<weight) {
				wc="슈퍼헤비급";
			}
		}else if(event ==4) {
			
			if(weight <=58) {
				wc="루스터급";
			}
			
			if (bool(weight,59,64)) {
				wc="라이트 페더급";
			}
			
			if (bool(weight,64,70)) {
				wc="페더급";
			}
			
			if (bool(weight,70,76)) {
				wc="라이트급";
			}
			if (bool(weight,76,82)) {
				wc="미들급";
			}
			if (bool(weight,82,88)) {
				wc="미디엄헤비급";
			}
			if (bool(weight,88,94)) {
				wc="헤비급";
			}
			if (bool(weight,94,101)) {
				wc="수퍼헤비";
			}
			if (102<=weight) {
				wc="울트라헤비";
			}
		}
		

		System.out.println("체급 : " + wc);
		
		return wc;
		
	}
	public static boolean bool(int weight, int low, int high) {

		boolean tf = (low < weight && weight <= high);

		return tf;
	}

	public void insertBBuy2(int userNo,int profileNo,int bookingNo) {
		System.out.println("[Service] : insertBBuy2");
		BBuyVo bbuyVo = new BBuyVo();
		bbuyVo.setUser_no(userNo);
		bbuyVo.setProfile_no(profileNo);
		bbuyVo.setBooking_no(bookingNo);
		
		sparringDao.insertBBuyForm(bbuyVo);
		
		
	}

	public void accept(int partnerUserNo, int bookingNo) {
		System.out.println("[Dao]: accept()");
		
		//일단 다 예정자로 만든다 (대기자로 만드는 이유는 이후에 상대가 수락이아닌 거절을 할경우)
		//다시 신청자로 돌려주기 위함인데 그전에 거절한 사용자는 아예 탈락자로 보내기위함
		sparringDao.updateAcceptBBuyfail(bookingNo);
		
		//파트너만 선택자로 바꾼다
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bookingNo",bookingNo);
		map.put("userNo",partnerUserNo);
		sparringDao.updateAcceptBBuysucc(map);
		
		
	}

	public void acceptpayment(int partnerUserNo, int bookingNo) {
		System.out.println("[Dao]: accept() : acceptpayment");
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bookingNo",bookingNo);
		map.put("userNo",partnerUserNo);
		
		sparringDao.updateAcceptBBuysucc(map);
		
	}

	public void acceptpay(BBuyVo bBuyVo, int bbuyno , int bookingNo) {
		System.out.println("[Dao]: accept() : acceptpay");
		
		
		int num = bBuyVo.getB_buy_price().lastIndexOf(".");
		
		String str=bBuyVo.getB_buy_price().substring(0, num);
		
		System.out.println(str);
		
		int price = Integer.parseInt(str);
		bBuyVo.setPrice(price);
		
		bBuyVo.setB_buy_player_state("시합결정자");
		
		//부킹 결제완료로 바꿔주기
		sparringDao.updateBooking3(bookingNo);
		
		bBuyVo.setB_buy_no(bbuyno);
		bBuyVo.setBooking_no(bookingNo);
		sparringDao.updateBBuy2(bBuyVo);
		
	}

	public void acceptPartner(int partneruserno, int bookingNo, BBuyVo bBuyVo, int bbuyno, int bookingNo2, int mybbuyno) {
		System.out.println("[Service] : acceptPartner");
		
		int num = bBuyVo.getB_buy_price().lastIndexOf(".");
		
		String str=bBuyVo.getB_buy_price().substring(0, num);
		
		System.out.println(str);
		
		int price = Integer.parseInt(str);
		bBuyVo.setPrice(price);
		//상대 player_state (시합등록자)변경해주기
		bBuyVo.setB_buy_player_state("시합결정자");
		bBuyVo.setB_buy_no(bbuyno);
		bBuyVo.setBooking_no(bookingNo);
		sparringDao.updateBBuy3(bBuyVo);
		
		//일단 다 대기자로 만든다 (대기자로 만드는 이유는 이후에 상대가 수락이아닌 거절을 할경우)
		//다시 신청자로 돌려주기 위함인데 그전에 거절한 사용자는 아예 탈락자로 보내기위함
		sparringDao.updateAcceptBBuyfail(bookingNo);
				
		
		//내 결제상태 바꾸기
		bBuyVo.setB_buy_no(mybbuyno);
		System.out.println(bBuyVo.getB_buy_no());
		
		sparringDao.updateBBuy4(bBuyVo);
		
		//부킹 결제완료로 바꿔주기
		sparringDao.updateBooking3(bookingNo);
		
		
	}

	public void refuse(int bbuyNo) {
		System.out.println("[Service] : refuse()");
		System.out.println(bbuyNo);
		sparringDao.updateBBuyrefuse(bbuyNo);
		
	}

	public void cancel(int bbuyno, int bookingno) {
		System.out.println("[Service] : cancel");
		System.out.println(bbuyno);
		System.out.println(bookingno);
		//취소한 사용자 삭제
		sparringDao.removeBBuy(bbuyno);
		
		//대기자를 다시 신청자로 변경
		sparringDao.updatebbuyBack(bookingno);
		
	}
	
}
