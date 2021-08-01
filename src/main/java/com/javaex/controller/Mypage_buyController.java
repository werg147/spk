package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.AlarmService;
import com.javaex.service.BuyListService;
import com.javaex.service.CartService;
import com.javaex.vo.AlarmContentVo;
import com.javaex.vo.AlarmVo;
import com.javaex.vo.BBuyVo;
import com.javaex.vo.BookingCompleteVo;
import com.javaex.vo.BookingVo;
import com.javaex.vo.BuyListVo;
import com.javaex.vo.BuyProductVo;
import com.javaex.vo.BuyVo;
import com.javaex.vo.CartInfoVo;
import com.javaex.vo.CartVo;
import com.javaex.vo.MatchingCompleteVo;
import com.javaex.vo.ProdBuyForVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/mypage")
public class Mypage_buyController {

	AlarmContentVo acVo = new AlarmContentVo();
	BuyVo bVo = new BuyVo();
	BuyProductVo bprodVo = new BuyProductVo();

	@Autowired
	public AlarmService aServ;

	@Autowired
	public CartService cServ;

	@Autowired
	public BuyListService blServ;

	/* 알람 리스트 */
	@RequestMapping(value = "/alarm", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(Model model, HttpSession session) {

		System.out.println("[Alarm Ctrl]: list 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		List<AlarmVo> aList = aServ.list(user_no);

		System.out.println("[Alarm Ctrl]: " + aList.toString());

		model.addAttribute("AlarmList", aList);

		return "mypage/mypage_buy/alarm";

	}

	/* 결제완료 알람 */
	@RequestMapping(value = "/productBuy", method = { RequestMethod.GET, RequestMethod.POST })
	public void productBuy(@RequestParam("buy_no") int buy_no) {

		aServ.paymentComplete(buy_no);

		// 포워드 할 페이지

	}

	/* 배송준비 중 알람 */
	/*
	 * @RequestMapping(value = "/delReady", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public void delReady(@RequestParam("buyprod_no") int
	 * buyprod_no) {
	 * 
	 * aServ.deliveryReady(buyprod_no);
	 * 
	 * // 포워드 할 페이지
	 * 
	 * }
	 */
	/* 배송시작 알람 */
	/*
	 * @RequestMapping(value = "/delStart", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public void delStart(@RequestParam("buyprod_no") int
	 * buyprod_no) {
	 * 
	 * aServ.delStart(buyprod_no);
	 * 
	 * // 포워드 할 페이지
	 * 
	 * }
	 */
	/* 배송완료 알람 */
	@RequestMapping(value = "/delcomplete", method = { RequestMethod.GET, RequestMethod.POST })
	public void delcomplete(@RequestParam("buyprod_no") int buyprod_no) {

		aServ.delcomplete(buyprod_no);

		// 포워드 할 페이지

	}

	/* 장바구니 리스트 */
	@RequestMapping(value = "/cart", method = { RequestMethod.GET, RequestMethod.POST })
	public String cart(Model model, HttpSession session) {

		System.out.println("[Cart Ctrl]: cart 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUser_no(); // 로그인한 사용자의 userNo

		CartInfoVo cartInfoVo = cServ.list(userNo); // userNo주면 cartInfoVo: 회원정보, 카트에 있는 살품리스트, 상품총가격

		UserVo userVo = cartInfoVo.getuVo(); // cartInfoVo 회원정보

		List<CartVo> list = cartInfoVo.getcList();

		int total = cartInfoVo.getTotalPrice();

		System.out.println("ctrl: " + cartInfoVo);
		System.out.println("ctrl: " + userVo);
		System.out.println("ctrl: " + list);
		System.out.println("ctrl: " + total);
		
		System.out.println("vo확인:" + cartInfoVo);

		// model.addAttribute("cartInfoVo", list);
		model.addAttribute("cartInfoVo", cartInfoVo);

		return "mypage/mypage_buy/cart";

	}

	/* 장바구니 삭제 */
	@ResponseBody
	@RequestMapping(value = "/remove", method = { RequestMethod.GET, RequestMethod.POST })
	public int remove(@RequestParam("no") int cart_no, @RequestParam("userno") int user_no) {

		System.out.println("[Cart Ctrl]: remove 진입");

		System.out.println(cart_no);

		int priceAll = cServ.remove(cart_no, user_no);

		System.out.println(priceAll);

		return priceAll;

	}

	/* 장바구니에 담기 */
	@ResponseBody
	@RequestMapping(value = "/gotoCart", method = { RequestMethod.GET, RequestMethod.POST })
	public int gotoCart(HttpSession session, @RequestBody List<ProdBuyForVo> prodList, @ModelAttribute CartVo cartVo) {

		System.out.println("[Cart Ctrl]: gotoCart 진입");
		System.out.println(prodList);
		
		//user_no
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int user_no = authUser.getUser_no();
		cartVo.setUser_no(user_no);
		
		//prod_no,color,prod_size로 colorsize_no조회
		int success = cServ.getCno(prodList, user_no);

		return success;

	}

	/* 구매내역 출력 */
	/* #1. 배송상품내역 */
	@RequestMapping(value = "/buylist", method = { RequestMethod.GET, RequestMethod.POST })
	public String buylist(Model model, HttpSession session,
			@RequestParam(value = "buy_no", required = false, defaultValue = "1") int buy_no) {

		System.out.println("[BuyList Ctrl]: buylist 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		BuyListVo buylistVo = new BuyListVo();

		BuyVo buyVo = new BuyVo();

		buylistVo.setBuy_no(buyVo.getBuy_no());

		/* #1. 배송상품내역 */
		List<BuyListVo> buyList = blServ.buylist(user_no);

		System.out.println("[BuyList Ctrl]: " + buyList.toString());

		/* #1. 배송상품내역 */
		model.addAttribute("BuyList", buyList);

		return "mypage/mypage_buy/buylist";

	}

	/* #2. 대관상품내역 */
	@RequestMapping(value = "/bookinglist", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookinglist(Model model, HttpSession session) {

		System.out.println("[BuyList Ctrl]: bookinglist 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		BuyListVo buylistVo = new BuyListVo();

		BookingVo bkVo = new BookingVo();

		buylistVo.setBooking_no(bkVo.getBooking_no());

		/* #2. 대관상품내역 */
		List<BuyListVo> buyList = blServ.bookinglist(user_no);

		System.out.println("[BuyList Ctrl]: " + buyList.toString());

		/* #2. 대관상품내역 */
		model.addAttribute("BookingList", buyList);

		return "mypage/mypage_buy/bookinglist";

	}

	/* #3. 매칭상품내역 */
	@RequestMapping(value = "/matchinglist", method = { RequestMethod.GET, RequestMethod.POST })
	public String matchinglist(Model model, HttpSession session) {

		System.out.println("[BuyList Ctrl]: matchinglist 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		BuyListVo buylistVo = new BuyListVo();

		BBuyVo bbuyVo = new BBuyVo();

		buylistVo.setB_buy_no(bbuyVo.getB_buy_no());

		/* #3. 매칭상품내역 */
		List<BuyListVo> buyList = blServ.bbuylist(user_no);

		System.out.println("[BuyList Ctrl]: " + buyList.toString());

		/* #3. 매칭상품내역 */
		model.addAttribute("BbuyList", buyList);

		System.out.println(user_no);

		return "mypage/mypage_buy/matchinglist";

	}
	/* //구매내역 출력 */

	// 구매내역_배송상세페이지
	@RequestMapping(value = "/buydel")
	public String buydel(@RequestParam("buy_no") int buy_no, Model model) {
		System.out.println("[Controller] buydel()");
		System.out.println("바이넘버: " + buy_no);

		Map<String, Object> bmap = blServ.buydel(buy_no);
		System.out.println("맵: " + bmap);

		model.addAttribute("bmap", bmap);

		return "mypage/mypage_buy/buy_complete";
	}

	// 회원정보관리 페이지 열기
	@RequestMapping(value = "/infoupdate", method = { RequestMethod.GET, RequestMethod.POST })
	public String infoUpdate(HttpSession session) {
		System.out.println("[cnt]회원정보수정");
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		return "mypage/mypage_buy/info_update";
	}

	/* 구매내역_대관상세페이지(경환) */
	@RequestMapping(value = "/buybooking", method = { RequestMethod.GET, RequestMethod.POST })
	public String buybooking(@RequestParam("booking_no") int booking_no, Model model) {

		System.out.println("[BuyList_buybooking Ctrl]: buybooking 진입");

		BookingCompleteVo bcVo = new BookingCompleteVo();

		bcVo.setBooking_no(booking_no);

		List<BookingCompleteVo> bkList = blServ.buybooking(booking_no);

		model.addAttribute("BookingList", bkList);

		return "mypage/mypage_buy/booking_complete";

	}

	/* 구매내역_매치상세페이지(경환) */
	@RequestMapping(value = "/buymatching", method = { RequestMethod.GET, RequestMethod.POST })
	public String buymatching(@ModelAttribute MatchingCompleteVo mcVo, @RequestParam("booking_no") int booking_no,
			Model model, HttpSession session) {

		System.out.println("[BuyList_buymatching Ctrl]: buymatching 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		mcVo.setUser_no(user_no);

		mcVo.setBooking_no(booking_no);

		mcVo = blServ.buymatching(mcVo);

		model.addAttribute("MatchingList", mcVo);

		System.out.println(user_no);
		System.out.println(booking_no);

		return "mypage/mypage_buy/matching_complete";

	}

}