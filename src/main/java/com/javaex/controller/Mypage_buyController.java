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
import com.javaex.vo.AlarmContentVo;
import com.javaex.vo.AlarmVo;
import com.javaex.vo.BuyVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/mypage")
public class Mypage_buyController {

	AlarmContentVo acVo = new AlarmContentVo();
	BuyVo bVo = new BuyVo();

	@Autowired
	public AlarmService aS;

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(Model model) {

		System.out.println("[Alarm Ctrl]: list 진입");

		List<AlarmVo> aList = aS.list();

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

		aS.payment_complete(aVo);

		return "redirect:/mypage/list";

	}

	@RequestMapping(value = "/delivery_ready", method = { RequestMethod.GET, RequestMethod.POST })
	public String delivery_ready(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: delivery_ready 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getDelivery_ready();

		aVo.setAlarm_content(content);

		aS.delivery_ready(aVo);

		return "redirect:/mypage/list";

	}

	@RequestMapping(value = "/delivery_ing", method = { RequestMethod.GET, RequestMethod.POST })
	public String delivery_ing(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: delivery_ing 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getDelivery_ing();

		aVo.setAlarm_content(content);

		aS.delivery_ing(aVo);

		return "redirect:/mypage/list";

	}

	@RequestMapping(value = "/delivery_complete", method = { RequestMethod.GET, RequestMethod.POST })
	public String delivery_complete(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: delivery_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getDelivery_complete();

		aVo.setAlarm_content(content);

		aS.delivery_complete(aVo);

		return "redirect:/mypage/list";

	}

	@RequestMapping(value = "/matching_registration", method = { RequestMethod.GET, RequestMethod.POST })
	public String matching_registration(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: payment_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getMatch_registration();

		aVo.setAlarm_content(content);

		aS.matching_registration(aVo);

		return "redirect:/mypage/list";

	}

	@RequestMapping(value = "/matching_application", method = { RequestMethod.GET, RequestMethod.POST })
	public String matching_application(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: payment_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getMatch_application();

		aVo.setAlarm_content(content);

		aS.getMatch_application(aVo);

		return "redirect:/mypage/list";

	}

	@RequestMapping(value = "/matching_refused", method = { RequestMethod.GET, RequestMethod.POST })
	public String matching_refused(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: payment_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getMatching_refused();

		aVo.setAlarm_content(content);

		aS.getMatching_refused(aVo);

		return "redirect:/mypage/list";

	}

	@RequestMapping(value = "/matching_accept", method = { RequestMethod.GET, RequestMethod.POST })
	public String matching_accept(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: payment_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getMatching_accept();

		aVo.setAlarm_content(content);

		aS.matching_accept(aVo);

		return "redirect:/mypage/list";

	}

	@RequestMapping(value = "/matching_complete", method = { RequestMethod.GET, RequestMethod.POST })
	public String matching_complete(@ModelAttribute AlarmVo aVo, HttpSession session) {

		System.out.println("[Alarm Ctrl]: payment_complete 진입");

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		int user_no = authUser.getUser_no();

		aVo.setFrom_user_no(user_no);

		String content = acVo.getMatching_complete();

		aVo.setAlarm_content(content);

		aS.matching_complete(aVo);

		return "redirect:/mypage/list";

	}

}