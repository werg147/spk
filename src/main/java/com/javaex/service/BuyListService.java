package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BuyListDao;
import com.javaex.vo.BBuyVo;
import com.javaex.vo.BookingCompleteVo;
import com.javaex.vo.BookingVo;
import com.javaex.vo.BuyListVo;
import com.javaex.vo.BuyVo;
import com.javaex.vo.MatchingCompleteVo;
import com.javaex.vo.ProdBuyForVo;

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
		
		System.out.println(user_no);

		return blDao.selectBbuyList(user_no);
	}

	// 구매내역_배송상세페이지
	public Map<String, Object> buydel(int buy_no) {
		System.out.println("[BuyList Service] buydel()");

		// 구매자 정보 가져오기
		BuyVo buyVo = blDao.selectBuy(buy_no);
		System.out.println(buyVo.toString());

		// 구매상품 내역 가져오기
		List<ProdBuyForVo> pbList = blDao.selectBuydel(buy_no);
		System.out.println(pbList.toString());

		// map 담기
		Map<String, Object> bmap = new HashMap<String, Object>();
		bmap.put("buyVo", buyVo);
		bmap.put("pbList", pbList);

		return bmap;
	}

	/* 구매내역_대관상세페이지(경환) */
	public List<BookingCompleteVo> buybooking(int booking_no) {

		System.out.println("[BuyList_Buybooking Service]: buybooking 연결");

		return blDao.selectBookingCompleteVo(booking_no);
	}

	/* 구매내역_매치상세페이지(경환) */
	public List<MatchingCompleteVo> buymatching(int booking_no) {

		System.out.println("[BuyList_Buymatching Service]: buymatching 연결");

		return blDao.selectMatchingCompleteVo(booking_no);
	}

}
