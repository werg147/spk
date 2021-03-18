package com.javaex.vo;

public class UserVo {

	private int user_no;
	private int sell_no;
	private String user_id;
	private String user_name;
	private String password;
	private String nickname;
	private String address;
	private String user_photo;
	private int user_phone;
	private int user_level;
	private String user_date;

	public UserVo() {
	}

	public UserVo(String user_id, String password) {
		this.user_id = user_id;
		this.password = password;
	}

	public UserVo(int user_no, int sell_no, String nickname) {
		this.user_no = user_no;
		this.sell_no = sell_no;
		this.nickname = nickname;
	}

	public UserVo(int user_no, int sell_no, String user_id, String user_name, String password, String nickname,
			String address, String user_photo, int user_phone, int user_level, String user_date) {
		this.user_no = user_no;
		this.sell_no = sell_no;
		this.user_id = user_id;
		this.user_name = user_name;
		this.password = password;
		this.nickname = nickname;
		this.address = address;
		this.user_photo = user_photo;
		this.user_phone = user_phone;
		this.user_level = user_level;
		this.user_date = user_date;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getSell_no() {
		return sell_no;
	}

	public void setSell_no(int sell_no) {
		this.sell_no = sell_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}

	public int getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(int user_phone) {
		this.user_phone = user_phone;
	}

	public int getUser_level() {
		return user_level;
	}

	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}

	public String getUser_date() {
		return user_date;
	}

	public void setUser_date(String user_date) {
		this.user_date = user_date;
	}

	@Override
	public String toString() {
		return "UserVo [user_no=" + user_no + ", sell_no=" + sell_no + ", user_id=" + user_id + ", user_name="
				+ user_name + ", password=" + password + ", nickname=" + nickname + ", address=" + address
				+ ", user_photo=" + user_photo + ", user_phone=" + user_phone + ", user_level=" + user_level
				+ ", user_date=" + user_date + "]";
	}

}
