package com.javaex.vo;

import java.util.List;

public class CartInfoVo {

	private UserVo userVo;
	private int totalPrice;
	private List<CartVo> cList;

	public CartInfoVo() {
		super();
	}

	public CartInfoVo(UserVo userVo, int totalPrice, List<CartVo> cList) {
		super();
		this.userVo = userVo;
		this.totalPrice = totalPrice;
		this.cList = cList;
	}

	public UserVo getUserVo() {
		return userVo;
	}

	public void setUserVo(UserVo userVo) {
		this.userVo = userVo;
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
		return "CartInfoVo [userVo=" + userVo + ", totalPrice=" + totalPrice + ", cList=" + cList + "]";
	}

}
