package com.javaex.vo;

import java.util.List;

public class BBuyVo {
	private int b_buy_no;
	private int user_no;
	private int booking_no;
	private int profile_no;
	private String b_buy_paytype;
	private String b_buy_price;
	private String b_buy_state;
	private String b_buy_player_state;
	private String b_buy_date;
	
	// 대관x일 경우
	private String b_buy_address;
	private String b_buy_event;
	private String b_buy_time;
	private String b_buy_day;
	
	//users
	private String nickname;
	private String career;
	private String user_photo;
	private String user_name;
	private String user_name2;
	//profile
	private String word;
	private String height;
	private String weight;
	private String major;
	//gym
	private String gym_name;
	private String gym_address;
	private String gym_event;
	private String gym_img_savename;
	
	private String addressHalf;
	//bookingDate
	private String booking_date;
	private String booking_start;
	private String booking_end;
	
	private String booking_state;
	
	//EventList
	
	List<EventVo> eventList;
	
	//RecordList
	
	List<RecordVo> recordList;
	
	//userList
	List<UserVo> userList;
	///
	private String checkAll;
	private String chkItem;
	
	//int 타입변환
	
	private int price;
	
	//플레이어상태를 위한 파라미터값 subNum
	private int subNum;
	
	
	//matchScore
	
	private int scoreCount; //스파클링 이용횟수(결과작성)
	
	private int rate;//승률
	private int sumScore;
	private int sumWin;
	
	//체급
	
	private String weightC;
	
	//레벨체크
	private double rowLevel;
	private double highLevel;
	
	//상대 user_no
	private int u_no;
	
	public BBuyVo(int b_buy_no, int user_no, int booking_no, int profile_no, String b_buy_paytype, String b_buy_price, String b_buy_state,
			String b_buy_player_state, String b_buy_date, String checkAll, String chkItem) {
		super();
		this.b_buy_no = b_buy_no;
		this.user_no = user_no;
		this.booking_no = booking_no;
		this.profile_no = profile_no;
		this.b_buy_paytype = b_buy_paytype;
		this.b_buy_price = b_buy_price;
		this.b_buy_state = b_buy_state;
		this.b_buy_player_state = b_buy_player_state;
		this.b_buy_date = b_buy_date;
		this.checkAll = checkAll;
		this.chkItem = chkItem;
	}
	
	
	public BBuyVo() {
		super();
	}

	
	


	
	
	public String getUser_name2() {
		return user_name2;
	}


	public void setUser_name2(String user_name2) {
		this.user_name2 = user_name2;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public int getU_no() {
		return u_no;
	}


	public void setU_no(int u_no) {
		this.u_no = u_no;
	}


	public List<UserVo> getUserList() {
		return userList;
	}


	public void setUserList(List<UserVo> userList) {
		this.userList = userList;
	}


	public double getRowLevel() {
		return rowLevel;
	}


	public void setRowLevel(double rowLevel) {
		this.rowLevel = rowLevel;
	}


	public double getHighLevel() {
		return highLevel;
	}


	public void setHighLevel(double highLevel) {
		this.highLevel = highLevel;
	}


	public String getBooking_state() {
		return booking_state;
	}


	public void setBooking_state(String booking_state) {
		this.booking_state = booking_state;
	}


	public String getWeightC() {
		return weightC;
	}


	public void setWeightC(String weightC) {
		this.weightC = weightC;
	}


	public String getUser_photo() {
		return user_photo;
	}


	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}


	public List<RecordVo> getRecordList() {
		return recordList;
	}


	public void setRecordList(List<RecordVo> recordList) {
		this.recordList = recordList;
	}


	public String getMajor() {
		return major;
	}


	public void setMajor(String major) {
		this.major = major;
	}


	public String getWord() {
		return word;
	}


	public String getHeight() {
		return height;
	}


	public void setHeight(String height) {
		this.height = height;
	}


	public String getWeight() {
		return weight;
	}


	public void setWeight(String weight) {
		this.weight = weight;
	}


	public void setWord(String word) {
		this.word = word;
	}


	public int getSumScore() {
		return sumScore;
	}


	public void setSumScore(int sumScore) {
		this.sumScore = sumScore;
	}


	public int getSumWin() {
		return sumWin;
	}


	public void setSumWin(int sumWin) {
		this.sumWin = sumWin;
	}


	public int getScoreCount() {
		return scoreCount;
	}


	public void setScoreCount(int scoreCount) {
		this.scoreCount = scoreCount;
	}


	public int getRate() {
		return rate;
	}


	public void setRate(int rate) {
		this.rate = rate;
	}


	public String getB_buy_address() {
		return b_buy_address;
	}


	public void setB_buy_address(String b_buy_address) {
		this.b_buy_address = b_buy_address;
	}


	public String getB_buy_event() {
		return b_buy_event;
	}


	public void setB_buy_event(String b_buy_event) {
		this.b_buy_event = b_buy_event;
	}


