package com.javaex.vo;

public class MatchingCompleteVo {

	/* Users */
	private int user_no;
	private String user_name;
	private String nickname;
	private String user_photo;

	/* Bbuy */
	private int booking_no;
	private String b_buy_event;
	private String b_buy_state;
	private String b_buy_paytype;
	private int b_buy_price;
	private String b_buy_player_state;
	private String b_buy_date;

	/* Profile */
	private int height;
	private int weight;

	/* Event */
	private String weight_class;

	/* Booking */
	private String booking_start;
	private String booking_end;

	public MatchingCompleteVo() {
		super();
	}

	public MatchingCompleteVo(int user_no, String user_name, String nickname, String user_photo, int booking_no,
			String b_buy_event, String b_buy_state, String b_buy_paytype, int b_buy_price, String b_buy_player_state,
			String b_buy_date, int height, int weight, String weight_class, String booking_start, String booking_end) {
		super();
		this.user_no = user_no;
		this.user_name = user_name;
		this.nickname = nickname;
		this.user_photo = user_photo;
		this.booking_no = booking_no;
		this.b_buy_event = b_buy_event;
		this.b_buy_state = b_buy_state;
		this.b_buy_paytype = b_buy_paytype;
		this.b_buy_price = b_buy_price;
		this.b_buy_player_state = b_buy_player_state;
		this.b_buy_date = b_buy_date;
		this.height = height;
		this.weight = weight;
		this.weight_class = weight_class;
		this.booking_start = booking_start;
		this.booking_end = booking_end;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}

	public int getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(int booking_no) {
		this.booking_no = booking_no;
	}

	public String getB_buy_event() {
		return b_buy_event;
	}

	public void setB_buy_event(String b_buy_event) {
		this.b_buy_event = b_buy_event;
	}

	public String getB_buy_state() {
		return b_buy_state;
	}

	public void setB_buy_state(String b_buy_state) {
		this.b_buy_state = b_buy_state;
	}

	public String getB_buy_paytype() {
		return b_buy_paytype;
	}

	public void setB_buy_paytype(String b_buy_paytype) {
		this.b_buy_paytype = b_buy_paytype;
	}

	public int getB_buy_price() {
		return b_buy_price;
	}

	public void setB_buy_price(int b_buy_price) {
		this.b_buy_price = b_buy_price;
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

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getWeight_class() {
		return weight_class;
	}

	public void setWeight_class(String weight_class) {
		this.weight_class = weight_class;
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

	@Override
	public String toString() {
		return "MatchingCompleteVo [user_no=" + user_no + ", user_name=" + user_name + ", nickname=" + nickname
				+ ", user_photo=" + user_photo + ", booking_no=" + booking_no + ", b_buy_event=" + b_buy_event
				+ ", b_buy_state=" + b_buy_state + ", b_buy_paytype=" + b_buy_paytype + ", b_buy_price=" + b_buy_price
				+ ", b_buy_player_state=" + b_buy_player_state + ", b_buy_date=" + b_buy_date + ", height=" + height
				+ ", weight=" + weight + ", weight_class=" + weight_class + ", booking_start=" + booking_start
				+ ", booking_end=" + booking_end + "]";
	}

}
