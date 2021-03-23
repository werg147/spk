package com.javaex.vo;

public class CartVo {

	private int cart_no;
	private int user_no;
	private String prod_no;
	private int colorsize_no;
	private int count;

	private String prod_detail_img_savename;
	private String prod_name;
	private int prod_price;

	private String prod_size;
	private String color;

	public CartVo() {
		super();
	}

	public CartVo(int cart_no, int user_no, String prod_no, int colorsize_no, int count,
			String prod_detail_img_savename, String prod_name, int prod_price, String prod_size, String color) {
		super();
		this.cart_no = cart_no;
		this.user_no = user_no;
		this.prod_no = prod_no;
		this.colorsize_no = colorsize_no;
		this.count = count;
		this.prod_detail_img_savename = prod_detail_img_savename;
		this.prod_name = prod_name;
		this.prod_price = prod_price;
		this.prod_size = prod_size;
		this.color = color;
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

	public String getProd_detail_img_savename() {
		return prod_detail_img_savename;
	}

	public void setProd_detail_img_savename(String prod_detail_img_savename) {
		this.prod_detail_img_savename = prod_detail_img_savename;
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

	public String getProd_size() {
		return prod_size;
	}

	public void setProd_size(String prod_size) {
		this.prod_size = prod_size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "CartVo [cart_no=" + cart_no + ", user_no=" + user_no + ", prod_no=" + prod_no + ", colorsize_no="
				+ colorsize_no + ", count=" + count + ", prod_detail_img_savename=" + prod_detail_img_savename
				+ ", prod_name=" + prod_name + ", prod_price=" + prod_price + ", prod_size=" + prod_size + ", color="
				+ color + "]";
	}

}
