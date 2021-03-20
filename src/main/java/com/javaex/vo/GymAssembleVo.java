package com.javaex.vo;

import java.util.List;

public class GymAssembleVo {
	//1.gym 정보
	private GymVo gymVo;
	
	//2.gymImg 정보
	private List<GymImgVo> gymimgList;
	
	//3.오늘부터 10일 날짜와 요일
	private List<DayVo> dayList;
	
	//4.오늘날짜의 부킹정보
	private List<BookingVo> bookingList;
	
	//5.해당gym의 편의시설 리스트
	private List<ConvenienceVo> conList;

	
	
	public GymAssembleVo() {
		super();
	}



	public GymAssembleVo(GymVo gymVo, List<GymImgVo> gymimgList, List<DayVo> dayList, List<BookingVo> bookingList, List<ConvenienceVo> conList) {
		super();
		this.gymVo = gymVo;
		this.gymimgList = gymimgList;
		this.dayList = dayList;
		this.bookingList = bookingList;
		this.conList = conList;
	}



	public GymVo getGymVo() {
		return gymVo;
	}



	public void setGymVo(GymVo gymVo) {
		this.gymVo = gymVo;
	}



	public List<GymImgVo> getGymimgList() {
		return gymimgList;
	}



	public void setGymimgList(List<GymImgVo> gymimgList) {
		this.gymimgList = gymimgList;
	}



	public List<DayVo> getDayList() {
		return dayList;
	}



	public void setDayList(List<DayVo> dayList) {
		this.dayList = dayList;
	}



	public List<BookingVo> getBookingList() {
		return bookingList;
	}



	public void setBookingList(List<BookingVo> bookingList) {
		this.bookingList = bookingList;
	}



	public List<ConvenienceVo> getConList() {
		return conList;
	}



	public void setConList(List<ConvenienceVo> conList) {
		this.conList = conList;
	}



	@Override
	public String toString() {
		return "GymAssembleVo [gymVo=" + gymVo + ", gymimgList=" + gymimgList + ", dayList=" + dayList + ", bookingList=" + bookingList + ", conList=" + conList
				+ "]";
	}
	
	
	
	
}
