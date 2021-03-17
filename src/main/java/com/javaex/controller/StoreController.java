package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/store")
public class StoreController {
	
	@RequestMapping(value="/list")
	public String list() {
		System.out.println("스토어 상품 리스트");
		
		return "store/storeList";
	}

}
