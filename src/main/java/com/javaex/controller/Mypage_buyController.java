package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.AlarmService;
import com.javaex.service.CartService;
import com.javaex.vo.AlarmContentVo;
import com.javaex.vo.AlarmVo;
import com.javaex.vo.BuyProductVo;
import com.javaex.vo.BuyVo;
import com.javaex.vo.CartInfoVo;
import com.javaex.vo.CartVo;
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

	// 알람리스트 출력
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

	// 결제완료 알람 발송
	@RequestMapping(value = "/productBuy", method = { RequestMethod.GET, RequestMethod.POST })
	public void productBuy(@RequestParam("buy_no") int buy_no) {

		aServ.paymentComplete(buy_no);

		// 포워드 할 페이지

	}

	// 배송준비 중 알람 발송

	@RequestMapping(value = "/delReady", method = { RequestMethod.GET, RequestMethod.POST })
	public void delReady(@RequestParam("buyprod_no") int buyprod_no) {

		aServ.deliveryReady(buyprod_no);

		// 포워드 할 페이지

	}

	@RequestMapping(value = "/delStart", method = { RequestMethod.GET, RequestMethod.POST })
	public void delStart(@RequestParam("buyprod_no") int buyprod_no) {

		aServ.delStart(buyprod_no);

		// 포워드 할 페이지

	}

	@RequestMapping(value = "/delcomplete", method = { RequestMethod.GET, RequestMethod.POST })
	public void delcomplete(@RequestParam("buyprod_no") int buyprod_no) {

		aServ.delcomplete(buyprod_no);

		// 포워드 할 페이지

	}

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

		// model.addAttribute("cartInfoVo", list);
		model.addAttribute("cartInfoVo", cartInfoVo);

		return "mypage/mypage_buy/cart";

	}

	@ResponseBody
	@RequestMapping(value = "/remove", method = { RequestMethod.GET, RequestMethod.POST })
	public int remove(@RequestParam("no") int cart_no, @RequestParam("userno") int user_no) {

		System.out.println("[Cart Ctrl]: remove 진입");

		System.out.println(cart_no);

		int priceAll = cServ.remove(cart_no, user_no);

		System.out.println(priceAll);

		return priceAll;

	}

	@RequestMapping(value = "/gotoCart", method = { RequestMethod.GET, RequestMethod.POST })
	public String gotoCart(@RequestParam("prod_no") String prod_no, @RequestParam("colorsize_no") int colorsize_no,
			@RequestParam("count") int count, HttpSession session, @ModelAttribute CartVo cartVo) {

		System.out.println("[Cart Ctrl]: gotoCart 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		cartVo.setUser_no(user_no);

		cartVo.setProd_no(prod_no);
		// cartVo.setProd_no("1");

		cartVo.setColorsize_no(colorsize_no);
		// cartVo.setColorsize_no(1);

		cartVo.setCount(count);

		System.out.println(cartVo);

		cServ.gotoCart(cartVo);

		return "redirect:/mypage/cart";

	}
}