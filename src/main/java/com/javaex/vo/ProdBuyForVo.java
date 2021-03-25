package com.javaex.vo;

import java.util.List;

public class ProdBuyForVo {
	
	private String prod_name;
	private String prod_brand;
	private int buyprod_no;
	private String prod_no;
	private String buy_address;
	private int buy_ph;
	private int colorsize_no;
	private int buy_del_no;
	private String buy_delivery;
	private String buy_del_state;
	private int buy_price;
	private int count;
	private int buy_no;
	private String prod_size;
	private String color;
	private String prod_cate;
	private String buy_date;
	private String buy_paytype;
	private int sell_no;
	private String prod_img_savename;
	private String prod_img_type;
	private String buy_name;
	private int buyprod_price;
	private List <ProdBuyForVo> plist;
	
	
	public ProdBuyForVo() {
	}







	public ProdBuyForVo(String prod_name, String prod_brand, int buyprod_no, String prod_no, String buy_address,
			int buy_ph, int colorsize_no, int buy_del_no, String buy_delivery, String buy_del_state, int buy_price,
			int count, int buy_no, String prod_size, String color, String prod_cate, String buy_date,
			String buy_paytype, int sell_no, String prod_img_savename, String prod_img_type, String buy_name,
			int buyprod_price, List<ProdBuyForVo> plist) {
		super();
		this.prod_name = prod_name;
		this.prod_brand = prod_brand;
		this.buyprod_no = buyprod_no;
		this.prod_no = prod_no;
		this.buy_address = buy_address;
		this.buy_ph = buy_ph;
		this.colorsize_no = colorsize_no;
		this.buy_del_no = buy_del_no;
		this.buy_delivery = buy_delivery;
		this.buy_del_state = buy_del_state;
		this.buy_price = buy_price;
		this.count = count;
		this.buy_no = buy_no;
		this.prod_size = prod_size;
		this.color = color;
		this.prod_cate = prod_cate;
		this.buy_date = buy_date;
		this.buy_paytype = buy_paytype;
		this.sell_no = sell_no;
		this.prod_img_savename = prod_img_savename;
		this.prod_img_type = prod_img_type;
		this.buy_name = buy_name;
		this.buyprod_price = buyprod_price;
		this.plist = plist;
	}







	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_brand() {
		return prod_brand;
	}

	public void setProd_brand(String prod_brand) {
		this.prod_brand = prod_brand;
	}

	public int getBuyprod_no() {
		return buyprod_no;
	}

	public void setBuyprod_no(int buyprod_no) {
		this.buyprod_no = buyprod_no;
	}

	public String getProd_no() {
		return prod_no;
	}

	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
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

	public int getColorsize_no() {
		return colorsize_no;
	}

	public void setColorsize_no(int colorsize_no) {
		this.colorsize_no = colorsize_no;
	}

	public int getBuy_del_no() {
		return buy_del_no;
	}

	public void setBuy_del_no(int buy_del_no) {
		this.buy_del_no = buy_del_no;
	}

	public String getBuy_delivery() {
		return buy_delivery;
	}

	public void setBuy_delivery(String buy_delivery) {
		this.buy_delivery = buy_delivery;
	}

	public String getBuy_del_state() {
		return buy_del_state;
	}

	public void setBuy_del_state(String buy_del_state) {
		this.buy_del_state = buy_del_state;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
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

	public String getProd_cate() {
		return prod_cate;
	}

	public void setProd_cate(String prod_cate) {
		this.prod_cate = prod_cate;
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

	public int getSell_no() {
		return sell_no;
	}

	public void setSell_no(int sell_no) {
		this.sell_no = sell_no;
	}

	public String getProd_img_savename() {
		return prod_img_savename;
	}

	public void setProd_img_savename(String prod_img_savename) {
		this.prod_img_savename = prod_img_savename;
	}

	public String getProd_img_type() {
		return prod_img_type;
	}

	public void setProd_img_type(String prod_img_type) {
		this.prod_img_type = prod_img_type;
	}

	public String getBuy_name() {
		return buy_name;
	}



	public void setBuy_name(String buy_name) {
		this.buy_name = buy_name;
	}



	public int getBuyprod_price() {
		return buyprod_price;
	}





	public void setBuyprod_price(int buyprod_price) {
		this.buyprod_price = buyprod_price;
	}





	public List<ProdBuyForVo> getPlist() {
		return plist;
	}







	public void setPlist(List<ProdBuyForVo> plist) {
		this.plist = plist;
	}







	@Override
	public String toString() {
		return "ProdBuyForVo [prod_name=" + prod_name + ", prod_brand=" + prod_brand + ", buyprod_no=" + buyprod_no
				+ ", prod_no=" + prod_no + ", buy_address=" + buy_address + ", buy_ph=" + buy_ph + ", colorsize_no="
				+ colorsize_no + ", buy_del_no=" + buy_del_no + ", buy_delivery=" + buy_delivery + ", buy_del_state="
				+ buy_del_state + ", buy_price=" + buy_price + ", count=" + count + ", buy_no=" + buy_no
				+ ", prod_size=" + prod_size + ", color=" + color + ", prod_cate=" + prod_cate + ", buy_date="
				+ buy_date + ", buy_paytype=" + buy_paytype + ", sell_no=" + sell_no + ", prod_img_savename="
				+ prod_img_savename + ", prod_img_type=" + prod_img_type + ", buy_name=" + buy_name + ", buyprod_price="
				+ buyprod_price + ", plist=" + plist + "]";
	}



	
}
