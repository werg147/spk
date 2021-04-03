package com.javaex.vo;

public class ProdNoVo {
	
	private int buyprod_no;

	
	
	public ProdNoVo() {
		super();
	}



	public ProdNoVo(int buyprod_no) {
		super();
		this.buyprod_no = buyprod_no;
	}



	public int getBuyprod_no() {
		return buyprod_no;
	}



	public void setBuyprod_no(int buyprod_no) {
		this.buyprod_no = buyprod_no;
	}



	@Override
	public String toString() {
		return "ProdNoVo [buyprod_no=" + buyprod_no + "]";
	}
	
	

}
