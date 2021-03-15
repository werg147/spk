package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Test {

	@RequestMapping(value="test", method= {RequestMethod.GET, RequestMethod.POST})
	public String test() {
		System.out.println("/hellospring/hello");
		return "test";
	}
}
