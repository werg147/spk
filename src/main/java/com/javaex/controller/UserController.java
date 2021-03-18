package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;
@Controller
@RequestMapping(value = "/user")
public class UserController {

	
	@Autowired
	private UserService userservice;


	//로그인페이지 열기
	@RequestMapping(value = "/loginform", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginform() {
		System.out.println("[cnt] 로그인페이지 오픈");
		return "main/loginform";
	}
	
	//로그인하기
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@ModelAttribute UserVo uservo, HttpSession session) {
		System.out.println("[cnt] 로그인하기" + uservo.toString());

		UserVo authUser = userservice.login(uservo);
		
		if (authUser == null) {
			System.out.println("로그인실패");

			return "redirect:/user/loginform?result=fail";
		} else {
			System.out.println("로그인성공");
			session.setAttribute("authUser", authUser);

			return "redirect:/";
		}
	}
}