	public String getB_buy_time() {
		return b_buy_time;
	}


	public void setB_buy_time(String b_buy_time) {
		this.b_buy_time = b_buy_time;
	}


	public String getB_buy_day() {
		return b_buy_day;
	}


	public void setB_buy_day(String b_buy_day) {
		this.b_buy_day = b_buy_day;
	}


	public String getAddressHalf() {
		return addressHalf;
	}
	public void setAddressHalf(String addressHalf) {
		this.addressHalf = addressHalf;
	}
	public List<EventVo> getEventList() {
		return eventList;
	}
	public void setEventList(List<EventVo> eventList) {
		this.eventList = eventList;
	}
	public String getGym_img_savename() {
		return gym_img_savename;
	}
	public void setGym_img_savename(String gym_img_savename) {
		this.gym_img_savename = gym_img_savename;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getGym_name() {
		return gym_name;
	}
	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}
	public String getGym_address() {
		return gym_address;
	}
	public void setGym_address(String gym_address) {
		this.gym_address = gym_address;
	}
	public String getGym_event() {
		return gym_event;
	}
	public void setGym_event(String gym_event) {
		this.gym_event = gym_event;
	}
	public String getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
	}
	public String getBooking_start() {
		return booking_start;
	}
	public void setBooking_start(String booking_start) {
		this.booking_start = booking_start;
	}
	public String getBooking_end() {
		return booking_end;
	}
	public void setBooking_end(String booking_end) {
		this.booking_end = booking_end;
	}
	public int getSubNum() {
		return subNum;
	}
	public void setSubNum(int subNum) {
		this.subNum = subNum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getB_buy_price() {
		return b_buy_price;
	}
	public void setB_buy_price(String b_buy_price) {
		this.b_buy_price = b_buy_price;
	}
	public String getCheckAll() {
		return checkAll;
	}

	public void setCheckAll(String checkAll) {
		this.checkAll = checkAll;
	}

	public String getChkItem() {
		return chkItem;
	}

	public void setChkItem(String chkItem) {
		this.chkItem = chkItem;
	}


	public int getB_buy_no() {
		return b_buy_no;
	}

	public void setB_buy_no(int b_buy_no) {
		this.b_buy_no = b_buy_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(int booking_no) {
		this.booking_no = booking_no;
	}

	public int getProfile_no() {
		return profile_no;
	}

	public void setProfile_no(int profile_no) {
		this.profile_no = profile_no;
	}

	public String getB_buy_paytype() {
		return b_buy_paytype;
	}

	public void setB_buy_paytype(String b_buy_paytype) {
		this.b_buy_paytype = b_buy_paytype;
	}

	

	public String getB_buy_state() {
		return b_buy_state;
	}

	public void setB_buy_state(String b_buy_state) {
		this.b_buy_state = b_buy_state;
	}

	public String getB_buy_player_state() {
		return b_buy_player_state;
	}

	public void setB_buy_player_state(String b_buy_player_state) {
		this.b_buy_player_state = b_buy_player_state;
	}

	public String getB_buy_date() {
		return b_buy_date;
	}

	public void setB_buy_date(String b_buy_date) {
		this.b_buy_date = b_buy_date;
	}


	@Override
	public String toString() {
		return "BBuyVo [b_buy_no=" + b_buy_no + ", user_no=" + user_no + ", booking_no=" + booking_no + ", profile_no=" + profile_no + ", b_buy_paytype="
				+ b_buy_paytype + ", b_buy_price=" + b_buy_price + ", b_buy_state=" + b_buy_state + ", b_buy_player_state=" + b_buy_player_state
				+ ", b_buy_date=" + b_buy_date + ", b_buy_address=" + b_buy_address + ", b_buy_event=" + b_buy_event + ", b_buy_time=" + b_buy_time
				+ ", b_buy_day=" + b_buy_day + ", nickname=" + nickname + ", career=" + career + ", user_photo=" + user_photo + ", word=" + word + ", height="
				+ height + ", weight=" + weight + ", major=" + major + ", gym_name=" + gym_name + ", gym_address=" + gym_address + ", gym_event=" + gym_event
				+ ", gym_img_savename=" + gym_img_savename + ", addressHalf=" + addressHalf + ", booking_date=" + booking_date + ", booking_start="
				+ booking_start + ", booking_end=" + booking_end + ", booking_state=" + booking_state + ", eventList=" + eventList + ", recordList="
				+ recordList + ", userList=" + userList + ", checkAll=" + checkAll + ", chkItem=" + chkItem + ", price=" + price + ", subNum=" + subNum
				+ ", scoreCount=" + scoreCount + ", rate=" + rate + ", sumScore=" + sumScore + ", sumWin=" + sumWin + ", weightC=" + weightC + ", rowLevel="
				+ rowLevel + ", highLevel=" + highLevel + ", u_no=" + u_no + "]";
	}


	
	
	
	
	
}
