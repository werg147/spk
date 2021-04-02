package com.javaex.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaex.service.UserService;
import com.javaex.vo.KakaoVo;
import com.javaex.vo.TokenVo;
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
		System.out.println("[cnt] 로그인하기" + uservo.getUser_id() + uservo.getPassword());

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

	// 수익관리페이지
	@RequestMapping(value = "/profit", method = { RequestMethod.GET, RequestMethod.POST })
	public String profit() {
		System.out.println("[cnt] 판매자 수익 페이지");

		return "mypage/mypage_seller/seller_profit";
	}

	// 회원정보입력 페이지열기
	@RequestMapping(value = "/joinform", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinInfo() {
		System.out.println("[cnt]회원정보입력");

		return "main/joininfo";
	}

	// 카카오 회원가입 가입 정보 받기
	@RequestMapping(value = "/join", method = { RequestMethod.GET })
	public String joinForm(String code, HttpSession session, Model model) {

		System.out.println("[cnt]카카오회원가입");

		UserVo uservo = userservice.kakaoJoin(code);

		System.out.println("회원정보" + uservo);

		if (uservo.getPassword() == "" || uservo.getPassword() == null) {

			UserVo authUser = uservo;

			System.out.println("로그인성공");
			System.out.println("로그인정보: " + authUser);
			session.setAttribute("authUser", authUser);

			return "redirect:/";

		} else {

			model.addAttribute("uservo", uservo);
			System.out.println("페이지 전달내용" + uservo);

			return "main/joininfo";

		}

	}

	// 네이버 회원가입 가입 정보 받기
	@RequestMapping(value = "/joinnaver", method = { RequestMethod.GET })
	public String joinFormNaver(String code, String state, HttpSession session, Model model) {

		System.out.println("[cnt]네이버회원가입");

		System.out.println(code);

		UserVo uservo = userservice.naverJoin(code, state);

		System.out.println("회원정보" + uservo);

		if (uservo.getPassword() == "" || uservo.getPassword() == null) {

			UserVo authUser = uservo;

			System.out.println("로그인성공");
			System.out.println("로그인정보: " + authUser);
			session.setAttribute("authUser", authUser);

			return "redirect:/";

		} else {

			model.addAttribute("uservo", uservo);
			System.out.println("페이지 전달내용" + uservo);

			return "main/joininfo";

		}
	}

	// 회원가입 후 회원정보입력
	@RequestMapping(value = "/joininfowrite", method = { RequestMethod.GET, RequestMethod.POST })
	public String joininfoWrite(@ModelAttribute UserVo uservo, @RequestParam("profilphoto") MultipartFile profilphoto) {
		System.out.println("[cnt]회원가입 후 회원정보입력" + uservo);

		String address = uservo.getRoadaddress() + uservo.getAddressdetail();
		uservo.setAddress(address);
		userservice.joininfoWrite(uservo, profilphoto);

		int user_no = uservo.getUser_no();

		return "redirect:/sparring/writeForm?join=1&user_no=" + user_no;
	}

	// 회원가입 취소하기
	@RequestMapping(value = "/joincancle", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinCancle(@RequestParam("user_no") int user_no) {
		System.out.println("[cnt]회원가입 취소" + user_no);
		int count = userservice.joinCancle(user_no);
		System.out.println("회원가입취소 개수: " + count);

		return "redirect:/";
	}

}
