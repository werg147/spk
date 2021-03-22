package com.javaex.vo;

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
	
	///
	private String checkAll;
	private String chkItem;
	
	//int 타입변환
	
	private int price;
	
	//플레이어상태를 위한 파라미터값 subNum
	private int subNum;
	
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
				+ ", b_buy_date=" + b_buy_date + ", checkAll=" + checkAll + ", chkItem=" + chkItem + ", price=" + price + ", subNum=" + subNum + "]";
	}
	

	
	
}
