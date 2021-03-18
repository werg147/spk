package com.javaex.vo;

public class QnaVo {
	
	private int qna_no;
	private String prod_no;
	private String qna_title;
	private String qna_content;
	private String qna_date;
	private String qna_type;
	private int user_no;
	private int buy_no;
	
	
	public QnaVo() {}


	public QnaVo(int qna_no, String prod_no, String qna_title, String qna_content, String qna_date, String qna_type,
			int user_no, int buy_no) {
		super();
		this.qna_no = qna_no;
		this.prod_no = prod_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.qna_type = qna_type;
		this.user_no = user_no;
		this.buy_no = buy_no;
	}


	public int getQna_no() {
		return qna_no;
	}


	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}


	public String getProd_no() {
		return prod_no;
	}


	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}


	public String getQna_title() {
		return qna_title;
	}


	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}


	public String getQna_content() {
		return qna_content;
	}


	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}


	public String getQna_date() {
		return qna_date;
	}


	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}


	public String getQna_type() {
		return qna_type;
	}


	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
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


	@Override
	public String toString() {
		return "QnaVo [qna_no=" + qna_no + ", prod_no=" + prod_no + ", qna_title=" + qna_title + ", qna_content="
				+ qna_content + ", qna_date=" + qna_date + ", qna_type=" + qna_type + ", user_no=" + user_no
				+ ", buy_no=" + buy_no + "]";
	}

	
	
	

}
