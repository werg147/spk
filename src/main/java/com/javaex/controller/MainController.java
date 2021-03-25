package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value = "")
public class MainController {

	// 메인페이지 추후 리스트 적용해야함
	@RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
	public String main() {
		System.out.println("[cnt]메인페이지");
		return "main/index";
	}

	
	// 에러400
	@RequestMapping(value = "/error400", method = { RequestMethod.GET, RequestMethod.POST })
	public String error400() {
		System.out.println("[cnt]에러400");
		return "main/error400";
	}

	// 에러400
	@RequestMapping(value = "/errorlogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String errorLogin() {
		System.out.println("[cnt]로그인 접근 오류");
		return "main/error_loginform";
	}
	
	// 에러400
	@RequestMapping(value = "/errorseller", method = { RequestMethod.GET, RequestMethod.POST })
	public String errorSeller() {
		System.out.println("[cnt]판매자 접근 오류");
		return "main/error_seller_notice";
	}

}
