package com.javaex.vo;

public class SellerVo {

	private int sell_no;
	private int user_no;
	private int book_type;
	private int prod_type;
	private String book_sell_name;
	private String book_com_name;
	private int book_business_no;
	private String book_sell_address;
	private String book_sell_bank;
	private int book_sell_account;
	private String prod_sell_name;
	private int prod_business_no;
	private String prod_sell_address;
	private String prod_sell_bank;
	private int prod_sell_account;
	private String prod_com_name;
	private String addressdetail;
	private String roadaddress;

	public SellerVo() {
	}

	public SellerVo(int sell_no, int user_no, int book_type, int prod_type, String book_sell_name, String book_com_name,
			int book_business_no, String book_sell_address, String book_sell_bank, int book_sell_account,
			String prod_sell_name, int prod_business_no, String prod_sell_address, String prod_sell_bank,
			int prod_sell_account, String prod_com_name) {
		this.sell_no = sell_no;
		this.user_no = user_no;
		this.book_type = book_type;
		this.prod_type = prod_type;
		this.book_sell_name = book_sell_name;
		this.book_com_name = book_com_name;
		this.book_business_no = book_business_no;
		this.book_sell_address = book_sell_address;
		this.book_sell_bank = book_sell_bank;
		this.book_sell_account = book_sell_account;
		this.prod_sell_name = prod_sell_name;
		this.prod_business_no = prod_business_no;
		this.prod_sell_address = prod_sell_address;
		this.prod_sell_bank = prod_sell_bank;
		this.prod_sell_account = prod_sell_account;
		this.prod_com_name = prod_com_name;
	}

	public SellerVo(int sell_no, int user_no, int book_type, int prod_type, String book_sell_name, String book_com_name,
			int book_business_no, String book_sell_address, String book_sell_bank, int book_sell_account,
			String prod_sell_name, int prod_business_no, String prod_sell_address, String prod_sell_bank,
			int prod_sell_account, String prod_com_name, String addressdetail, String roadaddress) {
		super();
		this.sell_no = sell_no;
		this.user_no = user_no;
		this.book_type = book_type;
		this.prod_type = prod_type;
		this.book_sell_name = book_sell_name;
		this.book_com_name = book_com_name;
		this.book_business_no = book_business_no;
		this.book_sell_address = book_sell_address;
		this.book_sell_bank = book_sell_bank;
		this.book_sell_account = book_sell_account;
		this.prod_sell_name = prod_sell_name;
		this.prod_business_no = prod_business_no;
		this.prod_sell_address = prod_sell_address;
		this.prod_sell_bank = prod_sell_bank;
		this.prod_sell_account = prod_sell_account;
		this.prod_com_name = prod_com_name;
		this.addressdetail = addressdetail;
		this.roadaddress = roadaddress;
	}

	public int getSell_no() {
		return sell_no;
	}

	public void setSell_no(int sell_no) {
		this.sell_no = sell_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getBook_type() {
		return book_type;
	}

	public void setBook_type(int book_type) {
		this.book_type = book_type;
	}

	public int getProd_type() {
		return prod_type;
	}

	public void setProd_type(int prod_type) {
		this.prod_type = prod_type;
	}

	public String getBook_sell_name() {
		return book_sell_name;
	}

	public void setBook_sell_name(String book_sell_name) {
		this.book_sell_name = book_sell_name;
	}

	public String getBook_com_name() {
		return book_com_name;
	}

	public void setBook_com_name(String book_com_name) {
		this.book_com_name = book_com_name;
	}

	public int getBook_business_no() {
		return book_business_no;
	}

	public void setBook_business_no(int book_business_no) {
		this.book_business_no = book_business_no;
	}

	public String getBook_sell_address() {
		return book_sell_address;
	}

	public void setBook_sell_address(String book_sell_address) {
		this.book_sell_address = book_sell_address;
	}

	public String getBook_sell_bank() {
		return book_sell_bank;
	}

	public void setBook_sell_bank(String book_sell_bank) {
		this.book_sell_bank = book_sell_bank;
	}

	public int getBook_sell_account() {
		return book_sell_account;
	}

	public void setBook_sell_account(int book_sell_account) {
		this.book_sell_account = book_sell_account;
	}

	public String getProd_sell_name() {
		return prod_sell_name;
	}

	public void setProd_sell_name(String prod_sell_name) {
		this.prod_sell_name = prod_sell_name;
	}

	public int getProd_business_no() {
		return prod_business_no;
	}

	public void setProd_business_no(int prod_business_no) {
		this.prod_business_no = prod_business_no;
	}

	public String getProd_sell_address() {
		return prod_sell_address;
	}

	public void setProd_sell_address(String prod_sell_address) {
		this.prod_sell_address = prod_sell_address;
	}

	public String getProd_sell_bank() {
		return prod_sell_bank;
	}

	public void setProd_sell_bank(String prod_sell_bank) {
		this.prod_sell_bank = prod_sell_bank;
	}

	public int getProd_sell_account() {
		return prod_sell_account;
	}

	public void setProd_sell_account(int prod_sell_account) {
		this.prod_sell_account = prod_sell_account;
	}

	public String getProd_com_name() {
		return prod_com_name;
	}

	public void setProd_com_name(String prod_com_name) {
		this.prod_com_name = prod_com_name;
	}

	public String getAddressdetail() {
		return addressdetail;
	}

	public void setAddressdetail(String addressdetail) {
		this.addressdetail = addressdetail;
	}


	public String getRoadaddress() {
		return roadaddress;
	}

	public void setRoadaddress(String roadaddress) {
		this.roadaddress = roadaddress;
	}

	@Override
	public String toString() {
		return "SellerVo [sell_no=" + sell_no + ", user_no=" + user_no + ", book_type=" + book_type + ", prod_type="
				+ prod_type + ", book_sell_name=" + book_sell_name + ", book_com_name=" + book_com_name
				+ ", book_business_no=" + book_business_no + ", book_sell_address=" + book_sell_address
				+ ", book_sell_bank=" + book_sell_bank + ", book_sell_account=" + book_sell_account
				+ ", prod_sell_name=" + prod_sell_name + ", prod_business_no=" + prod_business_no
				+ ", prod_sell_address=" + prod_sell_address + ", prod_sell_bank=" + prod_sell_bank
				+ ", prod_sell_account=" + prod_sell_account + ", prod_com_name=" + prod_com_name + ", addressdetail="
				+ addressdetail + ", roadaddress=" + roadaddress + "]";
	}

}
