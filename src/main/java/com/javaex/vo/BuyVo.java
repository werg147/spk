package com.javaex.vo;

public class BuyVo {

	private int buy_no;
	private int user_no;
	private String buy_address;
	private int buy_ph;
	private String buy_date;
	private String buy_paytype;
	private int buy_price;
	private String buy_state;
	private String buy_name;

	public BuyVo() {
	}

	public BuyVo(int buy_no, int user_no, String buy_address, int buy_ph, String buy_date, String buy_paytype,
			int buy_price, String buy_state, String buy_name) {
		super();
		this.buy_no = buy_no;
		this.user_no = user_no;
		this.buy_address = buy_address;
		this.buy_ph = buy_ph;
		this.buy_date = buy_date;
		this.buy_paytype = buy_paytype;
		this.buy_price = buy_price;
		this.buy_state = buy_state;
		this.buy_name = buy_name;
	}

	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getBuy_address() {
		return buy_address;
	}

	public void setBuy_address(String buy_address) {
		this.buy_address = buy_address;
	}

	public int getBuy_ph() {
		return buy_ph;
	}

	public void setBuy_ph(int buy_ph) {
		this.buy_ph = buy_ph;
	}

	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}

	public String getBuy_paytype() {
		return buy_paytype;
	}

	public void setBuy_paytype(String buy_paytype) {
		this.buy_paytype = buy_paytype;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}

	public String getBuy_state() {
		return buy_state;
	}

	public void setBuy_state(String buy_state) {
		this.buy_state = buy_state;
	}

	public String getBuy_name() {
		return buy_name;
	}

	public void setBuy_name(String buy_name) {
		this.buy_name = buy_name;
	}

	@Override
	public String toString() {
		return "BuyVo [buy_no=" + buy_no + ", user_no=" + user_no + ", buy_address=" + buy_address + ", buy_ph="
				+ buy_ph + ", buy_date=" + buy_date + ", buy_paytype=" + buy_paytype + ", buy_price=" + buy_price
				+ ", buy_state=" + buy_state + ", buy_name=" + buy_name + "]";
	}

}
