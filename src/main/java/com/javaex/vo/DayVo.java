package com.javaex.vo;

public class DayVo {
	
	private int year;
	private int month;
	private int day;
	private String today;
	
	
	public DayVo() {
		
	}
	public DayVo(int year, int month, int day, String today) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.today = today;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	@Override
	public String toString() {
		return "DayVo [year=" + year + ", month=" + month + ", day=" + day + ", today=" + today + "]";
	}
	
	
	
}
