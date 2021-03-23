package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.AlarmService;
import com.javaex.service.CartService;
import com.javaex.vo.AlarmContentVo;
import com.javaex.vo.AlarmVo;
import com.javaex.vo.BuyVo;
import com.javaex.vo.CartInfoVo;
import com.javaex.vo.CartVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/mypage")
public class Mypage_buyController {

	AlarmContentVo acVo = new AlarmContentVo();
	BuyVo bVo = new BuyVo();

	@Autowired
	public AlarmService aServ;

	@Autowired
	public CartService cServ;

	@RequestMapping(value = "/alarm", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(Model model) {

		System.out.println("[Alarm Ctrl]: list 진입");

		List<AlarmVo> aList = aServ.list();

		System.out.println("[Alarm Ctrl]: " + aList.toString());

		model.addAttribute("AlarmList", aList);

		return "mypage/mypage_buy/alarm";

	}

	@RequestMapping(value = "/payment_complete", method = { RequestMethod.GET, RequestMethod.POST })
	public String payment_complete(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: payment_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getPayment_complete();

		aVo.setAlarm_content(content);

		aServ.payment_complete(aVo);

		return "redirect:/mypage/alarm";

	}

	@RequestMapping(value = "/delivery_ready", method = { RequestMethod.GET, RequestMethod.POST })
	public String delivery_ready(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: delivery_ready 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getDelivery_ready();

		aVo.setAlarm_content(content);

		aServ.delivery_ready(aVo);

		return "redirect:/mypage/alarm";

	}

	@RequestMapping(value = "/delivery_ing", method = { RequestMethod.GET, RequestMethod.POST })
	public String delivery_ing(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: delivery_ing 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getDelivery_ing();

		aVo.setAlarm_content(content);

		aServ.delivery_ing(aVo);

		return "redirect:/mypage/alarm";

	}

	@RequestMapping(value = "/delivery_complete", method = { RequestMethod.GET, RequestMethod.POST })
	public String delivery_complete(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: delivery_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getDelivery_complete();

		aVo.setAlarm_content(content);

		aServ.delivery_complete(aVo);

		return "redirect:/mypage/alarm";

	}

	@RequestMapping(value = "/matching_registration", method = { RequestMethod.GET, RequestMethod.POST })
	public String matching_registration(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: payment_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getMatch_registration();

		aVo.setAlarm_content(content);

		aServ.matching_registration(aVo);

		return "redirect:/mypage/alarm";

	}

	@RequestMapping(value = "/matching_application", method = { RequestMethod.GET, RequestMethod.POST })
	public String matching_application(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: payment_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getMatch_application();

		aVo.setAlarm_content(content);

		aServ.getMatch_application(aVo);

		return "redirect:/mypage/alarm";

	}

	@RequestMapping(value = "/matching_refused", method = { RequestMethod.GET, RequestMethod.POST })
	public String matching_refused(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: payment_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getMatching_refused();

		aVo.setAlarm_content(content);

		aServ.getMatching_refused(aVo);

		return "redirect:/mypage/alarm";

	}

	@RequestMapping(value = "/matching_accept", method = { RequestMethod.GET, RequestMethod.POST })
	public String matching_accept(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: payment_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getMatching_accept();

		aVo.setAlarm_content(content);

		aServ.matching_accept(aVo);

		return "redirect:/mypage/alarm";

	}

	@RequestMapping(value = "/matching_complete", method = { RequestMethod.GET, RequestMethod.POST })
	public String matching_complete(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: payment_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getMatching_complete();

		aVo.setAlarm_content(content);

		aServ.matching_complete(aVo);

		return "redirect:/mypage/alarm";

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

		//model.addAttribute("cartInfoVo", list);
		model.addAttribute("cartInfoVo", cartInfoVo);

		return "mypage/mypage_buy/cart";

	}

}