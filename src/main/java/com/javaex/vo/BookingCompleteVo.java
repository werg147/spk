package com.javaex.vo;

public class BookingCompleteVo {

	/* Booking */
	private int booking_no;
	private String booking_date;
	private String booking_state;
	private int booking_price;

	/* Gym */
	private String gym_name;

	/* Gymimg */
	private String gym_img_savename;

	/* Bbuy */
	private int b_buy_price;
	private String b_buy_paytype;

	/* Users */
	private int user_no;

	public BookingCompleteVo() {
		super();
	}

	public BookingCompleteVo(int booking_no, String booking_date, String booking_state, int booking_price,
			String gym_name, String gym_img_savename, int b_buy_price, String b_buy_paytype, int user_no) {
		super();
		this.booking_no = booking_no;
		this.booking_date = booking_date;
		this.booking_state = booking_state;
		this.booking_price = booking_price;
		this.gym_name = gym_name;
		this.gym_img_savename = gym_img_savename;
		this.b_buy_price = b_buy_price;
		this.b_buy_paytype = b_buy_paytype;
		this.user_no = user_no;
	}

	public int getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(int booking_no) {
		this.booking_no = booking_no;
	}

	public String getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
	}

	public String getBooking_state() {
		return booking_state;
	}

	public void setBooking_state(String booking_state) {
		this.booking_state = booking_state;
	}

	public int getBooking_price() {
		return booking_price;
	}

	public void setBooking_price(int booking_price) {
		this.booking_price = booking_price;
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

	public int getB_buy_price() {
		return b_buy_price;
	}

	public void setB_buy_price(int b_buy_price) {
		this.b_buy_price = b_buy_price;
	}

	public String getB_buy_paytype() {
		return b_buy_paytype;
	}

	public void setB_buy_paytype(String b_buy_paytype) {
		this.b_buy_paytype = b_buy_paytype;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "BookingCompleteVo [booking_no=" + booking_no + ", booking_date=" + booking_date + ", booking_state="
				+ booking_state + ", booking_price=" + booking_price + ", gym_name=" + gym_name + ", gym_img_savename="
				+ gym_img_savename + ", b_buy_price=" + b_buy_price + ", b_buy_paytype=" + b_buy_paytype + ", user_no="
				+ user_no + "]";
	}

}
