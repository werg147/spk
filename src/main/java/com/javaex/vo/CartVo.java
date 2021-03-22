package com.javaex.vo;

public class CartVo {

	public int cart_no;
	public int user_no;
	public String prod_no;
	public int colorsize_no;
	public int count;
	public int buy_no;
	public String user_name;
	public String prod_name;
	public int prod_price;
	public String prod_detail_img_savename;
	public String buy_address;
	public String color;
	public String prod_size;

	public CartVo() {
		super();
	}

	public CartVo(int cart_no, int user_no, String prod_no, int colorsize_no, int count, int buy_no, String user_name,
			String prod_name, int prod_price, String prod_detail_img_savename, String buy_address, String color,
			String prod_size) {
		super();
		this.cart_no = cart_no;
		this.user_no = user_no;
		this.prod_no = prod_no;
		this.colorsize_no = colorsize_no;
		this.count = count;
		this.buy_no = buy_no;
		this.user_name = user_name;
		this.prod_name = prod_name;
		this.prod_price = prod_price;
		this.prod_detail_img_savename = prod_detail_img_savename;
		this.buy_address = buy_address;
		this.color = color;
		this.prod_size = prod_size;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getProd_no() {
		return prod_no;
	}

	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}

	public int getColorsize_no() {
		return colorsize_no;
	}

	public void setColorsize_no(int colorsize_no) {
		this.colorsize_no = colorsize_no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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

	public String getProd_detail_img_savename() {
		return prod_detail_img_savename;
	}

	public void setProd_detail_img_savename(String prod_detail_img_savename) {
		this.prod_detail_img_savename = prod_detail_img_savename;
	}

	public String getBuy_address() {
		return buy_address;
	}

	public void setBuy_address(String buy_address) {
		this.buy_address = buy_address;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getProd_size() {
		return prod_size;
	}

	public void setProd_size(String prod_size) {
		this.prod_size = prod_size;
	}

	@Override
	public String toString() {
		return "CartVo [cart_no=" + cart_no + ", user_no=" + user_no + ", prod_no=" + prod_no + ", colorsize_no="
				+ colorsize_no + ", count=" + count + ", buy_no=" + buy_no + ", user_name=" + user_name + ", prod_name="
				+ prod_name + ", prod_price=" + prod_price + ", prod_detail_img_savename=" + prod_detail_img_savename
				+ ", buy_address=" + buy_address + ", color=" + color + ", prod_size=" + prod_size + "]";
	}

}
