package com.javaex.vo;

public class GymVo {

	private int gym_no;
	private int sell_no;
	private String gym_name;
	private String gym_address;
	private String gym_ph;
	private String gym_time;
	private String gym_notice;
	private String gym_event;
	private String gym_date;

	public GymVo() {
	}

	public GymVo(int gym_no, int sell_no, String gym_name, String gym_address, String gym_ph, String gym_time,
			String gym_notice, String gym_event, String gym_date) {
		this.gym_no = gym_no;
		this.sell_no = sell_no;
		this.gym_name = gym_name;
		this.gym_address = gym_address;
		this.gym_ph = gym_ph;
		this.gym_time = gym_time;
		this.gym_notice = gym_notice;
		this.gym_event = gym_event;
		this.gym_date = gym_date;
	}

	public int getGym_no() {
		return gym_no;
	}

	public void setGym_no(int gym_no) {
		this.gym_no = gym_no;
	}

	public int getSell_no() {
		return sell_no;
	}

	public void setSell_no(int sell_no) {
		this.sell_no = sell_no;
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

	public String getGym_ph() {
		return gym_ph;
	}

	public void setGym_ph(String gym_ph) {
		this.gym_ph = gym_ph;
	}

	public String getGym_time() {
		return gym_time;
	}

	public void setGym_time(String gym_time) {
		this.gym_time = gym_time;
	}

	public String getGym_notice() {
		return gym_notice;
	}

	public void setGym_notice(String gym_notice) {
		this.gym_notice = gym_notice;
	}

	public String getGym_event() {
		return gym_event;
	}

	public void setGym_event(String gym_event) {
		this.gym_event = gym_event;
	}

	public String getGym_date() {
		return gym_date;
	}

	public void setGym_date(String gym_date) {
		this.gym_date = gym_date;
	}

	@Override
	public String toString() {
		return "GymVo [gym_no=" + gym_no + ", sell_no=" + sell_no + ", gym_name=" + gym_name + ", gym_address="
				+ gym_address + ", gym_ph=" + gym_ph + ", gym_time=" + gym_time + ", gym_notice=" + gym_notice
				+ ", gym_event=" + gym_event + ", gym_date=" + gym_date + "]";
	}

}
