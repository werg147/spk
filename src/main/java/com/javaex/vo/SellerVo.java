package com.javaex.vo;

public class SellerVo {
	
	private int sell_no;
	private int user_no;
	private String book_sell_name;
	private int book_business_no;
	private String book_sell_address;
	private String book_sell_bank;
	private int book_sell_account;
	private String pord_sell_name;
	private int pord_business_no;
	private String pord_sell_address;
	private String pord_sell_bank;
	private int pord_sell_account;	
	private int prod_type;
	private int book_type;
	
	
	public SellerVo() {}


	public SellerVo(int sell_no, int user_no, String book_sell_name, int book_business_no, String book_sell_address,
			String book_sell_bank, int book_sell_account, String pord_sell_name, int pord_business_no,
			String pord_sell_address, String pord_sell_bank, int pord_sell_account, int prod_type, int book_type) {
		this.sell_no = sell_no;
		this.user_no = user_no;
		this.book_sell_name = book_sell_name;
		this.book_business_no = book_business_no;
		this.book_sell_address = book_sell_address;
		this.book_sell_bank = book_sell_bank;
		this.book_sell_account = book_sell_account;
		this.pord_sell_name = pord_sell_name;
		this.pord_business_no = pord_business_no;
		this.pord_sell_address = pord_sell_address;
		this.pord_sell_bank = pord_sell_bank;
		this.pord_sell_account = pord_sell_account;
		this.prod_type = prod_type;
		this.book_type = book_type;
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


	public String getBook_sell_name() {
		return book_sell_name;
	}


	public void setBook_sell_name(String book_sell_name) {
		this.book_sell_name = book_sell_name;
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


	public String getPord_sell_name() {
		return pord_sell_name;
	}


	public void setPord_sell_name(String pord_sell_name) {
		this.pord_sell_name = pord_sell_name;
	}


	public int getPord_business_no() {
		return pord_business_no;
	}


	public void setPord_business_no(int pord_business_no) {
		this.pord_business_no = pord_business_no;
	}


	public String getPord_sell_address() {
		return pord_sell_address;
	}


	public void setPord_sell_address(String pord_sell_address) {
		this.pord_sell_address = pord_sell_address;
	}


	public String getPord_sell_bank() {
		return pord_sell_bank;
	}


	public void setPord_sell_bank(String pord_sell_bank) {
		this.pord_sell_bank = pord_sell_bank;
	}


	public int getPord_sell_account() {
		return pord_sell_account;
	}


	public void setPord_sell_account(int pord_sell_account) {
		this.pord_sell_account = pord_sell_account;
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


	@Override
	public String toString() {
		return "SellerVo [sell_no=" + sell_no + ", user_no=" + user_no + ", book_sell_name=" + book_sell_name
				+ ", book_business_no=" + book_business_no + ", book_sell_address=" + book_sell_address
				+ ", book_sell_bank=" + book_sell_bank + ", book_sell_account=" + book_sell_account
				+ ", pord_sell_name=" + pord_sell_name + ", pord_business_no=" + pord_business_no
				+ ", pord_sell_address=" + pord_sell_address + ", pord_sell_bank=" + pord_sell_bank
				+ ", pord_sell_account=" + pord_sell_account + ", prod_type=" + prod_type + ", book_type=" + book_type
				+ "]";
	}

	
	
	

}
