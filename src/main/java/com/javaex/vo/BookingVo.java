package com.javaex.vo;

public class BookingVo {

	private int booking_no;
	private int gym_no;
	private String booking_date;
	private String booking_start;
	private String booking_end;
	private int booking_price;
	private String booking_state;
	private String booking_reg_date;

	// gym
	private String gym_name;
	private String gym_event;
	// gymImg
	private String gym_img_savename;

	/* 2021. 03. 26 추가 <조경환> */
	/* gyimg */
	private int gym_img_no;
	/* users */
	private int user_no;
	/* bbuy */
	private String b_buy_state;
	
	
	/* users */
	
	private String user_name1;
	private String user_name2;
	public BookingVo() {
	}

	public BookingVo(int booking_no, int gym_no, String booking_date, String booking_start, String booking_end,
			int booking_price, String booking_state, String booking_reg_date) {
		this.booking_no = booking_no;
		this.gym_no = gym_no;
		this.booking_date = booking_date;
		this.booking_start = booking_start;
		this.booking_end = booking_end;
		this.booking_price = booking_price;
		this.booking_state = booking_state;
		this.booking_reg_date = booking_reg_date;
	}

	public BookingVo(int booking_no, int gym_no, String booking_date, String booking_start, String booking_end,
			int booking_price, String booking_state, String booking_reg_date, String gym_name,
			String gym_img_savename) {
		super();
		this.booking_no = booking_no;
		this.gym_no = gym_no;
		this.booking_date = booking_date;
		this.booking_start = booking_start;
		this.booking_end = booking_end;
		this.booking_price = booking_price;
		this.booking_state = booking_state;
		this.booking_reg_date = booking_reg_date;
		this.gym_name = gym_name;
		this.gym_img_savename = gym_img_savename;
	}

	/* 2021. 03. 26 추가 <조경환> */
	public BookingVo(int booking_no, int gym_no, String booking_date, String booking_start, String booking_end,
			int booking_price, String booking_state, String booking_reg_date, String gym_name, String gym_event,
			String gym_img_savename, int gym_img_no, int user_no, String b_buy_state) {
		super();
		this.booking_no = booking_no;
		this.gym_no = gym_no;
		this.booking_date = booking_date;
		this.booking_start = booking_start;
		this.booking_end = booking_end;
		this.booking_price = booking_price;
		this.booking_state = booking_state;
		this.booking_reg_date = booking_reg_date;
		this.gym_name = gym_name;
		this.gym_event = gym_event;
		this.gym_img_savename = gym_img_savename;
		this.gym_img_no = gym_img_no;
		this.user_no = user_no;
		this.b_buy_state = b_buy_state;
	}
	
	
	public String getUser_name1() {
		return user_name1;
	}

	public void setUser_name1(String user_name1) {
		this.user_name1 = user_name1;
	}

	public String getUser_name2() {
		return user_name2;
	}

	public void setUser_name2(String user_name2) {
		this.user_name2 = user_name2;
	}

	public String getGym_event() {
		return gym_event;
	}

	public void setGym_event(String gym_event) {
		this.gym_event = gym_event;
	}

	public String getGym_name() {
		return gym_name;
	}

	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}

	public String getGym_img_savename() {
		return gym_img_savename;
	}

	public void setGym_img_savename(String gym_img_savename) {
		this.gym_img_savename = gym_img_savename;
	}

	public int getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(int booking_no) {
		this.booking_no = booking_no;
	}

	public int getGym_no() {
		return gym_no;
	}

	public void setGym_no(int gym_no) {
		this.gym_no = gym_no;
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

	public int getBooking_price() {
		return booking_price;
	}

	public void setBooking_price(int booking_price) {
		this.booking_price = booking_price;
	}

	public String getBooking_state() {
		return booking_state;
	}

	public void setBooking_state(String booking_state) {
		this.booking_state = booking_state;
	}

	public String getBooking_reg_date() {
		return booking_reg_date;
	}

	public void setBooking_reg_date(String booking_reg_date) {
		this.booking_reg_date = booking_reg_date;
	}

	/* 2021. 03. 26 추가 <조경환> */
	public int getGym_img_no() {
		return gym_img_no;
	}

	public void setGym_img_no(int gym_img_no) {
		this.gym_img_no = gym_img_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getB_buy_state() {
		return b_buy_state;
	}

	public void setB_buy_state(String b_buy_state) {
		this.b_buy_state = b_buy_state;
	}

	/* 2021. 03. 26 수정 <조경환> */
	@Override
	public String toString() {
		return "BookingVo [booking_no=" + booking_no + ", gym_no=" + gym_no + ", booking_date=" + booking_date
				+ ", booking_start=" + booking_start + ", booking_end=" + booking_end + ", booking_price="
				+ booking_price + ", booking_state=" + booking_state + ", booking_reg_date=" + booking_reg_date
				+ ", gym_name=" + gym_name + ", gym_event=" + gym_event + ", gym_img_savename=" + gym_img_savename
				+ ", gym_img_no=" + gym_img_no + ", user_no=" + user_no + ", b_buy_state=" + b_buy_state + "]";
	}

}
