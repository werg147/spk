package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Test {

	@RequestMapping(value="test", method= {RequestMethod.GET, RequestMethod.POST})
	public String test() {
		System.out.println("테스트");
		System.out.println("테스트 장세림");
		System.out.println("테스트 이영훈");
		System.out.println("테스트 조설아");
		System.out.println("테스트 조경환");
		
		System.out.println("이영훈 브랜치");
		return "test";
	}
}
