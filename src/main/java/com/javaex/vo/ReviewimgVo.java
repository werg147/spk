package com.javaex.vo;

public class ReviewimgVo {
	
	private int review_img_no;
	private int review_no;
	private String review_img_name;
	private String review_img_savename;
	private String review_img_type;
	
	public ReviewimgVo() {}

	public ReviewimgVo(int review_img_no, int reivew_no, String review_img_name, String review_img_savename,
			String review_img_type) {
		super();
		this.review_img_no = review_img_no;
		this.review_no = review_no;
		this.review_img_name = review_img_name;
		this.review_img_savename = review_img_savename;
		this.review_img_type = review_img_type;
	}

	public int getReview_img_no() {
		return review_img_no;
	}

	public void setReview_img_no(int review_img_no) {
		this.review_img_no = review_img_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_img_name() {
		return review_img_name;
	}

	public void setReview_img_name(String review_img_name) {
		this.review_img_name = review_img_name;
	}

	public String getReview_img_savename() {
		return review_img_savename;
	}

	public void setReview_img_savename(String review_img_savename) {
		this.review_img_savename = review_img_savename;
	}

	public String getReview_img_type() {
		return review_img_type;
	}

	public void setReview_img_type(String review_img_type) {
		this.review_img_type = review_img_type;
	}

	@Override
	public String toString() {
		return "ReviewimgVo [review_img_no=" + review_img_no + ", review_no=" + review_no + ", review_img_name="
				+ review_img_name + ", review_img_savename=" + review_img_savename + ", review_img_type="
				+ review_img_type + "]";
	}
	
	

}
