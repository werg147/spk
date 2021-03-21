package com.javaex.vo;

public class AlarmVo {

	public int alarm_no;
	public int from_user_no;
	public int to_user_no;
	public String alarm_content;
	public String sell_type;
	public String alarm_date;
	public String user_id;
	public String buy_del_state;
	public String prod_name;
	public String gym_name;

	public AlarmVo() {
		super();
	}

	public AlarmVo(String alarm_content, String sell_type, String alarm_date, String user_id, String buy_del_state,
			String prod_name) {
		super();
		this.alarm_content = alarm_content;
		this.sell_type = sell_type;
		this.alarm_date = alarm_date;
		this.user_id = user_id;
		this.buy_del_state = buy_del_state;
		this.prod_name = prod_name;
	}

	public AlarmVo(int alarm_no, int from_user_no, int to_user_no, String alarm_content, String sell_type,
			String alarm_date, String user_id, String buy_del_state, String prod_name) {
		super();
		this.alarm_no = alarm_no;
		this.from_user_no = from_user_no;
		this.to_user_no = to_user_no;
		this.alarm_content = alarm_content;
		this.sell_type = sell_type;
		this.alarm_date = alarm_date;
		this.user_id = user_id;
		this.buy_del_state = buy_del_state;
		this.prod_name = prod_name;
	}

	public AlarmVo(int alarm_no, int from_user_no, int to_user_no, String alarm_content, String sell_type,
			String alarm_date, String user_id, String buy_del_state, String prod_name, String gym_name) {
		super();
		this.alarm_no = alarm_no;
		this.from_user_no = from_user_no;
		this.to_user_no = to_user_no;
		this.alarm_content = alarm_content;
		this.sell_type = sell_type;
		this.alarm_date = alarm_date;
		this.user_id = user_id;
		this.buy_del_state = buy_del_state;
		this.prod_name = prod_name;
		this.gym_name = gym_name;
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

	public String getSell_type() {
		return sell_type;
	}

	public void setSell_type(String sell_type) {
		this.sell_type = sell_type;
	}

	public String getAlarm_date() {
		return alarm_date;
	}

	public void setAlarm_date(String alarm_date) {
		this.alarm_date = alarm_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBuy_del_state() {
		return buy_del_state;
	}

	public void setBuy_del_state(String buy_del_state) {
		this.buy_del_state = buy_del_state;
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

	@Override
	public String toString() {
		return "AlarmVo [alarm_no=" + alarm_no + ", from_user_no=" + from_user_no + ", to_user_no=" + to_user_no
				+ ", alarm_content=" + alarm_content + ", sell_type=" + sell_type + ", alarm_date=" + alarm_date
				+ ", user_id=" + user_id + ", buy_del_state=" + buy_del_state + ", prod_name=" + prod_name
				+ ", gym_name=" + gym_name + "]";
	}

}