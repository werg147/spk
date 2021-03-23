package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.UserService;
import com.javaex.vo.SellerVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userservice;

	// 로그인페이지 열기
	@RequestMapping(value = "/loginform", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginform() {
		System.out.println("[cnt] 로그인페이지 오픈");
		return "main/loginform";
	}

	// 로그인하기
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@ModelAttribute UserVo uservo, HttpSession session) {
		System.out.println("[cnt] 로그인하기" + uservo.toString());

		UserVo authUser = userservice.login(uservo);

		if (authUser == null) {
			System.out.println("로그인실패");

			return "redirect:/user/loginform?result=fail";
		} else {
			System.out.println("로그인성공");
			System.out.println("로그인정보: " + authUser);
			session.setAttribute("authUser", authUser);

			return "redirect:/";
		}
	}

	// 로그아웃하기
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {
		System.out.println("로그아웃");

		session.removeAttribute("authUser");
		session.invalidate();

		return "redirect:/";
	}

	// 판매자 계정등록 공지 페이지
	@RequestMapping(value = "/notice", method = { RequestMethod.GET, RequestMethod.POST })
	public String notice() {
		System.out.println("[cnt] 판매자 계정등록 공지페이지");

		return "mypage/mypage_seller/seller_notice";
	}

	// 대관판매자 계정등록 폼
	@RequestMapping(value = "/bookselleraddform", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookDellerAddForm(Model model, HttpSession session) {
		System.out.println("[cnt] 대관판매자 계정등록폼");
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		model.addAttribute("authUser", authUser);

		return "mypage/mypage_seller/book_seller_add";
	}

	// 대관판매자 대관계정 등록
	@RequestMapping(value = "/bookselleradd", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookSellerAdd(@ModelAttribute SellerVo sellervo) {
		System.out.println("[cnt] 대관판매자 계정 등록");

		userservice.bookSellerAdd(sellervo);
		System.out.println("돌아옴");

		return "mypage/mypage_resrvation/mypage_gyminfo";

	}

	// 배송판매자 계정등록 폼
	@RequestMapping(value = "/prodselleraddform", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodDellerAddForm(Model model, HttpSession session) {
		System.out.println("[cnt] 배송판매자 계정등록폼");
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		model.addAttribute("authUser", authUser);

		return "mypage/mypage_seller/prod_seller_add";
	}

	// 배송판매자 대관계정 등록
	@RequestMapping(value = "/prodselleradd", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodSellerAdd(@ModelAttribute SellerVo sellervo) {
		System.out.println("[cnt] 배송판매자 계정 등록");

		userservice.sellerProdAdd(sellervo);
		System.out.println("돌아옴");

		return "mypage/mypage_prod/prod_manage";

	}

}
