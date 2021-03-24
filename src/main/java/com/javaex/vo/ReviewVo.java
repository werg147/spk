package com.javaex.vo;

public class ReviewVo {

	private int review_no;
	private String prod_no;
	private String review_title;
	private String review_content;
	private String review_date;
	private int buy_no;
	private int user_no;
	private int review_hit;

	private String review_img_savename;
	private String nickname;

	public ReviewVo() {
	}

	public ReviewVo(int review_no, String prod_no, String review_title, String review_content, String review_date,
			int buy_no, int user_no, int review_hit, String review_img_savename, String nickname) {
		super();
		this.review_no = review_no;
		this.prod_no = prod_no;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_date = review_date;
		this.buy_no = buy_no;
		this.user_no = user_no;
		this.review_hit = review_hit;
		this.review_img_savename = review_img_savename;
		this.nickname = nickname;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getProd_no() {
		return prod_no;
	}

	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
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

	public int getReview_hit() {
		return review_hit;
	}

	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}

	public String getReview_img_savename() {
		return review_img_savename;
	}

	public void setReview_img_savename(String review_img_savename) {
		this.review_img_savename = review_img_savename;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "ReviewVo [review_no=" + review_no + ", prod_no=" + prod_no + ", review_title=" + review_title
				+ ", review_content=" + review_content + ", review_date=" + review_date + ", buy_no=" + buy_no
				+ ", user_no=" + user_no + ", review_hit=" + review_hit + ", review_img_savename=" + review_img_savename
				+ ", nickname=" + nickname + "]";
	}

}
