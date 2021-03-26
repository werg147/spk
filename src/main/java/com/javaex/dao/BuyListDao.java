package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BBuyVo;
import com.javaex.vo.BookingVo;
import com.javaex.vo.BuyListVo;

@Repository
public class BuyListDao {

	@Autowired
	private SqlSession sql;

	public List<BuyListVo> selectBuyList(int user_no) {

		System.out.println("[BuyList Dao]: selectList() 실행");

		List<BuyListVo> buyList = sql.selectList("buylist.selectBuyList", user_no);

		System.out.println("[BuyList Dao]: " + buyList.toString());

		return buyList;
	}

	public List<BookingVo> selectBookingList(int user_no) {

		System.out.println("[BuyList Dao]: selectBookingList() 실행");

		List<BookingVo> bookingList = sql.selectList("buylist.selectBookingList", user_no);

		System.out.println("[BuyList Dao]: " + bookingList.toString());

		return bookingList;
	}

	public List<BBuyVo> selectBbuyList(int user_no) {

		System.out.println("[BuyList Dao]: selectBbuyList() 실행");

		List<BBuyVo> bbuyList = sql.selectList("buylist.selectBBuyList", user_no);

		System.out.println("[BuyList Dao]: " + bbuyList.toString());

		return bbuyList;
	}

}
