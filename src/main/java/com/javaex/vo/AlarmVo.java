package com.javaex.vo;

public class AlarmVo {

	private int alarm_no;
	private int from_user_no;
	private int to_user_no;
	private String alarm_content;
	private String alarm_date;
	private int sell_no;
	private String alarm_title;
	private int buy_type;
	
	private String prod_name;

	private String gym_name;
	private String booking_state;

	private String buy_state;

	private String buy_del_state;

	private String b_buy_player_state; // 시합등록자, 신청자, 선택자, 탈락자
	private String b_buy_state;

	private int user_no;
	private int buy_no;
	private String prod_no;

	private int prod_type;
	private int book_type;

	public AlarmVo() {
		super();
	}

	public AlarmVo(int sell_no, String prod_name, String buy_del_state, int user_no, String prod_no) {
		super();
		this.sell_no = sell_no;
		this.prod_name = prod_name;
		this.buy_del_state = buy_del_state;
		this.user_no = user_no;
		this.prod_no = prod_no;
	}

	public int getAlarm_no() {
		return alarm_no;
	}

	public void setAlarm_no(int alarm_no) {
		this.alarm_no = alarm_no;
	}

	public int getFrom_user_no() {
		return from_user_no;
	}

	public void setFrom_user_no(int from_user_no) {
		this.from_user_no = from_user_no;
	}

	public int getTo_user_no() {
		return to_user_no;
	}

	public void setTo_user_no(int to_user_no) {
		this.to_user_no = to_user_no;
	}

	public String getAlarm_content() {
		return alarm_content;
	}

	public void setAlarm_content(String alarm_content) {
		this.alarm_content = alarm_content;
	}

	public String getAlarm_date() {
		return alarm_date;
	}

	public void setAlarm_date(String alarm_date) {
		this.alarm_date = alarm_date;
	}

	public int getSell_no() {
		return sell_no;
	}

	public void setSell_no(int sell_no) {
		this.sell_no = sell_no;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getGym_name() {
		return gym_name;
	}

	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}

	public String getBooking_state() {
		return booking_state;
	}

	public void setBooking_state(String booking_state) {
		this.booking_state = booking_state;
	}

	public String getBuy_state() {
		return buy_state;
	}

	public void setBuy_state(String buy_state) {
		this.buy_state = buy_state;
	}

	public String getBuy_del_state() {
		return buy_del_state;
	}

	public void setBuy_del_state(String buy_del_state) {
		this.buy_del_state = buy_del_state;
	}

	public String getB_buy_player_state() {
		return b_buy_player_state;
	}

	public void setB_buy_player_state(String b_buy_player_state) {
		this.b_buy_player_state = b_buy_player_state;
	}

	public String getB_buy_state() {
		return b_buy_state;
	}

	public void setB_buy_state(String b_buy_state) {
		this.b_buy_state = b_buy_state;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getProd_type() {
		return prod_type;
	}

	public void setProd_type(int prod_type) {
		this.prod_type = prod_type;
	}

	public int getBook_type() {
		return book_type;
	}

	public void setBook_type(int book_type) {
		this.book_type = book_type;
	}

	public String getAlarm_title() {
		return alarm_title;
	}

	public void setAlarm_title(String alarm_title) {
		this.alarm_title = alarm_title;
	}

	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public String getProd_no() {
		return prod_no;
	}

	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}

	public int getBuy_type() {
		return buy_type;
	}

	public void setBuy_type(int buy_type) {
		this.buy_type = buy_type;
	}

	@Override
	public String toString() {
		return "AlarmVo [alarm_no=" + alarm_no + ", from_user_no=" + from_user_no + ", to_user_no=" + to_user_no
				+ ", alarm_content=" + alarm_content + ", alarm_date=" + alarm_date + ", sell_no=" + sell_no
				+ ", alarm_title=" + alarm_title + ", buy_type=" + buy_type + ", prod_name=" + prod_name + ", gym_name="
				+ gym_name + ", booking_state=" + booking_state + ", buy_state=" + buy_state + ", buy_del_state="
				+ buy_del_state + ", b_buy_player_state=" + b_buy_player_state + ", b_buy_state=" + b_buy_state
				+ ", user_no=" + user_no + ", buy_no=" + buy_no + ", prod_no=" + prod_no + ", prod_type=" + prod_type
				+ ", book_type=" + book_type + "]";
	}

}