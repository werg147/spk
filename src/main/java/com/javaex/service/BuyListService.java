package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BuyListDao;
import com.javaex.vo.BBuyVo;
import com.javaex.vo.BookingVo;
import com.javaex.vo.BuyListVo;

@Service
public class BuyListService {

	@Autowired
	private BuyListDao blDao;

	public List<BuyListVo> buylist(int user_no) {

		System.out.println("[BuyList Service]: buylist() 연결");

		return blDao.selectBuyList(user_no);
	}

	public List<BookingVo> bookinglist(int user_no) {

		System.out.println("[BuyList Service]: bookinglist() 연결");

		return blDao.selectBookingList(user_no);
	}

	public List<BBuyVo> bbuylist(int user_no) {

		System.out.println("[BuyList Service]: bbuylist() 연결");

		return blDao.selectBbuyList(user_no);
	}

}
