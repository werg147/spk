package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/bbuy" , method= {RequestMethod.GET , RequestMethod.POST})
public class BBuyController {
	
	//스파링 리스트
	@RequestMapping(value="/bbuyList" , method= {RequestMethod.GET , RequestMethod.POST})
	public String sparringList() {
		System.out.println("[Controller] : sparringList()");
		return "matching/sparringList";
	}
	
	//스파링매치신청서
	@RequestMapping(value="/bbuyMatch" , method= {RequestMethod.GET , RequestMethod.POST})
	public String sparringMatch(@RequestParam("bookingNo")int bookingNo) {
		System.out.println("[Controller] : sparringMatch()");
		System.out.println("bookingNo = "+ bookingNo);
		return "matching/sparringMatch";
	}
}
