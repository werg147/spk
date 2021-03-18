package com.javaex.vo;

public class GymImgVo {

	private int gym_img_no;
	private int gym_no;
	private String gym_img_savename;
	private String gym_img_name;
	private String gym_img_type;

	public GymImgVo() {
	}

	public GymImgVo(int gym_no, String gym_img_savename, String gym_img_name) {
		this.gym_no = gym_no;
		this.gym_img_savename = gym_img_savename;
		this.gym_img_name = gym_img_name;
	}
	
	public GymImgVo(int gym_img_no, int gym_no, String gym_img_savename, String gym_img_name, String gym_img_type) {
		this.gym_img_no = gym_img_no;
		this.gym_no = gym_no;
		this.gym_img_savename = gym_img_savename;
		this.gym_img_name = gym_img_name;
		this.gym_img_type = gym_img_type;
	}

	public int getGym_img_no() {
		return gym_img_no;
	}

	public void setGym_img_no(int gym_img_no) {
		this.gym_img_no = gym_img_no;
	}

	public int getGym_no() {
		return gym_no;
	}

	public void setGym_no(int gym_no) {
		this.gym_no = gym_no;
	}

	public String getGym_img_savename() {
		return gym_img_savename;
	}

	public void setGym_img_savename(String gym_img_savename) {
		this.gym_img_savename = gym_img_savename;
	}

	public String getGym_img_name() {
		return gym_img_name;
	}

	public void setGym_img_name(String gym_img_name) {
		this.gym_img_name = gym_img_name;
	}

	public String getGym_img_type() {
		return gym_img_type;
	}

	public void setGym_img_type(String gym_img_type) {
		this.gym_img_type = gym_img_type;
	}

	@Override
	public String toString() {
		return "GymImgVo [gym_img_no=" + gym_img_no + ", gym_no=" + gym_no + ", gym_img_savename=" + gym_img_savename
				+ ", gym_img_name=" + gym_img_name + ", gym_img_type=" + gym_img_type + "]";
	}

}
