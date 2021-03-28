package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BBuyVo;
import com.javaex.vo.BookingVo;
import com.javaex.vo.BuyListVo;
import com.javaex.vo.BuyVo;
import com.javaex.vo.ProdBuyForVo;

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
	
	//구매내역_배송상세 구매자정보
	public BuyVo selectBuy(int buy_no) {
		System.out.println("[BuyListDao] selectBuy()");
		
		return sql.selectOne("buylist.selectBuy", buy_no);
	}
	
	//구매내역_배송상세 구매상품내역
	public List<ProdBuyForVo> selectBuydel(int buy_no) {
		System.out.println("[BuyListDao] selectBuydel()");
		
		return sql.selectList("buylist.selectBuydel", buy_no);
	}

}
