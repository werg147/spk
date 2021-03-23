package com.javaex.vo;

import java.util.List;

public class CartInfoVo {

	private UserVo uVo;
	private int totalPrice;
	private List<CartVo> cList;

	public CartInfoVo() {
		super();
	}

	public CartInfoVo(UserVo uVo, int totalPrice, List<CartVo> cList) {
		super();
		this.uVo = uVo;
		this.totalPrice = totalPrice;
		this.cList = cList;
	}

	public UserVo getuVo() {
		return uVo;
	}

	public void setuVo(UserVo uVo) {
		this.uVo = uVo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<CartVo> getcList() {
		return cList;
	}

	public void setcList(List<CartVo> cList) {
		this.cList = cList;
	}

	@Override
	public String toString() {
		return "CartInfoVo [uVo=" + uVo + ", totalPrice=" + totalPrice + ", cList=" + cList + "]";
	}

}
