package com.javaex.vo;

public class ProfitVo {

	private String peri_start;
	private String peri_end;
	private String monthstart;
	private String monthend;
	private String type;
	private int total;
	
	private int complete;
	private int possible;
	private int expect;
	private int sell_no;
	
	public ProfitVo() {
	}




	public ProfitVo(String peri_start, String peri_end, String monthstart, String monthend, String type, int total,
			int complete, int possible, int expect, int sell_no) {
		super();
		this.peri_start = peri_start;
		this.peri_end = peri_end;
		this.monthstart = monthstart;
		this.monthend = monthend;
		this.type = type;
		this.total = total;
		this.complete = complete;
		this.possible = possible;
		this.expect = expect;
		this.sell_no = sell_no;
	}




	public String getPeri_start() {
		return peri_start;
	}


	public void setPeri_start(String peri_start) {
		this.peri_start = peri_start;
	}


	public String getPeri_end() {
		return peri_end;
	}


	public void setPeri_end(String peri_end) {
		this.peri_end = peri_end;
	}


	public String getMonthstart() {
		return monthstart;
	}


	public void setMonthstart(String monthstart) {
		this.monthstart = monthstart;
	}


	public String getMonthend() {
		return monthend;
	}


	public void setMonthend(String monthend) {
		this.monthend = monthend;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getComplete() {
		return complete;
	}


	public void setComplete(int complete) {
		this.complete = complete;
	}


	public int getPossible() {
		return possible;
	}


	public void setPossible(int possible) {
		this.possible = possible;
	}


	public int getExpect() {
		return expect;
	}


	public void setExpect(int expect) {
		this.expect = expect;
	}


	public int getSell_no() {
		return sell_no;
	}




	public void setSell_no(int sell_no) {
		this.sell_no = sell_no;
	}




	@Override
	public String toString() {
		return "ProfitVo [peri_start=" + peri_start + ", peri_end=" + peri_end + ", monthstart=" + monthstart
				+ ", monthend=" + monthend + ", type=" + type + ", total=" + total + ", complete=" + complete
				+ ", possible=" + possible + ", expect=" + expect + ", sell_no=" + sell_no + "]";
	}
	
	
}
