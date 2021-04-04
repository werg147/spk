package com.javaex.vo;

public class BuyListVo {

	private String prod_detail_img_savename;
	private String prod_img_savename;
	private String prod_name;
	private int prod_price;

	private String buy_date;

	private String buy_del_state;

	private int user_no;
	private int buy_no;
	private int prod_no;
	private int booking_no;
	private int b_buy_no;

	public BuyListVo() {
		super();
	}

	public BuyListVo(String prod_detail_img_savename, String prod_img_savename, String prod_name, int prod_price,
			String buy_date, String buy_del_state, int user_no, int buy_no, int prod_no, int booking_no, int b_buy_no) {
		super();
		this.prod_detail_img_savename = prod_detail_img_savename;
		this.prod_img_savename = prod_img_savename;
		this.prod_name = prod_name;
		this.prod_price = prod_price;
		this.buy_date = buy_date;
		this.buy_del_state = buy_del_state;
		this.user_no = user_no;
		this.buy_no = buy_no;
		this.prod_no = prod_no;
		this.booking_no = booking_no;
		this.b_buy_no = b_buy_no;
	}

	public String getProd_detail_img_savename() {
		return prod_detail_img_savename;
	}

	public void setProd_detail_img_savename(String prod_detail_img_savename) {
		this.prod_detail_img_savename = prod_detail_img_savename;
	}

	public String getProd_img_savename() {
		return prod_img_savename;
	}

	public void setProd_img_savename(String prod_img_savename) {
		this.prod_img_savename = prod_img_savename;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public int getProd_price() {
		return prod_price;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}

	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}

	public String getBuy_del_state() {
		return buy_del_state;
	}

	public void setBuy_del_state(String buy_del_state) {
		this.buy_del_state = buy_del_state;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public int getProd_no() {
		return prod_no;
	}

	public void setProd_no(int prod_no) {
		this.prod_no = prod_no;
	}

	public int getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(int booking_no) {
		this.booking_no = booking_no;
	}

	public int getB_buy_no() {
		return b_buy_no;
	}

	public void setB_buy_no(int b_buy_no) {
		this.b_buy_no = b_buy_no;
	}

	@Override
	public String toString() {
		return "BuyListVo [prod_detail_img_savename=" + prod_detail_img_savename + ", prod_img_savename="
				+ prod_img_savename + ", prod_name=" + prod_name + ", prod_price=" + prod_price + ", buy_date="
				+ buy_date + ", buy_del_state=" + buy_del_state + ", user_no=" + user_no + ", buy_no=" + buy_no
				+ ", prod_no=" + prod_no + ", booking_no=" + booking_no + ", b_buy_no=" + b_buy_no + "]";
	}

}
