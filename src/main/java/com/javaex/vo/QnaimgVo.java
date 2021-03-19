package com.javaex.vo;

public class QnaimgVo {
	
	private int qna_img_no; //문의 이미지 번호
	private int qna_no; //문의 번호
	private String qna_img_name; //문의 이미지 등록명
	private String qna_img_savename; //문의 이미지 저장명
	private String qna_img_type; //옵션(main/sub)
	
	public QnaimgVo() {}

	public QnaimgVo(int qna_img_no, int qna_no, String qna_img_name, String qna_img_savename, String qna_img_type) {
		super();
		this.qna_img_no = qna_img_no;
		this.qna_no = qna_no;
		this.qna_img_name = qna_img_name;
		this.qna_img_savename = qna_img_savename;
		this.qna_img_type = qna_img_type;
	}

	public int getQna_img_no() {
		return qna_img_no;
	}

	public void setQna_img_no(int qna_img_no) {
		this.qna_img_no = qna_img_no;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_img_name() {
		return qna_img_name;
	}

	public void setQna_img_name(String qna_img_name) {
		this.qna_img_name = qna_img_name;
	}

	public String getQna_img_savename() {
		return qna_img_savename;
	}

	public void setQna_img_savename(String qna_img_savename) {
		this.qna_img_savename = qna_img_savename;
	}

	public String getQna_img_type() {
		return qna_img_type;
	}

	public void setQna_img_type(String qna_img_type) {
		this.qna_img_type = qna_img_type;
	}

	@Override
	public String toString() {
		return "QnaimgVo [qna_img_no=" + qna_img_no + ", qna_no=" + qna_no + ", qna_img_name=" + qna_img_name
				+ ", qna_img_savename=" + qna_img_savename + ", qna_img_type=" + qna_img_type + "]";
	}
	
	
	
	
	

}
